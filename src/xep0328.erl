%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0328).

-compile(export_all).

do_decode(<<"jid">>, <<"urn:xmpp:jidprep:0">>, El,
          Opts) ->
    decode_jidprep(<<"urn:xmpp:jidprep:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"jid">>, <<"urn:xmpp:jidprep:0">>}].

do_encode({jidprep, _} = Jid, TopXMLNS) ->
    encode_jidprep(Jid, TopXMLNS).

do_get_name({jidprep, _}) -> <<"jid">>.

do_get_ns({jidprep, _}) -> <<"urn:xmpp:jidprep:0">>.

pp(jidprep, 1) -> [jid];
pp(_, _) -> no.

records() -> [{jidprep, 1}].

decode_jidprep(__TopXMLNS, __Opts,
               {xmlel, <<"jid">>, _attrs, _els}) ->
    Jid = decode_jidprep_els(__TopXMLNS,
                             __Opts,
                             _els,
                             <<>>),
    {jidprep, Jid}.

decode_jidprep_els(__TopXMLNS, __Opts, [], Jid) ->
    decode_jidprep_cdata(__TopXMLNS, Jid);
decode_jidprep_els(__TopXMLNS, __Opts,
                   [{xmlcdata, _data} | _els], Jid) ->
    decode_jidprep_els(__TopXMLNS,
                       __Opts,
                       _els,
                       <<Jid/binary, _data/binary>>);
decode_jidprep_els(__TopXMLNS, __Opts, [_ | _els],
                   Jid) ->
    decode_jidprep_els(__TopXMLNS, __Opts, _els, Jid).

encode_jidprep({jidprep, Jid}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jidprep:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_jidprep_cdata(Jid, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"jid">>, _attrs, _els}.

decode_jidprep_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"jid">>, __TopXMLNS}});
decode_jidprep_cdata(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"jid">>, __TopXMLNS}});
        _res -> _res
    end.

encode_jidprep_cdata(_val, _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].
