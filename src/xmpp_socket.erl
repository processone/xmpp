%%%-------------------------------------------------------------------
%%%
%%% Copyright (C) 2002-2018 ProcessOne, SARL. All Rights Reserved.
%%%
%%% Licensed under the Apache License, Version 2.0 (the "License");
%%% you may not use this file except in compliance with the License.
%%% You may obtain a copy of the License at
%%%
%%%     http://www.apache.org/licenses/LICENSE-2.0
%%%
%%% Unless required by applicable law or agreed to in writing, software
%%% distributed under the License is distributed on an "AS IS" BASIS,
%%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%% See the License for the specific language governing permissions and
%%% limitations under the License.
%%%
%%%-------------------------------------------------------------------
-module(xmpp_socket).
-author('alexey@process-one.net').
-dialyzer({no_match, [send/2, parse/2]}).

%% API
-export([start/4,
	 connect/3,
	 connect/4,
	 connect/5,
	 starttls/2,
	 compress/1,
	 compress/2,
	 reset_stream/1,
	 send_element/2,
	 send_header/2,
	 send_trailer/1,
	 send/2,
	 send_xml/2,
	 recv/2,
	 activate/1,
	 change_shaper/2,
	 monitor/1,
	 get_sockmod/1,
	 get_transport/1,
	 get_peer_certificate/2,
	 get_verify_result/1,
	 close/1,
	 pp/1,
	 sockname/1, peername/1]).

-include("xmpp.hrl").

-type sockmod() :: gen_tcp | fast_tls | ezlib | module().
-type receiver() :: undefined | module() | pid().
-type socket() :: pid() | inet:socket() |
                  fast_tls:tls_socket() |
		  ezlib:zlib_socket() | any().

-record(socket_state, {sockmod = gen_tcp :: sockmod(),
                       socket            :: socket(),
		       max_stanza_size = infinity :: timeout(),
		       xml_stream :: undefined | fxml_stream:xml_stream_state(),
		       shaper = none :: none | p1_shaper:state(),
                       receiver :: receiver()}).

-type socket_state() :: #socket_state{}.

-export_type([socket/0, socket_state/0, sockmod/0]).

-callback start({module(), socket_state()},
		[proplists:property()]) -> {ok, pid()} | {error, term()} | ignore.
-callback start_link({module(), socket_state()},
		     [proplists:property()]) -> {ok, pid()} | {error, term()} | ignore.
-callback socket_type() -> xml_stream | independent | raw.

-define(is_http_socket(S),
	(S#socket_state.sockmod == ejabberd_bosh orelse
	 S#socket_state.sockmod == ejabberd_http_ws)).

-define(dbg(Fmt, Args),
	case xmpp_config:debug(global) of
	    {ok, true} -> error_logger:info_msg(Fmt, Args);
	    _ -> false
	end).

%%====================================================================
%% API
%%====================================================================
-spec start(atom(), sockmod(), socket(), [proplists:property()])
      -> {ok, pid() | independent} | {error, inet:posix() | any()} | ignore.
start(Module, SockMod, Socket, Opts) ->
    try
	case Module:socket_type() of
	    independent ->
		{ok, independent};
	    xml_stream ->
		MaxStanzaSize = proplists:get_value(max_stanza_size, Opts, infinity),
		Receiver = proplists:get_value(receiver, Opts),
		SocketData = #socket_state{sockmod = SockMod,
					   socket = Socket,
					   receiver = Receiver,
					   max_stanza_size = MaxStanzaSize},
		{ok, Pid} = Module:start({?MODULE, SocketData}, Opts),
		Receiver1 = if is_pid(Receiver) -> Receiver;
			       true -> Pid
			    end,
		ok = controlling_process(SocketData, Receiver1),
		ok = become_controller(SocketData, Pid),
		{ok, Receiver1};
	    raw ->
		{ok, Pid} = Module:start({SockMod, Socket}, Opts),
		ok = SockMod:controlling_process(Socket, Pid),
                %% This is becoming ridiculous
                %% We should rewrite this stuff completely
                case erlang:function_exported(Module, become_controller, 2) of
                    true ->
                        Module:become_controller(Pid, {SockMod, Socket});
                    false ->
                        ok
                end,
		{ok, Pid}
	end
    catch
	_:{badmatch, {error, _} = Err} ->
	    SockMod:close(Socket),
	    Err;
	_:{badmatch, ignore} ->
	    SockMod:close(Socket),
	    ignore
    end.

connect(Addr, Port, Opts) ->
    connect(Addr, Port, Opts, infinity, self()).

connect(Addr, Port, Opts, Timeout) ->
    connect(Addr, Port, Opts, Timeout, self()).

connect(Addr, Port, Opts, Timeout, Owner) ->
    case gen_tcp:connect(Addr, Port, Opts, Timeout) of
	{ok, Socket} ->
	    SocketData = #socket_state{sockmod = gen_tcp, socket = Socket},
	    case controlling_process(SocketData, Owner) of
		ok ->
		    activate_after(Socket, Owner, 0),
		    {ok, SocketData};
		{error, _Reason} = Error ->
		    gen_tcp:close(Socket),
		    Error
	    end;
	{error, _Reason} = Error ->
	    Error
    end.

starttls(#socket_state{socket = Socket,
		       receiver = undefined} = SocketData, TLSOpts) ->
    case fast_tls:tcp_to_tls(Socket, TLSOpts) of
	{ok, TLSSocket} ->
	    SocketData1 = SocketData#socket_state{socket = TLSSocket,
						  sockmod = fast_tls},
	    SocketData2 = reset_stream(SocketData1),
	    case fast_tls:recv_data(TLSSocket, <<>>) of
		{ok, TLSData} ->
		    parse(SocketData2, TLSData);
		{error, _} = Err ->
		    Err
	    end;
	{error, _} = Err ->
	    Err
    end.

