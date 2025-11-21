%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0445).

-compile(export_all).

do_decode(<<"register">>, <<"urn:xmpp:ibr-token:0">>,
          El, Opts) ->
    decode_feature_register_ibr_token(<<"urn:xmpp:ibr-token:0">>,
                                      Opts,
                                      El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"register">>, <<"urn:xmpp:ibr-token:0">>}].

do_encode({feature_register_ibr_token} = Register,
          TopXMLNS) ->
    encode_feature_register_ibr_token(Register, TopXMLNS).

do_get_name({feature_register_ibr_token}) ->
    <<"register">>.

do_get_ns({feature_register_ibr_token}) ->
    <<"urn:xmpp:ibr-token:0">>.

pp(feature_register_ibr_token, 0) -> [];
pp(_, _) -> no.

records() -> [{feature_register_ibr_token, 0}].

decode_feature_register_ibr_token(__TopXMLNS, __Opts,
                                  {xmlel, <<"register">>, _attrs, _els}) ->
    {feature_register_ibr_token}.

encode_feature_register_ibr_token({feature_register_ibr_token},
                                  __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:ibr-token:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"register">>, _attrs, _els}.
