%%%-------------------------------------------------------------------
%%%
%%% Copyright (C) 2002-2022 ProcessOne, SARL. All Rights Reserved.
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
-module(xmpp_stream_in).
-define(GEN_SERVER, p1_server).
-behaviour(?GEN_SERVER).

-protocol({rfc, 6120}).
-protocol({xep, 114, '1.6'}).

%% API
-export([start/3, start_link/3, call/3, cast/2, reply/2, stop/1, stop_async/1,
	 accept/1, send/2, close/1, close/2, send_error/3, establish/1,
	 get_transport/1, change_shaper/2, configure_queue/3, set_timeout/2,
	 format_error/1, send_ws_ping/1]).

%% gen_server callbacks
-export([init/1, handle_cast/2, handle_call/3, handle_info/2,
	 terminate/2, code_change/3]).

-deprecated([{stop, 1}]).

%%-define(DBGFSM, true).
-ifdef(DBGFSM).
-define(FSMOPTS, [{debug, [trace]}]).
-else.
-define(FSMOPTS, []).
-endif.

-include("xmpp.hrl").
-type state() :: #{owner := pid(),
		   mod := module(),
		   socket := xmpp_socket:socket(),
		   socket_mod => xmpp_socket:sockmod(),
		   socket_opts => [proplists:property()],
		   socket_monitor => reference(),
		   stream_timeout := {integer(), integer()} | infinity,
		   stream_state := stream_state(),
		   stream_direction => in | out,
		   stream_id => binary(),
		   stream_header_sent => boolean(),
		   stream_restarted => boolean(),
		   stream_compressed => boolean(),
		   stream_encrypted => boolean(),
		   stream_version => {non_neg_integer(), non_neg_integer()},
		   stream_authenticated => boolean(),
		   stream_queue := [xmpp_element() | xmlel()],
		   stream_queue_max := non_neg_integer(),
		   stream_queue_timeout => {non_neg_integer(), integer()},
		   ip => {inet:ip_address(), inet:port_number()},
		   codec_options => [xmpp:decode_option()],
		   xmlns => binary(),
		   lang => binary(),
		   user => binary(),
		   server => binary(),
		   resource => binary(),
		   lserver => binary(),
		   remote_server => binary(),
		   sasl_mech => binary(),
		   sasl_state => xmpp_sasl:sasl_state(),
		   _ => _}.
-type stream_state() :: accepting | wait_for_stream | wait_for_handshake |
			wait_for_starttls | wait_for_sasl_request |
			wait_for_sasl_response | wait_for_bind |
			established | disconnected.
-type stop_reason() :: {stream, reset | {in | out, stream_error()}} |
		       {tls, inet:posix() | atom() | binary()} |
		       {socket, inet:posix() | atom()} |
		       internal_failure.
-type noreply() :: {noreply, state(), timeout()}.
-type next_state() :: noreply() | {stop, term(), state()}.
-export_type([state/0, stop_reason/0]).
-callback init(list()) -> {ok, state()} | {error, term()} | ignore.
-callback handle_cast(term(), state()) -> state().
-callback handle_call(term(), term(), state()) -> state().
-callback handle_info(term(), state()) -> state().
-callback terminate(term(), state()) -> any().
-callback code_change(term(), state(), term()) -> {ok, state()} | {error, term()}.
-callback handle_stream_start(stream_start(), state()) -> state().
-callback handle_stream_established(state()) -> state().
-callback handle_stream_end(stop_reason(), state()) -> state().
-callback handle_cdata(binary(), state()) -> state().
-callback handle_unauthenticated_packet(xmpp_element(), state()) -> state().
-callback handle_authenticated_packet(xmpp_element(), state()) -> state().
-callback handle_unbinded_packet(xmpp_element(), state()) -> state().
-callback handle_auth_success(binary(), binary(), module(), state()) -> state().
-callback handle_auth_failure(binary(), binary(), binary(), state()) -> state().
-callback handle_send(xmpp_element(), ok | {error, inet:posix()}, state()) -> state().
-callback handle_recv(fxml:xmlel(), xmpp_element() | {error, term()}, state()) -> state().
-callback handle_timeout(state()) -> state().
-callback get_password_fun(state()) -> fun().
-callback get_password_fun(xmpp_sasl:mechanism(), state()) -> fun().
-callback check_password_fun(xmpp_sasl:mechanism(), state()) -> fun().
-callback check_password_digest_fun(xmpp_sasl:mechanism(), state()) -> fun().
-callback bind(binary(), state()) -> {ok, state()} | {error, stanza_error(), state()}.
-callback compress_methods(state()) -> [binary()].
-callback tls_options(state()) -> [proplists:property()].
-callback tls_required(state()) -> boolean().
-callback tls_enabled(state()) -> boolean().
-callback sasl_mechanisms([xmpp_sasl:mechanism()], state()) -> [xmpp_sasl:mechanism()].
-callback unauthenticated_stream_features(state()) -> [xmpp_element()].
-callback authenticated_stream_features(state()) -> [xmpp_element()].

%% All callbacks are optional
-optional_callbacks([init/1,
		     handle_cast/2,
		     handle_call/3,
		     handle_info/2,
		     terminate/2,
		     code_change/3,
		     handle_stream_start/2,
		     handle_stream_established/1,
		     handle_stream_end/2,
		     handle_cdata/2,
		     handle_authenticated_packet/2,
		     handle_unauthenticated_packet/2,
		     handle_unbinded_packet/2,
		     handle_auth_success/4,
		     handle_auth_failure/4,
		     handle_send/3,
		     handle_recv/3,
		     handle_timeout/1,
		     get_password_fun/1,
		     get_password_fun/2,
		     check_password_fun/2,
		     check_password_digest_fun/2,
		     bind/2,
		     compress_methods/1,
		     tls_options/1,
		     tls_required/1,
		     tls_enabled/1,
		     sasl_mechanisms/2,
		     unauthenticated_stream_features/1,
		     authenticated_stream_features/1]).

%%%===================================================================
%%% API
%%%===================================================================
start(Mod, Args, Opts) ->
    ?GEN_SERVER:start(?MODULE, [Mod|Args], Opts ++ ?FSMOPTS).

start_link(Mod, Args, Opts) ->
    ?GEN_SERVER:start_link(?MODULE, [Mod|Args], Opts ++ ?FSMOPTS).

call(Ref, Msg, Timeout) ->
    ?GEN_SERVER:call(Ref, Msg, Timeout).

cast(Ref, Msg) ->
    ?GEN_SERVER:cast(Ref, Msg).

reply(Ref, Reply) ->
    ?GEN_SERVER:reply(Ref, Reply).

-spec stop(pid()) -> ok;
	  (state()) -> no_return().
stop(Pid) when is_pid(Pid) ->
    stop_async(Pid);
