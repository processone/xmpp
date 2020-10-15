%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0417).

-compile(export_all).

do_decode(<<"x509-register">>, <<"urn:xmpp:x509:0">>,
          El, Opts) ->
    decode_x509_register(<<"urn:xmpp:x509:0">>, Opts, El);
do_decode(<<"x509-challenge-failed">>,
          <<"urn:xmpp:x509:0">>, El, Opts) ->
    decode_x509_challenge_failed(<<"urn:xmpp:x509:0">>,
                                 Opts,
                                 El);
do_decode(<<"x509-challenge">>, <<"urn:xmpp:x509:0">>,
          El, Opts) ->
    decode_x509_challenge(<<"urn:xmpp:x509:0">>, Opts, El);
do_decode(<<"x509-revoke">>, <<"urn:xmpp:x509:0">>, El,
          Opts) ->
    decode_x509_revoke(<<"urn:xmpp:x509:0">>, Opts, El);
do_decode(<<"x509-request">>, <<"urn:xmpp:x509:0">>, El,
          Opts) ->
    decode_x509_request(<<"urn:xmpp:x509:0">>, Opts, El);
do_decode(<<"x509-signature">>, <<"urn:xmpp:x509:0">>,
          El, Opts) ->
    decode_x509_signature(<<"urn:xmpp:x509:0">>, Opts, El);
do_decode(<<"x509-ca-list">>, <<"urn:xmpp:x509:0">>, El,
          Opts) ->
    decode_x509_ca_list(<<"urn:xmpp:x509:0">>, Opts, El);
do_decode(<<"x509-cert-chain">>, <<"urn:xmpp:x509:0">>,
          El, Opts) ->
    decode_x509_cert_chain(<<"urn:xmpp:x509:0">>, Opts, El);
do_decode(<<"x509-csr">>, <<"urn:xmpp:x509:0">>, El,
          Opts) ->
    decode_x509_csr(<<"urn:xmpp:x509:0">>, Opts, El);
do_decode(<<"x509-cert">>, <<"urn:xmpp:x509:0">>, El,
          Opts) ->
    decode_x509_cert(<<"urn:xmpp:x509:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"x509-register">>, <<"urn:xmpp:x509:0">>},
     {<<"x509-challenge-failed">>, <<"urn:xmpp:x509:0">>},
     {<<"x509-challenge">>, <<"urn:xmpp:x509:0">>},
     {<<"x509-revoke">>, <<"urn:xmpp:x509:0">>},
     {<<"x509-request">>, <<"urn:xmpp:x509:0">>},
     {<<"x509-signature">>, <<"urn:xmpp:x509:0">>},
     {<<"x509-ca-list">>, <<"urn:xmpp:x509:0">>},
     {<<"x509-cert-chain">>, <<"urn:xmpp:x509:0">>},
     {<<"x509-csr">>, <<"urn:xmpp:x509:0">>},
     {<<"x509-cert">>, <<"urn:xmpp:x509:0">>}].

do_encode({x509_csr, _, _} = X509_csr, TopXMLNS) ->
    encode_x509_csr(X509_csr, TopXMLNS);
do_encode({x509_cert_chain, _, _} = X509_cert_chain,
          TopXMLNS) ->
    encode_x509_cert_chain(X509_cert_chain, TopXMLNS);
do_encode({x509_ca_list, _} = X509_ca_list, TopXMLNS) ->
    encode_x509_ca_list(X509_ca_list, TopXMLNS);
do_encode({x509_request, _, _, _, _} = X509_request,
          TopXMLNS) ->
    encode_x509_request(X509_request, TopXMLNS);
do_encode({x509_revoke, _, _} = X509_revoke,
          TopXMLNS) ->
    encode_x509_revoke(X509_revoke, TopXMLNS);
do_encode({x509_challenge, _, _, _} = X509_challenge,
          TopXMLNS) ->
    encode_x509_challenge(X509_challenge, TopXMLNS);
do_encode({x509_challenge_failed} =
              X509_challenge_failed,
          TopXMLNS) ->
    encode_x509_challenge_failed(X509_challenge_failed,
                                 TopXMLNS);
do_encode({x509_register} = X509_register, TopXMLNS) ->
    encode_x509_register(X509_register, TopXMLNS).

do_get_name({x509_ca_list, _}) -> <<"x509-ca-list">>;
do_get_name({x509_cert_chain, _, _}) ->
    <<"x509-cert-chain">>;
