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
-module(xmpp_sasl_oauth).
-behaviour(xmpp_sasl).
-author('alexey@process-one.net').

-export([mech_new/6, mech_step/2, format_error/1]).
%% For tests
-export([parse/1]).

-record(state, {host, check_password}).

-type error_reason() :: parser_failed | not_authorized.
-export_type([error_reason/0]).

-spec format_error(error_reason()) -> {atom(), binary()}.
format_error(parser_failed) ->
    {'not-authorized', <<"Response decoding failed">>};
format_error(not_authorized) ->
    {'not-authorized', <<"Invalid token">>}.

mech_new(_Mech, _CB, _Mechs, _UAId, Host, #{check_password := CheckPassword}) ->
    #state{host = Host, check_password = CheckPassword}.

mech_step(State, ClientIn) ->
    case prepare(ClientIn) of
        [AuthzId, User, Token] ->
            case (State#state.check_password)(User, AuthzId, Token) of
                {true, AuthModule} ->
                    {ok,
                     [{username, User}, {authzid, AuthzId},
                      {auth_module, AuthModule}]};
                _ ->
                    {error, not_authorized, User}
            end;
        _ -> {error, parser_failed}
    end.

prepare(ClientIn) ->
    case parse(ClientIn) of
        [<<"">>, UserMaybeDomain, Token] ->
            case parse_domain(UserMaybeDomain) of
                %% <NUL>login@domain<NUL>pwd
                [User, _Domain] -> [User, User, Token];
                %% <NUL>login<NUL>pwd
                [User] -> [User, User, Token]
            end;
        %% login@domain<NUL>login<NUL>pwd
        [AuthzId, User, Token] ->
            case parse_domain(AuthzId) of
                %% login@domain<NUL>login<NUL>pwd
                [AuthzUser, _Domain] -> [AuthzUser, User, Token];
                %% login<NUL>login<NUL>pwd
                [AuthzUser] -> [AuthzUser, User, Token]
            end;
        _ -> error
    end.

parse(S) -> parse1(binary_to_list(S), "", []).

parse1([0 | Cs], S, T) ->
    parse1(Cs, "", [list_to_binary(lists:reverse(S)) | T]);
parse1([C | Cs], S, T) -> parse1(Cs, [C | S], T);
%parse1([], [], T) ->
%    lists:reverse(T);
parse1([], S, T) ->
    lists:reverse([list_to_binary(lists:reverse(S)) | T]).

parse_domain(S) -> parse_domain1(binary_to_list(S), "", []).

parse_domain1([$@ | Cs], S, T) ->
    parse_domain1(Cs, "", [list_to_binary(lists:reverse(S)) | T]);
parse_domain1([C | Cs], S, T) ->
    parse_domain1(Cs, [C | S], T);
parse_domain1([], S, T) ->
    lists:reverse([list_to_binary(lists:reverse(S)) | T]).
