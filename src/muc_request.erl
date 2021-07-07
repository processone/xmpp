%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_request.xdata
%% Form type: http://jabber.org/protocol/muc#request
%% Document: XEP-0045

-module(muc_request).

-compile({nowarn_unused_function,
          [{dec_int, 3},
           {dec_int, 1},
           {dec_enum, 2},
           {dec_enum_int, 2},
           {dec_enum_int, 4},
           {enc_int, 1},
           {enc_enum, 1},
           {enc_enum_int, 1},
           {not_empty, 1},
           {dec_bool, 1},
           {enc_bool, 1},
           {dec_ip, 1},
           {enc_ip, 1}]}).

-compile(nowarn_unused_vars).

-dialyzer({nowarn_function, {dec_int, 3}}).

-export([encode/1, encode/2, encode/3]).

-export([decode/1,
         decode/2,
         decode/3,
         format_error/1,
         io_format_error/1]).

-include("xmpp_codec.hrl").

-include("muc_request.hrl").

-export_type([property/0,
              result/0,
              form/0,
              error_reason/0]).

-define(T(S), <<S>>).

-spec format_error(error_reason()) -> binary().

-spec io_format_error(error_reason()) -> {binary(),
                                          [binary()]}.

-spec decode([xdata_field()]) -> result().

-spec decode([xdata_field()],
             [binary(), ...]) -> result().

-spec decode([xdata_field()], [binary(), ...],
             [binary()]) -> result().

-spec decode([xdata_field()], [binary(), ...],
             [binary()], result()) -> result().

-spec do_decode([xdata_field()], binary(), [binary()],
                result()) -> result().

-spec encode(form()) -> [xdata_field()].

-spec encode(form(), binary()) -> [xdata_field()].

-spec encode(form(), binary(),
             [role |
              jid |
              roomnick |
              request_allow]) -> [xdata_field()].

dec_int(Val) -> dec_int(Val, infinity, infinity).

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> integer_to_binary(Int).

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
        true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

dec_enum_int(Val, Enums) ->
    try dec_int(Val) catch _:_ -> dec_enum(Val, Enums) end.

dec_enum_int(Val, Enums, Min, Max) ->
    try dec_int(Val, Min, Max) catch
        _:_ -> dec_enum(Val, Enums)
    end.

enc_enum_int(Int) when is_integer(Int) -> enc_int(Int);
enc_enum_int(Atom) -> enc_enum(Atom).

dec_bool(<<"1">>) -> true;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"false">>) -> false.

enc_bool(true) -> <<"1">>;
enc_bool(false) -> <<"0">>.

not_empty(<<_, _/binary>> = Val) -> Val.

dec_ip(Val) ->
    {ok, Addr} = inet_parse:address(binary_to_list(Val)),
    Addr.

enc_ip({0, 0, 0, 0, 0, 65535, A, B}) ->
    enc_ip({(A bsr 8) band 255,
            A band 255,
            (B bsr 8) band 255,
            B band 255});
enc_ip(Addr) -> list_to_binary(inet_parse:ntoa(Addr)).

format_error({form_type_mismatch, Type}) ->
    <<"FORM_TYPE doesn't match '", Type/binary, "'">>;
format_error({bad_var_value, Var, Type}) ->
    <<"Bad value of field '", Var/binary, "' of type '",
      Type/binary, "'">>;
format_error({missing_value, Var, Type}) ->
    <<"Missing value of field '", Var/binary, "' of type '",
      Type/binary, "'">>;
format_error({too_many_values, Var, Type}) ->
    <<"Too many values for field '", Var/binary,
      "' of type '", Type/binary, "'">>;
format_error({unknown_var, Var, Type}) ->
    <<"Unknown field '", Var/binary, "' of type '",
      Type/binary, "'">>;
format_error({missing_required_var, Var, Type}) ->
    <<"Missing required field '", Var/binary, "' of type '",
      Type/binary, "'">>.

io_format_error({form_type_mismatch, Type}) ->
    {<<"FORM_TYPE doesn't match '~s'">>, [Type]};
io_format_error({bad_var_value, Var, Type}) ->
    {<<"Bad value of field '~s' of type '~s'">>,
     [Var, Type]};
io_format_error({missing_value, Var, Type}) ->
    {<<"Missing value of field '~s' of type "
       "'~s'">>,
     [Var, Type]};
io_format_error({too_many_values, Var, Type}) ->
    {<<"Too many values for field '~s' of type "
       "'~s'">>,
     [Var, Type]};
