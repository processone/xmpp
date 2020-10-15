%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0377).

-compile(export_all).

do_decode(<<"report">>, <<"urn:xmpp:reporting:0">>, El,
          Opts) ->
    decode_report(<<"urn:xmpp:reporting:0">>, Opts, El);
do_decode(<<"text">>, <<"urn:xmpp:reporting:0">>, El,
          Opts) ->
    decode_report_text(<<"urn:xmpp:reporting:0">>,
                       Opts,
                       El);
do_decode(<<"spam">>, <<"urn:xmpp:reporting:0">>, El,
          Opts) ->
    decode_report_reason_spam(<<"urn:xmpp:reporting:0">>,
                              Opts,
                              El);
do_decode(<<"abuse">>, <<"urn:xmpp:reporting:0">>, El,
          Opts) ->
    decode_report_reason_abuse(<<"urn:xmpp:reporting:0">>,
                               Opts,
                               El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"report">>, <<"urn:xmpp:reporting:0">>},
     {<<"text">>, <<"urn:xmpp:reporting:0">>},
     {<<"spam">>, <<"urn:xmpp:reporting:0">>},
     {<<"abuse">>, <<"urn:xmpp:reporting:0">>}].

do_encode({text, _, _} = Text, TopXMLNS) ->
    encode_report_text(Text, TopXMLNS);
do_encode({report, _, _} = Report, TopXMLNS) ->
    encode_report(Report, TopXMLNS).

do_get_name({report, _, _}) -> <<"report">>;
do_get_name({text, _, _}) -> <<"text">>.

do_get_ns({report, _, _}) -> <<"urn:xmpp:reporting:0">>;
do_get_ns({text, _, _}) -> <<"urn:xmpp:reporting:0">>.

pp(text, 2) -> [lang, data];
pp(report, 2) -> [reason, text];
pp(_, _) -> no.

records() -> [{text, 2}, {report, 2}].

decode_report(__TopXMLNS, __Opts,
              {xmlel, <<"report">>, _attrs, _els}) ->
    {Text, Reason} = decode_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       [],
                                       undefined),
    {report, Reason, Text}.

decode_report_els(__TopXMLNS, __Opts, [], Text,
                  Reason) ->
    {lists:reverse(Text), Reason};
decode_report_els(__TopXMLNS, __Opts,
                  [{xmlel, <<"abuse">>, _attrs, _} = _el | _els], Text,
                  Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:reporting:0">> ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              decode_report_reason_abuse(<<"urn:xmpp:reporting:0">>,
                                                         __Opts,
                                                         _el));
        _ ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              Reason)
    end;
decode_report_els(__TopXMLNS, __Opts,
                  [{xmlel, <<"spam">>, _attrs, _} = _el | _els], Text,
                  Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:reporting:0">> ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              decode_report_reason_spam(<<"urn:xmpp:reporting:0">>,
                                                        __Opts,
                                                        _el));
        _ ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              Reason)
    end;
decode_report_els(__TopXMLNS, __Opts,
                  [{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
                  Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:reporting:0">> ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              [decode_report_text(<<"urn:xmpp:reporting:0">>,
                                                  __Opts,
                                                  _el)
                               | Text],
                              Reason);
        _ ->
            decode_report_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text,
                              Reason)
    end;
decode_report_els(__TopXMLNS, __Opts, [_ | _els], Text,
                  Reason) ->
    decode_report_els(__TopXMLNS,
                      __Opts,
                      _els,
                      Text,
                      Reason).

encode_report({report, Reason, Text}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:reporting:0">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_report_$text'(Text,
                                               __NewTopXMLNS,
                                               'encode_report_$reason'(Reason,
                                                                       __NewTopXMLNS,
                                                                       []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"report">>, _attrs, _els}.

'encode_report_$text'([], __TopXMLNS, _acc) -> _acc;
'encode_report_$text'([Text | _els], __TopXMLNS,
                      _acc) ->
    'encode_report_$text'(_els,
                          __TopXMLNS,
                          [encode_report_text(Text, __TopXMLNS) | _acc]).

'encode_report_$reason'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_report_$reason'(abuse = Reason, __TopXMLNS,
                        _acc) ->
    [encode_report_reason_abuse(Reason, __TopXMLNS) | _acc];
'encode_report_$reason'(spam = Reason, __TopXMLNS,
                        _acc) ->
    [encode_report_reason_spam(Reason, __TopXMLNS) | _acc].

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
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:reporting:0">>,
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
    case catch xmpp_lang:check(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"xml:lang">>,
                           <<"text">>,
                           __TopXMLNS}});
        _res -> _res
    end.

'encode_report_text_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_report_text_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_report_text_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_report_text_cdata(__TopXMLNS, _val) -> _val.

encode_report_text_cdata(<<>>, _acc) -> _acc;
encode_report_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_report_reason_spam(__TopXMLNS, __Opts,
                          {xmlel, <<"spam">>, _attrs, _els}) ->
    spam.

encode_report_reason_spam(spam, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:reporting:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"spam">>, _attrs, _els}.

decode_report_reason_abuse(__TopXMLNS, __Opts,
                           {xmlel, <<"abuse">>, _attrs, _els}) ->
    abuse.

encode_report_reason_abuse(abuse, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:reporting:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"abuse">>, _attrs, _els}.
