%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0184).

-compile(export_all).

do_decode(<<"received">>, <<"urn:xmpp:receipts">>, El,
          Opts) ->
    decode_receipt_response(<<"urn:xmpp:receipts">>,
                            Opts,
                            El);
do_decode(<<"request">>, <<"urn:xmpp:receipts">>, El,
          Opts) ->
    decode_receipt_request(<<"urn:xmpp:receipts">>,
                           Opts,
                           El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"received">>, <<"urn:xmpp:receipts">>},
     {<<"request">>, <<"urn:xmpp:receipts">>}].

do_encode({receipt_request} = Request, TopXMLNS) ->
    encode_receipt_request(Request, TopXMLNS);
do_encode({receipt_response, _} = Received, TopXMLNS) ->
    encode_receipt_response(Received, TopXMLNS).

do_get_name({receipt_request}) -> <<"request">>;
do_get_name({receipt_response, _}) -> <<"received">>.

do_get_ns({receipt_request}) -> <<"urn:xmpp:receipts">>;
do_get_ns({receipt_response, _}) ->
    <<"urn:xmpp:receipts">>.

pp(receipt_request, 0) -> [];
pp(receipt_response, 1) -> [id];
pp(_, _) -> no.

records() ->
    [{receipt_request, 0}, {receipt_response, 1}].

decode_receipt_response(__TopXMLNS, __Opts,
                        {xmlel, <<"received">>, _attrs, _els}) ->
    Id = decode_receipt_response_attrs(__TopXMLNS,
                                       _attrs,
                                       undefined),
    {receipt_response, Id}.

decode_receipt_response_attrs(__TopXMLNS,
                              [{<<"id">>, _val} | _attrs], _Id) ->
    decode_receipt_response_attrs(__TopXMLNS, _attrs, _val);
decode_receipt_response_attrs(__TopXMLNS, [_ | _attrs],
                              Id) ->
    decode_receipt_response_attrs(__TopXMLNS, _attrs, Id);
decode_receipt_response_attrs(__TopXMLNS, [], Id) ->
    decode_receipt_response_attr_id(__TopXMLNS, Id).

encode_receipt_response({receipt_response, Id},
                        __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:receipts">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_receipt_response_attr_id(Id,
                                             xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                        __TopXMLNS)),
    {xmlel, <<"received">>, _attrs, _els}.

decode_receipt_response_attr_id(__TopXMLNS,
                                undefined) ->
    <<>>;
decode_receipt_response_attr_id(__TopXMLNS, _val) ->
    _val.

encode_receipt_response_attr_id(<<>>, _acc) -> _acc;
encode_receipt_response_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_receipt_request(__TopXMLNS, __Opts,
                       {xmlel, <<"request">>, _attrs, _els}) ->
    {receipt_request}.

encode_receipt_request({receipt_request}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:receipts">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"request">>, _attrs, _els}.
