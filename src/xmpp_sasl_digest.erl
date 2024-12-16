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
-module(xmpp_sasl_digest).
-behaviour(xmpp_sasl).
-author('alexey@sevcom.net').
-dialyzer({no_match, [get_local_fqdn/1]}).

-export([mech_new/6, mech_step/2, format_error/1]).
%% For tests
-export([parse/1]).

-type get_password_fun() :: fun((binary()) -> {false, any()} |
                                              {binary(), atom()}).
-type check_password_fun() :: fun((binary(), binary(), binary(), binary(),
                                   fun((binary()) -> binary())) ->
                                           {boolean(), any()} |
                                           {false, atom(), binary()} |
                                           false).
-type error_reason() :: parser_failed | invalid_digest_uri |
			not_authorized | unexpected_response | {atom(), binary()}.
-export_type([error_reason/0]).

-record(state, {step = 1 :: 1 | 3 | 5,
                nonce = <<"">> :: binary(),
                username = <<"">> :: binary(),
                authzid = <<"">> :: binary(),
                get_password :: get_password_fun(),
                check_password :: check_password_fun(),
                auth_module :: atom(),
                host = <<"">> :: binary(),
                hostfqdn = [] :: [binary()]}).

-spec format_error(error_reason()) -> {atom(), binary()}.
format_error({Condition, Text}) ->
    {Condition, Text};
format_error(parser_failed) ->
    {'not-authorized', <<"Response decoding failed">>};
format_error(invalid_digest_uri) ->
    {'not-authorized', <<"Invalid digest URI">>};
format_error(not_authorized) ->
    {'not-authorized', <<"Invalid username or password">>};
format_error(unexpected_response) ->
    {'not-authorized', <<"Unexpected response">>}.

mech_new(_Mech, _CB, _Mechs, _UAId, Host, #{get_password := GetPassword,
				     check_password_digest := CheckPasswordDigest}) ->
    #state{step = 1, nonce = p1_rand:get_string(),
	   host = Host, hostfqdn = get_local_fqdn(Host),
	   get_password = GetPassword,
	   check_password = CheckPasswordDigest}.

