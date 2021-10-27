%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0317).

-compile(export_all).

do_decode(<<"hat">>,
          <<"xmpp:prosody.im/protocol/hats:1">>, El, Opts) ->
    decode_muc_hat(<<"xmpp:prosody.im/protocol/hats:1">>,
                   Opts,
                   El);
do_decode(<<"hats">>,
          <<"xmpp:prosody.im/protocol/hats:1">>, El, Opts) ->
    decode_muc_hats(<<"xmpp:prosody.im/protocol/hats:1">>,
                    Opts,
                    El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"hat">>, <<"xmpp:prosody.im/protocol/hats:1">>},
     {<<"hats">>, <<"xmpp:prosody.im/protocol/hats:1">>}].

do_encode({muc_hats, _} = Hats, TopXMLNS) ->
    encode_muc_hats(Hats, TopXMLNS);
do_encode({muc_hat, _, _} = Hat, TopXMLNS) ->
    encode_muc_hat(Hat, TopXMLNS).

do_get_name({muc_hat, _, _}) -> <<"hat">>;
do_get_name({muc_hats, _}) -> <<"hats">>.

do_get_ns({muc_hat, _, _}) ->
    <<"xmpp:prosody.im/protocol/hats:1">>;
do_get_ns({muc_hats, _}) ->
    <<"xmpp:prosody.im/protocol/hats:1">>.

pp(muc_hats, 1) -> [hats];
pp(muc_hat, 2) -> [title, uri];
pp(_, _) -> no.

records() -> [{muc_hats, 1}, {muc_hat, 2}].

decode_muc_hat(__TopXMLNS, __Opts,
               {xmlel, <<"hat">>, _attrs, _els}) ->
    {Title, Uri} = decode_muc_hat_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined,
                                        undefined),
    {muc_hat, Title, Uri}.

decode_muc_hat_attrs(__TopXMLNS,
                     [{<<"title">>, _val} | _attrs], _Title, Uri) ->
    decode_muc_hat_attrs(__TopXMLNS, _attrs, _val, Uri);
decode_muc_hat_attrs(__TopXMLNS,
                     [{<<"uri">>, _val} | _attrs], Title, _Uri) ->
    decode_muc_hat_attrs(__TopXMLNS, _attrs, Title, _val);
decode_muc_hat_attrs(__TopXMLNS, [_ | _attrs], Title,
                     Uri) ->
    decode_muc_hat_attrs(__TopXMLNS, _attrs, Title, Uri);
decode_muc_hat_attrs(__TopXMLNS, [], Title, Uri) ->
    {decode_muc_hat_attr_title(__TopXMLNS, Title),
     decode_muc_hat_attr_uri(__TopXMLNS, Uri)}.

encode_muc_hat({muc_hat, Title, Uri}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"xmpp:prosody.im/protocol/hats:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_muc_hat_attr_uri(Uri,
                                     encode_muc_hat_attr_title(Title,
                                                               xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                          __TopXMLNS))),
    {xmlel, <<"hat">>, _attrs, _els}.

decode_muc_hat_attr_title(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"title">>, <<"hat">>, __TopXMLNS}});
decode_muc_hat_attr_title(__TopXMLNS, _val) -> _val.

encode_muc_hat_attr_title(_val, _acc) ->
    [{<<"title">>, _val} | _acc].

decode_muc_hat_attr_uri(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"uri">>, <<"hat">>, __TopXMLNS}});
decode_muc_hat_attr_uri(__TopXMLNS, _val) -> _val.

encode_muc_hat_attr_uri(_val, _acc) ->
    [{<<"uri">>, _val} | _acc].

decode_muc_hats(__TopXMLNS, __Opts,
                {xmlel, <<"hats">>, _attrs, _els}) ->
    Hats = decode_muc_hats_els(__TopXMLNS,
                               __Opts,
                               _els,
                               []),
    {muc_hats, Hats}.

decode_muc_hats_els(__TopXMLNS, __Opts, [], Hats) ->
    lists:reverse(Hats);
decode_muc_hats_els(__TopXMLNS, __Opts,
                    [{xmlel, <<"hat">>, _attrs, _} = _el | _els], Hats) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"xmpp:prosody.im/protocol/hats:1">> ->
            decode_muc_hats_els(__TopXMLNS,
                                __Opts,
                                _els,
                                [decode_muc_hat(<<"xmpp:prosody.im/protocol/hats:1">>,
                                                __Opts,
                                                _el)
                                 | Hats]);
        _ -> decode_muc_hats_els(__TopXMLNS, __Opts, _els, Hats)
    end;
decode_muc_hats_els(__TopXMLNS, __Opts, [_ | _els],
                    Hats) ->
    decode_muc_hats_els(__TopXMLNS, __Opts, _els, Hats).

encode_muc_hats({muc_hats, Hats}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"xmpp:prosody.im/protocol/hats:1">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_muc_hats_$hats'(Hats,
                                                 __NewTopXMLNS,
                                                 [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"hats">>, _attrs, _els}.

'encode_muc_hats_$hats'([], __TopXMLNS, _acc) -> _acc;
'encode_muc_hats_$hats'([Hats | _els], __TopXMLNS,
                        _acc) ->
    'encode_muc_hats_$hats'(_els,
                            __TopXMLNS,
                            [encode_muc_hat(Hats, __TopXMLNS) | _acc]).
