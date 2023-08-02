%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0421).

-compile(export_all).

do_decode(<<"occupant-id">>,
          <<"urn:xmpp:occupant-id:0">>, El, Opts) ->
    decode_occupant_id(<<"urn:xmpp:occupant-id:0">>,
                       Opts,
                       El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"occupant-id">>, <<"urn:xmpp:occupant-id:0">>}].

do_encode({occupant_id, _} = Occupant_id, TopXMLNS) ->
    encode_occupant_id(Occupant_id, TopXMLNS).

do_get_name({occupant_id, _}) -> <<"occupant-id">>.

do_get_ns({occupant_id, _}) ->
    <<"urn:xmpp:occupant-id:0">>.

pp(occupant_id, 1) -> [id];
pp(_, _) -> no.

records() -> [{occupant_id, 1}].

decode_occupant_id(__TopXMLNS, __Opts,
                   {xmlel, <<"occupant-id">>, _attrs, _els}) ->
    Id = decode_occupant_id_attrs(__TopXMLNS,
                                  _attrs,
                                  undefined),
    {occupant_id, Id}.

decode_occupant_id_attrs(__TopXMLNS,
                         [{<<"id">>, _val} | _attrs], _Id) ->
    decode_occupant_id_attrs(__TopXMLNS, _attrs, _val);
decode_occupant_id_attrs(__TopXMLNS, [_ | _attrs],
                         Id) ->
    decode_occupant_id_attrs(__TopXMLNS, _attrs, Id);
decode_occupant_id_attrs(__TopXMLNS, [], Id) ->
    decode_occupant_id_attr_id(__TopXMLNS, Id).

encode_occupant_id({occupant_id, Id}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:occupant-id:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_occupant_id_attr_id(Id,
                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                   __TopXMLNS)),
    {xmlel, <<"occupant-id">>, _attrs, _els}.

decode_occupant_id_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"id">>,
                   <<"occupant-id">>,
                   __TopXMLNS}});
decode_occupant_id_attr_id(__TopXMLNS, _val) -> _val.

encode_occupant_id_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].
