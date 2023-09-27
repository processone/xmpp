%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_publish_options.xdata
%% Form type: http://jabber.org/protocol/pubsub#publish-options
%% Document: XEP-0060

-module(pubsub_publish_options).

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

-include("pubsub_publish_options.hrl").

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
             [access_model |
              body_xslt |
              children_association_policy |
              children_association_whitelist |
              children |
              children_max |
              collection |
              contact |
              dataform_xslt |
              deliver_notifications |
              deliver_payloads |
              description |
              item_expire |
              itemreply |
              language |
              max_items |
              max_payload_size |
              node_type |
              notification_type |
              notify_config |
              notify_delete |
              notify_retract |
              notify_sub |
              persist_items |
              presence_based_delivery |
              publish_model |
              purge_offline |
              roster_groups_allowed |
              send_last_published_item |
              tempsub |
              subscribe |
              title |
              type]) -> [xdata_field()].

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
           [<<"http://jabber.org/protocol/pubsub#publish-opt"
              "ions">>],
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
              {body_xslt, Val} ->
                  [encode_body_xslt(Val,
                                    Lang,
                                    lists:member(body_xslt, Required))];
              {children_association_policy, Val} ->
                  [encode_children_association_policy(Val,
                                                      default,
                                                      Lang,
                                                      lists:member(children_association_policy,
                                                                   Required))];
              {children_association_policy, Val, Opts} ->
                  [encode_children_association_policy(Val,
                                                      Opts,
                                                      Lang,
                                                      lists:member(children_association_policy,
                                                                   Required))];
              {children_association_whitelist, Val} ->
                  [encode_children_association_whitelist(Val,
                                                         Lang,
                                                         lists:member(children_association_whitelist,
                                                                      Required))];
              {children, Val} ->
                  [encode_children(Val,
                                   Lang,
                                   lists:member(children, Required))];
              {children_max, Val} ->
                  [encode_children_max(Val,
                                       Lang,
                                       lists:member(children_max, Required))];
              {collection, Val} ->
                  [encode_collection(Val,
                                     Lang,
                                     lists:member(collection, Required))];
              {contact, Val} ->
                  [encode_contact(Val,
                                  Lang,
                                  lists:member(contact, Required))];
              {dataform_xslt, Val} ->
                  [encode_dataform_xslt(Val,
                                        Lang,
                                        lists:member(dataform_xslt, Required))];
              {deliver_notifications, Val} ->
                  [encode_deliver_notifications(Val,
                                                Lang,
                                                lists:member(deliver_notifications,
                                                             Required))];
              {deliver_payloads, Val} ->
                  [encode_deliver_payloads(Val,
                                           Lang,
                                           lists:member(deliver_payloads,
                                                        Required))];
              {description, Val} ->
                  [encode_description(Val,
                                      Lang,
                                      lists:member(description, Required))];
              {item_expire, Val} ->
                  [encode_item_expire(Val,
                                      Lang,
                                      lists:member(item_expire, Required))];
              {itemreply, Val} ->
                  [encode_itemreply(Val,
                                    default,
                                    Lang,
                                    lists:member(itemreply, Required))];
              {itemreply, Val, Opts} ->
                  [encode_itemreply(Val,
                                    Opts,
                                    Lang,
                                    lists:member(itemreply, Required))];
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
              {max_items, Val} ->
                  [encode_max_items(Val,
                                    Lang,
                                    lists:member(max_items, Required))];
              {max_payload_size, Val} ->
                  [encode_max_payload_size(Val,
                                           Lang,
                                           lists:member(max_payload_size,
                                                        Required))];
              {node_type, Val} ->
                  [encode_node_type(Val,
                                    default,
                                    Lang,
                                    lists:member(node_type, Required))];
              {node_type, Val, Opts} ->
                  [encode_node_type(Val,
                                    Opts,
                                    Lang,
                                    lists:member(node_type, Required))];
              {notification_type, Val} ->
                  [encode_notification_type(Val,
                                            default,
                                            Lang,
                                            lists:member(notification_type,
                                                         Required))];
              {notification_type, Val, Opts} ->
                  [encode_notification_type(Val,
                                            Opts,
                                            Lang,
                                            lists:member(notification_type,
                                                         Required))];
              {notify_config, Val} ->
                  [encode_notify_config(Val,
                                        Lang,
                                        lists:member(notify_config, Required))];
              {notify_delete, Val} ->
                  [encode_notify_delete(Val,
                                        Lang,
                                        lists:member(notify_delete, Required))];
              {notify_retract, Val} ->
                  [encode_notify_retract(Val,
                                         Lang,
                                         lists:member(notify_retract,
                                                      Required))];
              {notify_sub, Val} ->
                  [encode_notify_sub(Val,
                                     Lang,
                                     lists:member(notify_sub, Required))];
              {persist_items, Val} ->
                  [encode_persist_items(Val,
                                        Lang,
                                        lists:member(persist_items, Required))];
              {presence_based_delivery, Val} ->
                  [encode_presence_based_delivery(Val,
                                                  Lang,
                                                  lists:member(presence_based_delivery,
                                                               Required))];
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
              {purge_offline, Val} ->
                  [encode_purge_offline(Val,
                                        Lang,
                                        lists:member(purge_offline, Required))];
              {roster_groups_allowed, Val} ->
                  [encode_roster_groups_allowed(Val,
                                                default,
                                                Lang,
                                                lists:member(roster_groups_allowed,
                                                             Required))];
              {roster_groups_allowed, Val, Opts} ->
                  [encode_roster_groups_allowed(Val,
                                                Opts,
                                                Lang,
                                                lists:member(roster_groups_allowed,
                                                             Required))];
              {send_last_published_item, Val} ->
                  [encode_send_last_published_item(Val,
                                                   default,
                                                   Lang,
                                                   lists:member(send_last_published_item,
                                                                Required))];
              {send_last_published_item, Val, Opts} ->
                  [encode_send_last_published_item(Val,
                                                   Opts,
                                                   Lang,
                                                   lists:member(send_last_published_item,
                                                                Required))];
              {tempsub, Val} ->
                  [encode_tempsub(Val,
                                  Lang,
                                  lists:member(tempsub, Required))];
              {subscribe, Val} ->
                  [encode_subscribe(Val,
                                    Lang,
                                    lists:member(subscribe, Required))];
              {title, Val} ->
                  [encode_title(Val,
                                Lang,
                                lists:member(title, Required))];
              {type, Val} ->
                  [encode_type(Val, Lang, lists:member(type, Required))];
              #xdata_field{} -> [Opt]
          end
          || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
                            type = hidden,
                            values =
                                [<<"http://jabber.org/protocol/pubsub#publish-opt"
                                   "ions">>]},
    [FormType | lists:flatten(Fs)].

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
do_decode([#xdata_field{var = <<"pubsub#body_xslt">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#body_xslt">>, Required),
                      [{body_xslt, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#body_xslt">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#body_xslt">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#body_xslt">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#body_xslt">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#body_xslt">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#children_association_policy">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, [all, owners, whitelist]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#children_association_policy">>,
                                   Required),
                      [{children_association_policy, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#children_association_policy">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#children_association_policy">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#children_association_policy">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#children_association_policy">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#children_association_policy">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#children_association_whitelist">>,
                        values = [<<>>]} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    %% Psi work-around
    do_decode([F#xdata_field{var =
                                 <<"pubsub#children_association_whitelist">>,
                             values = []}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#children_association_whitelist">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [jid:decode(Value) || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#children_association_whitelist">>,
                                   Required),
                      [{children_association_whitelist, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#children_association_whitelist">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#children">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [Value || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#children">>, Required),
                      [{children, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#children">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#children_max">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try xmpp_util:decode_limit(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#children_max">>, Required),
                      [{children_max, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#children_max">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#children_max">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#children_max">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#children_max">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#children_max">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#collection">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [Value || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#collection">>, Required),
                      [{collection, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#collection">>, XMLNS}})
    end;
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
                            <<"pubsub#dataform_xslt">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#dataform_xslt">>, Required),
                      [{dataform_xslt, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#dataform_xslt">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#dataform_xslt">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#dataform_xslt">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#dataform_xslt">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#dataform_xslt">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#deliver_notifications">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#deliver_notifications">>,
                                   Required),
                      [{deliver_notifications, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#deliver_notifications">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#deliver_notifications">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#deliver_notifications">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#deliver_notifications">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#deliver_notifications">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#deliver_payloads">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#deliver_payloads">>, Required),
                      [{deliver_payloads, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#deliver_payloads">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#deliver_payloads">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#deliver_payloads">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#deliver_payloads">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#deliver_payloads">>,
                   XMLNS}});
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
do_decode([#xdata_field{var = <<"pubsub#item_expire">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try xmpp_util:decode_limit(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#item_expire">>, Required),
                      [{item_expire, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#item_expire">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#item_expire">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#item_expire">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#item_expire">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#item_expire">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#itemreply">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, [owner, publisher, none]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#itemreply">>, Required),
                      [{itemreply, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#itemreply">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#itemreply">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#itemreply">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#itemreply">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#itemreply">>, XMLNS}});
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
do_decode([#xdata_field{var =
                            <<"pubsub#max_payload_size">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_int(Value, 0, infinity) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#max_payload_size">>, Required),
                      [{max_payload_size, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#max_payload_size">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#max_payload_size">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#max_payload_size">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#max_payload_size">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#max_payload_size">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#node_type">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, [leaf, collection]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#node_type">>, Required),
                      [{node_type, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#node_type">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#node_type">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#node_type">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#node_type">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#node_type">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#notification_type">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, [normal, headline]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#notification_type">>, Required),
                      [{notification_type, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#notification_type">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#notification_type">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#notification_type">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#notification_type">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#notification_type">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#notify_config">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#notify_config">>, Required),
                      [{notify_config, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#notify_config">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#notify_config">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#notify_config">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#notify_config">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#notify_config">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#notify_delete">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#notify_delete">>, Required),
                      [{notify_delete, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#notify_delete">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#notify_delete">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#notify_delete">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#notify_delete">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#notify_delete">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#notify_retract">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#notify_retract">>, Required),
                      [{notify_retract, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#notify_retract">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#notify_retract">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#notify_retract">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#notify_retract">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#notify_retract">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#notify_sub">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#notify_sub">>, Required),
                      [{notify_sub, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#notify_sub">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#notify_sub">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#notify_sub">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#notify_sub">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#notify_sub">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#persist_items">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#persist_items">>, Required),
                      [{persist_items, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#persist_items">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#persist_items">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#persist_items">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#persist_items">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#persist_items">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#presence_based_delivery">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#presence_based_delivery">>,
                                   Required),
                      [{presence_based_delivery, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#presence_based_delivery">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#presence_based_delivery">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#presence_based_delivery">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#presence_based_delivery">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#presence_based_delivery">>,
                   XMLNS}});
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
do_decode([#xdata_field{var =
                            <<"pubsub#purge_offline">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#purge_offline">>, Required),
                      [{purge_offline, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#purge_offline">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#purge_offline">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#purge_offline">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#purge_offline">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#purge_offline">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"pubsub#roster_groups_allowed">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [Value || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#roster_groups_allowed">>,
                                   Required),
                      [{roster_groups_allowed, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#roster_groups_allowed">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#send_last_published_item">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value,
                 [never, on_sub, on_sub_and_presence])
    of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#send_last_published_item">>,
                                   Required),
                      [{send_last_published_item, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"pubsub#send_last_published_item">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"pubsub#send_last_published_item">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"pubsub#send_last_published_item">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"pubsub#send_last_published_item">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"pubsub#send_last_published_item">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#tempsub">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#tempsub">>, Required),
                      [{tempsub, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#tempsub">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#tempsub">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#tempsub">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#tempsub">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#tempsub">>, XMLNS}});
do_decode([#xdata_field{var = <<"pubsub#subscribe">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"pubsub#subscribe">>, Required),
                      [{subscribe, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"pubsub#subscribe">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"pubsub#subscribe">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"pubsub#subscribe">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"pubsub#subscribe">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"pubsub#subscribe">>, XMLNS}});
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
                 label =
                     xmpp_tr:tr(Lang, ?T("Specify the access model"))}.

-spec encode_body_xslt(binary(), binary(),
                       boolean()) -> xdata_field().

encode_body_xslt(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#body_xslt">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The URL of an XSL transformation which "
                                   "can be applied to payloads in order "
                                   "to generate an appropriate message body "
                                   "element."))}.

-spec
     encode_children_association_policy(children_association_policy() |
                                        undefined,
                                        default |
                                        options(children_association_policy()),
                                        binary(), boolean()) -> xdata_field().

encode_children_association_policy(Value, Options, Lang,
                                   IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Anyone may associate leaf nodes with "
                                                   "the collection")),
                                 value = <<"all">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Only collection node owners may associate "
                                                   "leaf nodes with the collection")),
                                 value = <<"owners">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Only those on a whitelist may associate "
                                                   "leaf nodes with the collection")),
                                 value = <<"whitelist">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var =
                     <<"pubsub#children_association_policy">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Who may associate leaf nodes with a "
                                   "collection"))}.

-spec encode_children_association_whitelist([jid:jid()],
                                            binary(),
                                            boolean()) -> xdata_field().

encode_children_association_whitelist(Value, Lang,
                                      IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [jid:encode(V) || V <- Value]
             end,
    Opts = [],
    #xdata_field{var =
                     <<"pubsub#children_association_whitelist">>,
                 values = Values, required = IsRequired,
                 type = 'jid-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The list of JIDs that may associate "
                                   "leaf nodes with a collection"))}.

-spec encode_children([binary()], binary(),
                      boolean()) -> xdata_field().

encode_children(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> Value
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#children">>,
                 values = Values, required = IsRequired,
                 type = 'text-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The child nodes (leaf or collection) "
                                   "associated with a collection"))}.

-spec encode_children_max(xmpp_util:limit() | undefined,
                          binary(), boolean()) -> xdata_field().

encode_children_max(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [xmpp_util:encode_limit(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#children_max">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The maximum number of child nodes that "
                                   "can be associated with a collection, "
                                   "or `max` for no specific limit other "
                                   "than a server imposed maximum"))}.

-spec encode_collection([binary()], binary(),
                        boolean()) -> xdata_field().

encode_collection(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> Value
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#collection">>,
                 values = Values, required = IsRequired,
                 type = 'text-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The collections with which a node is "
                                   "affiliated"))}.

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

-spec encode_dataform_xslt(binary(), binary(),
                           boolean()) -> xdata_field().

encode_dataform_xslt(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#dataform_xslt">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The URL of an XSL transformation which "
                                   "can be applied to the payload format "
                                   "in order to generate a valid Data Forms "
                                   "result that the client could display "
                                   "using a generic Data Forms rendering "
                                   "engine"))}.

-spec encode_deliver_notifications(boolean() |
                                   undefined,
                                   binary(), boolean()) -> xdata_field().

encode_deliver_notifications(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#deliver_notifications">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Deliver event notifications"))}.

-spec encode_deliver_payloads(boolean() | undefined,
                              binary(), boolean()) -> xdata_field().

encode_deliver_payloads(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#deliver_payloads">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Deliver payloads with event notifications"))}.

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

-spec encode_item_expire(xmpp_util:limit() | undefined,
                         binary(), boolean()) -> xdata_field().

encode_item_expire(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [xmpp_util:encode_limit(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#item_expire">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Number of seconds after which to automaticall"
                                   "y purge items, or `max` for no specific "
                                   "limit other than a server imposed maximum"))}.

-spec encode_itemreply(itemreply() | undefined,
                       default | options(itemreply()), binary(),
                       boolean()) -> xdata_field().

encode_itemreply(Value, Options, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Statically specify a replyto of the "
                                                   "node owner(s)")),
                                 value = <<"owner">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Dynamically specify a replyto of the "
                                                   "item publisher")),
                                 value = <<"publisher">>},
                   #xdata_option{value = <<"none">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#itemreply">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Whether owners or publisher should receive "
                                   "replies to items"))}.

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
                                ?T("Max # of items to persist, or `max` "
                                   "for no specific limit other than a server "
                                   "imposed maximum"))}.

-spec encode_max_payload_size(non_neg_integer() |
                              undefined,
                              binary(), boolean()) -> xdata_field().

encode_max_payload_size(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_int(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#max_payload_size">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Max payload size in bytes"))}.

-spec encode_node_type(node_type() | undefined,
                       default | options(node_type()), binary(),
                       boolean()) -> xdata_field().

encode_node_type(Value, Options, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("The node is a leaf node (default)")),
                                 value = <<"leaf">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("The node is a collection node")),
                                 value = <<"collection">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#node_type">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Whether the node is a leaf (default) "
                                   "or a collection"))}.

-spec encode_notification_type(notification_type() |
                               undefined,
                               default | options(notification_type()), binary(),
                               boolean()) -> xdata_field().

encode_notification_type(Value, Options, Lang,
                         IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Messages of type normal")),
                                 value = <<"normal">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("Messages of type headline")),
                                 value = <<"headline">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#notification_type">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Specify the event message type"))}.

-spec encode_notify_config(boolean() | undefined,
                           binary(), boolean()) -> xdata_field().

encode_notify_config(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#notify_config">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Notify subscribers when the node configuratio"
                                   "n changes"))}.

-spec encode_notify_delete(boolean() | undefined,
                           binary(), boolean()) -> xdata_field().

encode_notify_delete(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#notify_delete">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Notify subscribers when the node is "
                                   "deleted"))}.

-spec encode_notify_retract(boolean() | undefined,
                            binary(), boolean()) -> xdata_field().

encode_notify_retract(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#notify_retract">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Notify subscribers when items are removed "
                                   "from the node"))}.

-spec encode_notify_sub(boolean() | undefined, binary(),
                        boolean()) -> xdata_field().

encode_notify_sub(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#notify_sub">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Whether to notify owners about new subscriber"
                                   "s and unsubscribes"))}.

-spec encode_persist_items(boolean() | undefined,
                           binary(), boolean()) -> xdata_field().

encode_persist_items(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#persist_items">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Persist items to storage"))}.

-spec encode_presence_based_delivery(boolean() |
                                     undefined,
                                     binary(), boolean()) -> xdata_field().

encode_presence_based_delivery(Value, Lang,
                               IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#presence_based_delivery">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Only deliver notifications to available "
                                   "users"))}.

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
                 label =
                     xmpp_tr:tr(Lang, ?T("Specify the publisher model"))}.

-spec encode_purge_offline(boolean() | undefined,
                           binary(), boolean()) -> xdata_field().

encode_purge_offline(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#purge_offline">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Purge all items when the relevant publisher "
                                   "goes offline"))}.

-spec encode_roster_groups_allowed([binary()],
                                   default | options(binary()), binary(),
                                   boolean()) -> xdata_field().

encode_roster_groups_allowed(Value, Options, Lang,
                             IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> Value
             end,
    Opts = if Options == default -> [];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L), value = V}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"pubsub#roster_groups_allowed">>,
                 values = Values, required = IsRequired,
                 type = 'list-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Roster groups allowed to subscribe"))}.

-spec
     encode_send_last_published_item(send_last_published_item() |
                                     undefined,
                                     default |
                                     options(send_last_published_item()),
                                     binary(), boolean()) -> xdata_field().

encode_send_last_published_item(Value, Options, Lang,
                                IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, ?T("Never")),
                                 value = <<"never">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("When a new subscription is processed")),
                                 value = <<"on_sub">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang,
                                                ?T("When a new subscription is processed "
                                                   "and whenever a subscriber comes online")),
                                 value = <<"on_sub_and_presence">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var =
                     <<"pubsub#send_last_published_item">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("When to send the last published item"))}.

-spec encode_tempsub(boolean() | undefined, binary(),
                     boolean()) -> xdata_field().

encode_tempsub(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#tempsub">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Whether to make all subscriptions temporary, "
                                   "based on subscriber presence"))}.

-spec encode_subscribe(boolean() | undefined, binary(),
                       boolean()) -> xdata_field().

encode_subscribe(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"pubsub#subscribe">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Whether to allow subscriptions"))}.

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
                 label =
                     xmpp_tr:tr(Lang, ?T("A friendly name for the node"))}.

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
                                ?T("The semantic type information of data "
                                   "in the node, usually specified by the "
                                   "namespace of the payload (if any)"))}.
