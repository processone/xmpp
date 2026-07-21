%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0513).

-compile(export_all).

do_decode(<<"noping">>, <<"urn:xmpp:mentions:0">>, El,
          Opts) ->
    decode_mention_noping(<<"urn:xmpp:mentions:0">>,
                          Opts,
                          El);
do_decode(<<"active">>, <<"urn:xmpp:mentions:0">>, El,
          Opts) ->
    decode_mention_active(<<"urn:xmpp:mentions:0">>,
                          Opts,
                          El);
do_decode(<<"mention">>, <<"urn:xmpp:mentions:0">>, El,
          Opts) ->
    decode_mention(<<"urn:xmpp:mentions:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"noping">>, <<"urn:xmpp:mentions:0">>},
     {<<"active">>, <<"urn:xmpp:mentions:0">>},
     {<<"mention">>, <<"urn:xmpp:mentions:0">>}].

do_encode({mention, _, _, _, _, _, _, _, _} = Mention,
          TopXMLNS) ->
    encode_mention(Mention, TopXMLNS).

do_get_name({mention, _, _, _, _, _, _, _, _}) ->
    <<"mention">>.

do_get_ns({mention, _, _, _, _, _, _, _, _}) ->
    <<"urn:xmpp:mentions:0">>.

pp(mention, 8) ->
    ['begin',
     'end',
     occupantid,
     mentions,
     uri,
     hreflang,
     active,
     noping];
pp(_, _) -> no.

records() -> [{mention, 8}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

dec_mention_type(<<"urn:xmpp:mentions:0#channel">>) ->
    channel;
dec_mention_type(<<"urn:xmpp:mentions:0#space">>) ->
    space;
dec_mention_type(<<"urn:xmpp:mentions:0#server">>) ->
    server;
dec_mention_type(<<"urn:xmpp:mentions:0#moderators">>) ->
    moderators;
dec_mention_type(<<"urn:xmpp:mentions:0#participants">>) ->
    participants;
dec_mention_type(<<"urn:xmpp:mentions:0#visitors">>) ->
    visitors;
dec_mention_type(<<"urn:xmpp:mentions:0#owners">>) ->
    owners;
dec_mention_type(<<"urn:xmpp:mentions:0#admin">>) ->
    admin;
dec_mention_type(<<"urn:xmpp:mentions:0#member">>) ->
    member;
dec_mention_type(<<"urn:xmpp:mentions:0#none">>) ->
    none;
dec_mention_type(Other) -> Other.

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_mention_type(channel) ->
    <<"urn:xmpp:mentions:0#channel">>;
enc_mention_type(space) ->
    <<"urn:xmpp:mentions:0#space">>;
enc_mention_type(server) ->
    <<"urn:xmpp:mentions:0#server">>;
enc_mention_type(moderators) ->
    <<"urn:xmpp:mentions:0#moderators">>;
enc_mention_type(participants) ->
    <<"urn:xmpp:mentions:0#participants">>;
enc_mention_type(visitors) ->
    <<"urn:xmpp:mentions:0#visitors">>;
enc_mention_type(owners) ->
    <<"urn:xmpp:mentions:0#owners">>;
enc_mention_type(admin) ->
    <<"urn:xmpp:mentions:0#admin">>;
enc_mention_type(member) ->
    <<"urn:xmpp:mentions:0#member">>;
enc_mention_type(none) ->
    <<"urn:xmpp:mentions:0#none">>;
enc_mention_type(Other) -> Other.

decode_mention_noping(__TopXMLNS, __Opts,
                      {xmlel, <<"noping">>, _attrs, _els}) ->
    true.

encode_mention_noping(true, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mentions:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"noping">>, _attrs, _els}.

decode_mention_active(__TopXMLNS, __Opts,
                      {xmlel, <<"active">>, _attrs, _els}) ->
    true.

encode_mention_active(true, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mentions:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"active">>, _attrs, _els}.

decode_mention(__TopXMLNS, __Opts,
               {xmlel, <<"mention">>, _attrs, _els}) ->
    {Active, Noping} = decode_mention_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          false,
                                          false),
    {Begin, End, Occupantid, Mentions, Uri, Hreflang} =
        decode_mention_attrs(__TopXMLNS,
                             _attrs,
                             undefined,
                             undefined,
                             undefined,
                             undefined,
                             undefined,
                             undefined),
    {mention,
     Begin,
     End,
     Occupantid,
     Mentions,
     Uri,
     Hreflang,
     Active,
     Noping}.

