%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0357).

-compile(export_all).

do_decode(<<"notification">>, <<"urn:xmpp:push:0">>, El,
          Opts) ->
    decode_push_notification(<<"urn:xmpp:push:0">>,
                             Opts,
                             El);
do_decode(<<"disable">>, <<"urn:xmpp:push:0">>, El,
          Opts) ->
    decode_push_disable(<<"urn:xmpp:push:0">>, Opts, El);
do_decode(<<"enable">>, <<"urn:xmpp:push:0">>, El,
          Opts) ->
    decode_push_enable(<<"urn:xmpp:push:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"notification">>, <<"urn:xmpp:push:0">>},
     {<<"disable">>, <<"urn:xmpp:push:0">>},
     {<<"enable">>, <<"urn:xmpp:push:0">>}].

do_encode({push_enable, _, _, _} = Enable, TopXMLNS) ->
    encode_push_enable(Enable, TopXMLNS);
do_encode({push_disable, _, _} = Disable, TopXMLNS) ->
    encode_push_disable(Disable, TopXMLNS);
do_encode({push_notification, _} = Notification,
          TopXMLNS) ->
    encode_push_notification(Notification, TopXMLNS).

do_get_name({push_disable, _, _}) -> <<"disable">>;
do_get_name({push_enable, _, _, _}) -> <<"enable">>;
do_get_name({push_notification, _}) ->
    <<"notification">>.

do_get_ns({push_disable, _, _}) ->
    <<"urn:xmpp:push:0">>;
do_get_ns({push_enable, _, _, _}) ->
    <<"urn:xmpp:push:0">>;
do_get_ns({push_notification, _}) ->
    <<"urn:xmpp:push:0">>.

pp(push_enable, 3) -> [jid, node, xdata];
pp(push_disable, 2) -> [jid, node];
pp(push_notification, 1) -> [xdata];
pp(_, _) -> no.

records() ->
    [{push_enable, 3},
     {push_disable, 2},
     {push_notification, 1}].

decode_push_notification(__TopXMLNS, __Opts,
                         {xmlel, <<"notification">>, _attrs, _els}) ->
    Xdata = decode_push_notification_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         undefined),
    {push_notification, Xdata}.

decode_push_notification_els(__TopXMLNS, __Opts, [],
                             Xdata) ->
    Xdata;
decode_push_notification_els(__TopXMLNS, __Opts,
                             [{xmlel, <<"x">>, _attrs, _} = _el | _els],
                             Xdata) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"jabber:x:data">> ->
            decode_push_notification_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         xep0004:decode_xdata(<<"jabber:x:data">>,
                                                              __Opts,
                                                              _el));
        _ ->
            decode_push_notification_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         Xdata)
    end;
decode_push_notification_els(__TopXMLNS, __Opts,
                             [_ | _els], Xdata) ->
    decode_push_notification_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 Xdata).

encode_push_notification({push_notification, Xdata},
                         __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:push:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_push_notification_$xdata'(Xdata,
                                                        __NewTopXMLNS,
                                                        [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"notification">>, _attrs, _els}.

'encode_push_notification_$xdata'(undefined, __TopXMLNS,
                                  _acc) ->
    _acc;
'encode_push_notification_$xdata'(Xdata, __TopXMLNS,
                                  _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

decode_push_disable(__TopXMLNS, __Opts,
                    {xmlel, <<"disable">>, _attrs, _els}) ->
    {Jid, Node} = decode_push_disable_attrs(__TopXMLNS,
                                            _attrs,
                                            undefined,
                                            undefined),
    {push_disable, Jid, Node}.

decode_push_disable_attrs(__TopXMLNS,
                          [{<<"jid">>, _val} | _attrs], _Jid, Node) ->
    decode_push_disable_attrs(__TopXMLNS,
                              _attrs,
                              _val,
                              Node);
decode_push_disable_attrs(__TopXMLNS,
                          [{<<"node">>, _val} | _attrs], Jid, _Node) ->
    decode_push_disable_attrs(__TopXMLNS,
                              _attrs,
                              Jid,
                              _val);
decode_push_disable_attrs(__TopXMLNS, [_ | _attrs], Jid,
                          Node) ->
    decode_push_disable_attrs(__TopXMLNS,
                              _attrs,
                              Jid,
                              Node);
decode_push_disable_attrs(__TopXMLNS, [], Jid, Node) ->
    {decode_push_disable_attr_jid(__TopXMLNS, Jid),
     decode_push_disable_attr_node(__TopXMLNS, Node)}.

encode_push_disable({push_disable, Jid, Node},
                    __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:push:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_push_disable_attr_node(Node,
                                           encode_push_disable_attr_jid(Jid,
                                                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                   __TopXMLNS))),
    {xmlel, <<"disable">>, _attrs, _els}.

decode_push_disable_attr_jid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"jid">>, <<"disable">>, __TopXMLNS}});
decode_push_disable_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"jid">>,
                           <<"disable">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_push_disable_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_push_disable_attr_node(__TopXMLNS, undefined) ->
    <<>>;
