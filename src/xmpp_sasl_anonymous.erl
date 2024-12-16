%%%-------------------------------------------------------------------
%%% @author Magnus Henoch <henoch@dtek.chalmers.se>
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
-module(xmpp_sasl_anonymous).
-behaviour(xmpp_sasl).
-protocol({xep, 175, '1.2'}).

-export([mech_new/6, mech_step/2]).

-record(state, {server = <<"">> :: binary()}).

mech_new(_Mech, _CB, _Mechs, _UAId, Host, _Callbacks) ->
    #state{server = Host}.

mech_step(#state{}, _ClientIn) ->
    User = iolist_to_binary([p1_rand:get_string(),
                             integer_to_binary(p1_time_compat:unique_integer([positive]))]),
    {ok, [{username, User},
	  {authzid, User},
	  {auth_module, anonymous}]}.
