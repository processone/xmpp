%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0440).

-compile(export_all).

do_decode(<<"channel-binding">>,
          <<"urn:xmpp:sasl-cb:0">>, El, Opts) ->
    decode_sasl_channel_binding_element(<<"urn:xmpp:sasl-cb:0">>,
                                        Opts,
                                        El);
do_decode(<<"sasl-channel-binding">>,
          <<"urn:xmpp:sasl-cb:0">>, El, Opts) ->
    decode_sasl_channel_binding(<<"urn:xmpp:sasl-cb:0">>,
                                Opts,
                                El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"channel-binding">>, <<"urn:xmpp:sasl-cb:0">>},
     {<<"sasl-channel-binding">>, <<"urn:xmpp:sasl-cb:0">>}].

do_encode({sasl_channel_binding, _} =
              Sasl_channel_binding,
          TopXMLNS) ->
    encode_sasl_channel_binding(Sasl_channel_binding,
                                TopXMLNS).

do_get_name({sasl_channel_binding, _}) ->
    <<"sasl-channel-binding">>.

do_get_ns({sasl_channel_binding, _}) ->
    <<"urn:xmpp:sasl-cb:0">>.

pp(sasl_channel_binding, 1) -> [bindings];
pp(_, _) -> no.

records() -> [{sasl_channel_binding, 1}].

decode_sasl_channel_binding_element(__TopXMLNS, __Opts,
                                    {xmlel,
                                     <<"channel-binding">>,
                                     _attrs,
                                     _els}) ->
    Type =
        decode_sasl_channel_binding_element_attrs(__TopXMLNS,
                                                  _attrs,
                                                  undefined),
    Type.

decode_sasl_channel_binding_element_attrs(__TopXMLNS,
                                          [{<<"type">>, _val} | _attrs],
                                          _Type) ->
    decode_sasl_channel_binding_element_attrs(__TopXMLNS,
                                              _attrs,
                                              _val);
decode_sasl_channel_binding_element_attrs(__TopXMLNS,
                                          [_ | _attrs], Type) ->
    decode_sasl_channel_binding_element_attrs(__TopXMLNS,
                                              _attrs,
                                              Type);
decode_sasl_channel_binding_element_attrs(__TopXMLNS,
                                          [], Type) ->
    decode_sasl_channel_binding_element_attr_type(__TopXMLNS,
                                                  Type).

encode_sasl_channel_binding_element(Type, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl-cb:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs =
        encode_sasl_channel_binding_element_attr_type(Type,
                                                      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                 __TopXMLNS)),
    {xmlel, <<"channel-binding">>, _attrs, _els}.

decode_sasl_channel_binding_element_attr_type(__TopXMLNS,
                                              undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"type">>,
                   <<"channel-binding">>,
                   __TopXMLNS}});
decode_sasl_channel_binding_element_attr_type(__TopXMLNS,
                                              _val) ->
    _val.

encode_sasl_channel_binding_element_attr_type(_val,
                                              _acc) ->
    [{<<"type">>, _val} | _acc].

decode_sasl_channel_binding(__TopXMLNS, __Opts,
                            {xmlel,
                             <<"sasl-channel-binding">>,
                             _attrs,
                             _els}) ->
    Bindings = decode_sasl_channel_binding_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               []),
    {sasl_channel_binding, Bindings}.

decode_sasl_channel_binding_els(__TopXMLNS, __Opts, [],
                                Bindings) ->
    lists:reverse(Bindings);
decode_sasl_channel_binding_els(__TopXMLNS, __Opts,
                                [{xmlel, <<"channel-binding">>, _attrs, _} = _el
                                 | _els],
                                Bindings) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl-cb:0">> ->
            decode_sasl_channel_binding_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            [decode_sasl_channel_binding_element(<<"urn:xmpp:sasl-cb:0">>,
                                                                                 __Opts,
                                                                                 _el)
                                             | Bindings]);
        _ ->
            decode_sasl_channel_binding_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Bindings)
    end;
decode_sasl_channel_binding_els(__TopXMLNS, __Opts,
                                [_ | _els], Bindings) ->
    decode_sasl_channel_binding_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Bindings).

encode_sasl_channel_binding({sasl_channel_binding,
                             Bindings},
                            __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl-cb:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_sasl_channel_binding_$bindings'(Bindings,
                                                              __NewTopXMLNS,
                                                              [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"sasl-channel-binding">>, _attrs, _els}.

'encode_sasl_channel_binding_$bindings'([], __TopXMLNS,
                                        _acc) ->
    _acc;
'encode_sasl_channel_binding_$bindings'([Bindings
                                         | _els],
                                        __TopXMLNS, _acc) ->
    'encode_sasl_channel_binding_$bindings'(_els,
                                            __TopXMLNS,
                                            [encode_sasl_channel_binding_element(Bindings,
                                                                                 __TopXMLNS)
                                             | _acc]).
