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
-module(xmpp_sasl_plain).
-behaviour(xmpp_sasl).
-author('alexey@process-one.net').

-export([mech_new/4, mech_step/2, format_error/1]).
%% For tests
-export([parse/1]).

-record(state, {check_password}).
-type error_reason() :: parser_failed | not_authorized.
-export_type([error_reason/0]).

-spec format_error(error_reason()) -> {atom(), binary()}.
format_error(parser_failed) ->
    {'bad-protocol', <<"Response decoding failed">>};
format_error(not_authorized) ->
    {'not-authorized', <<"Invalid username or password">>}.

mech_new(_Host, _GetPassword, CheckPassword, _CheckPasswordDigest) ->
    #state{check_password = CheckPassword}.

mech_step(State, ClientIn) ->
    case prepare(ClientIn) of
      [AuthzId, User, Password] ->
	  case (State#state.check_password)(User, AuthzId, Password) of
	    {true, AuthModule} ->
		{ok,
		 [{username, User}, {authzid, AuthzId},
		  {auth_module, AuthModule}]};
	    _ -> {error, not_authorized, User}
	  end;
      _ -> {error, parser_failed}
    end.

prepare(ClientIn) ->
    case parse(ClientIn) of
      [<<"">>, UserMaybeDomain, Password] ->
	  case parse_domain(UserMaybeDomain) of
	    %% <NUL>login@domain<NUL>pwd
	    [User, _Domain] -> [User, User, Password];
	    %% <NUL>login<NUL>pwd
	    [User] -> [User, User, Password]
	  end;
      [AuthzId, User, Password] ->
      case parse_domain(AuthzId) of
      %% login@domain<NUL>login<NUL>pwd
        [AuthzUser, _Domain] -> [AuthzUser, User, Password];
        %% login<NUL>login<NUL>pwd
        [AuthzUser] -> [AuthzUser, User, Password]
      end;
      _ -> error
    end.

parse(S) ->
    binary:split(S, <<0>>, [global]).

parse_domain(S) -> parse_domain1(binary_to_list(S), "", []).

parse_domain1([$@ | Cs], S, T) ->
    parse_domain1(Cs, "", [list_to_binary(lists:reverse(S)) | T]);
parse_domain1([C | Cs], S, T) ->
    parse_domain1(Cs, [C | S], T);
parse_domain1([], S, T) ->
    lists:reverse([list_to_binary(lists:reverse(S)) | T]).