do_get_name({x509_challenge, _, _, _}) ->
    <<"x509-challenge">>;
do_get_name({x509_challenge_failed}) ->
    <<"x509-challenge-failed">>;
do_get_name({x509_csr, _, _}) -> <<"x509-csr">>;
do_get_name({x509_register}) -> <<"x509-register">>;
do_get_name({x509_request, _, _, _, _}) ->
    <<"x509-request">>;
do_get_name({x509_revoke, _, _}) -> <<"x509-revoke">>.

do_get_ns({x509_ca_list, _}) -> <<"urn:xmpp:x509:0">>;
do_get_ns({x509_cert_chain, _, _}) ->
    <<"urn:xmpp:x509:0">>;
do_get_ns({x509_challenge, _, _, _}) ->
    <<"urn:xmpp:x509:0">>;
do_get_ns({x509_challenge_failed}) ->
    <<"urn:xmpp:x509:0">>;
do_get_ns({x509_csr, _, _}) -> <<"urn:xmpp:x509:0">>;
do_get_ns({x509_register}) -> <<"urn:xmpp:x509:0">>;
do_get_ns({x509_request, _, _, _, _}) ->
    <<"urn:xmpp:x509:0">>;
do_get_ns({x509_revoke, _, _}) -> <<"urn:xmpp:x509:0">>.

pp(x509_csr, 2) -> [name, der];
pp(x509_cert_chain, 2) -> [name, certs];
pp(x509_ca_list, 1) -> [certs];
pp(x509_request, 4) ->
    [transaction, csr, cert, signature];
pp(x509_revoke, 2) -> [cert, signature];
pp(x509_challenge, 3) -> [transaction, uri, signature];
pp(x509_challenge_failed, 0) -> [];
pp(x509_register, 0) -> [];
pp(_, _) -> no.

records() ->
    [{x509_csr, 2},
     {x509_cert_chain, 2},
     {x509_ca_list, 1},
     {x509_request, 4},
     {x509_revoke, 2},
     {x509_challenge, 3},
     {x509_challenge_failed, 0},
     {x509_register, 0}].

decode_x509_register(__TopXMLNS, __Opts,
                     {xmlel, <<"x509-register">>, _attrs, _els}) ->
    {x509_register}.

encode_x509_register({x509_register}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"x509-register">>, _attrs, _els}.

decode_x509_challenge_failed(__TopXMLNS, __Opts,
                             {xmlel,
                              <<"x509-challenge-failed">>,
                              _attrs,
                              _els}) ->
    {x509_challenge_failed}.

encode_x509_challenge_failed({x509_challenge_failed},
                             __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"x509-challenge-failed">>, _attrs, _els}.

decode_x509_challenge(__TopXMLNS, __Opts,
                      {xmlel, <<"x509-challenge">>, _attrs, _els}) ->
    Signature = decode_x509_challenge_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          error),
    {Transaction, Uri} =
        decode_x509_challenge_attrs(__TopXMLNS,
                                    _attrs,
                                    undefined,
                                    undefined),
    {x509_challenge, Transaction, Uri, Signature}.

decode_x509_challenge_els(__TopXMLNS, __Opts, [],
                          Signature) ->
    case Signature of
        error ->
            erlang:error({xmpp_codec,
                          {missing_tag, <<"x509-signature">>, __TopXMLNS}});
        {value, Signature1} -> Signature1
    end;
decode_x509_challenge_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"x509-signature">>, _attrs, _} = _el
                           | _els],
                          Signature) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:x509:0">> ->
            decode_x509_challenge_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      {value,
                                       decode_x509_signature(<<"urn:xmpp:x509:0">>,
                                                             __Opts,
                                                             _el)});
        _ ->
            decode_x509_challenge_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Signature)
    end;
decode_x509_challenge_els(__TopXMLNS, __Opts,
                          [_ | _els], Signature) ->
    decode_x509_challenge_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Signature).

decode_x509_challenge_attrs(__TopXMLNS,
                            [{<<"transaction">>, _val} | _attrs], _Transaction,
                            Uri) ->
    decode_x509_challenge_attrs(__TopXMLNS,
                                _attrs,
                                _val,
                                Uri);
decode_x509_challenge_attrs(__TopXMLNS,
                            [{<<"uri">>, _val} | _attrs], Transaction, _Uri) ->
    decode_x509_challenge_attrs(__TopXMLNS,
                                _attrs,
                                Transaction,
                                _val);
