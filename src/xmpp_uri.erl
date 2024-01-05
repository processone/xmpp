%%%-------------------------------------------------------------------
%%% @author Evgeny Khramtsov <ekhramtsov@process-one.net>
%%% @doc
%%%   XMPP URI processing library (see RFC5122)
%%% @end
%%% Created : 27 Nov 2017 by Evgeny Khramtsov <ekhramtsov@process-one.net>
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
-module(xmpp_uri).

%% API
-export([start/0, is_valid/1, check/1]).

%%%===================================================================
%%% API
%%%===================================================================
-spec start() -> ok | {error, unable_to_load_nif}.

start() ->
    load_nif(p1_nif_utils:get_so_path(?MODULE, [xmpp_uri], "xmpp_uri")).

load_nif(SOPath) ->
    case catch erlang:load_nif(SOPath, 0) of
	ok -> ok;
	{error, {reload, _}} -> ok;
	Err -> error_logger:warning_msg("unable to load xmpp_uri NIF: ~p~n", [Err]),
	       {error, unable_to_load_nif}
    end.

-spec is_valid(binary()) -> boolean().
is_valid(_) ->
    erlang:nif_error(nif_not_loaded).

-spec check(binary()) -> binary().
check(<<>>) ->
    <<>>;
check(S) ->
    case is_valid(S) of
	true ->
	    S;
	false ->
	    erlang:error({bad_uri, S})
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
