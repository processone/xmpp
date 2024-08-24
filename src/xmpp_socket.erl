%%%-------------------------------------------------------------------
%%%
%%% Copyright (C) 2002-2024 ProcessOne, SARL. All Rights Reserved.
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
-export([new/3,
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
	 sockname/1,
	 peername/1,
	 send_ws_ping/1,
	 get_negotiated_cipher/1,
	 get_tls_last_message/2,
	 release/1,
	 get_tls_cb_exporter/1,
	 get_tls_cert_hash/1,
	 finish_tls_handshake/1]).

-include("xmpp.hrl").
-include_lib("public_key/include/public_key.hrl").

-type sockmod() :: gen_tcp | fast_tls | ezlib | ext_mod().
-type socket() :: inet:socket() | fast_tls:tls_socket() |
		  ezlib:zlib_socket() | ext_socket().
-type ext_mod() :: module().
-type ext_socket() :: any().
-type endpoint() :: {inet:ip_address(), inet:port_number()}.
-type stream_element() :: {xmlstreamelement, fxml:xmlel()} |
			  {xmlstreamstart, binary(), [{binary(), binary()}]} |
			  {xmlstreamend, binary()} |
			  {xmlstreamraw, iodata()}.
-type cert() :: #'Certificate'{} | #'OTPCertificate'{}.

-record(socket_state, {sockmod           :: sockmod(),
                       socket            :: socket(),
		       max_stanza_size   :: timeout(),
		       xml_stream :: undefined | fxml_stream:xml_stream_state(),
		       shaper = none :: none | p1_shaper:state(),
		       sock_peer_name = none :: none | {endpoint(), endpoint()},
		       tls_certfile = none :: none | binary()}).

-type socket_state() :: #socket_state{}.

-export_type([socket/0, socket_state/0, sockmod/0]).

-callback send_xml(ext_socket(), stream_element()) -> ok | {error, inet:posix()}.
-callback get_owner(ext_socket()) -> pid().
-callback get_transport(ext_socket()) -> atom().
-callback change_shaper(ext_socket(), none | p1_shaper:state()) -> ok.
-callback controlling_process(ext_socket(), pid()) -> ok | {error, inet:posix()}.
-callback close(ext_socket()) -> ok | {error, inet:posix()}.
-callback sockname(ext_socket()) -> {ok, endpoint()} | {error, inet:posix()}.
-callback peername(ext_socket()) -> {ok, endpoint()} | {error, inet:posix()}.
-callback setopts(ext_socket(), [{active, once}]) -> ok | {error, inet:posix()}.
-callback get_peer_certificate(ext_socket(), plain|otp|der) -> {ok, cert() | binary()} | error.

-optional_callbacks([get_peer_certificate/2]).

-define(dbg(Fmt, Args),
	case xmpp_config:debug(global) of
	    {ok, true} -> error_logger:info_msg(Fmt, Args);
	    _ -> false
	end).

-dialyzer({no_match, send_xml/2}).
-dialyzer({no_unused, stringify_stream_element/1}).

%%====================================================================
%% API
%%====================================================================
-spec new(sockmod(), socket(), [proplists:property()]) -> socket_state().
new(SockMod, Socket, Opts) ->
    MaxStanzaSize = proplists:get_value(max_stanza_size, Opts, infinity),
    SockPeer =  proplists:get_value(sock_peer_name, Opts, none),
    XMLStream = case get_owner(SockMod, Socket) of
		    Pid when Pid == self() ->
			fxml_stream:new(self(), MaxStanzaSize);
		    _ ->
			undefined
		end,
    #socket_state{sockmod = SockMod,
		  socket = Socket,
		  xml_stream = XMLStream,
		  max_stanza_size = MaxStanzaSize,
		  sock_peer_name = SockPeer}.

connect(Addr, Port, Opts) ->
    connect(Addr, Port, Opts, infinity, self()).

connect(Addr, Port, Opts, Timeout) ->
    connect(Addr, Port, Opts, Timeout, self()).

