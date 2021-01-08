%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0430).

-compile(export_all).

do_decode(<<"fin">>, <<"urn:xmpp:inbox:1">>, El,
          Opts) ->
    decode_inbox_fin(<<"urn:xmpp:inbox:1">>, Opts, El);
do_decode(<<"entry">>, <<"urn:xmpp:inbox:1">>, El,
          Opts) ->
    decode_inbox_entry(<<"urn:xmpp:inbox:1">>, Opts, El);
do_decode(<<"inbox">>, <<"urn:xmpp:inbox:1">>, El,
          Opts) ->
    decode_inbox_query(<<"urn:xmpp:inbox:1">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"fin">>, <<"urn:xmpp:inbox:1">>},
     {<<"entry">>, <<"urn:xmpp:inbox:1">>},
     {<<"inbox">>, <<"urn:xmpp:inbox:1">>}].

do_encode({inbox_query, _} = Inbox, TopXMLNS) ->
    encode_inbox_query(Inbox, TopXMLNS);
do_encode({inbox_entry, _, _, _} = Entry, TopXMLNS) ->
    encode_inbox_entry(Entry, TopXMLNS);
do_encode({inbox_fin, _, _, _, _} = Fin, TopXMLNS) ->
    encode_inbox_fin(Fin, TopXMLNS).

do_get_name({inbox_entry, _, _, _}) -> <<"entry">>;
do_get_name({inbox_fin, _, _, _, _}) -> <<"fin">>;
do_get_name({inbox_query, _}) -> <<"inbox">>.

do_get_ns({inbox_entry, _, _, _}) ->
    <<"urn:xmpp:inbox:1">>;
do_get_ns({inbox_fin, _, _, _, _}) ->
    <<"urn:xmpp:inbox:1">>;
do_get_ns({inbox_query, _}) -> <<"urn:xmpp:inbox:1">>.

pp(inbox_query, 1) -> [rsm];
pp(inbox_entry, 3) -> [unread, jid, id];
pp(inbox_fin, 4) -> [total, unread, all_unread, rsm];
pp(_, _) -> no.

records() ->
    [{inbox_query, 1}, {inbox_entry, 3}, {inbox_fin, 4}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_inbox_fin(__TopXMLNS, __Opts,
                 {xmlel, <<"fin">>, _attrs, _els}) ->
    Rsm = decode_inbox_fin_els(__TopXMLNS,
                               __Opts,
                               _els,
                               undefined),
    {Total, Unread, All_unread} =
        decode_inbox_fin_attrs(__TopXMLNS,
                               _attrs,
                               undefined,
                               undefined,
                               undefined),
    {inbox_fin, Total, Unread, All_unread, Rsm}.

decode_inbox_fin_els(__TopXMLNS, __Opts, [], Rsm) ->
    Rsm;
decode_inbox_fin_els(__TopXMLNS, __Opts,
                     [{xmlel, <<"set">>, _attrs, _} = _el | _els], Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"http://jabber.org/protocol/rsm">> ->
            decode_inbox_fin_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 xep0059:decode_rsm_set(<<"http://jabber.org/protocol/rsm">>,
                                                        __Opts,
                                                        _el));
        _ -> decode_inbox_fin_els(__TopXMLNS, __Opts, _els, Rsm)
    end;
decode_inbox_fin_els(__TopXMLNS, __Opts, [_ | _els],
                     Rsm) ->
    decode_inbox_fin_els(__TopXMLNS, __Opts, _els, Rsm).

decode_inbox_fin_attrs(__TopXMLNS,
                       [{<<"total">>, _val} | _attrs], _Total, Unread,
                       All_unread) ->
    decode_inbox_fin_attrs(__TopXMLNS,
                           _attrs,
                           _val,
                           Unread,
                           All_unread);
decode_inbox_fin_attrs(__TopXMLNS,
                       [{<<"unread">>, _val} | _attrs], Total, _Unread,
                       All_unread) ->
    decode_inbox_fin_attrs(__TopXMLNS,
                           _attrs,
                           Total,
                           _val,
                           All_unread);
decode_inbox_fin_attrs(__TopXMLNS,
                       [{<<"all-unread">>, _val} | _attrs], Total, Unread,
                       _All_unread) ->
    decode_inbox_fin_attrs(__TopXMLNS,
                           _attrs,
                           Total,
                           Unread,
                           _val);
decode_inbox_fin_attrs(__TopXMLNS, [_ | _attrs], Total,
                       Unread, All_unread) ->
    decode_inbox_fin_attrs(__TopXMLNS,
                           _attrs,
                           Total,
                           Unread,
                           All_unread);
decode_inbox_fin_attrs(__TopXMLNS, [], Total, Unread,
                       All_unread) ->
    {decode_inbox_fin_attr_total(__TopXMLNS, Total),
     decode_inbox_fin_attr_unread(__TopXMLNS, Unread),
     'decode_inbox_fin_attr_all-unread'(__TopXMLNS,
                                        All_unread)}.

encode_inbox_fin({inbox_fin,
                  Total,
                  Unread,
                  All_unread,
                  Rsm},
                 __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:inbox:1">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_inbox_fin_$rsm'(Rsm,
                                                 __NewTopXMLNS,
                                                 [])),
    _attrs = 'encode_inbox_fin_attr_all-unread'(All_unread,
                                                encode_inbox_fin_attr_unread(Unread,
                                                                             encode_inbox_fin_attr_total(Total,
                                                                                                         xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                    __TopXMLNS)))),
    {xmlel, <<"fin">>, _attrs, _els}.

'encode_inbox_fin_$rsm'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_inbox_fin_$rsm'(Rsm, __TopXMLNS, _acc) ->
    [xep0059:encode_rsm_set(Rsm, __TopXMLNS) | _acc].

