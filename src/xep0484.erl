%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0484).

-compile(export_all).

do_decode(<<"token">>, <<"urn:xmpp:fast:0">>, El,
          Opts) ->
    decode_fast_token(<<"urn:xmpp:fast:0">>, Opts, El);
do_decode(<<"request-token">>, <<"urn:xmpp:fast:0">>,
          El, Opts) ->
    decode_fast_request_token(<<"urn:xmpp:fast:0">>,
                              Opts,
                              El);
do_decode(<<"mechanism">>, <<"urn:xmpp:fast:0">>, El,
          Opts) ->
    decode_fast_mech(<<"urn:xmpp:fast:0">>, Opts, El);
do_decode(<<"fast">>, <<"urn:xmpp:fast:0">>, El,
          Opts) ->
    decode_fast(<<"urn:xmpp:fast:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"token">>, <<"urn:xmpp:fast:0">>},
     {<<"request-token">>, <<"urn:xmpp:fast:0">>},
     {<<"mechanism">>, <<"urn:xmpp:fast:0">>},
     {<<"fast">>, <<"urn:xmpp:fast:0">>}].

do_encode({fast, _, _, _, _} = Fast, TopXMLNS) ->
    encode_fast(Fast, TopXMLNS);
do_encode({fast_request_token, _} = Request_token,
          TopXMLNS) ->
    encode_fast_request_token(Request_token, TopXMLNS);
do_encode({fast_token, _, _} = Token, TopXMLNS) ->
    encode_fast_token(Token, TopXMLNS).

do_get_name({fast, _, _, _, _}) -> <<"fast">>;
do_get_name({fast_request_token, _}) ->
    <<"request-token">>;
do_get_name({fast_token, _, _}) -> <<"token">>.

do_get_ns({fast, _, _, _, _}) -> <<"urn:xmpp:fast:0">>;
do_get_ns({fast_request_token, _}) ->
    <<"urn:xmpp:fast:0">>;
do_get_ns({fast_token, _, _}) -> <<"urn:xmpp:fast:0">>.

pp(fast, 4) -> [zero_rtt, count, invalidate, mechs];
pp(fast_request_token, 1) -> [mech];
pp(fast_token, 2) -> [expiry, token];
pp(_, _) -> no.