connect(Addr, Port, Opts, Timeout, Owner) ->
    case do_connect(Addr, Port, Opts, Timeout) of
	{ok, Socket} ->
	    SocketData = new(gen_tcp, Socket, []),
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

-ifndef(USE_ADDRPORTCONNECT).
do_connect(Addr, Port, Opts, Timeout)
    when is_tuple(Addr) orelse
         is_list(Addr)  orelse
         is_atom(Addr)  orelse
         (Addr =:= any) orelse
         (Addr =:= loopback) ->
        gen_tcp:connect(Addr, Port, Opts, Timeout);
do_connect(SockAddr, _Port, Opts, Timeout) ->
        gen_tcp:connect(SockAddr, Opts, Timeout).
-else.
do_connect(Addr, Port, Opts, Timeout)
    when is_tuple(Addr) orelse
         is_list(Addr)  orelse
         is_atom(Addr)  orelse
         (Addr =:= any) orelse
         (Addr =:= loopback) ->
        gen_tcp:connect(Addr, Port, Opts, Timeout);
do_connect(SockAddr, _Port, Opts, Timeout) ->
        #{addr := Addr, port := Port} = SockAddr,
        gen_tcp:connect(Addr, Port, Opts, Timeout).
-endif.

-spec starttls(socket_state(), [proplists:property()]) ->
		      {ok, socket_state()} |
		      {error, inet:posix() | atom() | binary()}.
starttls(#socket_state{sockmod = gen_tcp,
		       socket = Socket} = SocketData, TLSOpts) ->
    case fast_tls:tcp_to_tls(Socket, TLSOpts) of
	{ok, TLSSocket} ->
	    SocketData1 = SocketData#socket_state{socket = TLSSocket,
						  sockmod = fast_tls,
						  tls_certfile = proplists:get_value(certfile, TLSOpts, none)},
	    SocketData2 = reset_stream(SocketData1),
	    case fast_tls:recv_data(TLSSocket, <<>>) of
		{ok, Data} -> parse(SocketData2, Data);
		{error, _} = Err ->
		    Err
	    end;
	{error, _} = Err ->
	    Err
    end;
starttls(_, _) ->
    erlang:error(badarg).

-spec finish_tls_handshake(socket_state()) ->
		      {ok, socket_state()} |
		      {error, inet:posix() | atom() | binary()}.
 finish_tls_handshake(#socket_state{sockmod = fast_tls,
		       socket = Socket} = SocketData) ->
    fast_tls:setopts(Socket, [{active, false}]),
    case fast_tls:finish_handshake(Socket, 5000) of
	ok ->
	    {ok, SocketData};
	{error, _} = Err ->
	    Err
    end;
finish_tls_handshake(SocketData) ->
    {ok, SocketData}.

compress(SocketData) -> compress(SocketData, undefined).

compress(#socket_state{sockmod = SockMod,
		       socket = Socket} = SocketData, Data)
  when SockMod == gen_tcp orelse SockMod == fast_tls ->
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
    end;
compress(_, _) ->
    erlang:error(badarg).

reset_stream(#socket_state{xml_stream = XMLStream,
			   sockmod = SockMod, socket = Socket,
			   max_stanza_size = MaxStanzaSize} = SocketData) ->
    if XMLStream /= undefined ->
	    XMLStream1 = try fxml_stream:reset(XMLStream)
			 catch error:_ ->
				 fxml_stream:close(XMLStream),
				 fxml_stream:new(self(), MaxStanzaSize)
			 end,
	    SocketData#socket_state{xml_stream = XMLStream1};
       true ->
	    Socket1 = SockMod:reset_stream(Socket),
	    SocketData#socket_state{socket = Socket1}
    end.

