%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0480).

-compile(export_all).

do_decode(<<"hash">>, <<"urn:xmpp:scram-upgrade:0">>,
          El, Opts) ->
    decode_scram_upgrade_hash(<<"urn:xmpp:scram-upgrade:0">>,
                              Opts,
                              El);
do_decode(<<"salt">>, <<"urn:xmpp:scram-upgrade:0">>,
          El, Opts) ->
    decode_scram_upgrade_salt(<<"urn:xmpp:scram-upgrade:0">>,
                              Opts,
                              El);
do_decode(<<"upgrade">>, <<"urn:xmpp:sasl:upgrade:0">>,
          El, Opts) ->
    decode_sasl_upgrade(<<"urn:xmpp:sasl:upgrade:0">>,
                        Opts,
                        El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"hash">>, <<"urn:xmpp:scram-upgrade:0">>},
     {<<"salt">>, <<"urn:xmpp:scram-upgrade:0">>},
     {<<"upgrade">>, <<"urn:xmpp:sasl:upgrade:0">>}].

do_encode({sasl_upgrade, _} = Upgrade, TopXMLNS) ->
    encode_sasl_upgrade(Upgrade, TopXMLNS);
do_encode({scram_upgrade_salt, _, _} = Salt,
          TopXMLNS) ->
    encode_scram_upgrade_salt(Salt, TopXMLNS);
do_encode({scram_upgrade_hash, _} = Hash, TopXMLNS) ->
    encode_scram_upgrade_hash(Hash, TopXMLNS).

do_get_name({sasl_upgrade, _}) -> <<"upgrade">>;
do_get_name({scram_upgrade_hash, _}) -> <<"hash">>;
do_get_name({scram_upgrade_salt, _, _}) -> <<"salt">>.

do_get_ns({sasl_upgrade, _}) ->
    <<"urn:xmpp:sasl:upgrade:0">>;
do_get_ns({scram_upgrade_hash, _}) ->
    <<"urn:xmpp:scram-upgrade:0">>;
do_get_ns({scram_upgrade_salt, _, _}) ->
    <<"urn:xmpp:scram-upgrade:0">>.

pp(sasl_upgrade, 1) -> [cdata];
pp(scram_upgrade_salt, 2) -> [iterations, cdata];
pp(scram_upgrade_hash, 1) -> [data];
pp(_, _) -> no.

records() ->
    [{sasl_upgrade, 1},
     {scram_upgrade_salt, 2},
     {scram_upgrade_hash, 1}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_scram_upgrade_hash(__TopXMLNS, __Opts,
                          {xmlel, <<"hash">>, _attrs, _els}) ->
    Data = decode_scram_upgrade_hash_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         <<>>),
    {scram_upgrade_hash, Data}.

decode_scram_upgrade_hash_els(__TopXMLNS, __Opts, [],
                              Data) ->
    decode_scram_upgrade_hash_cdata(__TopXMLNS, Data);
decode_scram_upgrade_hash_els(__TopXMLNS, __Opts,
                              [{xmlcdata, _data} | _els], Data) ->
    decode_scram_upgrade_hash_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<Data/binary, _data/binary>>);
decode_scram_upgrade_hash_els(__TopXMLNS, __Opts,
                              [_ | _els], Data) ->
    decode_scram_upgrade_hash_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  Data).

encode_scram_upgrade_hash({scram_upgrade_hash, Data},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:scram-upgrade:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_scram_upgrade_hash_cdata(Data, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"hash">>, _attrs, _els}.

decode_scram_upgrade_hash_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"hash">>, __TopXMLNS}});
decode_scram_upgrade_hash_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"hash">>, __TopXMLNS}});
        _res -> _res
    end.

encode_scram_upgrade_hash_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_scram_upgrade_salt(__TopXMLNS, __Opts,
                          {xmlel, <<"salt">>, _attrs, _els}) ->
    Cdata = decode_scram_upgrade_salt_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          <<>>),
    Iterations = decode_scram_upgrade_salt_attrs(__TopXMLNS,
                                                 _attrs,
                                                 undefined),
    {scram_upgrade_salt, Iterations, Cdata}.

