%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0300).

-compile(export_all).

do_decode(<<"hash-used">>, <<"urn:xmpp:hashes:2">>, El,
          Opts) ->
    decode_hash_used(<<"urn:xmpp:hashes:2">>, Opts, El);
do_decode(<<"hash">>, <<"urn:xmpp:hashes:2">>, El,
          Opts) ->
    decode_hash(<<"urn:xmpp:hashes:2">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"hash-used">>, <<"urn:xmpp:hashes:2">>},
     {<<"hash">>, <<"urn:xmpp:hashes:2">>}].

do_encode({hash, _, _} = Hash, TopXMLNS) ->
    encode_hash(Hash, TopXMLNS);
do_encode({hash_used, _} = Hash_used, TopXMLNS) ->
    encode_hash_used(Hash_used, TopXMLNS).

do_get_name({hash, _, _}) -> <<"hash">>;
do_get_name({hash_used, _}) -> <<"hash-used">>.

do_get_ns({hash, _, _}) -> <<"urn:xmpp:hashes:2">>;
do_get_ns({hash_used, _}) -> <<"urn:xmpp:hashes:2">>.

pp(hash, 2) -> [algo, data];
pp(hash_used, 1) -> [algo];
pp(_, _) -> no.

records() -> [{hash, 2}, {hash_used, 1}].

decode_hash_used(__TopXMLNS, __Opts,
                 {xmlel, <<"hash-used">>, _attrs, _els}) ->
    Algo = decode_hash_used_attrs(__TopXMLNS,
                                  _attrs,
                                  undefined),
    {hash_used, Algo}.

decode_hash_used_attrs(__TopXMLNS,
                       [{<<"algo">>, _val} | _attrs], _Algo) ->
    decode_hash_used_attrs(__TopXMLNS, _attrs, _val);
decode_hash_used_attrs(__TopXMLNS, [_ | _attrs],
                       Algo) ->
    decode_hash_used_attrs(__TopXMLNS, _attrs, Algo);
decode_hash_used_attrs(__TopXMLNS, [], Algo) ->
    decode_hash_used_attr_algo(__TopXMLNS, Algo).

encode_hash_used({hash_used, Algo}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:hashes:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_hash_used_attr_algo(Algo,
                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                   __TopXMLNS)),
    {xmlel, <<"hash-used">>, _attrs, _els}.

decode_hash_used_attr_algo(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"algo">>,
                   <<"hash-used">>,
                   __TopXMLNS}});
decode_hash_used_attr_algo(__TopXMLNS, _val) -> _val.

encode_hash_used_attr_algo(_val, _acc) ->
    [{<<"algo">>, _val} | _acc].

decode_hash(__TopXMLNS, __Opts,
            {xmlel, <<"hash">>, _attrs, _els}) ->
    Data = decode_hash_els(__TopXMLNS, __Opts, _els, <<>>),
    Algo = decode_hash_attrs(__TopXMLNS, _attrs, undefined),
    {hash, Algo, Data}.

decode_hash_els(__TopXMLNS, __Opts, [], Data) ->
    decode_hash_cdata(__TopXMLNS, Data);
decode_hash_els(__TopXMLNS, __Opts,
                [{xmlcdata, _data} | _els], Data) ->
    decode_hash_els(__TopXMLNS,
                    __Opts,
                    _els,
                    <<Data/binary, _data/binary>>);
decode_hash_els(__TopXMLNS, __Opts, [_ | _els], Data) ->
    decode_hash_els(__TopXMLNS, __Opts, _els, Data).

decode_hash_attrs(__TopXMLNS,
                  [{<<"algo">>, _val} | _attrs], _Algo) ->
    decode_hash_attrs(__TopXMLNS, _attrs, _val);
decode_hash_attrs(__TopXMLNS, [_ | _attrs], Algo) ->
    decode_hash_attrs(__TopXMLNS, _attrs, Algo);
decode_hash_attrs(__TopXMLNS, [], Algo) ->
    decode_hash_attr_algo(__TopXMLNS, Algo).

encode_hash({hash, Algo, Data}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:hashes:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_hash_cdata(Data, []),
    _attrs = encode_hash_attr_algo(Algo,
                                   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                              __TopXMLNS)),
    {xmlel, <<"hash">>, _attrs, _els}.

decode_hash_attr_algo(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"algo">>, <<"hash">>, __TopXMLNS}});
decode_hash_attr_algo(__TopXMLNS, _val) -> _val.

encode_hash_attr_algo(_val, _acc) ->
    [{<<"algo">>, _val} | _acc].

decode_hash_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_hash_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"hash">>, __TopXMLNS}});
        _res -> _res
    end.

encode_hash_cdata(<<>>, _acc) -> _acc;
encode_hash_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].
