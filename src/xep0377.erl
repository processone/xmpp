%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0377).

-compile(export_all).

do_decode(<<"report">>, <<"urn:xmpp:reporting:1">>, El,
          Opts) ->
    decode_report(<<"urn:xmpp:reporting:1">>, Opts, El);
do_decode(<<"third-party">>, <<"urn:xmpp:reporting:1">>,
          El, Opts) ->
    decode_third_party(<<"urn:xmpp:reporting:1">>,
                       Opts,
                       El);
do_decode(<<"report-origin">>,
          <<"urn:xmpp:reporting:1">>, El, Opts) ->
    decode_report_origin(<<"urn:xmpp:reporting:1">>,
                         Opts,
                         El);
do_decode(<<"text">>, <<"urn:xmpp:reporting:1">>, El,
          Opts) ->
    decode_report_text(<<"urn:xmpp:reporting:1">>,
                       Opts,
                       El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"report">>, <<"urn:xmpp:reporting:1">>},
     {<<"third-party">>, <<"urn:xmpp:reporting:1">>},
     {<<"report-origin">>, <<"urn:xmpp:reporting:1">>},
     {<<"text">>, <<"urn:xmpp:reporting:1">>}].

do_encode({text, _, _} = Text, TopXMLNS) ->
    encode_report_text(Text, TopXMLNS);
do_encode({report, _, _, _, _, _} = Report, TopXMLNS) ->
    encode_report(Report, TopXMLNS).

do_get_name({report, _, _, _, _, _}) -> <<"report">>;
do_get_name({text, _, _}) -> <<"text">>.

do_get_ns({report, _, _, _, _, _}) ->
    <<"urn:xmpp:reporting:1">>;
do_get_ns({text, _, _}) -> <<"urn:xmpp:reporting:1">>.

pp(text, 2) -> [lang, data];
pp(report, 5) ->
    [reason, text, report_origin, third_party, stanza_ids];
pp(_, _) -> no.

records() -> [{text, 2}, {report, 5}].

dec_reporting_reason(<<"urn:xmpp:reporting:abuse">>) ->
    abuse;
dec_reporting_reason(<<"urn:xmpp:reporting:spam">>) ->
    spam.

enc_reporting_reason(abuse) ->
    <<"urn:xmpp:reporting:abuse">>;
enc_reporting_reason(spam) ->
    <<"urn:xmpp:reporting:spam">>.

decode_report(__TopXMLNS, __Opts,
              {xmlel, <<"report">>, _attrs, _els}) ->
    {Text, Report_origin, Third_party, Stanza_ids} =
        decode_report_els(__TopXMLNS,
                          __Opts,
                          _els,
                          [],
                          false,
                          false,
                          []),
    Reason = decode_report_attrs(__TopXMLNS,
                                 _attrs,
                                 undefined),
    {report,
     Reason,
     Text,
     Report_origin,
     Third_party,
     Stanza_ids}.

decode_report_els(__TopXMLNS, __Opts, [], Text,
                  Report_origin, Third_party, Stanza_ids) ->
    {lists:reverse(Text),
     Report_origin,
     Third_party,
     lists:reverse(Stanza_ids)};
decode_report_els(__TopXMLNS, __Opts,
                  [{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
                  Report_origin, Third_party, Stanza_ids) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:reporting:1">> ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              [decode_report_text(<<"urn:xmpp:reporting:1">>,
                                                  __Opts,
                                                  _el)
                               | Text],
                              Report_origin,
                              Third_party,
                              Stanza_ids);
        _ ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              Report_origin,
                              Third_party,
                              Stanza_ids)
    end;
decode_report_els(__TopXMLNS, __Opts,
                  [{xmlel, <<"report-origin">>, _attrs, _} = _el | _els],
                  Text, Report_origin, Third_party, Stanza_ids) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:reporting:1">> ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              decode_report_origin(<<"urn:xmpp:reporting:1">>,
                                                   __Opts,
                                                   _el),
                              Third_party,
                              Stanza_ids);
        _ ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              Report_origin,
                              Third_party,
                              Stanza_ids)
    end;
decode_report_els(__TopXMLNS, __Opts,
                  [{xmlel, <<"third-party">>, _attrs, _} = _el | _els],
                  Text, Report_origin, Third_party, Stanza_ids) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:reporting:1">> ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              Report_origin,
                              decode_third_party(<<"urn:xmpp:reporting:1">>,
                                                 __Opts,
                                                 _el),
                              Stanza_ids);
        _ ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              Report_origin,
                              Third_party,
                              Stanza_ids)
    end;
decode_report_els(__TopXMLNS, __Opts,
                  [{xmlel, <<"stanza-id">>, _attrs, _} = _el | _els],
                  Text, Report_origin, Third_party, Stanza_ids) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sid:0">> ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              Report_origin,
                              Third_party,
                              [xep0359:decode_stanza_id(<<"urn:xmpp:sid:0">>,
                                                        __Opts,
                                                        _el)
                               | Stanza_ids]);
        _ ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              Report_origin,
                              Third_party,
                              Stanza_ids)
    end;
decode_report_els(__TopXMLNS, __Opts, [_ | _els], Text,
                  Report_origin, Third_party, Stanza_ids) ->
    decode_report_els(__TopXMLNS,
                      __Opts,
                      _els,
                      Text,
                      Report_origin,
                      Third_party,
                      Stanza_ids).