-spec send_element(socket_state(), fxml:xmlel()) -> ok | {error, inet:posix()}.
send_element(#socket_state{xml_stream = undefined} = SocketData, El) ->
    send_xml(SocketData, {xmlstreamelement, El});
send_element(SocketData, El) ->
    send(SocketData, fxml:element_to_binary(El)).

-spec send_header(socket_state(), fxml:xmlel()) -> ok | {error, inet:posix()}.
send_header(#socket_state{xml_stream = undefined} = SocketData, El) ->
    send_xml(SocketData, {xmlstreamstart, El#xmlel.name, El#xmlel.attrs});
send_header(SocketData, El) ->
    send(SocketData, fxml:element_to_header(El)).

-spec send_trailer(socket_state()) -> ok | {error, inet:posix()}.
send_trailer(#socket_state{xml_stream = undefined} = SocketData) ->
    send_xml(SocketData, {xmlstreamend, <<"stream:stream">>});
send_trailer(SocketData) ->
    send(SocketData, <<"</stream:stream>">>).

-spec send_ws_ping(socket_state()) -> ok | {error, inet:posix()}.
send_ws_ping(#socket_state{xml_stream = undefined}) ->
    % we don't send cdata on xmlsockets
    ok;
send_ws_ping(SocketData) ->
    send(SocketData, <<"\r\n\r\n">>).

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

-spec send_xml(socket_state(), stream_element()) -> ok | {error, any()}.
send_xml(#socket_state{sockmod = SockMod, socket = Socket} = SocketData, El) ->
    ?dbg("(~s) Send XML on stream = ~p", [pp(SocketData),
					  stringify_stream_element(El)]),
    SockMod:send_xml(Socket, El).

stringify_stream_element({xmlstreamstart, Name, Attrs}) ->
    fxml:element_to_header(#xmlel{name = Name, attrs = Attrs});
stringify_stream_element({xmlstreamend, Name}) ->
    <<"</",Name/binary,">">>;
stringify_stream_element({xmlstreamelement, El}) ->
    fxml:element_to_binary(El);
stringify_stream_element({xmlstreamerror, Data}) ->
    Err = iolist_to_binary(io_lib:format("~p", [Data])),
    <<"!StreamError: ", Err/binary>>;
stringify_stream_element({xmlstreamraw, Data}) ->
    Data.

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
change_shaper(#socket_state{xml_stream = XMLStream,
			    sockmod = SockMod,
			    socket = Socket} = SocketData, Shaper) ->
    if XMLStream /= undefined ->
	    SocketData#socket_state{shaper = Shaper};
       true ->
	    SockMod:change_shaper(Socket, Shaper),
	    SocketData
    end.

monitor(#socket_state{xml_stream = undefined,
		      sockmod = SockMod, socket = Socket}) ->
    erlang:monitor(process, SockMod:get_owner(Socket));
monitor(_) ->
    make_ref().

controlling_process(#socket_state{sockmod = SockMod,
				  socket = Socket}, Pid) ->
    SockMod:controlling_process(Socket, Pid).

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
	_ -> SockMod:get_transport(Socket)
    end.

get_owner(SockMod, _) when SockMod == gen_tcp orelse
			   SockMod == fast_tls orelse
			   SockMod == ezlib ->
    self();
get_owner(SockMod, Socket) ->
    SockMod:get_owner(Socket).

-spec get_peer_certificate(socket_state(), plain|otp) -> {ok, cert()} | error;
			  (socket_state(), der) -> {ok, binary()} | error.
get_peer_certificate(#socket_state{sockmod = SockMod,
				   socket = Socket}, Type) ->
    case erlang:function_exported(SockMod, get_peer_certificate, 2) of
	true -> SockMod:get_peer_certificate(Socket, Type);
	false -> error
    end.

-spec get_tls_cert_hash(socket_state()) -> {ok, binary()} | error.
get_tls_cert_hash(#socket_state{tls_certfile = none}) ->
    error;
get_tls_cert_hash(#socket_state{tls_certfile = Path}) ->
    case file:read_file(Path) of
	{ok, Content} ->
	    try lists:keyfind('Certificate', 1, public_key:pem_decode(Content)) of
		{'Certificate', Cert, not_encrypted} ->
		    try public_key:pkix_decode_cert(Cert, otp) of
			#'OTPCertificate'{signatureAlgorithm = #'SignatureAlgorithm'{algorithm = Algo}} ->
			    Hash = case public_key:pkix_sign_types(Algo) of
				{sha, _} -> sha256;
				{md5, _} -> sha256;
				{Hash2, _} -> Hash2
			    end,
			    {ok, crypto:hash(Hash, Cert)};
			_ ->
			    error
		    catch _:_ ->
			error
		    end;
		_ ->
		    error
	    catch _:_ ->
		error
	    end;
	_ ->
	    error
    end.

-spec get_negotiated_cipher(socket_state()) -> {ok, binary()} | error.
get_negotiated_cipher(#socket_state{sockmod = SockMod,
				    socket = Socket}) ->
    case erlang:function_exported(SockMod, get_negotiated_cipher, 1) of
	true -> SockMod:get_negotiated_cipher(Socket);
	false -> error
    end.

-spec get_tls_last_message(socket_state(), peer | self) -> {ok, binary()} | {error, term()}.
get_tls_last_message(#socket_state{sockmod = SockMod,
				    socket = Socket}, Type) ->
    case erlang:function_exported(SockMod, get_tls_last_message, 2) of
	true -> SockMod:get_tls_last_message(Type, Socket);
	false -> {error, unavailable}
    end.

-spec get_tls_cb_exporter(socket_state()) -> {ok, binary()} | {error, term()}.
get_tls_cb_exporter(#socket_state{sockmod = SockMod,
				  socket = Socket}) ->
    case erlang:function_exported(SockMod, get_tls_cb_exporter, 1) of
	true -> SockMod:get_tls_cb_exporter(Socket);
	false -> {error, unavailable}
    end.

get_verify_result(SocketData) ->
    fast_tls:get_verify_result(SocketData#socket_state.socket).

close(#socket_state{sockmod = SockMod, socket = Socket}) ->
    SockMod:close(Socket).

release(#socket_state{xml_stream = XMLStream} = State) ->
    close(State),
    case XMLStream of
	undefined -> ok;
	_ -> fxml_stream:close(XMLStream)
    end.

-spec sockname(socket_state()) -> {ok, endpoint()} | {error, inet:posix()}.
sockname(#socket_state{sockmod = SockMod,
		       socket = Socket,
		       sock_peer_name = SockPeer}) ->
    case SockPeer of
	none ->
	    case SockMod of
		gen_tcp -> inet:sockname(Socket);
		_ -> SockMod:sockname(Socket)
	    end;
	{SN, _} ->
	    {ok, SN}
    end.

-spec peername(socket_state()) -> {ok, endpoint()} | {error, inet:posix()}.
peername(#socket_state{sockmod = SockMod,
		       socket = Socket,
		       sock_peer_name = SockPeer}) ->
    case SockPeer of
	none ->
	    case SockMod of
		gen_tcp -> inet:peername(Socket);
		_ -> SockMod:peername(Socket)
	    end;
	{_, PN} ->
	    {ok, PN}
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

pp(#socket_state{sockmod = SockMod, socket = Socket} = State) ->
    Transport = get_transport(State),
    Receiver = get_owner(SockMod, Socket),
    io_lib:format("~s|~w", [Transport, Receiver]).

parse(SocketData, Data) when Data == <<>>; Data == [] ->
    case activate(SocketData) of
	ok ->
	    {ok, SocketData};
	{error, _} = Err ->
	    Err
    end;
parse(SocketData, [El | Els]) when is_record(El, xmlel) ->
    ?dbg("(~s) Received XML on stream = ~p", [pp(SocketData),
					      fxml:element_to_binary(El)]),
    self() ! {'$gen_event', {xmlstreamelement, El}},
    parse(SocketData, Els);
parse(SocketData, [El | Els]) when
      element(1, El) == xmlstreamstart;
      element(1, El) == xmlstreamelement;
      element(1, El) == xmlstreamend;
      element(1, El) == xmlstreamerror ->
    ?dbg("(~s) Received XML on stream = ~p", [pp(SocketData),
					      stringify_stream_element(El)]),
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

shaper_update(none, _) ->
    {none, 0};
shaper_update(Shaper, Size) ->
    p1_shaper:update(Shaper, Size).