mech_step(#state{step = 1, nonce = Nonce} = State, _) ->
    {continue,
     <<"nonce=\"", Nonce/binary,
       "\",qop=\"auth\",charset=utf-8,algorithm=md5-sess">>,
     State#state{step = 3}};
mech_step(#state{step = 3, nonce = Nonce} = State,
	  ClientIn) ->
    case parse(ClientIn) of
	bad -> {error, parser_failed};
	KeyVals ->
	  DigestURI = proplists:get_value(<<"digest-uri">>, KeyVals, <<>>),
	  UserName = proplists:get_value(<<"username">>, KeyVals, <<>>),
	  case is_digesturi_valid(DigestURI, State#state.host,
				  State#state.hostfqdn)
	      of
	    false ->
		{error, invalid_digest_uri, UserName};
	    true ->
		AuthzId = proplists:get_value(<<"authzid">>, KeyVals, <<>>),
		case (State#state.get_password)(UserName) of
		  {false, _} -> {error, not_authorized, UserName};
		  {Passwd, AuthModule} ->
		      case (State#state.check_password)(UserName, UserName, <<"">>,
							proplists:get_value(<<"response">>, KeyVals, <<>>),
							fun (PW) ->
								response(KeyVals,
									 UserName,
									 PW,
									 Nonce,
									 AuthzId,
									 <<"AUTHENTICATE">>)
							end)
			  of
			{true, _} ->
			    RspAuth = response(KeyVals, UserName, Passwd, Nonce,
					       AuthzId, <<"">>),
			    {continue, <<"rspauth=", RspAuth/binary>>,
			     State#state{step = 5, auth_module = AuthModule,
					 username = UserName,
					 authzid = AuthzId}};
			false -> {error, not_authorized, UserName};
			{false, Condition, Text} -> {error, {Condition, Text}, UserName};
			{false, _} -> {error, not_authorized, UserName}
		      end
		end
	  end
    end;
mech_step(#state{step = 5, auth_module = AuthModule,
		 username = UserName, authzid = AuthzId},
	  <<"">>) ->
    {ok,
     [{username, UserName}, {authzid, case AuthzId of
        <<"">> -> UserName;
        _ -> AuthzId
      end
    },
      {auth_module, AuthModule}]};
mech_step(_, _) ->
    {error, unexpected_response}.

parse(S) -> parse1(binary_to_list(S), "", []).

parse1([$= | Cs], S, Ts) ->
    parse2(Cs, lists:reverse(S), "", Ts);
parse1([$, | Cs], [], Ts) -> parse1(Cs, [], Ts);
parse1([$\s | Cs], [], Ts) -> parse1(Cs, [], Ts);
parse1([C | Cs], S, Ts) -> parse1(Cs, [C | S], Ts);
parse1([], [], T) -> lists:reverse(T);
parse1([], _S, _T) -> bad.

parse2([$" | Cs], Key, Val, Ts) ->
    parse3(Cs, Key, Val, Ts);
parse2([C | Cs], Key, Val, Ts) ->
    parse4(Cs, Key, [C | Val], Ts);
parse2([], _, _, _) -> bad.

parse3([$" | Cs], Key, Val, Ts) ->
    parse4(Cs, Key, Val, Ts);
parse3([$\\, C | Cs], Key, Val, Ts) ->
    parse3(Cs, Key, [C | Val], Ts);
parse3([C | Cs], Key, Val, Ts) ->
    parse3(Cs, Key, [C | Val], Ts);
parse3([], _, _, _) -> bad.

parse4([$, | Cs], Key, Val, Ts) ->
    parse1(Cs, "", [{list_to_binary(Key), list_to_binary(lists:reverse(Val))} | Ts]);
parse4([$\s | Cs], Key, Val, Ts) ->
    parse4(Cs, Key, Val, Ts);
parse4([C | Cs], Key, Val, Ts) ->
    parse4(Cs, Key, [C | Val], Ts);
parse4([], Key, Val, Ts) ->
%% @doc Check if the digest-uri is valid.
%% RFC-2831 allows to provide the IP address in Host,
%% however this is not supported
%% If the service (for example jabber.example.org)
%% is provided by several hosts (being one of them server3.example.org),
%% then acceptable digest-uris would be:
%% xmpp/server3.example.org/jabber.example.org, xmpp/server3.example.org and
%% xmpp/jabber.example.org
%% The last version is not actually allowed by the RFC, but implemented by popular clients
    parse1([], "", [{list_to_binary(Key), list_to_binary(lists:reverse(Val))} | Ts]).

is_digesturi_valid(DigestURICase, JabberDomain,
		   JabberFQDN) ->
    DigestURI = stringprep:tolower(DigestURICase),
    case binary:split(DigestURI, <<$/>>, [global, trim]) of
	[<<"xmpp">>, Host] ->
	    IsHostFqdn = is_host_fqdn(Host, JabberFQDN),
	    (Host == JabberDomain) or IsHostFqdn;
	[<<"xmpp">>, Host, ServName] ->
	    IsHostFqdn = is_host_fqdn(Host, JabberFQDN),
	    (ServName == JabberDomain) and IsHostFqdn;
	_ ->
	    false
    end.

is_host_fqdn(_Host, []) ->
    false;
is_host_fqdn(Host, [Fqdn | _FqdnTail]) when Host == Fqdn ->
    true;
is_host_fqdn(Host, [Fqdn | FqdnTail]) when Host /= Fqdn ->
    is_host_fqdn(Host, FqdnTail).

get_local_fqdn(Host) ->
    {ok, FQDNs} = xmpp_config:fqdn(Host),
    case FQDNs of
	[] -> [Host];
	_ -> FQDNs
    end.

hex(S) ->
    xmpp_util:hex(S).

proplists_get_bin_value(Key, Pairs, Default) ->
    case proplists:get_value(Key, Pairs, Default) of
        L when is_list(L) ->
            list_to_binary(L);
        L2 ->
            L2
    end.

response(KeyVals, User, Passwd, Nonce, AuthzId,
	 A2Prefix) ->
    Realm = proplists_get_bin_value(<<"realm">>, KeyVals, <<>>),
    CNonce = proplists_get_bin_value(<<"cnonce">>, KeyVals, <<>>),
    DigestURI = proplists_get_bin_value(<<"digest-uri">>, KeyVals, <<>>),
    NC = proplists_get_bin_value(<<"nc">>, KeyVals, <<>>),
    QOP = proplists_get_bin_value(<<"qop">>, KeyVals, <<>>),
    MD5Hash = erlang:md5(<<User/binary, ":", Realm/binary, ":",
                           Passwd/binary>>),
    A1 = case AuthzId of
	   <<"">> ->
	       <<MD5Hash/binary, ":", Nonce/binary, ":", CNonce/binary>>;
	   _ ->
	       <<MD5Hash/binary, ":", Nonce/binary, ":", CNonce/binary, ":",
		 AuthzId/binary>>
	 end,
    A2 = case QOP of
	   <<"auth">> ->
	       <<A2Prefix/binary, ":", DigestURI/binary>>;
	   _ ->
	       <<A2Prefix/binary, ":", DigestURI/binary,
		 ":00000000000000000000000000000000">>
	 end,
    T = <<(hex((erlang:md5(A1))))/binary, ":", Nonce/binary,
	  ":", NC/binary, ":", CNonce/binary, ":", QOP/binary,
	  ":", (hex((erlang:md5(A2))))/binary>>,
    hex((erlang:md5(T))).
