%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_subscribe_options.xdata
%% Form type: http://jabber.org/protocol/pubsub#subscribe_options
%% Document: XEP-0060

-module(pubsub_subscribe_options).

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

-include("pubsub_subscribe_options.hrl").

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
             [deliver |
              digest |
              digest_frequency |
              expire |
              include_body |
              'show-values' |
              subscription_type |
              subscription_depth]) -> [xdata_field()].

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
           [<<"http://jabber.org/protocol/pubsub#subscribe_o"
              "ptions">>],
           [],
           []).

decode(Fs, XMLNSList) -> decode(Fs, XMLNSList, [], []).

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

encode(Cfg) -> encode(Cfg, <<"en">>, []).

encode(Cfg, Lang) -> encode(Cfg, Lang, []).

encode(List, Lang, Required) ->
    Fs = [case Opt of
              {deliver, Val} ->
                  [encode_deliver(Val,
                                  Lang,
                                  lists:member(deliver, Required))];
              {digest, Val} ->
                  [encode_digest(Val,
                                 Lang,
                                 lists:member(digest, Required))];
              {digest_frequency, Val} ->
                  [encode_digest_frequency(Val,
                                           Lang,
                                           lists:member(digest_frequency,
                                                        Required))];
              {expire, Val} ->
                  [encode_expire(Val,
                                 Lang,
                                 lists:member(expire, Required))];
              {include_body, Val} ->
                  [encode_include_body(Val,
                                       Lang,
                                       lists:member(include_body, Required))];
              {'show-values', Val} ->
                  ['encode_show-values'(Val,
                                        default,
                                        Lang,
                                        lists:member('show-values', Required))];
              {'show-values', Val, Opts} ->
                  ['encode_show-values'(Val,
                                        Opts,
                                        Lang,
                                        lists:member('show-values', Required))];
              {subscription_type, Val} ->
                  [encode_subscription_type(Val,
                                            default,
                                            Lang,
                                            lists:member(subscription_type,
                                                         Required))];
              {subscription_type, Val, Opts} ->
                  [encode_subscription_type(Val,
                                            Opts,
                                            Lang,
                                            lists:member(subscription_type,
                                                         Required))];
              {subscription_depth, Val} ->
                  [encode_subscription_depth(Val,
                                             default,
                                             Lang,
                                             lists:member(subscription_depth,
                                                          Required))];
              {subscription_depth, Val, Opts} ->
                  [encode_subscription_depth(Val,
                                             Opts,
                                             Lang,
                                             lists:member(subscription_depth,
                                                          Required))];
              #xdata_field{} -> [Opt]
          end
          || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
                            type = hidden,
                            values =
                                [<<"http://jabber.org/protocol/pubsub#subscribe_o"
                                   "ptions">>]},
    [FormType | lists:flatten(Fs)].

do_decode([#xdata_field{var = <<"pubsub#deliver">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#deliver">>, Required),
                      [{deliver, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#deliver">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#deliver">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#deliver">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#deliver">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#deliver">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#digest">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#digest">>, Required),
                      [{digest, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#digest">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#digest">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#digest">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#digest">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#digest">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#digest_frequency">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#digest_frequency">>, Required),
                      [{digest_frequency, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#digest_frequency">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#digest_frequency">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#digest_frequency">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#digest_frequency">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#digest_frequency">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#expire">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#expire">>, Required),
                      [{expire, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#expire">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#expire">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#expire">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#expire">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#expire">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#include_body">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#include_body">>, Required),
                      [{include_body, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#include_body">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#include_body">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#include_body">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#include_body">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#include_body">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#show-values">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [dec_enum(Value, [away, chat, dnd, online, xa])
         || Value <- Values]
    of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#show-values">>, Required),
                      [{'show-values', Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#show-values">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#subscription_type">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, [items, nodes]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#subscription_type">>, Required),
                      [{subscription_type, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#subscription_type">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#subscription_type">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#subscription_type">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#subscription_type">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#subscription_type">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#subscription_depth">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, ['1', all]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#subscription_depth">>, Required),
                      [{subscription_depth, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#subscription_depth">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#subscription_depth">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#subscription_depth">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#subscription_depth">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#subscription_depth">>,
                   XMLNS}});
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

-spec encode_deliver(boolean() | undefined, binary(),
                     boolean()) -> xdata_field().

encode_deliver(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#deliver">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Whether an entity wants to receive or "
                                   "disable notifications"))}.

-spec encode_digest(boolean() | undefined, binary(),
                    boolean()) -> xdata_field().

encode_digest(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#digest">>, values = Values,
                 required = IsRequired, type = boolean, options = Opts,
                 desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Whether an entity wants to receive digests "
                                   "(aggregations) of notifications or all "
                                   "notifications individually"))}.

-spec encode_digest_frequency(binary(), binary(),
                              boolean()) -> xdata_field().

encode_digest_frequency(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#digest_frequency">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The minimum number of milliseconds between "
                                   "sending any two notification digests"))}.

-spec encode_expire(binary(), binary(),
                    boolean()) -> xdata_field().

encode_expire(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#expire">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The DateTime at which a leased subscription "
                                   "will end or has ended"))}.

-spec encode_include_body(boolean() | undefined,
                          binary(), boolean()) -> xdata_field().

encode_include_body(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#include_body">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Whether an entity wants to receive an "
                                   "XMPP message body in addition to the "
                                   "payload format"))}.

-spec 'encode_show-values'(['show-values'()],
                           default | options('show-values'()), binary(),
                           boolean()) -> xdata_field().

'encode_show-values'(Value, Options, Lang,
                     IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [enc_enum(V) || V <- Value]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("XMPP Show Value of Away")),
                                 value = <<"away">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("XMPP Show Value of Chat")),
                                 value = <<"chat">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("XMPP Show Value of DND (Do Not Disturb)")),
                                 value = <<"dnd">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Mere Availability in XMPP (No Show Value)")),
                                 value = <<"online">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("XMPP Show Value of XA (Extended Away)")),
                                 value = <<"xa">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#show-values">>,
                 values = Values, required = IsRequired,
                 type = 'list-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The presence states for which an entity "
                                   "wants to receive notifications"))}.

-spec encode_subscription_type(subscription_type() |
                               undefined,
                               default | options(subscription_type()), binary(),
                               boolean()) -> xdata_field().

encode_subscription_type(Value, Options, Lang,
                         IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Receive notification of new items only")),
                                 value = <<"items">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Receive notification of new nodes only")),
                                 value = <<"nodes">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#subscription_type">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label = <<>>}.

-spec encode_subscription_depth(subscription_depth() |
                                undefined,
                                default | options(subscription_depth()),
                                binary(), boolean()) -> xdata_field().

encode_subscription_depth(Value, Options, Lang,
                          IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Receive notification from direct child "
                                                   "nodes only")),
                                 value = <<"1">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Receive notification from all descendent "
                                                   "nodes")),
                                 value = <<"all">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#subscription_depth">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label = <<>>}.
