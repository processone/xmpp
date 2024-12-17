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
-module(xmpp_sasl_fast).
-behaviour(xmpp_sasl).
-author('alexey@process-one.net').

-export([mech_new/6, mech_step/2, format_error/1]).
%% For tests
-export([parse/1]).

-record(state, {mech, cb, ua, get_fast_tokens}).
-type error_reason() :: incompatible_mechs | missing_ua | bad_channel_binding |
                        parser_failed | not_authorized | {atom(), binary()}.
-export_type([error_reason/0]).

-spec format_error(error_reason()) -> {atom(), binary()}.
format_error({Condition, Text}) ->
    {Condition, Text};
format_error(incompatible_mechs) ->
    {'not-authorized', <<"Incompatible SCRAM methods">>};
format_error(missing_ua) ->
    {'malformed', <<"Missing user-agent">>};
format_error(bad_channel_binding) ->
    {'not-authorized', <<"Invalid channel binding">>};
format_error(parser_failed) ->
    {'not-authorized', <<"Response decoding failed">>};
format_error(not_authorized) ->
    {'not-authorized', <<"Invalid username or password">>}.

mech_new(Mech, CB, _Mechs, UAId, _Host, #{get_fast_tokens := GetFastTokens}) ->
    #state{mech = Mech, cb = CB, ua = UAId, get_fast_tokens = GetFastTokens}.


-ifdef(USE_OLD_CRYPTO_HMAC).
sha_mac(Algo, Key, Data) ->
    crypto:hmac(Algo, Key, Data).
-else.
sha_mac(Algo, Key, Data) ->
    crypto:mac(hmac, Algo, Key, Data).
-endif.

validate_token(User, _Mech, _CB, [], _Hash) ->
    {error, not_authorized, User};
validate_token(User, Mech, CB, [{TokenId, Token} | Tokens], Hash) ->
    {Hmac, CBName} = case Mech of
			 <<"HT-SHA-256-NONE">> -> {sha256, none};
			 <<"HT-SHA-256-UNIQ">> -> {sha256, <<"tls-unique">>};
			 <<"HT-SHA-256-EXPR">> -> {sha256, <<"tls-exporter">>};
			 <<"HT-SHA-256-ENDP">> -> {sha256, <<"tls-server-end-point">>}
		     end,
    CB2 = case CBName of
	      none -> <<>>;
	      _ when is_map(CB) -> maps:get(CBName, CB, error);
	      _ -> error
	  end,
    case CB2 of
	error -> {error, bad_channel_binding};
	_ ->
	    case sha_mac(Hmac, Token, <<"Initiator", CB2/binary>>) of
		V when V == Hash ->
		    {ok, [{username, User},
			  {auth_module, mod_auth_fast},
			  {extra_info, {token, TokenId}},
			  {authzid, User}],
		     sha_mac(Hmac, Token, <<"Responder", CB2/binary>>)};
		_ ->
		    validate_token(User, Mech, CB, Tokens, Hash)
	    end
    end.

mech_step(#state{get_fast_tokens = undefined}, _ClientIn) ->
    {error, incompatible_mechs};
mech_step(#state{ua = undefined}, _ClientIn) ->
    {error, missing_ua};
mech_step(State, ClientIn) ->
    case prepare(ClientIn) of
	{User, Hash} ->
	    case (State#state.get_fast_tokens)(User, State#state.ua) of
		[] ->
		    {error, not_authorized, User};
		Tokens ->
		    validate_token(User, State#state.mech, State#state.cb,
				   Tokens, Hash)
	    end;
	error ->
	    {error, parser_failed}
    end.

-spec prepare(binary()) -> {binary(), binary()} | error.
prepare(ClientIn) ->
    case parse(ClientIn) of
	[User, Hash] ->
	    case parse_authzid(User) of
		{ok, User} ->
		    {User, Hash};
		_ ->
		    error
	    end;
	_ ->
	    error
    end.

-spec parse(binary()) -> [binary()].
parse(S) ->
    binary:split(S, <<0>>).

-spec parse_authzid(binary()) -> {ok, binary()} | error.
parse_authzid(S) ->
    case binary:split(S, <<$@>>) of
	[User] -> {ok, User};
	[User, _Domain] -> {ok, User};
	_ -> error
    end.
