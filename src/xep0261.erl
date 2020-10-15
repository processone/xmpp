%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0261).

-compile(export_all).

do_decode(<<"transport">>,
          <<"urn:xmpp:jingle:transports:ibb:1">>, El, Opts) ->
    decode_jingle_ibb_transport(<<"urn:xmpp:jingle:transports:ibb:1">>,
                                Opts,
                                El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"transport">>,
      <<"urn:xmpp:jingle:transports:ibb:1">>}].

do_encode({jingle_ibb_transport, _, _, _} = Transport,
          TopXMLNS) ->
    encode_jingle_ibb_transport(Transport, TopXMLNS).

do_get_name({jingle_ibb_transport, _, _, _}) ->
    <<"transport">>.

do_get_ns({jingle_ibb_transport, _, _, _}) ->
    <<"urn:xmpp:jingle:transports:ibb:1">>.

pp(jingle_ibb_transport, 3) ->
    [sid, 'block-size', stanza];
pp(_, _) -> no.

records() -> [{jingle_ibb_transport, 3}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
        true -> AtomVal
    end.

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_jingle_ibb_transport(__TopXMLNS, __Opts,
                            {xmlel, <<"transport">>, _attrs, _els}) ->
    {Sid, Block_size, Stanza} =
        decode_jingle_ibb_transport_attrs(__TopXMLNS,
                                          _attrs,
                                          undefined,
                                          undefined,
                                          undefined),
    {jingle_ibb_transport, Sid, Block_size, Stanza}.

decode_jingle_ibb_transport_attrs(__TopXMLNS,
                                  [{<<"sid">>, _val} | _attrs], _Sid,
                                  Block_size, Stanza) ->
    decode_jingle_ibb_transport_attrs(__TopXMLNS,
                                      _attrs,
                                      _val,
                                      Block_size,
                                      Stanza);
decode_jingle_ibb_transport_attrs(__TopXMLNS,
                                  [{<<"block-size">>, _val} | _attrs], Sid,
                                  _Block_size, Stanza) ->
    decode_jingle_ibb_transport_attrs(__TopXMLNS,
                                      _attrs,
                                      Sid,
                                      _val,
                                      Stanza);
decode_jingle_ibb_transport_attrs(__TopXMLNS,
                                  [{<<"stanza">>, _val} | _attrs], Sid,
                                  Block_size, _Stanza) ->
    decode_jingle_ibb_transport_attrs(__TopXMLNS,
                                      _attrs,
                                      Sid,
                                      Block_size,
                                      _val);
decode_jingle_ibb_transport_attrs(__TopXMLNS,
                                  [_ | _attrs], Sid, Block_size, Stanza) ->
    decode_jingle_ibb_transport_attrs(__TopXMLNS,
                                      _attrs,
                                      Sid,
                                      Block_size,
                                      Stanza);
decode_jingle_ibb_transport_attrs(__TopXMLNS, [], Sid,
                                  Block_size, Stanza) ->
    {decode_jingle_ibb_transport_attr_sid(__TopXMLNS, Sid),
     'decode_jingle_ibb_transport_attr_block-size'(__TopXMLNS,
                                                   Block_size),
     decode_jingle_ibb_transport_attr_stanza(__TopXMLNS,
                                             Stanza)}.

encode_jingle_ibb_transport({jingle_ibb_transport,
                             Sid,
                             Block_size,
                             Stanza},
                            __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:transports:ibb:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_jingle_ibb_transport_attr_stanza(Stanza,
                                                     'encode_jingle_ibb_transport_attr_block-size'(Block_size,
                                                                                                   encode_jingle_ibb_transport_attr_sid(Sid,
                                                                                                                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                                   __TopXMLNS)))),
    {xmlel, <<"transport">>, _attrs, _els}.

decode_jingle_ibb_transport_attr_sid(__TopXMLNS,
                                     undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"sid">>,
                   <<"transport">>,
                   __TopXMLNS}});
decode_jingle_ibb_transport_attr_sid(__TopXMLNS,
                                     _val) ->
    _val.

encode_jingle_ibb_transport_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

'decode_jingle_ibb_transport_attr_block-size'(__TopXMLNS,
                                              undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"block-size">>,
                   <<"transport">>,
                   __TopXMLNS}});
'decode_jingle_ibb_transport_attr_block-size'(__TopXMLNS,
                                              _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"block-size">>,
                           <<"transport">>,
                           __TopXMLNS}});
        _res -> _res
    end.

'encode_jingle_ibb_transport_attr_block-size'(_val,
                                              _acc) ->
    [{<<"block-size">>, enc_int(_val)} | _acc].

decode_jingle_ibb_transport_attr_stanza(__TopXMLNS,
                                        undefined) ->
    iq;
decode_jingle_ibb_transport_attr_stanza(__TopXMLNS,
                                        _val) ->
    case catch dec_enum(_val, [iq, message]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"stanza">>,
                           <<"transport">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_ibb_transport_attr_stanza(iq, _acc) ->
    _acc;
encode_jingle_ibb_transport_attr_stanza(_val, _acc) ->
    [{<<"stanza">>, enc_enum(_val)} | _acc].
