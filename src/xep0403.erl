%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0403).

-compile(export_all).

do_decode(<<"mix">>, <<"urn:xmpp:mix:presence:0">>, El,
          Opts) ->
    decode_mix_presence(<<"urn:xmpp:mix:presence:0">>,
                        Opts,
                        El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"mix">>, <<"urn:xmpp:mix:presence:0">>}].

do_encode({mix_presence, _, _, _} = Mix, TopXMLNS) ->
    encode_mix_presence(Mix, TopXMLNS).

do_get_name({mix_presence, _, _, _}) -> <<"mix">>.

do_get_ns({mix_presence, Xmlns, _, _}) -> Xmlns.

pp(mix_presence, 3) -> [xmlns, jid, nick];
pp(_, _) -> no.

records() -> [{mix_presence, 3}].

decode_mix_presence(__TopXMLNS, __Opts,
                    {xmlel, <<"mix">>, _attrs, _els}) ->
    {Jid, Nick} = decode_mix_presence_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          undefined,
                                          <<>>),
    Xmlns = decode_mix_presence_attrs(__TopXMLNS,
                                      _attrs,
                                      undefined),
    {mix_presence, Xmlns, Jid, Nick}.

decode_mix_presence_els(__TopXMLNS, __Opts, [], Jid,
                        Nick) ->
    {Jid, Nick};
decode_mix_presence_els(__TopXMLNS, __Opts,
                        [{xmlel, <<"jid">>, _attrs, _} = _el | _els], Jid,
                        Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_presence_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    xep0369:decode_mix_jid(<<"urn:xmpp:mix:core:0">>,
                                                           __Opts,
                                                           _el),
                                    Nick);
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_presence_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    xep0369:decode_mix_jid(<<"urn:xmpp:mix:core:1">>,
                                                           __Opts,
                                                           _el),
                                    Nick);
        <<"urn:xmpp:mix:presence:0">> ->
            decode_mix_presence_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    xep0369:decode_mix_jid(<<"urn:xmpp:mix:presence:0">>,
                                                           __Opts,
                                                           _el),
                                    Nick);
        _ ->
            decode_mix_presence_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Jid,
                                    Nick)
    end;
decode_mix_presence_els(__TopXMLNS, __Opts,
                        [{xmlel, <<"nick">>, _attrs, _} = _el | _els], Jid,
                        Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_presence_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Jid,
                                    xep0369:decode_mix_nick(<<"urn:xmpp:mix:core:0">>,
                                                            __Opts,
                                                            _el));
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_presence_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Jid,
                                    xep0369:decode_mix_nick(<<"urn:xmpp:mix:core:1">>,
                                                            __Opts,
                                                            _el));
        <<"urn:xmpp:mix:presence:0">> ->
            decode_mix_presence_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Jid,
                                    xep0369:decode_mix_nick(<<"urn:xmpp:mix:presence:0">>,
                                                            __Opts,
                                                            _el));
        _ ->
            decode_mix_presence_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Jid,
                                    Nick)
    end;
decode_mix_presence_els(__TopXMLNS, __Opts, [_ | _els],
                        Jid, Nick) ->
    decode_mix_presence_els(__TopXMLNS,
                            __Opts,
                            _els,
                            Jid,
                            Nick).

decode_mix_presence_attrs(__TopXMLNS,
                          [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_mix_presence_attrs(__TopXMLNS, _attrs, _val);
decode_mix_presence_attrs(__TopXMLNS, [_ | _attrs],
                          Xmlns) ->
    decode_mix_presence_attrs(__TopXMLNS, _attrs, Xmlns);
decode_mix_presence_attrs(__TopXMLNS, [], Xmlns) ->
    decode_mix_presence_attr_xmlns(__TopXMLNS, Xmlns).

encode_mix_presence({mix_presence, Xmlns, Jid, Nick},
                    __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:presence:0">>],
                                                __TopXMLNS),
    _els = lists:reverse('encode_mix_presence_$jid'(Jid,
                                                    __NewTopXMLNS,
                                                    'encode_mix_presence_$nick'(Nick,
                                                                                __NewTopXMLNS,
                                                                                []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"mix">>, _attrs, _els}.

'encode_mix_presence_$jid'(undefined, __TopXMLNS,
                           _acc) ->
    _acc;
'encode_mix_presence_$jid'(Jid, __TopXMLNS, _acc) ->
    [xep0369:encode_mix_jid(Jid, __TopXMLNS) | _acc].

'encode_mix_presence_$nick'(<<>>, __TopXMLNS, _acc) ->
    _acc;
'encode_mix_presence_$nick'(Nick, __TopXMLNS, _acc) ->
    [xep0369:encode_mix_nick(Nick, __TopXMLNS) | _acc].

decode_mix_presence_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mix_presence_attr_xmlns(__TopXMLNS, _val) ->
    _val.
