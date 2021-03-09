%%%-------------------------------------------------------------------
%%% @author Gregor Reitzenstein <me@dequbed.space>
%%% @copyright (C) 2021, Gregor Reitzenstein
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

-module(xmpp_sasl_gssapi).
-behaviour(xmpp_sasl).
-author('me@dequbed.space').

%% API
-export([mech_new/6, mech_step/2]).

-record(state, {server = undefined}).

mech_new(_Mech, _Socket, _Host, _GetPassword, _CheckPassword, _CheckPasswordDigest) ->
    % TODO: Get an alternative keytab location from the config
    {ok, Server} = egssapi:start_link(),
    #state{server = Server}.

mech_step(#state{server = Server} = State, ClientIn) ->
    ClientInDec = base64:decode(ClientIn),
    Result = egssapi:accept_sec_context(Server, ClientInDec),

    case Result of
        {ok, {Context, User, _Ccname, Resp}} ->
            egssapi:delete_sec_context(Context),
            if
                Resp /= <<"">> ->
                    {ok, [{authzid, User}, {username, User}], Resp};
                true ->
                    {ok, [{authzid, User}, {username, User}]}
            end;
        {needsmore, {Context, Resp}} ->
            {continue, Resp, State#state{server = Context}};
        {error, Error} ->
            {error, Error}
    end.