compress(SocketData) -> compress(SocketData, undefined).

compress(#socket_state{receiver = undefined,
		       sockmod = SockMod,
		       socket = Socket} = SocketData, Data) ->
    {ok, ZlibSocket} = ezlib:enable_zlib(SockMod, Socket),
    case Data of
	undefined -> ok;
	_ -> send(SocketData, Data)
    end,
    SocketData1 = SocketData#socket_state{socket = ZlibSocket,
					  sockmod = ezlib},
    SocketData2 = reset_stream(SocketData1),
    case ezlib:recv_data(ZlibSocket, <<"">>) of
	{ok, ZlibData} ->
	    parse(SocketData2, ZlibData);
	{error, _} = Err ->
	    Err
    end.

reset_stream(#socket_state{xml_stream = XMLStream,
			   receiver = Receiver,
			   sockmod = SockMod, socket = Socket,
			   max_stanza_size = MaxStanzaSize} = SocketData) ->
    XMLStream1 = try fxml_stream:reset(XMLStream)
		 catch error:_ ->
			 close_stream(XMLStream),
			 fxml_stream:new(self(), MaxStanzaSize)
		 end,
    case Receiver of
	undefined ->
	    SocketData#socket_state{xml_stream = XMLStream1};
	_ ->
	    Socket1 = SockMod:reset_stream(Socket),
	    SocketData#socket_state{xml_stream = XMLStream1, socket = Socket1}
    end.

-spec send_element(socket_state(), fxml:xmlel()) -> ok | {error, inet:posix()}.
send_element(SocketData, El) when ?is_http_socket(SocketData) ->
    send_xml(SocketData, {xmlstreamelement, El});
send_element(SocketData, El) ->
    send(SocketData, fxml:element_to_binary(El)).

