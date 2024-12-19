%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0288).

-compile(export_all).

do_decode(<<"bidi">>, <<"urn:xmpp:features:bidi">>, El,
          Opts) ->
    decode_s2s_bidi_feature(<<"urn:xmpp:features:bidi">>,
                            Opts,
                            El);
do_decode(<<"bidi">>, <<"urn:xmpp:bidi">>, El, Opts) ->
    decode_s2s_bidi(<<"urn:xmpp:bidi">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"bidi">>, <<"urn:xmpp:features:bidi">>},
     {<<"bidi">>, <<"urn:xmpp:bidi">>}].

do_encode({s2s_bidi} = Bidi, TopXMLNS) ->
    encode_s2s_bidi(Bidi, TopXMLNS);
do_encode({s2s_bidi_feature} = Bidi, TopXMLNS) ->
    encode_s2s_bidi_feature(Bidi, TopXMLNS).

do_get_name({s2s_bidi}) -> <<"bidi">>;
do_get_name({s2s_bidi_feature}) -> <<"bidi">>.

do_get_ns({s2s_bidi}) -> <<"urn:xmpp:bidi">>;
do_get_ns({s2s_bidi_feature}) ->
    <<"urn:xmpp:features:bidi">>.

pp(s2s_bidi, 0) -> [];
pp(s2s_bidi_feature, 0) -> [];
pp(_, _) -> no.

records() -> [{s2s_bidi, 0}, {s2s_bidi_feature, 0}].

decode_s2s_bidi_feature(__TopXMLNS, __Opts,
                        {xmlel, <<"bidi">>, _attrs, _els}) ->
    {s2s_bidi_feature}.

encode_s2s_bidi_feature({s2s_bidi_feature},
                        __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:features:bidi">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"bidi">>, _attrs, _els}.

decode_s2s_bidi(__TopXMLNS, __Opts,
                {xmlel, <<"bidi">>, _attrs, _els}) ->
    {s2s_bidi}.

encode_s2s_bidi({s2s_bidi}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bidi">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"bidi">>, _attrs, _els}.
