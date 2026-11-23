%%%-------------------------------------------------------------------
%%% @author Magnus Henoch <henoch@dtek.chalmers.se>
%%%
%%% Copyright (C) 2002-2026 ProcessOne, SARL. All Rights Reserved.
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

-export([mech_new/7, mech_step/2]).

-record(state, {server = <<"">> :: binary()}).

-dialyzer({no_match, username/0}).
-dialyzer({no_unused, [random_hex/1, hex_digit/1]}).

mech_new(_Mech, _CB, _PD, _Mechs, _UAId, Host, _Callbacks) ->
    #state{server = Host}.

mech_step(#state{}, _ClientIn) ->
    User = username(),
    {ok, [{username, User},
	  {authzid, User},
	  {auth_module, anonymous}]}.

%% With the anonymous_username option set (see xmpp:set_config/1) the
%% username is the prefix followed by that many random lowercase hex
%% characters, otherwise a random number followed by a unique integer.
-spec username() -> binary().
username() ->
    case xmpp_config:anonymous_username(global) of
	{ok, {Prefix, Hex}} ->
	    <<Prefix/binary, (random_hex(Hex))/binary>>;
	_ ->
	    iolist_to_binary([p1_rand:get_string(),
			      integer_to_binary(p1_time_compat:unique_integer([positive]))])
    end.

-spec random_hex(pos_integer()) -> binary().
random_hex(N) ->
    Hex = << <<(hex_digit(D))>> || <<D:4>> <= crypto:strong_rand_bytes((N + 1) div 2) >>,
    binary:part(Hex, 0, N).

hex_digit(D) when D < 10 -> $0 + D;
hex_digit(D) -> $a + D - 10.

%%%===================================================================
%%% Unit tests
%%%===================================================================
-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").

anonymous_username_test_() ->
    {setup,
     fun() -> {ok, _} = application:ensure_all_started(xmpp) end,
     fun(_) -> xmpp:set_config([{anonymous_username, undefined}]) end,
     [{"unset: a random number and a counter", fun unset/0},
      {"prefix and hex characters", fun prefixed/0},
      {"empty prefix", fun empty_prefix/0},
      {"odd number of hex characters", fun odd_hex/0},
      {"invalid values are refused", fun badarg/0},
      {"unset again", fun unset_again/0}]}.

login() ->
    F = fun(_) -> {false, undefined} end,
    State = xmpp_sasl:server_new(<<"example.com">>, F, fun(_, _, _) -> false end,
				 fun(_, _, _, _, _) -> false end, undefined),
    {ok, Props} = xmpp_sasl:server_start(State, <<"ANONYMOUS">>, <<>>, none,
					 true, [], undefined),
    ?assertEqual(anonymous, proplists:get_value(auth_module, Props)),
    User = proplists:get_value(username, Props),
    ?assertEqual(User, proplists:get_value(authzid, Props)),
    User.

matches(User, Re) ->
    re:run(User, Re, [{capture, none}]) == match.

unset() ->
    ?assertEqual({anonymous_username, undefined},
		 lists:keyfind(anonymous_username, 1, xmpp:get_config())),
    ?assert(matches(login(), "^[0-9]+$")).

prefixed() ->
    ok = xmpp:set_config([{anonymous_username, {<<"guest-">>, 16}}]),
    ?assertEqual({anonymous_username, {<<"guest-">>, 16}},
		 lists:keyfind(anonymous_username, 1, xmpp:get_config())),
    Users = [login() || _ <- lists:seq(1, 50)],
    lists:foreach(fun(U) -> ?assert(matches(U, "^guest-[0-9a-f]{16}$")) end, Users),
    ?assertEqual(50, length(lists:usort(Users))).

empty_prefix() ->
    ok = xmpp:set_config([{anonymous_username, {<<>>, 8}}]),
    ?assert(matches(login(), "^[0-9a-f]{8}$")).

odd_hex() ->
    ok = xmpp:set_config([{anonymous_username, {<<"anon-">>, 9}}]),
    ?assert(matches(login(), "^anon-[0-9a-f]{9}$")).

badarg() ->
    ?assertError(badarg, xmpp:set_config([{anonymous_username, {<<"x">>, 0}}])),
    ?assertError(badarg, xmpp:set_config([{anonymous_username, {"x", 8}}])),
    ?assertError(badarg, xmpp:set_config([{anonymous_username, <<"x">>}])).

unset_again() ->
    ok = xmpp:set_config([{anonymous_username, {<<"guest-">>, 16}}]),
    ok = xmpp:set_config([{anonymous_username, undefined}]),
    ?assert(matches(login(), "^[0-9]+$")).

-endif.
