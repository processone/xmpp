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
-module(xmpp_sasl_plain).
-behaviour(xmpp_sasl).
-author('alexey@process-one.net').

-export([mech_new/6, mech_step/2, format_error/1]).
%% For tests
-export([parse/1]).

-record(state, {check_password}).
-type error_reason() :: parser_failed | not_authorized | {atom(), binary()}.
-export_type([error_reason/0]).

-spec format_error(error_reason()) -> {atom(), binary()}.
format_error({Condition, Text}) ->
    {Condition, Text};
format_error(parser_failed) ->
    {'not-authorized', <<"Response decoding failed">>};
format_error(not_authorized) ->
    {'not-authorized', <<"Invalid username or password">>}.

mech_new(_Mech, _CB, _Mechs, _UAId, _Host, #{check_password := CheckPassword}) ->
    #state{check_password = CheckPassword}.

mech_step(State, ClientIn) ->
    case prepare(ClientIn) of
	{AuthzId, User, Password} ->
	    case (State#state.check_password)(User, AuthzId, Password) of
		{true, AuthModule} ->
		    {ok, [{username, User},
			  {authzid, AuthzId},
			  {auth_module, AuthModule}]};
		{false, Condition, Text} ->
		    {error, {Condition, Text}, User};
		_ ->
		    {error, not_authorized, User}
	    end;
	error ->
	    {error, parser_failed}
    end.

-spec prepare(binary()) -> {binary(), binary(), binary()} | error.
prepare(ClientIn) ->
    case parse(ClientIn) of
	[<<"">>, UserMaybeDomain, Password] ->
	    case parse_authzid(UserMaybeDomain) of
		{ok, User} ->
		    {User, User, Password};
		_ ->
		    error
	    end;
	[AuthzId, User, Password] ->
	    case parse_authzid(AuthzId) of
		{ok, AuthzUser} ->
		    {AuthzUser, User, Password};
		_ ->
		    error
	    end;
	_ ->
	    error
    end.

-spec parse(binary()) -> [binary()].
parse(S) ->
    binary:split(S, <<0>>, [global]).

-spec parse_authzid(binary()) -> {ok, binary()} | error.
parse_authzid(S) ->
    case binary:split(S, <<$@>>) of
	[User] -> {ok, User};
	[User, _Domain] -> {ok, User};
	_ -> error
    end.
