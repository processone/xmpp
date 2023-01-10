%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_meta_data.xdata
%% Form type: http://jabber.org/protocol/pubsub#meta-data
%% Document: XEP-0060

-module(pubsub_meta_data).

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

-include("pubsub_meta_data.hrl").

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
             [contact |
              creation_date |
              creator |
              description |
              language |
              num_subscribers |
              owner |
              publisher |
              title |
              type |
              max_items |
              access_model |
              publish_model]) -> [xdata_field()].

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
           [<<"http://jabber.org/protocol/pubsub#meta-data">>],
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
              {contact, Val} ->
                  [encode_contact(Val,
                                  Lang,
                                  lists:member(contact, Required))];
              {creation_date, Val} ->
                  [encode_creation_date(Val,
                                        Lang,
                                        lists:member(creation_date, Required))];
              {creator, Val} ->
                  [encode_creator(Val,
                                  Lang,
                                  lists:member(creator, Required))];
              {description, Val} ->
                  [encode_description(Val,
                                      Lang,
                                      lists:member(description, Required))];
              {language, Val} ->
                  [encode_language(Val,
                                   default,
                                   Lang,
                                   lists:member(language, Required))];
              {language, Val, Opts} ->
                  [encode_language(Val,
                                   Opts,
                                   Lang,
                                   lists:member(language, Required))];
              {num_subscribers, Val} ->
                  [encode_num_subscribers(Val,
                                          Lang,
                                          lists:member(num_subscribers,
                                                       Required))];
              {owner, Val} ->
                  [encode_owner(Val,
                                Lang,
                                lists:member(owner, Required))];
              {publisher, Val} ->
                  [encode_publisher(Val,
                                    Lang,
                                    lists:member(publisher, Required))];
              {title, Val} ->
                  [encode_title(Val,
                                Lang,
                                lists:member(title, Required))];
              {type, Val} ->
                  [encode_type(Val, Lang, lists:member(type, Required))];
              {max_items, Val} ->
                  [encode_max_items(Val,
                                    Lang,
                                    lists:member(max_items, Required))];
              {access_model, Val} ->
                  [encode_access_model(Val,
                                       default,
                                       Lang,
                                       lists:member(access_model, Required))];
              {access_model, Val, Opts} ->
                  [encode_access_model(Val,
                                       Opts,
                                       Lang,
                                       lists:member(access_model, Required))];
              {publish_model, Val} ->
                  [encode_publish_model(Val,
                                        default,
                                        Lang,
                                        lists:member(publish_model, Required))];
              {publish_model, Val, Opts} ->
                  [encode_publish_model(Val,
                                        Opts,
                                        Lang,
                                        lists:member(publish_model, Required))];
              #xdata_field{} -> [Opt]
          end
          || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
                            type = hidden,
                            values =
                                [<<"http://jabber.org/protocol/pubsub#meta-data">>]},
    [FormType | lists:flatten(Fs)].

