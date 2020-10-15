%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0047).

-compile(export_all).

do_decode(<<"close">>,
          <<"http://jabber.org/protocol/ibb">>, El, Opts) ->
    decode_ibb_close(<<"http://jabber.org/protocol/ibb">>,
                     Opts,
                     El);
do_decode(<<"data">>,
          <<"http://jabber.org/protocol/ibb">>, El, Opts) ->
    decode_ibb_data(<<"http://jabber.org/protocol/ibb">>,
                    Opts,
                    El);
do_decode(<<"open">>,
          <<"http://jabber.org/protocol/ibb">>, El, Opts) ->
    decode_ibb_open(<<"http://jabber.org/protocol/ibb">>,
                    Opts,
                    El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"close">>, <<"http://jabber.org/protocol/ibb">>},
     {<<"data">>, <<"http://jabber.org/protocol/ibb">>},
     {<<"open">>, <<"http://jabber.org/protocol/ibb">>}].

do_encode({ibb_open, _, _, _} = Open, TopXMLNS) ->
    encode_ibb_open(Open, TopXMLNS);
do_encode({ibb_data, _, _, _} = Data, TopXMLNS) ->
    encode_ibb_data(Data, TopXMLNS);
do_encode({ibb_close, _} = Close, TopXMLNS) ->
    encode_ibb_close(Close, TopXMLNS).

do_get_name({ibb_close, _}) -> <<"close">>;
do_get_name({ibb_data, _, _, _}) -> <<"data">>;
do_get_name({ibb_open, _, _, _}) -> <<"open">>.

do_get_ns({ibb_close, _}) ->
    <<"http://jabber.org/protocol/ibb">>;
do_get_ns({ibb_data, _, _, _}) ->
    <<"http://jabber.org/protocol/ibb">>;
do_get_ns({ibb_open, _, _, _}) ->
    <<"http://jabber.org/protocol/ibb">>.

pp(ibb_open, 3) -> [sid, 'block-size', stanza];
pp(ibb_data, 3) -> [sid, seq, data];
pp(ibb_close, 1) -> [sid];
pp(_, _) -> no.

records() ->
    [{ibb_open, 3}, {ibb_data, 3}, {ibb_close, 1}].

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

decode_ibb_close(__TopXMLNS, __Opts,
                 {xmlel, <<"close">>, _attrs, _els}) ->
    Sid = decode_ibb_close_attrs(__TopXMLNS,
                                 _attrs,
                                 undefined),
    {ibb_close, Sid}.

decode_ibb_close_attrs(__TopXMLNS,
                       [{<<"sid">>, _val} | _attrs], _Sid) ->
    decode_ibb_close_attrs(__TopXMLNS, _attrs, _val);
decode_ibb_close_attrs(__TopXMLNS, [_ | _attrs], Sid) ->
    decode_ibb_close_attrs(__TopXMLNS, _attrs, Sid);
decode_ibb_close_attrs(__TopXMLNS, [], Sid) ->
    decode_ibb_close_attr_sid(__TopXMLNS, Sid).

encode_ibb_close({ibb_close, Sid}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/ibb">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_ibb_close_attr_sid(Sid,
                                       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                  __TopXMLNS)),
    {xmlel, <<"close">>, _attrs, _els}.

decode_ibb_close_attr_sid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"sid">>, <<"close">>, __TopXMLNS}});
decode_ibb_close_attr_sid(__TopXMLNS, _val) -> _val.

encode_ibb_close_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

decode_ibb_data(__TopXMLNS, __Opts,
                {xmlel, <<"data">>, _attrs, _els}) ->
    Data = decode_ibb_data_els(__TopXMLNS,
                               __Opts,
                               _els,
                               <<>>),
    {Sid, Seq} = decode_ibb_data_attrs(__TopXMLNS,
                                       _attrs,
                                       undefined,
                                       undefined),
    {ibb_data, Sid, Seq, Data}.

decode_ibb_data_els(__TopXMLNS, __Opts, [], Data) ->
    decode_ibb_data_cdata(__TopXMLNS, Data);
decode_ibb_data_els(__TopXMLNS, __Opts,
                    [{xmlcdata, _data} | _els], Data) ->
    decode_ibb_data_els(__TopXMLNS,
                        __Opts,
                        _els,
                        <<Data/binary, _data/binary>>);
decode_ibb_data_els(__TopXMLNS, __Opts, [_ | _els],
                    Data) ->
    decode_ibb_data_els(__TopXMLNS, __Opts, _els, Data).

decode_ibb_data_attrs(__TopXMLNS,
                      [{<<"sid">>, _val} | _attrs], _Sid, Seq) ->
    decode_ibb_data_attrs(__TopXMLNS, _attrs, _val, Seq);
decode_ibb_data_attrs(__TopXMLNS,
                      [{<<"seq">>, _val} | _attrs], Sid, _Seq) ->
    decode_ibb_data_attrs(__TopXMLNS, _attrs, Sid, _val);
