%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0297).

-compile(export_all).

do_decode(<<"forwarded">>, <<"urn:xmpp:forward:0">>, El,
          Opts) ->
    decode_forwarded(<<"urn:xmpp:forward:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"forwarded">>, <<"urn:xmpp:forward:0">>}].

do_encode({forwarded, _, _} = Forwarded, TopXMLNS) ->
    encode_forwarded(Forwarded, TopXMLNS).

do_get_name({forwarded, _, _}) -> <<"forwarded">>.

do_get_ns({forwarded, _, _}) ->
    <<"urn:xmpp:forward:0">>.

get_els({forwarded, _delay, _sub_els}) -> _sub_els.

set_els({forwarded, _delay, _}, _sub_els) ->
    {forwarded, _delay, _sub_els}.

pp(forwarded, 2) -> [delay, sub_els];
pp(_, _) -> no.

records() -> [{forwarded, 2}].

decode_forwarded(__TopXMLNS, __Opts,
                 {xmlel, <<"forwarded">>, _attrs, _els}) ->
    {Delay, __Els} = decode_forwarded_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          undefined,
                                          []),
    {forwarded, Delay, __Els}.

decode_forwarded_els(__TopXMLNS, __Opts, [], Delay,
                     __Els) ->
    {Delay, lists:reverse(__Els)};
decode_forwarded_els(__TopXMLNS, __Opts,
                     [{xmlel, <<"delay">>, _attrs, _} = _el | _els], Delay,
                     __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:delay">> ->
            decode_forwarded_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 xep0203:decode_delay(<<"urn:xmpp:delay">>,
                                                      __Opts,
                                                      _el),
                                 __Els);
        _ ->
            decode_forwarded_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 Delay,
                                 [_el | __Els])
    end;
decode_forwarded_els(__TopXMLNS, __Opts,
                     [{xmlel, _name, _attrs, _} = _el | _els], Delay,
                     __Els) ->
    decode_forwarded_els(__TopXMLNS,
                         __Opts,
                         _els,
                         Delay,
                         [_el | __Els]);
decode_forwarded_els(__TopXMLNS, __Opts, [_ | _els],
                     Delay, __Els) ->
    decode_forwarded_els(__TopXMLNS,
                         __Opts,
                         _els,
                         Delay,
                         __Els).

encode_forwarded({forwarded, Delay, __Els},
                 __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:forward:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_forwarded_$delay'(Delay,
                                                       __NewTopXMLNS,
                                                       [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"forwarded">>, _attrs, _els}.

'encode_forwarded_$delay'(undefined, __TopXMLNS,
                          _acc) ->
    _acc;
'encode_forwarded_$delay'(Delay, __TopXMLNS, _acc) ->
    [xep0203:encode_delay(Delay, __TopXMLNS) | _acc].