decode_push_disable_attr_node(__TopXMLNS, _val) -> _val.

encode_push_disable_attr_node(<<>>, _acc) -> _acc;
encode_push_disable_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_push_enable(__TopXMLNS, __Opts,
                   {xmlel, <<"enable">>, _attrs, _els}) ->
    Xdata = decode_push_enable_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   undefined),
    {Jid, Node} = decode_push_enable_attrs(__TopXMLNS,
                                           _attrs,
                                           undefined,
                                           undefined),
    {push_enable, Jid, Node, Xdata}.

decode_push_enable_els(__TopXMLNS, __Opts, [], Xdata) ->
    Xdata;
decode_push_enable_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"x">>, _attrs, _} = _el | _els], Xdata) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"jabber:x:data">> ->
            decode_push_enable_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   xep0004:decode_xdata(<<"jabber:x:data">>,
                                                        __Opts,
                                                        _el));
        _ ->
            decode_push_enable_els(__TopXMLNS, __Opts, _els, Xdata)
    end;
decode_push_enable_els(__TopXMLNS, __Opts, [_ | _els],
                       Xdata) ->
    decode_push_enable_els(__TopXMLNS, __Opts, _els, Xdata).

decode_push_enable_attrs(__TopXMLNS,
                         [{<<"jid">>, _val} | _attrs], _Jid, Node) ->
    decode_push_enable_attrs(__TopXMLNS,
                             _attrs,
                             _val,
                             Node);
decode_push_enable_attrs(__TopXMLNS,
                         [{<<"node">>, _val} | _attrs], Jid, _Node) ->
    decode_push_enable_attrs(__TopXMLNS, _attrs, Jid, _val);
decode_push_enable_attrs(__TopXMLNS, [_ | _attrs], Jid,
                         Node) ->
    decode_push_enable_attrs(__TopXMLNS, _attrs, Jid, Node);
decode_push_enable_attrs(__TopXMLNS, [], Jid, Node) ->
    {decode_push_enable_attr_jid(__TopXMLNS, Jid),
     decode_push_enable_attr_node(__TopXMLNS, Node)}.

encode_push_enable({push_enable, Jid, Node, Xdata},
                   __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:push:0">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_push_enable_$xdata'(Xdata,
                                                     __NewTopXMLNS,
                                                     [])),
    _attrs = encode_push_enable_attr_node(Node,
                                          encode_push_enable_attr_jid(Jid,
                                                                      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                 __TopXMLNS))),
    {xmlel, <<"enable">>, _attrs, _els}.

'encode_push_enable_$xdata'(undefined, __TopXMLNS,
                            _acc) ->
    _acc;
'encode_push_enable_$xdata'(Xdata, __TopXMLNS, _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

decode_push_enable_attr_jid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"jid">>, <<"enable">>, __TopXMLNS}});
decode_push_enable_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"jid">>,
                           <<"enable">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_push_enable_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_push_enable_attr_node(__TopXMLNS, undefined) ->
    <<>>;
decode_push_enable_attr_node(__TopXMLNS, _val) -> _val.

encode_push_enable_attr_node(<<>>, _acc) -> _acc;
encode_push_enable_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].