records() ->
    [{fast, 4}, {fast_request_token, 1}, {fast_token, 2}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

dec_int(Val) -> dec_int(Val, infinity, infinity).

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_fast_token(__TopXMLNS, __Opts,
                  {xmlel, <<"token">>, _attrs, _els}) ->
    {Expiry, Token} = decode_fast_token_attrs(__TopXMLNS,
                                              _attrs,
                                              undefined,
                                              undefined),
    {fast_token, Expiry, Token}.

decode_fast_token_attrs(__TopXMLNS,
                        [{<<"expiry">>, _val} | _attrs], _Expiry, Token) ->
    decode_fast_token_attrs(__TopXMLNS,
                            _attrs,
                            _val,
                            Token);
decode_fast_token_attrs(__TopXMLNS,
                        [{<<"token">>, _val} | _attrs], Expiry, _Token) ->
    decode_fast_token_attrs(__TopXMLNS,
                            _attrs,
                            Expiry,
                            _val);
decode_fast_token_attrs(__TopXMLNS, [_ | _attrs],
                        Expiry, Token) ->
    decode_fast_token_attrs(__TopXMLNS,
                            _attrs,
                            Expiry,
                            Token);
decode_fast_token_attrs(__TopXMLNS, [], Expiry,
                        Token) ->
    {decode_fast_token_attr_expiry(__TopXMLNS, Expiry),
     decode_fast_token_attr_token(__TopXMLNS, Token)}.

encode_fast_token({fast_token, Expiry, Token},
                  __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:fast:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_fast_token_attr_token(Token,
                                          encode_fast_token_attr_expiry(Expiry,
                                                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                   __TopXMLNS))),
    {xmlel, <<"token">>, _attrs, _els}.

decode_fast_token_attr_expiry(__TopXMLNS, undefined) ->
    undefined;
decode_fast_token_attr_expiry(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"expiry">>,
                           <<"token">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_fast_token_attr_expiry(undefined, _acc) -> _acc;
encode_fast_token_attr_expiry(_val, _acc) ->
    [{<<"expiry">>, enc_utc(_val)} | _acc].

decode_fast_token_attr_token(__TopXMLNS, undefined) ->
    <<>>;
decode_fast_token_attr_token(__TopXMLNS, _val) -> _val.

encode_fast_token_attr_token(<<>>, _acc) -> _acc;
encode_fast_token_attr_token(_val, _acc) ->
    [{<<"token">>, _val} | _acc].

decode_fast_request_token(__TopXMLNS, __Opts,
                          {xmlel, <<"request-token">>, _attrs, _els}) ->
    Mech = decode_fast_request_token_attrs(__TopXMLNS,
                                           _attrs,
                                           undefined),
    {fast_request_token, Mech}.

decode_fast_request_token_attrs(__TopXMLNS,
                                [{<<"mechanism">>, _val} | _attrs], _Mech) ->
    decode_fast_request_token_attrs(__TopXMLNS,
                                    _attrs,
                                    _val);
decode_fast_request_token_attrs(__TopXMLNS,
                                [_ | _attrs], Mech) ->
    decode_fast_request_token_attrs(__TopXMLNS,
                                    _attrs,
                                    Mech);
decode_fast_request_token_attrs(__TopXMLNS, [], Mech) ->
    decode_fast_request_token_attr_mechanism(__TopXMLNS,
                                             Mech).

encode_fast_request_token({fast_request_token, Mech},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:fast:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_fast_request_token_attr_mechanism(Mech,
                                                      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                 __TopXMLNS)),
    {xmlel, <<"request-token">>, _attrs, _els}.

decode_fast_request_token_attr_mechanism(__TopXMLNS,
                                         undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"mechanism">>,
                   <<"request-token">>,
                   __TopXMLNS}});
decode_fast_request_token_attr_mechanism(__TopXMLNS,
                                         _val) ->
    _val.

encode_fast_request_token_attr_mechanism(_val, _acc) ->
    [{<<"mechanism">>, _val} | _acc].

decode_fast_mech(__TopXMLNS, __Opts,
                 {xmlel, <<"mechanism">>, _attrs, _els}) ->
    Cdata = decode_fast_mech_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 <<>>),
    Cdata.

decode_fast_mech_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_fast_mech_cdata(__TopXMLNS, Cdata);
decode_fast_mech_els(__TopXMLNS, __Opts,
                     [{xmlcdata, _data} | _els], Cdata) ->
    decode_fast_mech_els(__TopXMLNS,
                         __Opts,
                         _els,
                         <<Cdata/binary, _data/binary>>);
decode_fast_mech_els(__TopXMLNS, __Opts, [_ | _els],
                     Cdata) ->
    decode_fast_mech_els(__TopXMLNS, __Opts, _els, Cdata).

encode_fast_mech(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:fast:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_fast_mech_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"mechanism">>, _attrs, _els}.

decode_fast_mech_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_fast_mech_cdata(__TopXMLNS, _val) -> _val.

encode_fast_mech_cdata(<<>>, _acc) -> _acc;
encode_fast_mech_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_fast(__TopXMLNS, __Opts,
            {xmlel, <<"fast">>, _attrs, _els}) ->
    Mechs = decode_fast_els(__TopXMLNS, __Opts, _els, []),
    {Zero_rtt, Count, Invalidate} =
        decode_fast_attrs(__TopXMLNS,
                          _attrs,
                          undefined,
                          undefined,
                          undefined),
    {fast, Zero_rtt, Count, Invalidate, Mechs}.

decode_fast_els(__TopXMLNS, __Opts, [], Mechs) ->
    lists:reverse(Mechs);
decode_fast_els(__TopXMLNS, __Opts,
                [{xmlel, <<"mechanism">>, _attrs, _} = _el | _els],
                Mechs) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:fast:0">> ->
            decode_fast_els(__TopXMLNS,
                            __Opts,
                            _els,
                            [decode_fast_mech(<<"urn:xmpp:fast:0">>,
                                              __Opts,
                                              _el)
                             | Mechs]);
        _ -> decode_fast_els(__TopXMLNS, __Opts, _els, Mechs)
    end;