decode_inbox_fin_attr_total(__TopXMLNS, undefined) ->
    undefined;
decode_inbox_fin_attr_total(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"total">>,
                           <<"fin">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_inbox_fin_attr_total(undefined, _acc) -> _acc;
encode_inbox_fin_attr_total(_val, _acc) ->
    [{<<"total">>, enc_int(_val)} | _acc].

decode_inbox_fin_attr_unread(__TopXMLNS, undefined) ->
    undefined;
decode_inbox_fin_attr_unread(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"unread">>,
                           <<"fin">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_inbox_fin_attr_unread(undefined, _acc) -> _acc;
encode_inbox_fin_attr_unread(_val, _acc) ->
    [{<<"unread">>, enc_int(_val)} | _acc].

'decode_inbox_fin_attr_all-unread'(__TopXMLNS,
                                   undefined) ->
    undefined;
'decode_inbox_fin_attr_all-unread'(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"all-unread">>,
                           <<"fin">>,
                           __TopXMLNS}});
        _res -> _res
    end.

'encode_inbox_fin_attr_all-unread'(undefined, _acc) ->
    _acc;
'encode_inbox_fin_attr_all-unread'(_val, _acc) ->
    [{<<"all-unread">>, enc_int(_val)} | _acc].

decode_inbox_entry(__TopXMLNS, __Opts,
                   {xmlel, <<"entry">>, _attrs, _els}) ->
    {Unread, Jid, Id} = decode_inbox_entry_attrs(__TopXMLNS,
                                                 _attrs,
                                                 undefined,
                                                 undefined,
                                                 undefined),
    {inbox_entry, Unread, Jid, Id}.

decode_inbox_entry_attrs(__TopXMLNS,
                         [{<<"unread">>, _val} | _attrs], _Unread, Jid, Id) ->
    decode_inbox_entry_attrs(__TopXMLNS,
                             _attrs,
                             _val,
                             Jid,
                             Id);
decode_inbox_entry_attrs(__TopXMLNS,
                         [{<<"jid">>, _val} | _attrs], Unread, _Jid, Id) ->
    decode_inbox_entry_attrs(__TopXMLNS,
                             _attrs,
                             Unread,
                             _val,
                             Id);
decode_inbox_entry_attrs(__TopXMLNS,
                         [{<<"id">>, _val} | _attrs], Unread, Jid, _Id) ->
    decode_inbox_entry_attrs(__TopXMLNS,
                             _attrs,
                             Unread,
                             Jid,
                             _val);
decode_inbox_entry_attrs(__TopXMLNS, [_ | _attrs],
                         Unread, Jid, Id) ->
    decode_inbox_entry_attrs(__TopXMLNS,
                             _attrs,
                             Unread,
                             Jid,
                             Id);
decode_inbox_entry_attrs(__TopXMLNS, [], Unread, Jid,
                         Id) ->
    {decode_inbox_entry_attr_unread(__TopXMLNS, Unread),
     decode_inbox_entry_attr_jid(__TopXMLNS, Jid),
     decode_inbox_entry_attr_id(__TopXMLNS, Id)}.

encode_inbox_entry({inbox_entry, Unread, Jid, Id},
                   __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:inbox:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_inbox_entry_attr_id(Id,
                                        encode_inbox_entry_attr_jid(Jid,
                                                                    encode_inbox_entry_attr_unread(Unread,
                                                                                                   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                              __TopXMLNS)))),
    {xmlel, <<"entry">>, _attrs, _els}.

decode_inbox_entry_attr_unread(__TopXMLNS, undefined) ->
    undefined;
decode_inbox_entry_attr_unread(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"unread">>,
                           <<"entry">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_inbox_entry_attr_unread(undefined, _acc) -> _acc;
encode_inbox_entry_attr_unread(_val, _acc) ->
    [{<<"unread">>, enc_int(_val)} | _acc].

decode_inbox_entry_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_inbox_entry_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"jid">>,
                           <<"entry">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_inbox_entry_attr_jid(undefined, _acc) -> _acc;
encode_inbox_entry_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_inbox_entry_attr_id(__TopXMLNS, undefined) ->
    <<>>;
decode_inbox_entry_attr_id(__TopXMLNS, _val) -> _val.

encode_inbox_entry_attr_id(<<>>, _acc) -> _acc;
encode_inbox_entry_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_inbox_query(__TopXMLNS, __Opts,
                   {xmlel, <<"inbox">>, _attrs, _els}) ->
    Rsm = decode_inbox_query_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 undefined),
    {inbox_query, Rsm}.

decode_inbox_query_els(__TopXMLNS, __Opts, [], Rsm) ->
    Rsm;
decode_inbox_query_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"set">>, _attrs, _} = _el | _els], Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"http://jabber.org/protocol/rsm">> ->
            decode_inbox_query_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   xep0059:decode_rsm_set(<<"http://jabber.org/protocol/rsm">>,
                                                          __Opts,
                                                          _el));
        _ ->
            decode_inbox_query_els(__TopXMLNS, __Opts, _els, Rsm)
    end;
decode_inbox_query_els(__TopXMLNS, __Opts, [_ | _els],
                       Rsm) ->
    decode_inbox_query_els(__TopXMLNS, __Opts, _els, Rsm).

encode_inbox_query({inbox_query, Rsm}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:inbox:1">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_inbox_query_$rsm'(Rsm,
                                                   __NewTopXMLNS,
                                                   [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"inbox">>, _attrs, _els}.

'encode_inbox_query_$rsm'(undefined, __TopXMLNS,
                          _acc) ->
    _acc;
'encode_inbox_query_$rsm'(Rsm, __TopXMLNS, _acc) ->
    [xep0059:encode_rsm_set(Rsm, __TopXMLNS) | _acc].