-spec send_header(socket_state(), fxml:xmlel()) -> ok | {error, inet:posix()}.
send_header(SocketData, El) when ?is_http_socket(SocketData) ->
    send_xml(SocketData, {xmlstreamstart, El#xmlel.name, El#xmlel.attrs});
send_header(SocketData, El) ->
    send(SocketData, fxml:element_to_header(El)).

-spec send_trailer(socket_state()) -> ok | {error, inet:posix()}.
send_trailer(SocketData) when ?is_http_socket(SocketData) ->
    send_xml(SocketData, {xmlstreamend, <<"stream:stream">>});
send_trailer(SocketData) ->
    send(SocketData, <<"</stream:stream>">>).

-spec send(socket_state(), iodata()) -> ok | {error, closed | inet:posix()}.
send(#socket_state{sockmod = SockMod, socket = Socket} = SocketData, Data) ->
    ?dbg("(~s) Send XML on stream = ~p", [pp(SocketData), Data]),
    try SockMod:send(Socket, Data) of
	{error, einval} -> {error, closed};
	Result -> Result
    catch _:badarg ->
	    %% Some modules throw badarg exceptions on closed sockets
	    %% TODO: their code should be improved
	    {error, closed}
    end.

-spec send_xml(socket_state(),
	       {xmlstreamelement, fxml:xmlel()} |
	       {xmlstreamstart, binary(), [{binary(), binary()}]} |
	       {xmlstreamend, binary()} |
	       {xmlstreamraw, iodata()}) -> term().
send_xml(SocketData, El) ->
    (SocketData#socket_state.sockmod):send_xml(SocketData#socket_state.socket, El).

recv(#socket_state{xml_stream = undefined} = SocketData, Data) ->
    XMLStream = fxml_stream:new(self(), SocketData#socket_state.max_stanza_size),
    recv(SocketData#socket_state{xml_stream = XMLStream}, Data);
recv(#socket_state{sockmod = SockMod, socket = Socket} = SocketData, Data) ->
    case SockMod of
	fast_tls ->
	    case fast_tls:recv_data(Socket, Data) of
		{ok, TLSData} ->
		    parse(SocketData, TLSData);
		{error, _} = Err ->
		    Err
	    end;
	ezlib ->
	    case ezlib:recv_data(Socket, Data) of
		{ok, ZlibData} ->
		    parse(SocketData, ZlibData);
		{error, _} = Err ->
		    Err
	    end;
	_ ->
	    parse(SocketData, Data)
    end.

-spec change_shaper(socket_state(), none | p1_shaper:state()) -> socket_state().
change_shaper(#socket_state{receiver = undefined} = SocketData, Shaper) ->
    SocketData#socket_state{shaper = Shaper};
change_shaper(#socket_state{sockmod = SockMod,
			    socket = Socket} = SocketData, Shaper) ->
    SockMod:change_shaper(Socket, Shaper),
    SocketData.

monitor(#socket_state{receiver = undefined}) ->
    make_ref();
monitor(#socket_state{sockmod = SockMod, socket = Socket}) ->
    SockMod:monitor(Socket).

controlling_process(#socket_state{sockmod = SockMod,
				  socket = Socket}, Pid) ->
    SockMod:controlling_process(Socket, Pid).

become_controller(#socket_state{receiver = Receiver,
				sockmod = SockMod,
				socket = Socket}, Pid) ->
    if is_pid(Receiver) ->
	    SockMod:become_controller(Receiver, Pid);
       true ->
	    activate_after(Socket, Pid, 0)
    end.

get_sockmod(SocketData) ->
    SocketData#socket_state.sockmod.

get_transport(#socket_state{sockmod = SockMod,
			    socket = Socket}) ->
    case SockMod of
	gen_tcp -> tcp;
	fast_tls -> tls;
	ezlib ->
	    case ezlib:get_sockmod(Socket) of
		gen_tcp -> tcp_zlib;
		fast_tls -> tls_zlib
	    end;
	ejabberd_bosh -> http_bind;
	ejabberd_http_ws -> websocket
    end.

get_peer_certificate(SocketData, Type) ->
    fast_tls:get_peer_certificate(SocketData#socket_state.socket, Type).

get_verify_result(SocketData) ->
    fast_tls:get_verify_result(SocketData#socket_state.socket).

close(#socket_state{sockmod = SockMod, socket = Socket}) ->
    SockMod:close(Socket).

sockname(#socket_state{sockmod = SockMod,
		       socket = Socket}) ->
    case SockMod of
      gen_tcp -> inet:sockname(Socket);
      _ -> SockMod:sockname(Socket)
    end.

peername(#socket_state{sockmod = SockMod,
		       socket = Socket}) ->
    case SockMod of
      gen_tcp -> inet:peername(Socket);
      _ -> SockMod:peername(Socket)
    end.

activate(#socket_state{sockmod = SockMod, socket = Socket}) ->
    case SockMod of
	gen_tcp -> inet:setopts(Socket, [{active, once}]);
	_ -> SockMod:setopts(Socket, [{active, once}])
    end.

activate_after(Socket, Pid, Pause) ->
    if Pause > 0 ->
	    erlang:send_after(Pause, Pid, {tcp, Socket, <<>>});
       true ->
	    Pid ! {tcp, Socket, <<>>}
    end,
    ok.

pp(#socket_state{receiver = Receiver} = State) ->
    Transport = get_transport(State),
    Receiver1 = case Receiver of
		    undefined -> self();
		    _ -> Receiver
		end,
    io_lib:format("~s|~w", [Transport, Receiver1]).

parse(SocketData, Data) when Data == <<>>; Data == [] ->
    case activate(SocketData) of
	ok ->
	    {ok, SocketData};
	{error, _} = Err ->
	    Err
    end;
parse(SocketData, [El | Els]) when is_record(El, xmlel) ->
    self() ! {'$gen_event', {xmlstreamelement, El}},
    parse(SocketData, Els);
parse(SocketData, [El | Els]) when
      element(1, El) == xmlstreamstart;
      element(1, El) == xmlstreamelement;
      element(1, El) == xmlstreamend;
      element(1, El) == xmlstreamerror ->
    self() ! {'$gen_event', El},
    parse(SocketData, Els);
parse(#socket_state{xml_stream = XMLStream,
		    socket = Socket,
		    shaper = ShaperState} = SocketData, Data)
  when is_binary(Data) ->
    ?dbg("(~s) Received XML on stream = ~p", [pp(SocketData), Data]),
    XMLStream1 = fxml_stream:parse(XMLStream, Data),
    {ShaperState1, Pause} = shaper_update(ShaperState, byte_size(Data)),
    Ret = if Pause > 0 ->
		  activate_after(Socket, self(), Pause);
	     true ->
		  activate(SocketData)
	  end,
    case Ret of
	ok ->
	    {ok, SocketData#socket_state{xml_stream = XMLStream1,
					 shaper = ShaperState1}};
	{error, _} = Err ->
	    Err
    end.

close_stream(undefined) ->
    ok;
close_stream(XMLStream) ->
    fxml_stream:close(XMLStream).

shaper_update(none, _) ->
    {none, 0};
shaper_update(Shaper, Size) ->
    p1_shaper:update(Shaper, Size).