decode_scram_upgrade_salt_els(__TopXMLNS, __Opts, [],
                              Cdata) ->
    decode_scram_upgrade_salt_cdata(__TopXMLNS, Cdata);
decode_scram_upgrade_salt_els(__TopXMLNS, __Opts,
                              [{xmlcdata, _data} | _els], Cdata) ->
    decode_scram_upgrade_salt_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<Cdata/binary, _data/binary>>);
decode_scram_upgrade_salt_els(__TopXMLNS, __Opts,
                              [_ | _els], Cdata) ->
    decode_scram_upgrade_salt_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  Cdata).

decode_scram_upgrade_salt_attrs(__TopXMLNS,
                                [{<<"iterations">>, _val} | _attrs],
                                _Iterations) ->
    decode_scram_upgrade_salt_attrs(__TopXMLNS,
                                    _attrs,
                                    _val);
decode_scram_upgrade_salt_attrs(__TopXMLNS,
                                [_ | _attrs], Iterations) ->
    decode_scram_upgrade_salt_attrs(__TopXMLNS,
                                    _attrs,
                                    Iterations);
decode_scram_upgrade_salt_attrs(__TopXMLNS, [],
                                Iterations) ->
    decode_scram_upgrade_salt_attr_iterations(__TopXMLNS,
                                              Iterations).

encode_scram_upgrade_salt({scram_upgrade_salt,
                           Iterations,
                           Cdata},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:scram-upgrade:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_scram_upgrade_salt_cdata(Cdata, []),
    _attrs =
        encode_scram_upgrade_salt_attr_iterations(Iterations,
                                                  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                             __TopXMLNS)),
    {xmlel, <<"salt">>, _attrs, _els}.

decode_scram_upgrade_salt_attr_iterations(__TopXMLNS,
                                          undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"iterations">>,
                   <<"salt">>,
                   __TopXMLNS}});
decode_scram_upgrade_salt_attr_iterations(__TopXMLNS,
                                          _val) ->
    case catch dec_int(_val, 1, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"iterations">>,
                           <<"salt">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_scram_upgrade_salt_attr_iterations(_val, _acc) ->
    [{<<"iterations">>, enc_int(_val)} | _acc].

decode_scram_upgrade_salt_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"salt">>, __TopXMLNS}});
decode_scram_upgrade_salt_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"salt">>, __TopXMLNS}});
        _res -> _res
    end.

encode_scram_upgrade_salt_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_sasl_upgrade(__TopXMLNS, __Opts,
                    {xmlel, <<"upgrade">>, _attrs, _els}) ->
    Cdata = decode_sasl_upgrade_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    <<>>),
    {sasl_upgrade, Cdata}.

decode_sasl_upgrade_els(__TopXMLNS, __Opts, [],
                        Cdata) ->
    decode_sasl_upgrade_cdata(__TopXMLNS, Cdata);
decode_sasl_upgrade_els(__TopXMLNS, __Opts,
                        [{xmlcdata, _data} | _els], Cdata) ->
    decode_sasl_upgrade_els(__TopXMLNS,
                            __Opts,
                            _els,
                            <<Cdata/binary, _data/binary>>);
decode_sasl_upgrade_els(__TopXMLNS, __Opts, [_ | _els],
                        Cdata) ->
    decode_sasl_upgrade_els(__TopXMLNS,
                            __Opts,
                            _els,
                            Cdata).

encode_sasl_upgrade({sasl_upgrade, Cdata},
                    __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:upgrade:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl_upgrade_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"upgrade">>, _attrs, _els}.

decode_sasl_upgrade_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"upgrade">>, __TopXMLNS}});
decode_sasl_upgrade_cdata(__TopXMLNS, _val) -> _val.

encode_sasl_upgrade_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