decode_mention_els(__TopXMLNS, __Opts, [], Active,
                   Noping) ->
    {Active, Noping};
decode_mention_els(__TopXMLNS, __Opts,
                   [{xmlel, <<"active">>, _attrs, _} = _el | _els], Active,
                   Noping) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mentions:0">> ->
            decode_mention_els(__TopXMLNS,
                               __Opts,
                               _els,
                               decode_mention_active(<<"urn:xmpp:mentions:0">>,
                                                     __Opts,
                                                     _el),
                               Noping);
        _ ->
            decode_mention_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Active,
                               Noping)
    end;
decode_mention_els(__TopXMLNS, __Opts,
                   [{xmlel, <<"noping">>, _attrs, _} = _el | _els], Active,
                   Noping) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mentions:0">> ->
            decode_mention_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Active,
                               decode_mention_noping(<<"urn:xmpp:mentions:0">>,
                                                     __Opts,
                                                     _el));
        _ ->
            decode_mention_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Active,
                               Noping)
    end;
decode_mention_els(__TopXMLNS, __Opts, [_ | _els],
                   Active, Noping) ->
    decode_mention_els(__TopXMLNS,
                       __Opts,
                       _els,
                       Active,
                       Noping).

decode_mention_attrs(__TopXMLNS,
                     [{<<"begin">>, _val} | _attrs], _Begin, End, Occupantid,
                     Mentions, Uri, Hreflang) ->
    decode_mention_attrs(__TopXMLNS,
                         _attrs,
                         _val,
                         End,
                         Occupantid,
                         Mentions,
                         Uri,
                         Hreflang);
decode_mention_attrs(__TopXMLNS,
                     [{<<"end">>, _val} | _attrs], Begin, _End, Occupantid,
                     Mentions, Uri, Hreflang) ->
    decode_mention_attrs(__TopXMLNS,
                         _attrs,
                         Begin,
                         _val,
                         Occupantid,
                         Mentions,
                         Uri,
                         Hreflang);
decode_mention_attrs(__TopXMLNS,
                     [{<<"occupantid">>, _val} | _attrs], Begin, End,
                     _Occupantid, Mentions, Uri, Hreflang) ->
    decode_mention_attrs(__TopXMLNS,
                         _attrs,
                         Begin,
                         End,
                         _val,
                         Mentions,
                         Uri,
                         Hreflang);
decode_mention_attrs(__TopXMLNS,
                     [{<<"mentions">>, _val} | _attrs], Begin, End,
                     Occupantid, _Mentions, Uri, Hreflang) ->
    decode_mention_attrs(__TopXMLNS,
                         _attrs,
                         Begin,
                         End,
                         Occupantid,
                         _val,
                         Uri,
                         Hreflang);
decode_mention_attrs(__TopXMLNS,
                     [{<<"uri">>, _val} | _attrs], Begin, End, Occupantid,
                     Mentions, _Uri, Hreflang) ->
    decode_mention_attrs(__TopXMLNS,
                         _attrs,
                         Begin,
                         End,
                         Occupantid,
                         Mentions,
                         _val,
                         Hreflang);
decode_mention_attrs(__TopXMLNS,
                     [{<<"hreflang">>, _val} | _attrs], Begin, End,
                     Occupantid, Mentions, Uri, _Hreflang) ->
    decode_mention_attrs(__TopXMLNS,
                         _attrs,
                         Begin,
                         End,
                         Occupantid,
                         Mentions,
                         Uri,
                         _val);
decode_mention_attrs(__TopXMLNS, [_ | _attrs], Begin,
                     End, Occupantid, Mentions, Uri, Hreflang) ->
    decode_mention_attrs(__TopXMLNS,
                         _attrs,
                         Begin,
                         End,
                         Occupantid,
                         Mentions,
                         Uri,
                         Hreflang);