decode_report_attrs(__TopXMLNS,
                    [{<<"reason">>, _val} | _attrs], _Reason) ->
    decode_report_attrs(__TopXMLNS, _attrs, _val);
decode_report_attrs(__TopXMLNS, [_ | _attrs], Reason) ->
    decode_report_attrs(__TopXMLNS, _attrs, Reason);
decode_report_attrs(__TopXMLNS, [], Reason) ->
    decode_report_attr_reason(__TopXMLNS, Reason).

encode_report({report,
               Reason,
               Text,
               Report_origin,
               Third_party,
               Stanza_ids},
              __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:reporting:1">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_report_$stanza_ids'(Stanza_ids,
                                                  __NewTopXMLNS,
                                                  'encode_report_$third_party'(Third_party,
                                                                               __NewTopXMLNS,
                                                                               'encode_report_$report_origin'(Report_origin,
                                                                                                              __NewTopXMLNS,
                                                                                                              'encode_report_$text'(Text,
                                                                                                                                    __NewTopXMLNS,
                                                                                                                                    []))))),
    _attrs = encode_report_attr_reason(Reason,
                                       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                  __TopXMLNS)),
    {xmlel, <<"report">>, _attrs, _els}.

'encode_report_$text'([], __TopXMLNS, _acc) -> _acc;
'encode_report_$text'([Text | _els], __TopXMLNS,
                      _acc) ->
    'encode_report_$text'(_els,
                          __TopXMLNS,
                          [encode_report_text(Text, __TopXMLNS) | _acc]).

'encode_report_$report_origin'(false, __TopXMLNS,
                               _acc) ->
    _acc;
'encode_report_$report_origin'(Report_origin,
                               __TopXMLNS, _acc) ->
    [encode_report_origin(Report_origin, __TopXMLNS)
     | _acc].

'encode_report_$third_party'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_report_$third_party'(Third_party, __TopXMLNS,
                             _acc) ->
    [encode_third_party(Third_party, __TopXMLNS) | _acc].

'encode_report_$stanza_ids'([], __TopXMLNS, _acc) ->
    _acc;
'encode_report_$stanza_ids'([Stanza_ids | _els],
                            __TopXMLNS, _acc) ->
    'encode_report_$stanza_ids'(_els,
                                __TopXMLNS,
                                [xep0359:encode_stanza_id(Stanza_ids,
                                                          __TopXMLNS)
                                 | _acc]).

decode_report_attr_reason(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"reason">>,
                   <<"report">>,
                   __TopXMLNS}});
decode_report_attr_reason(__TopXMLNS, _val) ->
    try dec_reporting_reason(_val) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"reason">>,
                           <<"report">>,
                           __TopXMLNS}})
    end.

encode_report_attr_reason(_val, _acc) ->
    [{<<"reason">>, enc_reporting_reason(_val)} | _acc].

decode_third_party(__TopXMLNS, __Opts,
                   {xmlel, <<"third-party">>, _attrs, _els}) ->
    true.

encode_third_party(true, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:reporting:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"third-party">>, _attrs, _els}.

decode_report_origin(__TopXMLNS, __Opts,
                     {xmlel, <<"report-origin">>, _attrs, _els}) ->
    true.

encode_report_origin(true, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:reporting:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"report-origin">>, _attrs, _els}.

decode_report_text(__TopXMLNS, __Opts,
                   {xmlel, <<"text">>, _attrs, _els}) ->
    Data = decode_report_text_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<>>),
    Lang = decode_report_text_attrs(__TopXMLNS,
                                    _attrs,
                                    undefined),
    {text, Lang, Data}.

decode_report_text_els(__TopXMLNS, __Opts, [], Data) ->
    decode_report_text_cdata(__TopXMLNS, Data);
decode_report_text_els(__TopXMLNS, __Opts,
                       [{xmlcdata, _data} | _els], Data) ->
    decode_report_text_els(__TopXMLNS,
                           __Opts,
                           _els,
                           <<Data/binary, _data/binary>>);
decode_report_text_els(__TopXMLNS, __Opts, [_ | _els],
                       Data) ->
    decode_report_text_els(__TopXMLNS, __Opts, _els, Data).

decode_report_text_attrs(__TopXMLNS,
                         [{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_report_text_attrs(__TopXMLNS, _attrs, _val);
decode_report_text_attrs(__TopXMLNS, [_ | _attrs],
                         Lang) ->
    decode_report_text_attrs(__TopXMLNS, _attrs, Lang);
decode_report_text_attrs(__TopXMLNS, [], Lang) ->
    'decode_report_text_attr_xml:lang'(__TopXMLNS, Lang).

encode_report_text({text, Lang, Data}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:reporting:1">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_report_text_cdata(Data, []),
    _attrs = 'encode_report_text_attr_xml:lang'(Lang,
                                                xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                           __TopXMLNS)),
    {xmlel, <<"text">>, _attrs, _els}.

'decode_report_text_attr_xml:lang'(__TopXMLNS,
                                   undefined) ->
    <<>>;
'decode_report_text_attr_xml:lang'(__TopXMLNS, _val) ->
    try xmpp_lang:check(_val) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"xml:lang">>,
                           <<"text">>,
                           __TopXMLNS}})
    end.

'encode_report_text_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_report_text_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_report_text_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_report_text_cdata(__TopXMLNS, _val) -> _val.

encode_report_text_cdata(<<>>, _acc) -> _acc;
encode_report_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