decode_fast_els(__TopXMLNS, __Opts, [_ | _els],
                Mechs) ->
    decode_fast_els(__TopXMLNS, __Opts, _els, Mechs).

decode_fast_attrs(__TopXMLNS,
                  [{<<"tls-0rtt">>, _val} | _attrs], _Zero_rtt, Count,
                  Invalidate) ->
    decode_fast_attrs(__TopXMLNS,
                      _attrs,
                      _val,
                      Count,
                      Invalidate);
decode_fast_attrs(__TopXMLNS,
                  [{<<"count">>, _val} | _attrs], Zero_rtt, _Count,
                  Invalidate) ->
    decode_fast_attrs(__TopXMLNS,
                      _attrs,
                      Zero_rtt,
                      _val,
                      Invalidate);
decode_fast_attrs(__TopXMLNS,
                  [{<<"invalidate">>, _val} | _attrs], Zero_rtt, Count,
                  _Invalidate) ->
    decode_fast_attrs(__TopXMLNS,
                      _attrs,
                      Zero_rtt,
                      Count,
                      _val);
decode_fast_attrs(__TopXMLNS, [_ | _attrs], Zero_rtt,
                  Count, Invalidate) ->
    decode_fast_attrs(__TopXMLNS,
                      _attrs,
                      Zero_rtt,
                      Count,
                      Invalidate);
decode_fast_attrs(__TopXMLNS, [], Zero_rtt, Count,
                  Invalidate) ->
    {'decode_fast_attr_tls-0rtt'(__TopXMLNS, Zero_rtt),
     decode_fast_attr_count(__TopXMLNS, Count),
     decode_fast_attr_invalidate(__TopXMLNS, Invalidate)}.

encode_fast({fast, Zero_rtt, Count, Invalidate, Mechs},
            __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:fast:0">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_fast_$mechs'(Mechs,
                                              __NewTopXMLNS,
                                              [])),
    _attrs = encode_fast_attr_invalidate(Invalidate,
                                         encode_fast_attr_count(Count,
                                                                'encode_fast_attr_tls-0rtt'(Zero_rtt,
                                                                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                       __TopXMLNS)))),
    {xmlel, <<"fast">>, _attrs, _els}.

'encode_fast_$mechs'([], __TopXMLNS, _acc) -> _acc;
'encode_fast_$mechs'([Mechs | _els], __TopXMLNS,
                     _acc) ->
    'encode_fast_$mechs'(_els,
                         __TopXMLNS,
                         [encode_fast_mech(Mechs, __TopXMLNS) | _acc]).

'decode_fast_attr_tls-0rtt'(__TopXMLNS, undefined) ->
    undefined;
'decode_fast_attr_tls-0rtt'(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"tls-0rtt">>,
                           <<"fast">>,
                           __TopXMLNS}});
        _res -> _res
    end.

'encode_fast_attr_tls-0rtt'(undefined, _acc) -> _acc;
'encode_fast_attr_tls-0rtt'(_val, _acc) ->
    [{<<"tls-0rtt">>, enc_bool(_val)} | _acc].

decode_fast_attr_count(__TopXMLNS, undefined) ->
    undefined;
decode_fast_attr_count(__TopXMLNS, _val) ->
    case catch dec_int(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"count">>,
                           <<"fast">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_fast_attr_count(undefined, _acc) -> _acc;
encode_fast_attr_count(_val, _acc) ->
    [{<<"count">>, enc_int(_val)} | _acc].

decode_fast_attr_invalidate(__TopXMLNS, undefined) ->
    undefined;
decode_fast_attr_invalidate(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"invalidate">>,
                           <<"fast">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_fast_attr_invalidate(undefined, _acc) -> _acc;
encode_fast_attr_invalidate(_val, _acc) ->
    [{<<"invalidate">>, enc_bool(_val)} | _acc].
