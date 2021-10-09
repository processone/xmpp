%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0333).

-compile(export_all).

do_decode(<<"acknowledged">>,
          <<"urn:xmpp:chat-markers:0">>, El, Opts) ->
    decode_mark_acknowledged(<<"urn:xmpp:chat-markers:0">>,
                             Opts,
                             El);
do_decode(<<"displayed">>,
          <<"urn:xmpp:chat-markers:0">>, El, Opts) ->
    decode_mark_displayed(<<"urn:xmpp:chat-markers:0">>,
                          Opts,
                          El);
do_decode(<<"received">>, <<"urn:xmpp:chat-markers:0">>,
          El, Opts) ->
    decode_mark_received(<<"urn:xmpp:chat-markers:0">>,
                         Opts,
                         El);
do_decode(<<"markable">>, <<"urn:xmpp:chat-markers:0">>,
          El, Opts) ->
    decode_mark_markable(<<"urn:xmpp:chat-markers:0">>,
                         Opts,
                         El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"acknowledged">>, <<"urn:xmpp:chat-markers:0">>},
     {<<"displayed">>, <<"urn:xmpp:chat-markers:0">>},
     {<<"received">>, <<"urn:xmpp:chat-markers:0">>},
     {<<"markable">>, <<"urn:xmpp:chat-markers:0">>}].

do_encode({markable} = Markable, TopXMLNS) ->
    encode_mark_markable(Markable, TopXMLNS);
do_encode({mark_received, _} = Received, TopXMLNS) ->
    encode_mark_received(Received, TopXMLNS);
do_encode({mark_displayed, _} = Displayed, TopXMLNS) ->
    encode_mark_displayed(Displayed, TopXMLNS);
do_encode({mark_acknowledged, _} = Acknowledged,
          TopXMLNS) ->
    encode_mark_acknowledged(Acknowledged, TopXMLNS).

do_get_name({mark_acknowledged, _}) ->
    <<"acknowledged">>;
do_get_name({mark_displayed, _}) -> <<"displayed">>;
do_get_name({mark_received, _}) -> <<"received">>;
do_get_name({markable}) -> <<"markable">>.

do_get_ns({mark_acknowledged, _}) ->
    <<"urn:xmpp:chat-markers:0">>;
do_get_ns({mark_displayed, _}) ->
    <<"urn:xmpp:chat-markers:0">>;
do_get_ns({mark_received, _}) ->
    <<"urn:xmpp:chat-markers:0">>;
do_get_ns({markable}) -> <<"urn:xmpp:chat-markers:0">>.

pp(markable, 0) -> [];
pp(mark_received, 1) -> [id];
pp(mark_displayed, 1) -> [id];
pp(mark_acknowledged, 1) -> [id];
pp(_, _) -> no.

records() ->
    [{markable, 0},
     {mark_received, 1},
     {mark_displayed, 1},
     {mark_acknowledged, 1}].

decode_mark_acknowledged(__TopXMLNS, __Opts,
                         {xmlel, <<"acknowledged">>, _attrs, _els}) ->
    Id = decode_mark_acknowledged_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined),
    {mark_acknowledged, Id}.

decode_mark_acknowledged_attrs(__TopXMLNS,
                               [{<<"id">>, _val} | _attrs], _Id) ->
    decode_mark_acknowledged_attrs(__TopXMLNS,
                                   _attrs,
                                   _val);
decode_mark_acknowledged_attrs(__TopXMLNS, [_ | _attrs],
                               Id) ->
    decode_mark_acknowledged_attrs(__TopXMLNS, _attrs, Id);
decode_mark_acknowledged_attrs(__TopXMLNS, [], Id) ->
    decode_mark_acknowledged_attr_id(__TopXMLNS, Id).

encode_mark_acknowledged({mark_acknowledged, Id},
                         __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:chat-markers:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_mark_acknowledged_attr_id(Id,
                                              xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                         __TopXMLNS)),
    {xmlel, <<"acknowledged">>, _attrs, _els}.

decode_mark_acknowledged_attr_id(__TopXMLNS,
                                 undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"id">>,
                   <<"acknowledged">>,
                   __TopXMLNS}});
decode_mark_acknowledged_attr_id(__TopXMLNS, _val) ->
    _val.

encode_mark_acknowledged_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_mark_displayed(__TopXMLNS, __Opts,
                      {xmlel, <<"displayed">>, _attrs, _els}) ->
    Id = decode_mark_displayed_attrs(__TopXMLNS,
                                     _attrs,
                                     undefined),
    {mark_displayed, Id}.

decode_mark_displayed_attrs(__TopXMLNS,
                            [{<<"id">>, _val} | _attrs], _Id) ->
    decode_mark_displayed_attrs(__TopXMLNS, _attrs, _val);
decode_mark_displayed_attrs(__TopXMLNS, [_ | _attrs],
                            Id) ->
    decode_mark_displayed_attrs(__TopXMLNS, _attrs, Id);
decode_mark_displayed_attrs(__TopXMLNS, [], Id) ->
    decode_mark_displayed_attr_id(__TopXMLNS, Id).

encode_mark_displayed({mark_displayed, Id},
                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:chat-markers:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_mark_displayed_attr_id(Id,
                                           xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                      __TopXMLNS)),
    {xmlel, <<"displayed">>, _attrs, _els}.

decode_mark_displayed_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"id">>, <<"displayed">>, __TopXMLNS}});
decode_mark_displayed_attr_id(__TopXMLNS, _val) -> _val.

encode_mark_displayed_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_mark_received(__TopXMLNS, __Opts,
                     {xmlel, <<"received">>, _attrs, _els}) ->
    Id = decode_mark_received_attrs(__TopXMLNS,
                                    _attrs,
                                    undefined),
    {mark_received, Id}.

decode_mark_received_attrs(__TopXMLNS,
                           [{<<"id">>, _val} | _attrs], _Id) ->
    decode_mark_received_attrs(__TopXMLNS, _attrs, _val);
decode_mark_received_attrs(__TopXMLNS, [_ | _attrs],
                           Id) ->
    decode_mark_received_attrs(__TopXMLNS, _attrs, Id);
decode_mark_received_attrs(__TopXMLNS, [], Id) ->
    decode_mark_received_attr_id(__TopXMLNS, Id).

encode_mark_received({mark_received, Id}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:chat-markers:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_mark_received_attr_id(Id,
                                          xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                     __TopXMLNS)),
    {xmlel, <<"received">>, _attrs, _els}.

decode_mark_received_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"id">>, <<"received">>, __TopXMLNS}});
decode_mark_received_attr_id(__TopXMLNS, _val) -> _val.

encode_mark_received_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_mark_markable(__TopXMLNS, __Opts,
                     {xmlel, <<"markable">>, _attrs, _els}) ->
    {markable}.

encode_mark_markable({markable}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:chat-markers:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"markable">>, _attrs, _els}.