decode_ibb_data_attrs(__TopXMLNS, [_ | _attrs], Sid,
                      Seq) ->
    decode_ibb_data_attrs(__TopXMLNS, _attrs, Sid, Seq);
decode_ibb_data_attrs(__TopXMLNS, [], Sid, Seq) ->
    {decode_ibb_data_attr_sid(__TopXMLNS, Sid),
     decode_ibb_data_attr_seq(__TopXMLNS, Seq)}.

encode_ibb_data({ibb_data, Sid, Seq, Data},
                __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/ibb">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_ibb_data_cdata(Data, []),
    _attrs = encode_ibb_data_attr_seq(Seq,
                                      encode_ibb_data_attr_sid(Sid,
                                                               xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                          __TopXMLNS))),
    {xmlel, <<"data">>, _attrs, _els}.

decode_ibb_data_attr_sid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"sid">>, <<"data">>, __TopXMLNS}});
decode_ibb_data_attr_sid(__TopXMLNS, _val) -> _val.

encode_ibb_data_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

decode_ibb_data_attr_seq(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"seq">>, <<"data">>, __TopXMLNS}});
decode_ibb_data_attr_seq(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value, <<"seq">>, <<"data">>, __TopXMLNS}});
        _res -> _res
    end.

encode_ibb_data_attr_seq(_val, _acc) ->
    [{<<"seq">>, enc_int(_val)} | _acc].

decode_ibb_data_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_ibb_data_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"data">>, __TopXMLNS}});
        _res -> _res
    end.

encode_ibb_data_cdata(<<>>, _acc) -> _acc;
encode_ibb_data_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_ibb_open(__TopXMLNS, __Opts,
                {xmlel, <<"open">>, _attrs, _els}) ->
    {Sid, Block_size, Stanza} =
        decode_ibb_open_attrs(__TopXMLNS,
                              _attrs,
                              undefined,
                              undefined,
                              undefined),
    {ibb_open, Sid, Block_size, Stanza}.

decode_ibb_open_attrs(__TopXMLNS,
                      [{<<"sid">>, _val} | _attrs], _Sid, Block_size,
                      Stanza) ->
    decode_ibb_open_attrs(__TopXMLNS,
                          _attrs,
                          _val,
                          Block_size,
                          Stanza);
decode_ibb_open_attrs(__TopXMLNS,
                      [{<<"block-size">>, _val} | _attrs], Sid, _Block_size,
                      Stanza) ->
    decode_ibb_open_attrs(__TopXMLNS,
                          _attrs,
                          Sid,
                          _val,
                          Stanza);
decode_ibb_open_attrs(__TopXMLNS,
                      [{<<"stanza">>, _val} | _attrs], Sid, Block_size,
                      _Stanza) ->
    decode_ibb_open_attrs(__TopXMLNS,
                          _attrs,
                          Sid,
                          Block_size,
                          _val);
decode_ibb_open_attrs(__TopXMLNS, [_ | _attrs], Sid,
                      Block_size, Stanza) ->
    decode_ibb_open_attrs(__TopXMLNS,
                          _attrs,
                          Sid,
                          Block_size,
                          Stanza);
decode_ibb_open_attrs(__TopXMLNS, [], Sid, Block_size,
                      Stanza) ->
    {decode_ibb_open_attr_sid(__TopXMLNS, Sid),
     'decode_ibb_open_attr_block-size'(__TopXMLNS,
                                       Block_size),
     decode_ibb_open_attr_stanza(__TopXMLNS, Stanza)}.

encode_ibb_open({ibb_open, Sid, Block_size, Stanza},
                __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/ibb">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_ibb_open_attr_stanza(Stanza,
                                         'encode_ibb_open_attr_block-size'(Block_size,
                                                                           encode_ibb_open_attr_sid(Sid,
                                                                                                    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                               __TopXMLNS)))),
    {xmlel, <<"open">>, _attrs, _els}.

decode_ibb_open_attr_sid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"sid">>, <<"open">>, __TopXMLNS}});
decode_ibb_open_attr_sid(__TopXMLNS, _val) -> _val.

encode_ibb_open_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

'decode_ibb_open_attr_block-size'(__TopXMLNS,
                                  undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"block-size">>,
                   <<"open">>,
                   __TopXMLNS}});
'decode_ibb_open_attr_block-size'(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"block-size">>,
                           <<"open">>,
                           __TopXMLNS}});
        _res -> _res
    end.

'encode_ibb_open_attr_block-size'(_val, _acc) ->
    [{<<"block-size">>, enc_int(_val)} | _acc].

decode_ibb_open_attr_stanza(__TopXMLNS, undefined) ->
    iq;
decode_ibb_open_attr_stanza(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [iq, message]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"stanza">>,
                           <<"open">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_ibb_open_attr_stanza(iq, _acc) -> _acc;
encode_ibb_open_attr_stanza(_val, _acc) ->
    [{<<"stanza">>, enc_enum(_val)} | _acc].
