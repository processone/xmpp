%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0379).

-compile(export_all).

do_decode(<<"preauth">>, <<"urn:xmpp:pars:0">>, El,
          Opts) ->
    decode_preauth(<<"urn:xmpp:pars:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"preauth">>, <<"urn:xmpp:pars:0">>}].

do_encode({preauth, _} = Preauth, TopXMLNS) ->
    encode_preauth(Preauth, TopXMLNS).

do_get_name({preauth, _}) -> <<"preauth">>.

do_get_ns({preauth, _}) -> <<"urn:xmpp:pars:0">>.

pp(preauth, 1) -> [token];
pp(_, _) -> no.

records() -> [{preauth, 1}].

decode_preauth(__TopXMLNS, __Opts,
               {xmlel, <<"preauth">>, _attrs, _els}) ->
    Token = decode_preauth_attrs(__TopXMLNS,
                                 _attrs,
                                 undefined),
    {preauth, Token}.

decode_preauth_attrs(__TopXMLNS,
                     [{<<"token">>, _val} | _attrs], _Token) ->
    decode_preauth_attrs(__TopXMLNS, _attrs, _val);
decode_preauth_attrs(__TopXMLNS, [_ | _attrs], Token) ->
    decode_preauth_attrs(__TopXMLNS, _attrs, Token);
decode_preauth_attrs(__TopXMLNS, [], Token) ->
    decode_preauth_attr_token(__TopXMLNS, Token).

encode_preauth({preauth, Token}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:pars:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_preauth_attr_token(Token,
                                       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                  __TopXMLNS)),
    {xmlel, <<"preauth">>, _attrs, _els}.

decode_preauth_attr_token(__TopXMLNS, undefined) ->
    <<>>;
decode_preauth_attr_token(__TopXMLNS, _val) -> _val.

encode_preauth_attr_token(<<>>, _acc) -> _acc;
encode_preauth_attr_token(_val, _acc) ->
    [{<<"token">>, _val} | _acc].
