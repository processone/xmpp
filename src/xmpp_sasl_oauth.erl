%%%----------------------------------------------------------------------
%%% File    : xmpp_sasl_oauth.erl
%%% Author  : Alexey Shchepin <alexey@process-one.net>
%%% Purpose : X-OAUTH2 SASL mechanism
%%% Created : 17 Sep 2015 by Alexey Shchepin <alexey@process-one.net>
%%%
%%%
%%% ejabberd, Copyright (C) 2002-2018   ProcessOne
%%%
%%% This program is free software; you can redistribute it and/or
%%% modify it under the terms of the GNU General Public License as
%%% published by the Free Software Foundation; either version 2 of the
%%% License, or (at your option) any later version.
%%%
%%% This program is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%%% General Public License for more details.
%%%
%%% You should have received a copy of the GNU General Public License along
%%% with this program; if not, write to the Free Software Foundation, Inc.,
%%% 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
%%%
%%%----------------------------------------------------------------------
-module(xmpp_sasl_oauth).
-behaviour(xmpp_sasl).
-author('alexey@process-one.net').

-export([mech_new/4, mech_step/2, format_error/1]).
%% For tests
-export([parse/1]).

-record(state, {host, check_password}).

-type error_reason() :: parser_failed | not_authorized.
-export_type([error_reason/0]).

-spec format_error(error_reason()) -> {atom(), binary()}.
format_error(parser_failed) ->
    {'bad-protocol', <<"Response decoding failed">>};
format_error(not_authorized) ->
    {'not-authorized', <<"Invalid token">>}.

mech_new(Host, _GetPassword, CheckPassword, _CheckPasswordDigest) ->
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