decode_x509_challenge_attrs(__TopXMLNS, [_ | _attrs],
                            Transaction, Uri) ->
    decode_x509_challenge_attrs(__TopXMLNS,
                                _attrs,
                                Transaction,
                                Uri);
decode_x509_challenge_attrs(__TopXMLNS, [], Transaction,
                            Uri) ->
    {decode_x509_challenge_attr_transaction(__TopXMLNS,
                                            Transaction),
     decode_x509_challenge_attr_uri(__TopXMLNS, Uri)}.

encode_x509_challenge({x509_challenge,
                       Transaction,
                       Uri,
                       Signature},
                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_x509_challenge_$signature'(Signature,
                                                         __NewTopXMLNS,
                                                         [])),
    _attrs = encode_x509_challenge_attr_uri(Uri,
                                            encode_x509_challenge_attr_transaction(Transaction,
                                                                                   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                              __TopXMLNS))),
    {xmlel, <<"x509-challenge">>, _attrs, _els}.

'encode_x509_challenge_$signature'(Signature,
                                   __TopXMLNS, _acc) ->
    [encode_x509_signature(Signature, __TopXMLNS) | _acc].

decode_x509_challenge_attr_transaction(__TopXMLNS,
                                       undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"transaction">>,
                   <<"x509-challenge">>,
                   __TopXMLNS}});
decode_x509_challenge_attr_transaction(__TopXMLNS,
                                       _val) ->
    _val.

encode_x509_challenge_attr_transaction(_val, _acc) ->
    [{<<"transaction">>, _val} | _acc].

decode_x509_challenge_attr_uri(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"uri">>,
                   <<"x509-challenge">>,
                   __TopXMLNS}});
decode_x509_challenge_attr_uri(__TopXMLNS, _val) ->
    _val.

encode_x509_challenge_attr_uri(_val, _acc) ->
    [{<<"uri">>, _val} | _acc].

decode_x509_revoke(__TopXMLNS, __Opts,
                   {xmlel, <<"x509-revoke">>, _attrs, _els}) ->
    {Cert, Signature} = decode_x509_revoke_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               error,
                                               error),
    {x509_revoke, Cert, Signature}.

decode_x509_revoke_els(__TopXMLNS, __Opts, [], Cert,
                       Signature) ->
    {case Cert of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"x509-cert">>, __TopXMLNS}});
         {value, Cert1} -> Cert1
     end,
     case Signature of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"x509-signature">>, __TopXMLNS}});
         {value, Signature1} -> Signature1
     end};
decode_x509_revoke_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"x509-cert">>, _attrs, _} = _el | _els],
                       Cert, Signature) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:x509:0">> ->
            decode_x509_revoke_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   {value,
                                    decode_x509_cert(<<"urn:xmpp:x509:0">>,
                                                     __Opts,
                                                     _el)},
                                   Signature);
        _ ->
            decode_x509_revoke_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Cert,
                                   Signature)
    end;
decode_x509_revoke_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"x509-signature">>, _attrs, _} = _el | _els],
                       Cert, Signature) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:x509:0">> ->
            decode_x509_revoke_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Cert,
                                   {value,
                                    decode_x509_signature(<<"urn:xmpp:x509:0">>,
                                                          __Opts,
                                                          _el)});
        _ ->
            decode_x509_revoke_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Cert,
                                   Signature)
    end;
decode_x509_revoke_els(__TopXMLNS, __Opts, [_ | _els],
                       Cert, Signature) ->
    decode_x509_revoke_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Cert,
                           Signature).

encode_x509_revoke({x509_revoke, Cert, Signature},
                   __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_x509_revoke_$cert'(Cert,
                                                    __NewTopXMLNS,
                                                    'encode_x509_revoke_$signature'(Signature,
                                                                                    __NewTopXMLNS,
                                                                                    []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"x509-revoke">>, _attrs, _els}.

'encode_x509_revoke_$cert'(Cert, __TopXMLNS, _acc) ->
    [encode_x509_cert(Cert, __TopXMLNS) | _acc].

'encode_x509_revoke_$signature'(Signature, __TopXMLNS,
                                _acc) ->
    [encode_x509_signature(Signature, __TopXMLNS) | _acc].

decode_x509_request(__TopXMLNS, __Opts,
                    {xmlel, <<"x509-request">>, _attrs, _els}) ->
    {Csr, Cert, Signature} =
        decode_x509_request_els(__TopXMLNS,
                                __Opts,
                                _els,
                                error,
                                undefined,
                                undefined),
    Transaction = decode_x509_request_attrs(__TopXMLNS,
                                            _attrs,
                                            undefined),
    {x509_request, Transaction, Csr, Cert, Signature}.

decode_x509_request_els(__TopXMLNS, __Opts, [], Csr,
                        Cert, Signature) ->
    {case Csr of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"x509-csr">>, __TopXMLNS}});
         {value, Csr1} -> Csr1
     end,
     Cert,
     Signature};