io_format_error({unknown_var, Var, Type}) ->
    {<<"Unknown field '~s' of type '~s'">>, [Var, Type]};
io_format_error({missing_required_var, Var, Type}) ->
    {<<"Missing required field '~s' of type "
       "'~s'">>,
     [Var, Type]}.

decode(Fs) ->
    decode(Fs,
           [<<"http://jabber.org/protocol/muc#request">>],
           [<<"muc#role">>],
           []).

decode(Fs, XMLNSList) ->
    decode(Fs, XMLNSList, [<<"muc#role">>], []).

decode(Fs, XMLNSList, Required) ->
    decode(Fs, XMLNSList, Required, []).

decode(Fs, [_ | _] = XMLNSList, Required, Acc) ->
    case lists:keyfind(<<"FORM_TYPE">>,
                       #xdata_field.var,
                       Fs)
        of
        false -> do_decode(Fs, hd(XMLNSList), Required, Acc);
        #xdata_field{values = [XMLNS]} ->
            case lists:member(XMLNS, XMLNSList) of
                true -> do_decode(Fs, XMLNS, Required, Acc);
                false ->
                    erlang:error({?MODULE, {form_type_mismatch, XMLNS}})
            end
    end.

encode(Cfg) -> encode(Cfg, <<"en">>, [role]).

encode(Cfg, Lang) -> encode(Cfg, Lang, [role]).

encode(List, Lang, Required) ->
    Fs = [case Opt of
              {role, Val} ->
                  [encode_role(Val,
                               default,
                               Lang,
                               lists:member(role, Required))];
              {role, Val, Opts} ->
                  [encode_role(Val,
                               Opts,
                               Lang,
                               lists:member(role, Required))];
              {jid, Val} ->
                  [encode_jid(Val, Lang, lists:member(jid, Required))];
              {roomnick, Val} ->
                  [encode_roomnick(Val,
                                   Lang,
                                   lists:member(roomnick, Required))];
              {request_allow, Val} ->
                  [encode_request_allow(Val,
                                        Lang,
                                        lists:member(request_allow, Required))];
              #xdata_field{} -> [Opt]
          end
          || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
                            type = hidden,
                            values =
                                [<<"http://jabber.org/protocol/muc#request">>]},
    [FormType | lists:flatten(Fs)].

do_decode([#xdata_field{var = <<"muc#role">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, [participant]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#role">>, Required),
                      [{role, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#role">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#role">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"muc#role">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"muc#role">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#role">>, XMLNS}});
do_decode([#xdata_field{var = <<"muc#jid">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try jid:decode(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#jid">>, Required),
                      [{jid, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#jid">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#jid">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"muc#jid">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"muc#jid">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#jid">>, XMLNS}});
do_decode([#xdata_field{var = <<"muc#roomnick">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomnick">>, Required),
                      [{roomnick, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roomnick">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#roomnick">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"muc#roomnick">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"muc#roomnick">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#roomnick">>, XMLNS}});
do_decode([#xdata_field{var = <<"muc#request_allow">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#request_allow">>, Required),
                      [{request_allow, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#request_allow">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#request_allow">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"muc#request_allow">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"muc#request_allow">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#request_allow">>, XMLNS}});
do_decode([#xdata_field{var = Var} | Fs], XMLNS,
          Required, Acc) ->
    if Var /= <<"FORM_TYPE">> ->
           erlang:error({?MODULE, {unknown_var, Var, XMLNS}});
       true -> do_decode(Fs, XMLNS, Required, Acc)
    end;
do_decode([], XMLNS, [Var | _], _) ->
    erlang:error({?MODULE,
                  {missing_required_var, Var, XMLNS}});
do_decode([], _, [], Acc) -> Acc.

-spec encode_role(participant | undefined,
                  default | options(participant), binary(),
                  boolean()) -> xdata_field().

encode_role(Value, Options, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang, ?T("Participant")),
                                 value = <<"participant">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"muc#role">>, values = Values,
                 required = IsRequired, type = 'list-single',
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Requested role"))}.

-spec encode_jid(jid:jid() | undefined, binary(),
                 boolean()) -> xdata_field().

encode_jid(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [jid:encode(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#jid">>, values = Values,
                 required = IsRequired, type = 'jid-single',
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("User JID"))}.

-spec encode_roomnick(binary(), binary(),
                      boolean()) -> xdata_field().

encode_roomnick(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomnick">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Nickname"))}.

-spec encode_request_allow(boolean() | undefined,
                           binary(), boolean()) -> xdata_field().

encode_request_allow(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#request_allow">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Grant voice to this person?"))}.