stop(#{owner := Owner} = State) when Owner == self() ->
    terminate(normal, State),
    try erlang:nif_error(normal)
    catch _:_ -> exit(normal)
    end;
stop(_) ->
    erlang:error(badarg).

-spec stop_async(pid()) -> ok.
stop_async(Pid) when is_pid(Pid) ->
    cast(Pid, stop);
stop_async(_) ->
    erlang:error(badarg).

-spec accept(pid()) -> ok.
accept(Pid) ->
    cast(Pid, accept).

-spec send(pid(), xmpp_element()) -> ok;
	  (state(), xmpp_element()) -> state().
send(Pid, Pkt) when is_pid(Pid) ->
    cast(Pid, {send, Pkt});
send(#{owner := Owner} = State, Pkt) when Owner == self() ->
    send_pkt(State, Pkt);
send(_, _) ->
    erlang:error(badarg).

-spec send_ws_ping(pid()) -> ok;
		  (state()) -> state().
send_ws_ping(Pid) when is_pid(Pid) ->
    cast(Pid, send_ws_ping);
send_ws_ping(#{owner := Owner, socket := Sock,
	       stream_header_sent := true} = State)
    when Owner == self() ->
    case xmpp_socket:send_ws_ping(Sock) of
	ok ->
	    State;
	{error, Why} ->
	    process_stream_end({socket, Why}, State)
    end;
send_ws_ping(State) ->
    State.

-spec close(pid()) -> ok;
	   (state()) -> state().
close(Pid) when is_pid(Pid) ->
    close(Pid, closed);
close(#{owner := Owner} = State) when Owner == self() ->
    close_socket(State);
close(_) ->
    erlang:error(badarg).

-spec close(pid(), atom()) -> ok.
close(Pid, Reason) ->
    cast(Pid, {close, Reason}).

-spec establish(state()) -> state().
establish(State) ->
    process_stream_established(State).

-spec configure_queue(state(), non_neg_integer(), non_neg_integer()) -> state().
configure_queue(#{owner := Owner} = State, MaxSize, MaxDelay)
  when Owner == self() ->
    flush_queue(State), % Support reconfiguration.
    if MaxSize == 0; MaxDelay == 0 ->
	    State#{stream_queue_max => 0};
       true ->
	    CurrentTime = p1_time_compat:monotonic_time(milli_seconds),
	    State#{stream_queue_max => MaxSize,
		   stream_queue_timeout => {MaxDelay, CurrentTime}}
    end;
configure_queue(_, _, _) ->
    erlang:error(badarg).

-spec set_timeout(state(), timeout()) -> state().
set_timeout(#{owner := Owner} = State, Timeout) when Owner == self() ->
    case Timeout of
	infinity -> State#{stream_timeout => infinity};
	_ ->
	    Time = p1_time_compat:monotonic_time(milli_seconds),
	    State#{stream_timeout => {Timeout, Time}}
    end;
set_timeout(_, _) ->
    erlang:error(badarg).

-spec get_transport(state()) -> atom().
get_transport(#{socket := Socket, owner := Owner})
  when Owner == self() ->
    xmpp_socket:get_transport(Socket);
get_transport(_) ->
    erlang:error(badarg).

-spec change_shaper(state(), none | p1_shaper:state()) -> state().
change_shaper(#{socket := Socket, owner := Owner} = State, Shaper)
  when Owner == self() ->
    Socket1 = xmpp_socket:change_shaper(Socket, Shaper),
    State#{socket => Socket1};
change_shaper(_, _) ->
    erlang:error(badarg).

-spec format_error(stop_reason()) ->  binary().
format_error({socket, Reason}) ->
    format("Connection failed: ~s", [format_inet_error(Reason)]);
format_error({stream, reset}) ->
    <<"Stream reset by peer">>;
format_error({stream, {in, #stream_error{} = Err}}) ->
    format("Stream closed by peer: ~s", [xmpp:format_stream_error(Err)]);
format_error({stream, {out, #stream_error{} = Err}}) ->
    format("Stream closed by local host: ~s", [xmpp:format_stream_error(Err)]);
format_error({tls, Reason}) ->
    format("TLS failed: ~s", [format_tls_error(Reason)]);
format_error(internal_failure) ->
    <<"Internal server error">>;
format_error(Err) ->
    format("Unrecognized error: ~w", [Err]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
init([Mod, {SockMod, Socket}, Opts]) ->
    Time = p1_time_compat:monotonic_time(milli_seconds),
    Timeout = timer:seconds(30),
    State = #{owner => self(),
	      mod => Mod,
	      socket => Socket,
	      socket_mod => SockMod,
	      socket_opts => Opts,
	      stream_timeout => {Timeout, Time},
	      stream_state => accepting,
	      stream_queue => [],
	      stream_queue_max => 0},
    {ok, State, Timeout}.

-spec handle_cast(term(), state()) -> next_state().
handle_cast(accept, #{socket := Socket,
		      socket_mod := SockMod,
		      socket_opts := Opts} = State) ->
    XMPPSocket = xmpp_socket:new(SockMod, Socket, Opts),
    SocketMonitor = xmpp_socket:monitor(XMPPSocket),
    case xmpp_socket:peername(XMPPSocket) of
	{ok, IP} ->
	    State1 = maps:remove(socket_mod, State),
	    State2 = maps:remove(socket_opts, State1),
	    State3 = State2#{socket => XMPPSocket,
			     socket_monitor => SocketMonitor,
			     ip => IP},
	    case init_state(State3, Opts) of
		{stop, State4} ->
		    {stop, normal, State4};
		State4 ->
		    case is_disconnected(State4) of
			true -> noreply(State4);
			false -> handle_info({tcp, Socket, <<>>}, State4)
		    end
	    end;
	{error, _} ->
	    {stop, normal, State}
    end;
handle_cast({send, Pkt}, State) ->
    noreply(send_pkt(State, Pkt));
handle_cast(send_ws_ping, State) ->
    noreply(send_ws_ping(State));
handle_cast(release_socket, #{socket := Socket,
			      socket_monitor := Monitor} = State) ->
    erlang:demonitor(Monitor),
    xmpp_socket:release(Socket),
    State2 = maps:remove(socket, State),
    State3 = maps:remove(socket_monitor, State2),
    noreply(State3);
handle_cast(stop, State) ->
    {stop, normal, State};
handle_cast({close, Reason}, State) ->
    State1 = close_socket(State),
    noreply(
      case is_disconnected(State) of
	  true -> State1;
	  false -> process_stream_end({socket, Reason}, State)
      end);
handle_cast(Cast, State) ->
    noreply(try callback(handle_cast, Cast, State)
	      catch _:{?MODULE, undef} -> State
	      end).

-spec handle_call(term(), term(), state()) -> next_state().
handle_call(Call, From, State) ->
    noreply(try callback(handle_call, Call, From, State)
	    catch _:{?MODULE, undef} -> State
	    end).

-spec handle_info(term(), state()) -> next_state().
handle_info(_, #{stream_state := accepting} = State) ->
    {stop, normal, State};
handle_info({'$gen_event', {xmlstreamstart, Name, Attrs}},
	    #{stream_state := wait_for_stream,
	      xmlns := XMLNS, lang := MyLang} = State) ->
    El = #xmlel{name = Name, attrs = Attrs},
    noreply(
      try xmpp:decode(El, XMLNS, []) of
	  #stream_start{} = Pkt ->
	      State1 = send_header(State, Pkt),
	      case is_disconnected(State1) of
		  true -> State1;
		  false -> process_stream(Pkt, State1)
	      end;
	  _ ->
	      State1 = send_header(State),
	      case is_disconnected(State1) of
		  true -> State1;
		  false -> send_pkt(State1, xmpp:serr_invalid_xml())
	      end
      catch _:{xmpp_codec, Why} ->
	      State1 = send_header(State),
	      case is_disconnected(State1) of
		  true -> State1;
		  false ->
		      Txt = xmpp:io_format_error(Why),
		      Lang = select_lang(MyLang, xmpp:get_lang(El)),
		      Err = xmpp:serr_invalid_xml(Txt, Lang),
		      send_pkt(State1, Err)
	      end
      end);
handle_info({'$gen_event', {xmlstreamend, _}}, State) ->
    noreply(process_stream_end({stream, reset}, State));
handle_info({'$gen_event', closed}, State) ->
    noreply(process_stream_end({socket, closed}, State));
handle_info({'$gen_event', {xmlstreamerror, Reason}}, #{lang := Lang}= State) ->
    State1 = send_header(State),
    noreply(
      case is_disconnected(State1) of
	  true -> State1;
	  false ->
	      Err = case Reason of
			<<"XML stanza is too big">> ->
			    xmpp:serr_policy_violation(Reason, Lang);
			{_, Txt} ->
			    xmpp:serr_not_well_formed(Txt, Lang)
		    end,
	      send_pkt(State1, Err)
      end);
handle_info({'$gen_event', El}, #{stream_state := wait_for_stream} = State) ->
    error_logger:warning_msg("unexpected event from XML driver: ~p; "
			     "xmlstreamstart was expected", [El]),
    State1 = send_header(State),
    noreply(
      case is_disconnected(State1) of
	  true -> State1;
	  false -> send_pkt(State1, xmpp:serr_invalid_xml())
      end);
handle_info({'$gen_event', {xmlstreamelement, El}},
	    #{xmlns := NS, codec_options := Opts} = State) ->
    noreply(
      try xmpp:decode(El, NS, Opts) of
	  Pkt ->
	      State1 = try callback(handle_recv, El, Pkt, State)
		       catch _:{?MODULE, undef} -> State
		       end,
	      case is_disconnected(State1) of
		  true -> State1;
		  false -> process_element(Pkt, State1)
	      end
      catch _:{xmpp_codec, Why} ->
	      State1 = try callback(handle_recv, El, {error, Why}, State)
		       catch _:{?MODULE, undef} -> State
		       end,
	      case is_disconnected(State1) of
		  true -> State1;
		  false -> process_invalid_xml(State1, El, Why)
	      end
      end);
handle_info({'$gen_all_state_event', {xmlstreamcdata, Data}},
	    State) ->
    noreply(try callback(handle_cdata, Data, State)
	    catch _:{?MODULE, undef} -> State
	    end);
handle_info(timeout, #{stream_queue := [_|_]} = State) ->
    noreply(flush_queue(State));
handle_info(timeout, #{lang := Lang} = State) ->
    Disconnected = is_disconnected(State),
    noreply(try callback(handle_timeout, State)
	    catch _:{?MODULE, undef} when not Disconnected ->
		    Txt = <<"Idle connection">>,
		    send_pkt(State, xmpp:serr_connection_timeout(Txt, Lang));
		  _:{?MODULE, undef} ->
		      {stop, normal, State}
	    end);
handle_info({'DOWN', MRef, _Type, _Object, _Info},
	    #{socket_monitor := MRef} = State) ->
    noreply(process_stream_end({socket, closed}, State));
handle_info({tcp, _, Data}, #{socket := Socket} = State) ->
    noreply(
      case xmpp_socket:recv(Socket, Data) of
	  {ok, NewSocket} ->
	      State#{socket => NewSocket};
	  {error, Reason} when is_atom(Reason) ->
	      process_stream_end({socket, Reason}, State);
	  {error, Reason} ->
	      %% TODO: make fast_tls return atoms
	      process_stream_end({tls, Reason}, State)
      end);
% Skip new tcp messages after socket get removed from state
handle_info({tcp, _, _}, State) ->
    noreply(State);
handle_info({tcp_closed, _}, State) ->
    handle_info({'$gen_event', closed}, State);
handle_info({tcp_error, _, Reason}, State) ->
    noreply(process_stream_end({socket, Reason}, State));
handle_info(Info, State) ->
    noreply(try callback(handle_info, Info, State)
	    catch _:{?MODULE, undef} -> State
	    end).

-spec terminate(term(), state()) -> state().
terminate(_, #{stream_state := accepting} = State) ->
    State;
terminate(Reason, State) ->
    case get(already_terminated) of
	true ->
	    State;
	_ ->
	    put(already_terminated, true),
	    try callback(terminate, Reason, State)
	    catch _:{?MODULE, undef} -> ok
	    end,
	    send_trailer(State)
    end.

-spec code_change(term(), state(), term()) -> {ok, state()} | {error, term()}.
code_change(OldVsn, State, Extra) ->
    callback(code_change, OldVsn, State, Extra).

%%%===================================================================
%%% Internal functions
%%%===================================================================
-spec init_state(state(), [proplists:property()]) -> state() | {stop, state()}.
init_state(#{socket := Socket, mod := Mod} = State, Opts) ->
    Encrypted = proplists:get_bool(tls, Opts),
    State1 = State#{stream_direction => in,
		    stream_id => xmpp_stream:new_id(),
		    stream_state => wait_for_stream,
		    stream_header_sent => false,
		    stream_restarted => false,
		    stream_compressed => false,
		    stream_encrypted => Encrypted,
		    stream_version => {1,0},
		    stream_authenticated => false,
		    codec_options => [ignore_els],
		    xmlns => ?NS_CLIENT,
		    lang => <<"">>,
		    user => <<"">>,
		    server => <<"">>,
		    resource => <<"">>,
		    lserver => <<"">>},
    case try Mod:init([State1, Opts])
	 catch _:undef -> {ok, State1}
	 end of
	{ok, State2} when not Encrypted ->
	    State2;
	{ok, State2} when Encrypted ->
	    TLSOpts = try callback(tls_options, State2)
		      catch _:{?MODULE, undef} -> []
		      end,
	    case xmpp_socket:starttls(Socket, TLSOpts) of
		{ok, TLSSocket} ->
		    State2#{socket => TLSSocket};
		{error, Reason} ->
		    process_stream_end({tls, Reason}, State2)
	    end;
	{error, Reason} ->
	    process_stream_end(Reason, State1);
	ignore ->
	    {stop, State}
    end.

-spec noreply(state()) -> noreply();
	     ({stop, state()}) -> {stop, normal, state()};
	     ({stop, normal, state()}) -> {stop, normal, state()}.
noreply({stop, State}) ->
    {stop, normal, State};
noreply({stop, normal, State}) ->
    {stop, normal, State};
noreply(State) ->
    {noreply, State, get_timeout(State)}.

-spec get_timeout(state()) -> timeout().
get_timeout(State) ->
    min(get_stream_timeout(State), get_queue_timeout(State)).

-spec get_stream_timeout(state()) -> timeout().
get_stream_timeout(#{stream_timeout := infinity}) ->
    infinity;
get_stream_timeout(#{stream_timeout := {MSecs, StartTime}}) ->
    CurrentTime = p1_time_compat:monotonic_time(milli_seconds),
    max(0, MSecs - CurrentTime + StartTime).

-spec get_queue_timeout(state()) -> timeout().
get_queue_timeout(#{stream_queue := []}) ->
    infinity;
get_queue_timeout(#{stream_queue_timeout := {MSecs, StartTime}}) ->
    CurrentTime = p1_time_compat:monotonic_time(milli_seconds),
    max(0, MSecs - CurrentTime + StartTime).

-spec is_disconnected(state()) -> boolean().
is_disconnected(#{stream_state := StreamState}) ->
    StreamState == disconnected.

-spec process_invalid_xml(state(), fxml:xmlel(), term()) -> state().
process_invalid_xml(#{lang := MyLang} = State, El, Reason) ->
    case xmpp:is_stanza(El) of
	true ->
	    Txt = xmpp:io_format_error(Reason),
	    Lang = select_lang(MyLang, xmpp:get_lang(El)),
	    send_error(State, El, xmpp:err_bad_request(Txt, Lang));
	false ->
	    case {xmpp:get_name(El), xmpp:get_ns(El)} of
		{Tag, ?NS_SASL} when Tag == <<"auth">>;
				     Tag == <<"response">>;
				     Tag == <<"abort">> ->
		    Txt = xmpp:io_format_error(Reason),
		    Err = #sasl_failure{reason = 'malformed-request',
					text = xmpp:mk_text(Txt, MyLang)},
		    send_pkt(State, Err);
		{<<"starttls">>, ?NS_TLS} ->
		    send_pkt(State, #starttls_failure{});
		{<<"compress">>, ?NS_COMPRESS} ->
		    Err = #compress_failure{reason = 'setup-failed'},
		    send_pkt(State, Err);
		_ ->
		    %% Maybe add something more?
		    State
	    end
    end.

-spec process_stream_end(stop_reason(), state()) -> state().
process_stream_end(_, #{stream_state := disconnected} = State) ->
    State;
process_stream_end(Reason, State) ->
    State1 = State#{stream_timeout => infinity,
		    stream_state => disconnected},
    try
        State2 = callback(handle_stream_end, Reason, State1),
        cast(self(), release_socket),
        State2
    catch _:{?MODULE, undef} ->
	stop_async(self()),
        State1
    end.

-spec process_stream(stream_start(), state()) -> state().
process_stream(#stream_start{xmlns = XML_NS,
			     stream_xmlns = STREAM_NS},
	       #{xmlns := NS} = State)
  when XML_NS /= NS; STREAM_NS /= ?NS_STREAM ->
    send_pkt(State, xmpp:serr_invalid_namespace());
process_stream(#stream_start{version = {N, _}}, State) when N > 1 ->
    send_pkt(State, xmpp:serr_unsupported_version());
process_stream(#stream_start{lang = Lang},
	       #{xmlns := ?NS_CLIENT, lang := DefaultLang} = State)
  when size(Lang) > 35 ->
    %% As stated in BCP47, 4.4.1:
    %% Protocols or specifications that specify limited buffer sizes for
    %% language tags MUST allow for language tags of at least 35 characters.
    %% Do not store long language tag to avoid possible DoS/flood attacks
    Txt = <<"Too long value of 'xml:lang' attribute">>,
    send_pkt(State, xmpp:serr_policy_violation(Txt, DefaultLang));
process_stream(#stream_start{to = undefined, version = Version} = StreamStart,
	       #{lang := Lang, server := Server, xmlns := NS} = State) ->
    if Version < {1,0} andalso NS /= ?NS_COMPONENT ->
	    %% Work-around for gmail servers
	    To = jid:make(Server),
	    process_stream(StreamStart#stream_start{to = To}, State);
       true ->
	    Txt = <<"Missing 'to' attribute">>,
	    send_pkt(State, xmpp:serr_improper_addressing(Txt, Lang))
    end;
process_stream(#stream_start{to = #jid{luser = U, lresource = R}},
	       #{lang := Lang} = State) when U /= <<"">>; R /= <<"">> ->
    Txt = <<"Improper 'to' attribute">>,
    send_pkt(State, xmpp:serr_improper_addressing(Txt, Lang));
process_stream(#stream_start{to = #jid{lserver = RemoteServer}} = StreamStart,
	       #{xmlns := ?NS_COMPONENT} = State) ->
    State1 = State#{remote_server => RemoteServer,
		    stream_state => wait_for_handshake},
    try callback(handle_stream_start, StreamStart, State1)
    catch _:{?MODULE, undef} -> State1
    end;
process_stream(#stream_start{to = #jid{server = Server, lserver = LServer},
			     from = From} = StreamStart,
	       #{stream_authenticated := Authenticated,
		 stream_restarted := StreamWasRestarted,
		 xmlns := NS, resource := Resource,
		 stream_encrypted := Encrypted} = State) ->
    State1 = if not StreamWasRestarted ->
		     State#{server => Server, lserver => LServer};
		true ->
		     State
	     end,
    State2 = case From of
		 #jid{lserver = RemoteServer} when NS == ?NS_SERVER ->
		     State1#{remote_server => RemoteServer};
		 _ ->
		     State1
	     end,
    State3 = try callback(handle_stream_start, StreamStart, State2)
	     catch _:{?MODULE, undef} -> State2
	     end,
    case is_disconnected(State3) of
	true -> State3;
	false ->
	    State4 = send_features(State3),
	    case is_disconnected(State4) of
		true -> State4;
		false ->
		    TLSRequired = is_starttls_required(State4),
		    if not Authenticated and (TLSRequired and not Encrypted) ->
			    State4#{stream_state => wait_for_starttls};
		       not Authenticated ->
			    State4#{stream_state => wait_for_sasl_request};
		       (NS == ?NS_CLIENT) and (Resource == <<"">>) ->
			    State4#{stream_state => wait_for_bind};
		       true ->
			    process_stream_established(State4)
		    end
	    end
    end.

-spec process_element(xmpp_element(), state()) -> state().
process_element(Pkt, #{stream_state := StateName, lang := Lang} = State) ->
    case Pkt of
	#starttls{} when StateName == wait_for_starttls;
			 StateName == wait_for_sasl_request ->
	    process_starttls(State);
	#starttls{} ->
	    process_starttls_failure(unexpected_starttls_request, State);
	#sasl_auth{} when StateName == wait_for_starttls ->
	    send_pkt(State, #sasl_failure{reason = 'encryption-required'});
	#sasl_auth{} when StateName == wait_for_sasl_request ->
	    process_sasl_request(Pkt, State);
	#sasl_auth{} when StateName == wait_for_sasl_response ->
	    process_sasl_request(Pkt, maps:remove(sasl_state, State));
	#sasl_auth{} ->
	    Txt = <<"SASL negotiation is not allowed in this state">>,
	    send_pkt(State, #sasl_failure{reason = 'not-authorized',
					      text = xmpp:mk_text(Txt, Lang)});
	#sasl_response{} when StateName == wait_for_starttls ->
	    send_pkt(State, #sasl_failure{reason = 'encryption-required'});
	#sasl_response{} when StateName == wait_for_sasl_response ->
	    process_sasl_response(Pkt, State);
	#sasl_response{} ->
	    Txt = <<"SASL negotiation is not allowed in this state">>,
	    send_pkt(State, #sasl_failure{reason = 'not-authorized',
					      text = xmpp:mk_text(Txt, Lang)});
	#sasl_abort{} when StateName == wait_for_sasl_response ->
	    process_sasl_abort(State);
	#sasl_abort{} ->
	    send_pkt(State, #sasl_failure{reason = 'aborted'});
	#sasl_success{} ->
	    State;
	#compress{} ->
	    process_compress(Pkt, State);
	#handshake{} when StateName == wait_for_handshake ->
	    process_handshake(Pkt, State);
	#handshake{} ->
	    State;
	#stream_error{} ->
	    process_stream_end({stream, {in, Pkt}}, State);
	_ when StateName == wait_for_sasl_request;
	       StateName == wait_for_handshake;
	       StateName == wait_for_sasl_response ->
	    process_unauthenticated_packet(Pkt, State);
	_ when StateName == wait_for_starttls ->
	    Txt = <<"Use of STARTTLS required">>,
	    Err = xmpp:serr_policy_violation(Txt, Lang),
	    send_pkt(State, Err);
	_ when StateName == wait_for_bind ->
	    process_bind(Pkt, State);
	_ when StateName == established ->
	    process_authenticated_packet(Pkt, State)
    end.

-spec process_unauthenticated_packet(xmpp_element(), state()) -> state().
process_unauthenticated_packet(Pkt, State) ->
    NewPkt = set_lang(Pkt, State),
    try callback(handle_unauthenticated_packet, NewPkt, State)
    catch _:{?MODULE, undef} ->
	    Err = xmpp:serr_not_authorized(),
	    send(State, Err)
    end.

-spec process_authenticated_packet(xmpp_element(), state()) -> state().
process_authenticated_packet(Pkt, State) ->
    Pkt1 = set_lang(Pkt, State),
    case set_from_to(Pkt1, State) of
	{ok, Pkt2} ->
	    try callback(handle_authenticated_packet, Pkt2, State)
	    catch _:{?MODULE, undef} ->
		    Err = xmpp:err_service_unavailable(),
		    send_error(State, Pkt, Err)
	    end;
	{error, Err} ->
	    send_pkt(State, Err)
    end.

-spec process_bind(xmpp_element(), state()) -> state().
process_bind(#iq{type = set, sub_els = [_]} = Pkt,
	     #{xmlns := ?NS_CLIENT, lang := MyLang} = State) ->
    try xmpp:try_subtag(Pkt, #bind{}) of
	#bind{resource = R} ->
	    case callback(bind, R, State) of
		{ok, #{user := U, server := S, resource := NewR} = State1}
		  when NewR /= <<"">> ->
		    Reply = #bind{jid = jid:make(U, S, NewR)},
		    State2 = send_pkt(State1, xmpp:make_iq_result(Pkt, Reply)),
		    process_stream_established(State2);
		{error, #stanza_error{} = Err, State1} ->
		    send_error(State1, Pkt, Err)
	    end;
	_ ->
	    try callback(handle_unbinded_packet, Pkt, State)
	    catch _:{?MODULE, undef} ->
		    Err = xmpp:err_not_authorized(),
		    send_error(State, Pkt, Err)
	    end
    catch _:{xmpp_codec, Why} ->
	    Txt = xmpp:io_format_error(Why),
	    Lang = select_lang(MyLang, xmpp:get_lang(Pkt)),
	    Err = xmpp:err_bad_request(Txt, Lang),
	    send_error(State, Pkt, Err)
    end;
process_bind(Pkt, State) ->
    try callback(handle_unbinded_packet, Pkt, State)
    catch _:{?MODULE, undef} ->
	    Err = xmpp:err_not_authorized(),
	    send_error(State, Pkt, Err)
    end.

-spec process_handshake(handshake(), state()) -> state().
process_handshake(#handshake{data = Digest},
		  #{stream_id := StreamID,
		    remote_server := RemoteServer} = State) ->
    GetPW = get_password_fun(State),
    AuthRes = case GetPW(<<"">>) of
		  {false, _} ->
		      false;
		  {Password, _} ->
		      sha(<<StreamID/binary, Password/binary>>) == Digest
	      end,
    case AuthRes of
	true ->
	    State1 = try callback(handle_auth_success,
			   RemoteServer, <<"handshake">>, undefined, State)
		     catch _:{?MODULE, undef} -> State
		     end,
	    case is_disconnected(State1) of
		true -> State1;
		false ->
		    State2 = send_pkt(State1, #handshake{}),
		    process_stream_established(State2)
	    end;
	false ->
	    State1 = try callback(handle_auth_failure,
			   RemoteServer, <<"handshake">>, <<"not authorized">>, State)
		     catch _:{?MODULE, undef} -> State
		     end,
	    case is_disconnected(State1) of
		true -> State1;
		false -> send_pkt(State1, xmpp:serr_not_authorized())
	    end
    end.

-spec process_stream_established(state()) -> state().
process_stream_established(#{stream_state := StateName} = State)
  when StateName == disconnected; StateName == established ->
    State;
process_stream_established(State) ->
    State1 = State#{stream_authenticated => true,
		    stream_state => established,
		    stream_timeout => infinity},
    try callback(handle_stream_established, State1)
    catch _:{?MODULE, undef} -> State1
    end.

-spec process_compress(compress(), state()) -> state().
process_compress(#compress{},
		 #{stream_compressed := Compressed,
		   stream_authenticated := Authenticated} = State)
  when Compressed or not Authenticated ->
    send_pkt(State, #compress_failure{reason = 'setup-failed'});
process_compress(#compress{methods = HisMethods},
		 #{socket := Socket} = State) ->
    MyMethods = try callback(compress_methods, State)
		catch _:{?MODULE, undef} -> []
		end,
    CommonMethods = lists_intersection(MyMethods, HisMethods),
    case lists:member(<<"zlib">>, CommonMethods) of
	true ->
	    case xmpp_socket:compress(Socket) of
		{ok, ZlibSocket} ->
		    State1 = send_pkt(State, #compressed{}),
		    case is_disconnected(State1) of
			true -> State1;
			false ->
			    State1#{socket => ZlibSocket,
				    stream_id => xmpp_stream:new_id(),
				    stream_header_sent => false,
				    stream_restarted => true,
				    stream_state => wait_for_stream,
				    stream_compressed => true}
		    end;
		{error, _} ->
		    Err = #compress_failure{reason = 'setup-failed'},
		    send_pkt(State, Err)
	    end;
	false ->
	    send_pkt(State, #compress_failure{reason = 'unsupported-method'})
    end.

-spec process_starttls(state()) -> state().
process_starttls(#{stream_encrypted := true} = State) ->
    process_starttls_failure(already_encrypted, State);
process_starttls(#{socket := Socket} = State) ->
    case is_starttls_available(State) of
	true ->
	    TLSOpts = try callback(tls_options, State)
		      catch _:{?MODULE, undef} -> []
		      end,
	    case xmpp_socket:starttls(Socket, TLSOpts) of
		{ok, TLSSocket} ->
		    State1 = send_pkt(State, #starttls_proceed{}),
		    case is_disconnected(State1) of
			true -> State1;
			false ->
			    State1#{socket => TLSSocket,
				    stream_id => xmpp_stream:new_id(),
				    stream_header_sent => false,
				    stream_restarted => true,
				    stream_state => wait_for_stream,
				    stream_encrypted => true}
		    end;
		{error, Reason} ->
		    process_starttls_failure(Reason, State)
	    end;
	false ->
	    process_starttls_failure(starttls_unsupported, State)
    end.

-spec process_starttls_failure(term(), state()) -> state().
process_starttls_failure(Why, State) ->
    State1 = send_pkt(State, #starttls_failure{}),
    case is_disconnected(State1) of
	true -> State1;
	false -> process_stream_end({tls, Why}, State1)
    end.

-spec process_sasl_request(sasl_auth(), state()) -> state().
process_sasl_request(#sasl_auth{mechanism = Mech, text = ClientIn},
		     #{lserver := LServer, socket := Socket} = State) ->
    State1 = State#{sasl_mech => Mech},
    Mechs = get_sasl_mechanisms(State1),
    case lists:member(Mech, Mechs) of
	true when Mech == <<"EXTERNAL">> ->
	    Res = case xmpp_stream_pkix:authenticate(State1, ClientIn) of
		      {ok, Peer} ->
			  {ok, [{auth_module, pkix}, {username, Peer}]};
		      {error, Reason, Peer} ->
			  {error, Reason, Peer}
		  end,
	    process_sasl_result(Res, State1);
	true ->
	    GetPW = get_password_fun(Mech, State1),
	    CheckPW = check_password_fun(Mech, State1),
	    CheckPWDigest = check_password_digest_fun(Mech, State1),
	    SASLState = xmpp_sasl:server_new(LServer, GetPW, CheckPW, CheckPWDigest),
	    Res = xmpp_sasl:server_start(SASLState, Mech, ClientIn, Socket),
	    process_sasl_result(Res, State1#{sasl_state => SASLState});
	false ->
	    process_sasl_result({error, unsupported_mechanism, <<"">>}, State1)
    end.

-spec process_sasl_response(sasl_response(), state()) -> state().
process_sasl_response(#sasl_response{text = ClientIn},
		      #{sasl_state := SASLState} = State) ->
    SASLResult = xmpp_sasl:server_step(SASLState, ClientIn),
    process_sasl_result(SASLResult, State).

-spec process_sasl_result(xmpp_sasl:sasl_return(), state()) -> state().
process_sasl_result({ok, Props}, State) ->
    process_sasl_success(Props, <<"">>, State);
process_sasl_result({ok, Props, ServerOut}, State) ->
    process_sasl_success(Props, ServerOut, State);
process_sasl_result({continue, ServerOut, NewSASLState}, State) ->
    process_sasl_continue(ServerOut, NewSASLState, State);
process_sasl_result({error, Reason, User}, State) ->
    process_sasl_failure(Reason, User, State).

-spec process_sasl_success([xmpp_sasl:sasl_property()], binary(), state()) -> state().
process_sasl_success(Props, ServerOut,
		     #{socket := Socket,
		       sasl_mech := Mech} = State) ->
    User = identity(Props),
    AuthModule = proplists:get_value(auth_module, Props),
    Socket1 = xmpp_socket:reset_stream(Socket),
    State0 = State#{socket => Socket1},
    State1 = try callback(handle_auth_success, User, Mech, AuthModule, State0)
	     catch _:{?MODULE, undef} -> State
	     end,
    case is_disconnected(State1) of
	true -> State1;
	false ->
	    State2 = send_pkt(State1, #sasl_success{text = ServerOut}),
	    case is_disconnected(State2) of
		true -> State2;
		false ->
		    State3 = maps:remove(sasl_state,
					 maps:remove(sasl_mech, State2)),
		    State3#{stream_id => xmpp_stream:new_id(),
			    stream_authenticated => true,
			    stream_header_sent => false,
			    stream_restarted => true,
			    stream_state => wait_for_stream,
			    user => User}
	    end
    end.

-spec process_sasl_continue(binary(), xmpp_sasl:sasl_state(), state()) -> state().
process_sasl_continue(ServerOut, NewSASLState, State) ->
    State1 = State#{sasl_state => NewSASLState,
		    stream_state => wait_for_sasl_response},
    send_pkt(State1, #sasl_challenge{text = ServerOut}).

-spec process_sasl_failure(atom(), binary(), state()) -> state().
process_sasl_failure(Err, User,
		     #{sasl_mech := Mech, lang := Lang} = State) ->
    {Reason, Text} = format_sasl_error(Mech, Err),
    State1 = try callback(handle_auth_failure, User, Mech, Text, State)
	     catch _:{?MODULE, undef} -> State
	     end,
    case is_disconnected(State1) of
	true -> State1;
	false ->
	    State2 = send_pkt(State1,
			      #sasl_failure{reason = Reason,
					    text = xmpp:mk_text(Text, Lang)}),
	    case is_disconnected(State2) of
		true -> State2;
		false ->
		    State3 = maps:remove(sasl_state,
					 maps:remove(sasl_mech, State2)),
		    State3#{stream_state => wait_for_sasl_request}
	    end
    end.

-spec process_sasl_abort(state()) -> state().
process_sasl_abort(State) ->
    process_sasl_failure(aborted, <<"">>, State).

-spec send_features(state()) -> state().
send_features(#{stream_version := {1,0},
		stream_encrypted := Encrypted} = State) ->
    TLSRequired = is_starttls_required(State),
    Features = if TLSRequired and not Encrypted ->
		       get_tls_feature(State);
		  true ->
		       get_sasl_feature(State) ++ get_compress_feature(State)
			   ++ get_tls_feature(State) ++ get_bind_feature(State)
			   ++ get_session_feature(State) ++ get_other_features(State)
	       end,
    send_pkt(State, #stream_features{sub_els = Features});
send_features(State) ->
    %% clients and servers from stone age
    State.

-spec get_password_fun(state()) -> fun().
get_password_fun(State) ->
    try callback(get_password_fun, State)
    catch _:{?MODULE, undef} -> fun(_) -> {false, undefined} end
    end.

-spec get_password_fun(xmpp_sasl:mechanism(), state()) -> fun().
get_password_fun(Mech, State) ->
    try callback(get_password_fun, Mech, State)
    catch _:{?MODULE, undef} -> fun(_) -> {false, undefined} end
    end.

-spec check_password_fun(xmpp_sasl:mechanism(), state()) -> fun().
check_password_fun(Mech, State) ->
    try callback(check_password_fun, Mech, State)
    catch _:{?MODULE, undef} -> fun(_, _, _) -> {false, undefined} end
    end.

-spec check_password_digest_fun(xmpp_sasl:mechanism(), state()) -> fun().
check_password_digest_fun(Mech, State) ->
    try callback(check_password_digest_fun, Mech, State)
    catch _:{?MODULE, undef} -> fun(_, _, _, _, _) -> {false, undefined} end
    end.

-spec get_sasl_mechanisms(state()) -> [xmpp_sasl:mechanism()].
get_sasl_mechanisms(#{stream_encrypted := Encrypted,
		      xmlns := NS} = State) ->
    Mechs = if NS == ?NS_CLIENT -> xmpp_sasl:listmech();
	       true -> []
	    end,
    Mechs1 = if Encrypted -> [<<"EXTERNAL">>|Mechs];
		true -> Mechs
	     end,
    try callback(sasl_mechanisms, Mechs1, State)
    catch _:{?MODULE, undef} -> Mechs1
    end.

-spec get_sasl_feature(state()) -> [sasl_mechanisms()].
get_sasl_feature(#{stream_authenticated := false,
		   stream_encrypted := Encrypted} = State) ->
    TLSRequired = is_starttls_required(State),
    if Encrypted or not TLSRequired ->
	    Mechs = get_sasl_mechanisms(State),
	    [#sasl_mechanisms{list = Mechs}];
       true ->
	    []
    end;
get_sasl_feature(_) ->
    [].

-spec get_compress_feature(state()) -> [compression()].
get_compress_feature(#{stream_compressed := false,
		       stream_authenticated := true} = State) ->
    try callback(compress_methods, State) of
	[] -> [];
	Ms -> [#compression{methods = Ms}]
    catch _:{?MODULE, undef} ->
	    []
    end;
get_compress_feature(_) ->
    [].

-spec get_tls_feature(state()) -> [starttls()].
get_tls_feature(#{stream_authenticated := false,
		  stream_encrypted := false} = State) ->
    case is_starttls_available(State) of
	true ->
	    TLSRequired = is_starttls_required(State),
	    [#starttls{required = TLSRequired}];
	false ->
	    []
    end;
get_tls_feature(_) ->
    [].

-spec get_bind_feature(state()) -> [bind()].
get_bind_feature(#{xmlns := ?NS_CLIENT,
		   stream_authenticated := true,
		   resource := <<"">>}) ->
    [#bind{}];
get_bind_feature(_) ->
    [].

-spec get_session_feature(state()) -> [xmpp_session()].
get_session_feature(#{xmlns := ?NS_CLIENT,
		      stream_authenticated := true,
		      resource := <<"">>}) ->
    [#xmpp_session{optional = true}];
get_session_feature(_) ->
    [].

-spec get_other_features(state()) -> [xmpp_element()].
get_other_features(#{stream_authenticated := Auth} = State) ->
    try
	if Auth -> callback(authenticated_stream_features, State);
	   true -> callback(unauthenticated_stream_features, State)
	end
    catch _:{?MODULE, undef} ->
	    []
    end.

-spec is_starttls_available(state()) -> boolean().
is_starttls_available(State) ->
    try callback(tls_enabled, State)
    catch _:{?MODULE, undef} -> true
    end.

-spec is_starttls_required(state()) -> boolean().
is_starttls_required(State) ->
    try callback(tls_required, State)
    catch _:{?MODULE, undef} -> false
    end.

-spec set_from_to(xmpp_element(), state()) -> {ok, xmpp_element()} |
					      {error, stream_error()}.
set_from_to(Pkt, _State) when not ?is_stanza(Pkt) ->
    {ok, Pkt};
set_from_to(Pkt, #{user := U, server := S, resource := R,
		   lang := Lang, xmlns := ?NS_CLIENT}) ->
    JID = jid:make(U, S, R),
    From = case xmpp:get_from(Pkt) of
	       undefined -> JID;
	       F -> F
	   end,
    if JID#jid.luser == From#jid.luser andalso
       JID#jid.lserver == From#jid.lserver andalso
       (JID#jid.lresource == From#jid.lresource
	orelse From#jid.lresource == <<"">>) ->
	    To = case xmpp:get_to(Pkt) of
		     undefined -> jid:make(U, S);
		     T -> T
		 end,
	    {ok, xmpp:set_from_to(Pkt, JID, To)};
       true ->
	    Txt = <<"Improper 'from' attribute">>,
	    {error, xmpp:serr_invalid_from(Txt, Lang)}
    end;
set_from_to(Pkt, #{lang := Lang}) ->
    From = xmpp:get_from(Pkt),
    To = xmpp:get_to(Pkt),
    if From == undefined ->
	    Txt = <<"Missing 'from' attribute">>,
	    {error, xmpp:serr_improper_addressing(Txt, Lang)};
       To == undefined ->
	    Txt = <<"Missing 'to' attribute">>,
	    {error, xmpp:serr_improper_addressing(Txt, Lang)};
       true ->
	    {ok, Pkt}
    end.

-spec send_header(state()) -> state().
send_header(#{stream_version := Version} = State) ->
    send_header(State, #stream_start{version = Version}).

-spec send_header(state(), stream_start()) -> state().
send_header(#{stream_id := StreamID,
	      stream_version := MyVersion,
	      stream_header_sent := false,
	      lang := MyLang,
	      xmlns := NS} = State,
	    #stream_start{to = HisTo, from = HisFrom,
			  lang = HisLang, version = HisVersion}) ->
    Lang = select_lang(MyLang, HisLang),
    NS_DB = if NS == ?NS_SERVER -> ?NS_SERVER_DIALBACK;
	       true -> <<"">>
	    end,
    Version = case HisVersion of
		  undefined -> undefined;
		  {0,_} -> HisVersion;
		  _ -> MyVersion
	      end,
    StreamStart = #stream_start{version = Version,
				lang = Lang,
				xmlns = NS,
				stream_xmlns = ?NS_STREAM,
				db_xmlns = NS_DB,
				id = StreamID,
				to = HisFrom,
				from = HisTo},
    State1 = State#{lang => Lang,
		    stream_version => Version,
		    stream_header_sent => true},
    case socket_send(State1, StreamStart) of
	ok -> State1;
	{error, Why} -> process_stream_end({socket, Why}, State1)
    end;
send_header(State, _) ->
    State.

-spec send_pkt(state(), xmpp_element() | xmlel()) -> state().
send_pkt(State, Pkt) ->
    case check_queue(State, Pkt) of
	flush ->
	    flush_queue(State, Pkt);
	queue ->
	    queue_pkt(State, Pkt);
	noqueue ->
	    State1 = flush_queue(State),
	    Result = socket_send(State1, Pkt),
	    State2 = try callback(handle_send, Pkt, Result, State1)
		     catch _:{?MODULE, undef} -> State1
		     end,
	    case Result of
		_ when is_record(Pkt, stream_error) ->
		    process_stream_end({stream, {out, Pkt}}, State2);
		ok ->
		    State2;
		{error, _Why} ->
		    % Queue process_stream_end instead of calling it directly,
		    % so we have the opportunity to process incoming queued
		    % messages before terminating the session.
		    self() ! {'$gen_event', closed},
		    State2
	    end
    end.

-spec send_error(state(), xmpp_element() | xmlel(), stanza_error()) -> state().
send_error(State, Pkt, Err) ->
    case xmpp:is_stanza(Pkt) of
	true ->
	    case xmpp:get_type(Pkt) of
		result -> State;
		error -> State;
		<<"result">> -> State;
		<<"error">> -> State;
		_ ->
		    ErrPkt = xmpp:make_error(Pkt, Err),
		    send_pkt(State, ErrPkt)
	    end;
	false ->
	    State
    end.

-spec send_trailer(state()) -> state().
send_trailer(State) ->
    socket_send(State, trailer),
    close_socket(State).

-spec socket_send(state(), xmpp_element() | xmlel() | trailer) -> ok | {error, inet:posix()}.
socket_send(#{socket := Sock,
	      stream_state := StateName,
	      xmlns := NS,
	      stream_header_sent := true}, Pkt) ->
    case Pkt of
	trailer ->
	    xmpp_socket:send_trailer(Sock);
	#stream_start{} when StateName /= disconnected ->
	    xmpp_socket:send_header(Sock, xmpp:encode(Pkt));
	_ when StateName /= disconnected ->
	    xmpp_socket:send_element(Sock, xmpp:encode(Pkt, NS));
	_ ->
	    {error, closed}
    end;
socket_send(_, _) ->
    {error, closed}.

-spec close_socket(state()) -> state().
close_socket(#{socket := Socket} = State) ->
    xmpp_socket:close(Socket),
    State#{stream_timeout => infinity,
	   stream_state => disconnected};
close_socket(State) ->
    State.

-spec check_queue(state(), xmpp_element() | xmlel()) -> flush | queue | noqueue.
check_queue(#{stream_queue_max := 0}, _Pkt) ->
    noqueue;
check_queue(#{stream_state := StreamState}, _Pkt)
  when StreamState /= established->
    noqueue;
check_queue(_State, Pkt)
  when not ?is_stanza(Pkt),
       not is_record(Pkt, sm_a),
       not is_record(Pkt, sm_r) ->
    noqueue;
check_queue(#{stream_queue := Q, stream_queue_max := MaxQueue}, _Pkt)
  when length(Q) >= MaxQueue ->
    flush;
check_queue(_State, _Pkt) ->
    queue.

-spec queue_pkt(state(), xmpp_element() | xmlel()) -> state().
queue_pkt(#{stream_queue := [],
	    stream_queue_timeout := {MSecs, _PrevTime}} = State, Pkt) ->
    CurrentTime = p1_time_compat:monotonic_time(milli_seconds),
    State#{stream_queue := [Pkt],
	   stream_queue_timeout := {MSecs, CurrentTime}};
queue_pkt(#{stream_queue := Q} = State, Pkt) ->
    State#{stream_queue := [Pkt|Q]}.

-spec flush_queue(state(), xmpp_element() | xmlel()) -> state().
flush_queue(State, Pkt) ->
    flush_queue(queue_pkt(State, Pkt)).

-spec flush_queue(state()) -> state().
flush_queue(#{stream_queue := []} = State) ->
    State;
flush_queue(#{stream_queue := Q0,
	      socket := Sock,
	      xmlns := NS} = State0) ->
    Q = lists:reverse(Q0),
    Els = [xmpp:encode(Pkt, NS) || Pkt <- Q],
    Result = xmpp_socket:send_elements(Sock, Els),
    State1 = State0#{stream_queue := []},
    State2 = try lists:foldl(
		   fun(Pkt, State) ->
			   callback(handle_send, Pkt, Result, State)
		   end, State1, Q)
	     catch _:{?MODULE, undef} -> State1
	     end,
    case Result of
	ok ->
	    State2;
	{error, _Why} ->
	    self() ! {'$gen_event', closed},
	    State2
    end;
flush_queue(#{stream_queue := _Q} = State) -> % Socket has been released.
    State#{stream_queue := []}.

-spec select_lang(binary(), binary()) -> binary().
select_lang(Lang, <<"">>) -> Lang;
select_lang(_, Lang) -> Lang.

-spec set_lang(xmpp_element(), state()) -> xmpp_element().
set_lang(Pkt, #{lang := MyLang, xmlns := ?NS_CLIENT}) when ?is_stanza(Pkt) ->
    HisLang = xmpp:get_lang(Pkt),
    Lang = select_lang(MyLang, HisLang),
    xmpp:set_lang(Pkt, Lang);
set_lang(Pkt, _) ->
    Pkt.

-spec format_inet_error(atom()) -> string().
format_inet_error(closed) ->
    "connection closed";
format_inet_error(Reason) ->
    case inet:format_error(Reason) of
	"unknown POSIX error" -> atom_to_list(Reason);
	Txt -> Txt
    end.

-spec format_sasl_error(xmpp_sasl:mechanism(), atom()) -> {atom(), binary()}.
format_sasl_error(<<"EXTERNAL">>, Err) ->
    xmpp_stream_pkix:format_error(Err);
format_sasl_error(Mech, Err) ->
    xmpp_sasl:format_error(Mech, Err).

-spec format_tls_error(atom() | binary()) -> list().
format_tls_error(Reason) when is_atom(Reason) ->
    format_inet_error(Reason);
format_tls_error(Reason) ->
    Reason.

-spec format(io:format(), list()) -> binary().
format(Fmt, Args) ->
    iolist_to_binary(io_lib:format(Fmt, Args)).

-spec lists_intersection(list(), list()) -> list().
lists_intersection(L1, L2) ->
    lists:filter(
      fun(E) ->
	      lists:member(E, L2)
      end, L1).

-spec identity([xmpp_sasl:sasl_property()]) -> binary().
identity(Props) ->
    case proplists:get_value(authzid, Props, <<>>) of
	<<>> -> proplists:get_value(username, Props, <<>>);
	AuthzId -> AuthzId
    end.

-spec sha(binary()) -> binary().
sha(Data) ->
    xmpp_util:hex(crypto:hash(sha, Data)).

%%%===================================================================
%%% Callbacks
%%%===================================================================
callback(F, #{mod := Mod} = State) ->
    case erlang:function_exported(Mod, F, 1) of
	true -> Mod:F(State);
	false -> erlang:error({?MODULE, undef})
    end.

callback(F, Arg1, #{mod := Mod} = State) ->
    case erlang:function_exported(Mod, F, 2) of
	true -> Mod:F(Arg1, State);
	false -> erlang:error({?MODULE, undef})
    end.

callback(code_change, OldVsn, #{mod := Mod} = State, Extra) ->
    %% code_change/3 callback is a special snowflake
    case erlang:function_exported(Mod, code_change, 3) of
	true -> Mod:code_change(OldVsn, State, Extra);
	false -> {ok, State}
    end;
callback(F, Arg1, Arg2, #{mod := Mod} = State) ->
    case erlang:function_exported(Mod, F, 3) of
	true -> Mod:F(Arg1, Arg2, State);
	false -> erlang:error({?MODULE, undef})
    end.

callback(F, Arg1, Arg2, Arg3, #{mod := Mod} = State) ->
    case erlang:function_exported(Mod, F, 4) of
	true -> Mod:F(Arg1, Arg2, Arg3, State);
	false -> erlang:error({?MODULE, undef})
    end.