decode_x509_request_els(__TopXMLNS, __Opts,
                        [{xmlel, <<"x509-csr">>, _attrs, _} = _el | _els], Csr,
                        Cert, Signature) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:x509:0">> ->
            decode_x509_request_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    {value,
                                     decode_x509_csr(<<"urn:xmpp:x509:0">>,
                                                     __Opts,
                                                     _el)},
                                    Cert,
                                    Signature);
        _ ->
            decode_x509_request_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Csr,
                                    Cert,
                                    Signature)
    end;
decode_x509_request_els(__TopXMLNS, __Opts,
                        [{xmlel, <<"x509-cert">>, _attrs, _} = _el | _els], Csr,
                        Cert, Signature) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:x509:0">> ->
            decode_x509_request_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Csr,
                                    decode_x509_cert(<<"urn:xmpp:x509:0">>,
                                                     __Opts,
                                                     _el),
                                    Signature);
        _ ->
            decode_x509_request_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Csr,
                                    Cert,
                                    Signature)
    end;
decode_x509_request_els(__TopXMLNS, __Opts,
                        [{xmlel, <<"x509-signature">>, _attrs, _} = _el | _els],
                        Csr, Cert, Signature) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:x509:0">> ->
            decode_x509_request_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Csr,
                                    Cert,
                                    decode_x509_signature(<<"urn:xmpp:x509:0">>,
                                                          __Opts,
                                                          _el));
        _ ->
            decode_x509_request_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Csr,
                                    Cert,
                                    Signature)
    end;
decode_x509_request_els(__TopXMLNS, __Opts, [_ | _els],
                        Csr, Cert, Signature) ->
    decode_x509_request_els(__TopXMLNS,
                            __Opts,
                            _els,
                            Csr,
                            Cert,
                            Signature).

decode_x509_request_attrs(__TopXMLNS,
                          [{<<"transaction">>, _val} | _attrs], _Transaction) ->
    decode_x509_request_attrs(__TopXMLNS, _attrs, _val);
decode_x509_request_attrs(__TopXMLNS, [_ | _attrs],
                          Transaction) ->
    decode_x509_request_attrs(__TopXMLNS,
                              _attrs,
                              Transaction);
decode_x509_request_attrs(__TopXMLNS, [],
                          Transaction) ->
    decode_x509_request_attr_transaction(__TopXMLNS,
                                         Transaction).

encode_x509_request({x509_request,
                     Transaction,
                     Csr,
                     Cert,
                     Signature},
                    __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_x509_request_$csr'(Csr,
                                                    __NewTopXMLNS,
                                                    'encode_x509_request_$cert'(Cert,
                                                                                __NewTopXMLNS,
                                                                                'encode_x509_request_$signature'(Signature,
                                                                                                                 __NewTopXMLNS,
                                                                                                                 [])))),
    _attrs =
        encode_x509_request_attr_transaction(Transaction,
                                             xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                        __TopXMLNS)),
    {xmlel, <<"x509-request">>, _attrs, _els}.

'encode_x509_request_$csr'(Csr, __TopXMLNS, _acc) ->
    [encode_x509_csr(Csr, __TopXMLNS) | _acc].

'encode_x509_request_$cert'(undefined, __TopXMLNS,
                            _acc) ->
    _acc;
'encode_x509_request_$cert'(Cert, __TopXMLNS, _acc) ->
    [encode_x509_cert(Cert, __TopXMLNS) | _acc].

'encode_x509_request_$signature'(undefined, __TopXMLNS,
                                 _acc) ->
    _acc;
'encode_x509_request_$signature'(Signature, __TopXMLNS,
                                 _acc) ->
    [encode_x509_signature(Signature, __TopXMLNS) | _acc].

decode_x509_request_attr_transaction(__TopXMLNS,
                                     undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"transaction">>,
                   <<"x509-request">>,
                   __TopXMLNS}});
decode_x509_request_attr_transaction(__TopXMLNS,
                                     _val) ->
    _val.