decode_mention_attrs(__TopXMLNS, [], Begin, End,
                     Occupantid, Mentions, Uri, Hreflang) ->
    {decode_mention_attr_begin(__TopXMLNS, Begin),
     decode_mention_attr_end(__TopXMLNS, End),
     decode_mention_attr_occupantid(__TopXMLNS, Occupantid),
     decode_mention_attr_mentions(__TopXMLNS, Mentions),
     decode_mention_attr_uri(__TopXMLNS, Uri),
     decode_mention_attr_hreflang(__TopXMLNS, Hreflang)}.

encode_mention({mention,
                Begin,
                End,
                Occupantid,
                Mentions,
                Uri,
                Hreflang,
                Active,
                Noping},
               __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mentions:0">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_mention_$active'(Active,
                                                  __NewTopXMLNS,
                                                  'encode_mention_$noping'(Noping,
                                                                           __NewTopXMLNS,
                                                                           []))),
    _attrs = encode_mention_attr_hreflang(Hreflang,
                                          encode_mention_attr_uri(Uri,
                                                                  encode_mention_attr_mentions(Mentions,
                                                                                               encode_mention_attr_occupantid(Occupantid,
                                                                                                                              encode_mention_attr_end(End,
                                                                                                                                                      encode_mention_attr_begin(Begin,
                                                                                                                                                                                xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                                                                           __TopXMLNS))))))),
    {xmlel, <<"mention">>, _attrs, _els}.

'encode_mention_$active'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_mention_$active'(Active, __TopXMLNS, _acc) ->
    [encode_mention_active(Active, __TopXMLNS) | _acc].

'encode_mention_$noping'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_mention_$noping'(Noping, __TopXMLNS, _acc) ->
    [encode_mention_noping(Noping, __TopXMLNS) | _acc].

decode_mention_attr_begin(__TopXMLNS, undefined) ->
    undefined;
decode_mention_attr_begin(__TopXMLNS, _val) ->
    try dec_int(_val, 0, infinity) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"begin">>,
                           <<"mention">>,
                           __TopXMLNS}})
    end.

encode_mention_attr_begin(undefined, _acc) -> _acc;
encode_mention_attr_begin(_val, _acc) ->
    [{<<"begin">>, enc_int(_val)} | _acc].

decode_mention_attr_end(__TopXMLNS, undefined) ->
    undefined;
decode_mention_attr_end(__TopXMLNS, _val) ->
    try dec_int(_val, 0, infinity) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"end">>,
                           <<"mention">>,
                           __TopXMLNS}})
    end.

encode_mention_attr_end(undefined, _acc) -> _acc;
encode_mention_attr_end(_val, _acc) ->
    [{<<"end">>, enc_int(_val)} | _acc].

decode_mention_attr_occupantid(__TopXMLNS, undefined) ->
    <<>>;
decode_mention_attr_occupantid(__TopXMLNS, _val) ->
    _val.

encode_mention_attr_occupantid(<<>>, _acc) -> _acc;
encode_mention_attr_occupantid(_val, _acc) ->
    [{<<"occupantid">>, _val} | _acc].

decode_mention_attr_mentions(__TopXMLNS, undefined) ->
    undefined;
decode_mention_attr_mentions(__TopXMLNS, _val) ->
    try dec_mention_type(_val) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"mentions">>,
                           <<"mention">>,
                           __TopXMLNS}})
    end.

encode_mention_attr_mentions(undefined, _acc) -> _acc;
encode_mention_attr_mentions(_val, _acc) ->
    [{<<"mentions">>, enc_mention_type(_val)} | _acc].

decode_mention_attr_uri(__TopXMLNS, undefined) -> <<>>;
decode_mention_attr_uri(__TopXMLNS, _val) -> _val.

encode_mention_attr_uri(<<>>, _acc) -> _acc;
encode_mention_attr_uri(_val, _acc) ->
    [{<<"uri">>, _val} | _acc].

decode_mention_attr_hreflang(__TopXMLNS, undefined) ->
    <<>>;
decode_mention_attr_hreflang(__TopXMLNS, _val) ->
    try xmpp_lang:check(_val) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"hreflang">>,
                           <<"mention">>,
                           __TopXMLNS}})
    end.

encode_mention_attr_hreflang(<<>>, _acc) -> _acc;
encode_mention_attr_hreflang(_val, _acc) ->
    [{<<"hreflang">>, _val} | _acc].
