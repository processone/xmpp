%%%-------------------------------------------------------------------
%%% @author Evgeny Khramtsov <ekhramtsov@process-one.net>
%%% @doc
%%%
%%% @end
%%% Created : 12 Jul 2016 by Evgeny Khramtsov <ekhramtsov@process-one.net>
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

-module(xmpp_util).

%% API
-export([get_xdata_values/2, set_xdata_field/2, has_xdata_var/2,
	 make_adhoc_response/1, make_adhoc_response/2, decode_limit/1,
	 encode_limit/1, decode_timestamp/1, encode_timestamp/1]).
-export([hex/1]).

-include("xmpp.hrl").

-type limit() :: non_neg_integer() | max.

-export_type([limit/0]).

%%%===================================================================
%%% API
%%%===================================================================
-spec get_xdata_values(binary(), xdata()) -> [binary()].
get_xdata_values(Var, #xdata{fields = Fields}) ->
    case lists:keyfind(Var, #xdata_field.var, Fields) of
	#xdata_field{values = Vals} -> Vals;
	false -> []
    end.

-spec set_xdata_field(xdata_field(), xdata()) -> xdata().
set_xdata_field(Field, #xdata{fields = Fields} = X) ->
    NewFields = lists:keystore(Field#xdata_field.var, #xdata_field.var,
			       Fields, Field),
    X#xdata{fields = NewFields}.

-spec has_xdata_var(binary(), xdata()) -> boolean().
has_xdata_var(Var, #xdata{fields = Fields}) ->
    lists:keymember(Var, #xdata_field.var, Fields).

-spec make_adhoc_response(adhoc_command(), adhoc_command()) -> adhoc_command().
make_adhoc_response(#adhoc_command{lang = Lang, node = Node, sid = SID},
		    Command) ->
    make_adhoc_response(
      Command#adhoc_command{lang = Lang, node = Node, sid = SID}).

-spec make_adhoc_response(adhoc_command()) -> adhoc_command().
make_adhoc_response(#adhoc_command{sid = <<"">>,
				   status = Status,
				   actions = Actions} = Command) ->
    SID = encode_timestamp(p1_time_compat:timestamp()),
    NewActions = if Actions == undefined, Status /= completed ->
			 #adhoc_actions{execute = complete, complete = true};
		    true ->
			 undefined
		 end,
    Command#adhoc_command{sid = SID, actions = NewActions};
make_adhoc_response(Command) ->
    Command.

-spec decode_limit(binary()) -> limit().
decode_limit(S) ->
    try try_decode_limit(S)
    catch _:_ -> erlang:error({bad_limit, S})
    end.

-spec encode_limit(limit()) -> binary().
encode_limit(I) when is_integer(I), I >= 0 ->
    integer_to_binary(I);
encode_limit(max) ->
    <<"max">>.

-spec decode_timestamp(binary()) -> erlang:timestamp().
decode_timestamp(S) ->
    try try_decode_timestamp(S)
    catch _:_ -> erlang:error({bad_timestamp, S})
    end.

-spec encode_timestamp(erlang:timestamp()) -> binary().
encode_timestamp({MegaSecs, Secs, MicroSecs}) ->
    {{Year, Month, Day}, {Hour, Minute, Second}} =
        calendar:now_to_universal_time({MegaSecs, Secs, MicroSecs}),
    Fraction = if MicroSecs > 0 ->
		       io_lib:format(".~6..0B", [MicroSecs]);
		  true ->
		       ""
	       end,
    list_to_binary(io_lib:format("~4..0B-~2..0B-~2..0BT"
				 "~2..0B:~2..0B:~2..0B~sZ",
				 [Year, Month, Day, Hour, Minute, Second,
				  Fraction])).

-spec hex(binary()) -> binary().
hex(Bin) ->
    << <<(to_xchar(N div 16)), (to_xchar(N rem 16))>> || <<N>> <= Bin >>.

%%%===================================================================
%%% Internal functions
%%%===================================================================
try_decode_limit(<<"max">>) ->
    max;
try_decode_limit(S) ->
    case binary_to_integer(S) of
	I when I >= 0 ->
	    I
    end.

try_decode_timestamp(<<Y:4/binary, $-, Mo:2/binary, $-, D:2/binary, $T,
		       H:2/binary, $:, Mi:2/binary, $:, S:2/binary, T/binary>>) ->
    Date = {to_integer(Y, 1970, 9999), to_integer(Mo, 1, 12), to_integer(D, 1, 31)},
    Time = {to_integer(H, 0, 23), to_integer(Mi, 0, 59), to_integer(S, 0, 59)},
    {MS, {TZH, TZM}} = try_decode_fraction(T),
    Seconds = calendar:datetime_to_gregorian_seconds({Date, Time}) -
	calendar:datetime_to_gregorian_seconds({{1970,1,1}, {0,0,0}}) -
	TZH * 60 * 60 - TZM * 60,
    {Seconds div 1000000, Seconds rem 1000000, MS};
try_decode_timestamp(<<Y:4/binary, Mo:2/binary, D:2/binary, $T,
		       H:2/binary, $:, Mi:2/binary, $:, S:2/binary>>) ->
    try_decode_timestamp(<<Y:4/binary, $-, Mo:2/binary, $-, D:2/binary, $T,
			   H:2/binary, $:, Mi:2/binary, $:, S:2/binary, $Z>>).

try_decode_fraction(<<$., T/binary>>) ->
    {match, [V]} = re:run(T, <<"^[0-9]+">>, [{capture, [0], list}]),
    Size = length(V),
    <<_:Size/binary, TZD/binary>> = T,
    {list_to_integer(string:left(V, 6, $0)),
     try_decode_tzd(TZD)};
try_decode_fraction(TZD) ->
    {0, try_decode_tzd(TZD)}.

try_decode_tzd(<<$Z>>) ->
    {0, 0};
try_decode_tzd(<<$-, H:2/binary, $:, M:2/binary>>) ->
    {-1 * to_integer(H, 0, 12), to_integer(M, 0, 59)};
try_decode_tzd(<<$+, H:2/binary, $:, M:2/binary>>) ->
    {to_integer(H, 0, 12), to_integer(M, 0, 59)}.

to_integer(S, Min, Max) ->
    case binary_to_integer(S) of
	I when I >= Min, I =< Max ->
	    I
    end.

to_xchar(D) when (D >= 0) and (D < 10) -> D + $0;
to_xchar(D) -> D + $a - 10.
