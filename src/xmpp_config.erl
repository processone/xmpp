%%%-------------------------------------------------------------------
%%% @author Evgeny Khramtsov <ekhramtsov@process-one.net>
%%%
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
-module(xmpp_config).

%% API
-export([debug/1, fqdn/1]).

%%%===================================================================
%%% API
%%%===================================================================
-spec fqdn(any()) -> {ok, [binary()]}.
fqdn(_) ->
    {ok, []}.

-spec debug(any()) -> {ok, boolean()}.
debug(_) ->
    {ok, false}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