encode_x509_request_attr_transaction(_val, _acc) ->
    [{<<"transaction">>, _val} | _acc].

decode_x509_signature(__TopXMLNS, __Opts,
                      {xmlel, <<"x509-signature">>, _attrs, _els}) ->
    Cdata = decode_x509_signature_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      <<>>),
    Cdata.

decode_x509_signature_els(__TopXMLNS, __Opts, [],
                          Cdata) ->
    decode_x509_signature_cdata(__TopXMLNS, Cdata);
decode_x509_signature_els(__TopXMLNS, __Opts,
                          [{xmlcdata, _data} | _els], Cdata) ->
    decode_x509_signature_els(__TopXMLNS,
                              __Opts,
                              _els,
                              <<Cdata/binary, _data/binary>>);
decode_x509_signature_els(__TopXMLNS, __Opts,
                          [_ | _els], Cdata) ->
    decode_x509_signature_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Cdata).

encode_x509_signature(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_x509_signature_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"x509-signature">>, _attrs, _els}.

decode_x509_signature_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata,
                   <<>>,
                   <<"x509-signature">>,
                   __TopXMLNS}});
decode_x509_signature_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value,
                           <<>>,
                           <<"x509-signature">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_x509_signature_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_x509_ca_list(__TopXMLNS, __Opts,
                    {xmlel, <<"x509-ca-list">>, _attrs, _els}) ->
    Certs = decode_x509_ca_list_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    []),
    {x509_ca_list, Certs}.

decode_x509_ca_list_els(__TopXMLNS, __Opts, [],
                        Certs) ->
    lists:reverse(Certs);
decode_x509_ca_list_els(__TopXMLNS, __Opts,
                        [{xmlel, <<"x509-cert">>, _attrs, _} = _el | _els],
                        Certs) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:x509:0">> ->
            decode_x509_ca_list_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    [decode_x509_cert(<<"urn:xmpp:x509:0">>,
                                                      __Opts,
                                                      _el)
                                     | Certs]);
        _ ->
            decode_x509_ca_list_els(__TopXMLNS, __Opts, _els, Certs)
    end;
decode_x509_ca_list_els(__TopXMLNS, __Opts, [_ | _els],
                        Certs) ->
    decode_x509_ca_list_els(__TopXMLNS,
                            __Opts,
                            _els,
                            Certs).

encode_x509_ca_list({x509_ca_list, Certs},
                    __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_x509_ca_list_$certs'(Certs,
                                                      __NewTopXMLNS,
                                                      [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"x509-ca-list">>, _attrs, _els}.

'encode_x509_ca_list_$certs'([], __TopXMLNS, _acc) ->
    _acc;
'encode_x509_ca_list_$certs'([Certs | _els], __TopXMLNS,
                             _acc) ->
    'encode_x509_ca_list_$certs'(_els,
                                 __TopXMLNS,
                                 [encode_x509_cert(Certs, __TopXMLNS) | _acc]).

decode_x509_cert_chain(__TopXMLNS, __Opts,
                       {xmlel, <<"x509-cert-chain">>, _attrs, _els}) ->
    Certs = decode_x509_cert_chain_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       []),
    Name = decode_x509_cert_chain_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined),
    {x509_cert_chain, Name, Certs}.

decode_x509_cert_chain_els(__TopXMLNS, __Opts, [],
                           Certs) ->
    lists:reverse(Certs);
decode_x509_cert_chain_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"x509-cert">>, _attrs, _} = _el | _els],
                           Certs) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:x509:0">> ->
            decode_x509_cert_chain_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       [decode_x509_cert(<<"urn:xmpp:x509:0">>,
                                                         __Opts,
                                                         _el)
                                        | Certs]);
        _ ->
            decode_x509_cert_chain_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Certs)
    end;
decode_x509_cert_chain_els(__TopXMLNS, __Opts,
                           [_ | _els], Certs) ->
    decode_x509_cert_chain_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Certs).

decode_x509_cert_chain_attrs(__TopXMLNS,
                             [{<<"name">>, _val} | _attrs], _Name) ->
    decode_x509_cert_chain_attrs(__TopXMLNS, _attrs, _val);
decode_x509_cert_chain_attrs(__TopXMLNS, [_ | _attrs],
                             Name) ->
    decode_x509_cert_chain_attrs(__TopXMLNS, _attrs, Name);
decode_x509_cert_chain_attrs(__TopXMLNS, [], Name) ->
    decode_x509_cert_chain_attr_name(__TopXMLNS, Name).

