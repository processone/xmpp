%%%-------------------------------------------------------------------
%%%
%%% Copyright (C) 2002-2020 ProcessOne, SARL. All Rights Reserved.
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
-module(xmpp_sasl).
-author('alexey@process-one.net').

-export([server_new/4, server_start/3, server_step/2,
	 listmech/0, format_error/2]).

%% TODO: write correct types for these callbacks
-type get_password_fun() :: fun().
-type check_password_fun() :: fun().
-type check_password_digest_fun() :: fun().

-record(sasl_state, {server_host           :: binary(),
		     mech_name = <<"">>    :: mechanism(),
		     mech_state            :: mech_state(),
		     get_password          :: get_password_fun(),
		     check_password        :: check_password_fun(),
		     check_password_digest :: check_password_digest_fun()}).

-type mechanism() :: binary().
-type mech_state() :: term().
-type sasl_module() :: xmpp_sasl_anonymous | xmpp_sasl_digest |
		       xmpp_sasl_oauth | xmpp_sasl_plain |
		       xmpp_sasl_scram.
-type sasl_state() :: #sasl_state{}.
-type sasl_property() :: {username, binary()} |
			 {authzid, binary()} |
			 {mechanism, binary()} |
			 {auth_module, atom()}.
-type sasl_return() :: {ok, [sasl_property()]} |
		       {ok, [sasl_property()], binary()} |
		       {continue, binary(), sasl_state()} |
		       {error, error_reason(), binary()}.
-type error_reason() :: xmpp_sasl_digest:error_reason() |
			xmpp_sasl_oauth:error_reason() |
			xmpp_sasl_plain:error_reason() |
			xmpp_sasl_scram:error_reason() |
			unsupported_mechanism | nodeprep_failed |
			empty_username | aborted.

-export_type([mechanism/0, error_reason/0,
	      sasl_state/0, sasl_return/0, sasl_property/0]).

-callback mech_new(binary(),
		   get_password_fun(),
		   check_password_fun(),
		   check_password_digest_fun()) -> mech_state().
-callback mech_step(mech_state(), binary()) -> sasl_return().

%%%===================================================================
%%% API
%%%===================================================================
-spec format_error(mechanism(), error_reason()) -> {atom(), binary()}.
format_error(_, unsupported_mechanism) ->
    {'invalid-mechanism', <<"Unsupported mechanism">>};
format_error(_, nodeprep_failed) ->
    {'bad-protocol', <<"Nodeprep failed">>};
format_error(_, empty_username) ->
    {'bad-protocol', <<"Empty username">>};
format_error(_, aborted) ->
    {'aborted', <<"Aborted">>};
format_error(Mech, Reason) ->
    case get_mod(Mech) of
	undefined ->
	    {'invalid-mechanism', <<"Unsupported mechanism">>};
	Mod ->
	    Mod:format_error(Reason)
    end.

-spec listmech() -> [mechanism()].
listmech() ->
    [<<"ANONYMOUS">>,<<"DIGEST-MD5">>,<<"PLAIN">>,
     <<"SCRAM-SHA-1">>,<<"X-OAUTH2">>].

-spec server_new(binary(),
		 get_password_fun(),
		 check_password_fun(),
		 check_password_digest_fun()) -> sasl_state().
server_new(ServerHost, GetPassword, CheckPassword, CheckPasswordDigest) ->
    #sasl_state{server_host = ServerHost,
		get_password = GetPassword,
		check_password = CheckPassword,
		check_password_digest = CheckPasswordDigest}.

-spec server_start(sasl_state(), mechanism(), binary()) -> sasl_return().
server_start(State, Mech, ClientIn) ->
    case get_mod(Mech) of
	undefined ->
	    {error, unsupported_mechanism, <<"">>};
	Module ->
	    MechState = Module:mech_new(State#sasl_state.server_host,
					State#sasl_state.get_password,
					State#sasl_state.check_password,
					State#sasl_state.check_password_digest),
	    State1 = State#sasl_state{mech_name = Mech,
				      mech_state = MechState},
	    server_step(State1, ClientIn)
    end.

-spec server_step(sasl_state(), binary()) -> sasl_return().
server_step(State, ClientIn) ->
    Module = get_mod(State#sasl_state.mech_name),
    MechState = State#sasl_state.mech_state,
    case Module:mech_step(MechState, ClientIn) of
        {ok, Props} ->
            case check_credentials(Props) of
                ok             -> {ok, Props};
                {error, Error} -> {error, Error, <<"">>}
            end;
        {ok, Props, ServerOut} ->
            case check_credentials(Props) of
                ok             -> {ok, Props, ServerOut};
                {error, Error} -> {error, Error, <<"">>}
            end;
        {continue, ServerOut, NewMechState} ->
            {continue, ServerOut, State#sasl_state{mech_state = NewMechState}};
        {error, Error, Username} ->
            {error, Error, Username};
        {error, Error} ->
            {error, Error, <<"">>}
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
-spec check_credentials([sasl_property()]) -> ok | {error, error_reason()}.
check_credentials(Props) ->
    User = proplists:get_value(authzid, Props, <<>>),
    case jid:nodeprep(User) of
	error -> {error, nodeprep_failed};
	<<"">> -> {error, empty_username};
	_LUser -> ok
    end.

-spec get_mod(binary()) -> sasl_module() | undefined.
get_mod(<<"ANONYMOUS">>) -> xmpp_sasl_anonymous;
get_mod(<<"DIGEST-MD5">>) -> xmpp_sasl_digest;    
get_mod(<<"X-OAUTH2">>) -> xmpp_sasl_oauth;
get_mod(<<"PLAIN">>) -> xmpp_sasl_plain;
get_mod(<<"SCRAM-SHA-1">>) -> xmpp_sasl_scram;
get_mod(_) -> undefined.