do_decode([#xdata_field{var = <<"pubsub#contact">>,
                        values = [<<>>]} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    %% Psi work-around
    do_decode([F#xdata_field{var = <<"pubsub#contact">>,
                             values = []}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#contact">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [jid:decode(Value) || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#contact">>, Required),
                      [{contact, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#contact">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#creation_date">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try xmpp_util:decode_timestamp(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#creation_date">>, Required),
                      [{creation_date, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#creation_date">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#creation_date">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#creation_date">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#creation_date">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#creation_date">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#creator">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try jid:decode(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#creator">>, Required),
                      [{creator, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#creator">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#creator">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#creator">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#creator">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#creator">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#description">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#description">>, Required),
                      [{description, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#description">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#description">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#description">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#description">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#description">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#language">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#language">>, Required),
                      [{language, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#language">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#language">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#language">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#language">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#language">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#num_subscribers">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_int(Value, 0, infinity) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#num_subscribers">>, Required),
                      [{num_subscribers, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#num_subscribers">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#num_subscribers">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#num_subscribers">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#num_subscribers">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#num_subscribers">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#owner">>,
                        values = [<<>>]} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    %% Psi work-around
    do_decode([F#xdata_field{var = <<"pubsub#owner">>,
                             values = []}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#owner">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [jid:decode(Value) || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#owner">>, Required),
                      [{owner, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#owner">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#publisher">>,
                        values = [<<>>]} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    %% Psi work-around
    do_decode([F#xdata_field{var = <<"pubsub#publisher">>,
                             values = []}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#publisher">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [jid:decode(Value) || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#publisher">>, Required),
                      [{publisher, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#publisher">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#title">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#title">>, Required),
                      [{title, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#title">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#title">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#title">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#title">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#title">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#type">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#type">>, Required),
                      [{type, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#type">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#type">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#type">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#type">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#type">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#max_items">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try xmpp_util:decode_limit(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#max_items">>, Required),
                      [{max_items, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#max_items">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#max_items">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#max_items">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#max_items">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#max_items">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#access_model">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value,
                 [authorize, open, presence, roster, whitelist])
    of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#access_model">>, Required),
                      [{access_model, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#access_model">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#access_model">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#access_model">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#access_model">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#access_model">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#publish_model">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, [publishers, subscribers, open]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#publish_model">>, Required),
                      [{publish_model, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#publish_model">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#publish_model">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#publish_model">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#publish_model">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#publish_model">>, XMLNS}});
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

-spec encode_contact([jid:jid()], binary(),
                     boolean()) -> xdata_field().

encode_contact(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [jid:encode(V) || V <- Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#contact">>,
                 values = Values, required = IsRequired,
                 type = 'jid-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The JIDs of those to contact with questions"))}.

-spec encode_creation_date(erlang:timestamp() |
                           undefined,
                           binary(), boolean()) -> xdata_field().

encode_creation_date(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [xmpp_util:encode_timestamp(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#creation_date">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The datetime when the node was created"))}.

-spec encode_creator(jid:jid() | undefined, binary(),
                     boolean()) -> xdata_field().

encode_creator(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [jid:encode(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#creator">>,
                 values = Values, required = IsRequired,
                 type = 'jid-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("The JID of the node creator"))}.

-spec encode_description(binary(), binary(),
                         boolean()) -> xdata_field().

encode_description(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#description">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("A description of the node"))}.

-spec encode_language(binary(),
                      default | options(binary()), binary(),
                      boolean()) -> xdata_field().

encode_language(Value, Options, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = if Options == default -> [];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L), value = V}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#language">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The default language of the node"))}.

-spec encode_num_subscribers(non_neg_integer() |
                             undefined,
                             binary(), boolean()) -> xdata_field().

encode_num_subscribers(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_int(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#num_subscribers">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The number of subscribers to the node"))}.

-spec encode_owner([jid:jid()], binary(),
                   boolean()) -> xdata_field().

encode_owner(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [jid:encode(V) || V <- Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#owner">>, values = Values,
                 required = IsRequired, type = 'jid-multi',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The JIDs of those with an affiliation "
                                   "of owner"))}.

-spec encode_publisher([jid:jid()], binary(),
                       boolean()) -> xdata_field().

encode_publisher(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [jid:encode(V) || V <- Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#publisher">>,
                 values = Values, required = IsRequired,
                 type = 'jid-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The JIDs of those with an affiliation "
                                   "of publisher"))}.

-spec encode_title(binary(), binary(),
                   boolean()) -> xdata_field().

encode_title(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#title">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("The name of the node"))}.

-spec encode_type(binary(), binary(),
                  boolean()) -> xdata_field().

encode_type(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#type">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Payload semantic type information"))}.

-spec encode_max_items(xmpp_util:limit() | undefined,
                       binary(), boolean()) -> xdata_field().

encode_max_items(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [xmpp_util:encode_limit(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#max_items">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Maximum number of items to persist"))}.

-spec encode_access_model(access_model() | undefined,
                          default | options(access_model()), binary(),
                          boolean()) -> xdata_field().

encode_access_model(Value, Options, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Subscription requests must be approved "
                                                   "and only subscribers may retrieve items")),
                                 value = <<"authorize">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Anyone may subscribe and retrieve items")),
                                 value = <<"open">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Anyone with a presence subscription "
                                                   "of both or from may subscribe and retrieve "
                                                   "items")),
                                 value = <<"presence">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Anyone in the specified roster group(s) "
                                                   "may subscribe and retrieve items")),
                                 value = <<"roster">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Only those on a whitelist may subscribe "
                                                   "and retrieve items")),
                                 value = <<"whitelist">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#access_model">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Access model"))}.

-spec encode_publish_model(publish_model() | undefined,
                           default | options(publish_model()), binary(),
                           boolean()) -> xdata_field().

encode_publish_model(Value, Options, Lang,
                     IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Only publishers may publish")),
                                 value = <<"publishers">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Subscribers may publish")),
                                 value = <<"subscribers">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang, ?T("Anyone may publish")),
                                 value = <<"open">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#publish_model">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Publish model"))}.