encode_x509_cert_chain({x509_cert_chain, Name, Certs},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_x509_cert_chain_$certs'(Certs,
                                                      __NewTopXMLNS,
                                                      [])),
    _attrs = encode_x509_cert_chain_attr_name(Name,
                                              xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                         __TopXMLNS)),
    {xmlel, <<"x509-cert-chain">>, _attrs, _els}.

'encode_x509_cert_chain_$certs'([], __TopXMLNS, _acc) ->
    _acc;
'encode_x509_cert_chain_$certs'([Certs | _els],
                                __TopXMLNS, _acc) ->
    'encode_x509_cert_chain_$certs'(_els,
                                    __TopXMLNS,
                                    [encode_x509_cert(Certs, __TopXMLNS)
                                     | _acc]).

decode_x509_cert_chain_attr_name(__TopXMLNS,
                                 undefined) ->
    <<>>;
decode_x509_cert_chain_attr_name(__TopXMLNS, _val) ->
    _val.

encode_x509_cert_chain_attr_name(<<>>, _acc) -> _acc;
encode_x509_cert_chain_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_x509_csr(__TopXMLNS, __Opts,
                {xmlel, <<"x509-csr">>, _attrs, _els}) ->
    Der = decode_x509_csr_els(__TopXMLNS,
                              __Opts,
                              _els,
                              <<>>),
    Name = decode_x509_csr_attrs(__TopXMLNS,
                                 _attrs,
                                 undefined),
    {x509_csr, Name, Der}.

decode_x509_csr_els(__TopXMLNS, __Opts, [], Der) ->
    decode_x509_csr_cdata(__TopXMLNS, Der);
decode_x509_csr_els(__TopXMLNS, __Opts,
                    [{xmlcdata, _data} | _els], Der) ->
    decode_x509_csr_els(__TopXMLNS,
                        __Opts,
                        _els,
                        <<Der/binary, _data/binary>>);
decode_x509_csr_els(__TopXMLNS, __Opts, [_ | _els],
                    Der) ->
    decode_x509_csr_els(__TopXMLNS, __Opts, _els, Der).

decode_x509_csr_attrs(__TopXMLNS,
                      [{<<"name">>, _val} | _attrs], _Name) ->
    decode_x509_csr_attrs(__TopXMLNS, _attrs, _val);
decode_x509_csr_attrs(__TopXMLNS, [_ | _attrs], Name) ->
    decode_x509_csr_attrs(__TopXMLNS, _attrs, Name);
decode_x509_csr_attrs(__TopXMLNS, [], Name) ->
    decode_x509_csr_attr_name(__TopXMLNS, Name).

encode_x509_csr({x509_csr, Name, Der}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_x509_csr_cdata(Der, []),
    _attrs = encode_x509_csr_attr_name(Name,
                                       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                  __TopXMLNS)),
    {xmlel, <<"x509-csr">>, _attrs, _els}.

decode_x509_csr_attr_name(__TopXMLNS, undefined) ->
    <<>>;
decode_x509_csr_attr_name(__TopXMLNS, _val) -> _val.

encode_x509_csr_attr_name(<<>>, _acc) -> _acc;
encode_x509_csr_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_x509_csr_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"x509-csr">>, __TopXMLNS}});
decode_x509_csr_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"x509-csr">>, __TopXMLNS}});
        _res -> _res
    end.

encode_x509_csr_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_x509_cert(__TopXMLNS, __Opts,
                 {xmlel, <<"x509-cert">>, _attrs, _els}) ->
    Cdata = decode_x509_cert_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 <<>>),
    Cdata.

decode_x509_cert_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_x509_cert_cdata(__TopXMLNS, Cdata);
decode_x509_cert_els(__TopXMLNS, __Opts,
                     [{xmlcdata, _data} | _els], Cdata) ->
    decode_x509_cert_els(__TopXMLNS,
                         __Opts,
                         _els,
                         <<Cdata/binary, _data/binary>>);
decode_x509_cert_els(__TopXMLNS, __Opts, [_ | _els],
                     Cdata) ->
    decode_x509_cert_els(__TopXMLNS, __Opts, _els, Cdata).

encode_x509_cert(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:x509:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_x509_cert_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"x509-cert">>, _attrs, _els}.

decode_x509_cert_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"x509-cert">>, __TopXMLNS}});
decode_x509_cert_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value,
                           <<>>,
                           <<"x509-cert">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_x509_cert_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].
