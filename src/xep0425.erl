%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0425).

-compile(export_all).

do_decode(<<"reason">>,
          <<"urn:xmpp:message-moderate:0">>, El, Opts) ->
    decode_message_moderate_reason(<<"urn:xmpp:message-moderate:0">>,
                                   Opts,
                                   El);
do_decode(<<"moderated">>,
          <<"urn:xmpp:message-moderate:0">>, El, Opts) ->
    decode_message_moderated(<<"urn:xmpp:message-moderate:0">>,
                             Opts,
                             El);
do_decode(<<"moderate">>,
          <<"urn:xmpp:message-moderate:0">>, El, Opts) ->
    decode_message_moderate(<<"urn:xmpp:message-moderate:0">>,
                            Opts,
                            El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"reason">>, <<"urn:xmpp:message-moderate:0">>},
     {<<"moderated">>, <<"urn:xmpp:message-moderate:0">>},
     {<<"moderate">>, <<"urn:xmpp:message-moderate:0">>}].

do_encode({message_moderate, _, _} = Moderate,
          TopXMLNS) ->
    encode_message_moderate(Moderate, TopXMLNS);
do_encode({message_moderated, _, _, _, _} = Moderated,
          TopXMLNS) ->
    encode_message_moderated(Moderated, TopXMLNS).

do_get_name({message_moderate, _, _}) -> <<"moderate">>;
do_get_name({message_moderated, _, _, _, _}) ->
    <<"moderated">>.

do_get_ns({message_moderate, _, _}) ->
    <<"urn:xmpp:message-moderate:0">>;
do_get_ns({message_moderated, _, _, _, _}) ->
    <<"urn:xmpp:message-moderate:0">>.

get_els({message_moderated,
         _by,
         _reason,
         _retract,
         _sub_els}) ->
    _sub_els.

set_els({message_moderated, _by, _reason, _retract, _},
        _sub_els) ->
    {message_moderated, _by, _reason, _retract, _sub_els}.

pp(message_moderate, 2) -> [reason, retract];
pp(message_moderated, 4) ->
    [by, reason, retract, sub_els];
pp(_, _) -> no.

records() ->
    [{message_moderate, 2}, {message_moderated, 4}].

decode_message_moderate_reason(__TopXMLNS, __Opts,
                               {xmlel, <<"reason">>, _attrs, _els}) ->
    Cdata = decode_message_moderate_reason_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               <<>>),
    Cdata.

decode_message_moderate_reason_els(__TopXMLNS, __Opts,
                                   [], Cdata) ->
    decode_message_moderate_reason_cdata(__TopXMLNS, Cdata);
decode_message_moderate_reason_els(__TopXMLNS, __Opts,
                                   [{xmlcdata, _data} | _els], Cdata) ->
    decode_message_moderate_reason_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       <<Cdata/binary, _data/binary>>);
decode_message_moderate_reason_els(__TopXMLNS, __Opts,
                                   [_ | _els], Cdata) ->
    decode_message_moderate_reason_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Cdata).

encode_message_moderate_reason(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:message-moderate:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_message_moderate_reason_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"reason">>, _attrs, _els}.

decode_message_moderate_reason_cdata(__TopXMLNS,
                                     <<>>) ->
    <<>>;
decode_message_moderate_reason_cdata(__TopXMLNS,
                                     _val) ->
    _val.

encode_message_moderate_reason_cdata(<<>>, _acc) ->
    _acc;
encode_message_moderate_reason_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_message_moderated(__TopXMLNS, __Opts,
                         {xmlel, <<"moderated">>, _attrs, _els}) ->
    {Retract, Reason, __Els} =
        decode_message_moderated_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     undefined,
                                     undefined,
                                     []),
    By = decode_message_moderated_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined),
    {message_moderated, By, Reason, Retract, __Els}.

decode_message_moderated_els(__TopXMLNS, __Opts, [],
                             Retract, Reason, __Els) ->
    {Retract, Reason, lists:reverse(__Els)};
decode_message_moderated_els(__TopXMLNS, __Opts,
                             [{xmlel, <<"reason">>, _attrs, _} = _el | _els],
                             Retract, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:message-moderate:0">> ->
            decode_message_moderated_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         Retract,
                                         decode_message_moderate_reason(<<"urn:xmpp:message-moderate:0">>,
                                                                        __Opts,
                                                                        _el),
                                         __Els);
        _ ->
            decode_message_moderated_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         Retract,
                                         Reason,
                                         [_el | __Els])
    end;
decode_message_moderated_els(__TopXMLNS, __Opts,
                             [{xmlel, <<"retract">>, _attrs, _} = _el | _els],
                             Retract, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:message-retract:0">> ->
            decode_message_moderated_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         xep0424:decode_message_retract(<<"urn:xmpp:message-retract:0">>,
                                                                        __Opts,
                                                                        _el),
                                         Reason,
                                         __Els);
        _ ->
            decode_message_moderated_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         Retract,
                                         Reason,
                                         [_el | __Els])
    end;
decode_message_moderated_els(__TopXMLNS, __Opts,
                             [{xmlel, _name, _attrs, _} = _el | _els], Retract,
                             Reason, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_message_moderated_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         Retract,
                                         Reason,
                                         [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_message_moderated_els(__TopXMLNS,
                                                 __Opts,
                                                 _els,
                                                 Retract,
                                                 Reason,
                                                 [_el | __Els]);
                Mod ->
                    decode_message_moderated_els(__TopXMLNS,
                                                 __Opts,
                                                 _els,
                                                 Retract,
                                                 Reason,
                                                 [Mod:do_decode(_name,
                                                                __XMLNS,
                                                                _el,
                                                                __Opts)
                                                  | __Els])
            end
    end;
decode_message_moderated_els(__TopXMLNS, __Opts,
                             [_ | _els], Retract, Reason, __Els) ->
    decode_message_moderated_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 Retract,
                                 Reason,
                                 __Els).

decode_message_moderated_attrs(__TopXMLNS,
                               [{<<"by">>, _val} | _attrs], _By) ->
    decode_message_moderated_attrs(__TopXMLNS,
                                   _attrs,
                                   _val);
decode_message_moderated_attrs(__TopXMLNS, [_ | _attrs],
                               By) ->
    decode_message_moderated_attrs(__TopXMLNS, _attrs, By);
decode_message_moderated_attrs(__TopXMLNS, [], By) ->
    decode_message_moderated_attr_by(__TopXMLNS, By).

encode_message_moderated({message_moderated,
                          By,
                          Reason,
                          Retract,
                          __Els},
                         __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:message-moderate:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_message_moderated_$retract'(Retract,
                                                                 __NewTopXMLNS,
                                                                 'encode_message_moderated_$reason'(Reason,
                                                                                                    __NewTopXMLNS,
                                                                                                    []))),
    _attrs = encode_message_moderated_attr_by(By,
                                              xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                         __TopXMLNS)),
    {xmlel, <<"moderated">>, _attrs, _els}.

'encode_message_moderated_$retract'(undefined,
                                    __TopXMLNS, _acc) ->
    _acc;
'encode_message_moderated_$retract'(Retract, __TopXMLNS,
                                    _acc) ->
    [xep0424:encode_message_retract(Retract, __TopXMLNS)
     | _acc].

'encode_message_moderated_$reason'(undefined,
                                   __TopXMLNS, _acc) ->
    _acc;
'encode_message_moderated_$reason'(Reason, __TopXMLNS,
                                   _acc) ->
    [encode_message_moderate_reason(Reason, __TopXMLNS)
     | _acc].

decode_message_moderated_attr_by(__TopXMLNS,
                                 undefined) ->
    undefined;
decode_message_moderated_attr_by(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"by">>,
                           <<"moderated">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_message_moderated_attr_by(undefined, _acc) ->
    _acc;
encode_message_moderated_attr_by(_val, _acc) ->
    [{<<"by">>, jid:encode(_val)} | _acc].

decode_message_moderate(__TopXMLNS, __Opts,
                        {xmlel, <<"moderate">>, _attrs, _els}) ->
    {Retract, Reason} =
        decode_message_moderate_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    undefined,
                                    undefined),
    {message_moderate, Reason, Retract}.

decode_message_moderate_els(__TopXMLNS, __Opts, [],
                            Retract, Reason) ->
    {Retract, Reason};
decode_message_moderate_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"reason">>, _attrs, _} = _el | _els],
                            Retract, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:message-moderate:0">> ->
            decode_message_moderate_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Retract,
                                        decode_message_moderate_reason(<<"urn:xmpp:message-moderate:0">>,
                                                                       __Opts,
                                                                       _el));
        _ ->
            decode_message_moderate_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Retract,
                                        Reason)
    end;
decode_message_moderate_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"retract">>, _attrs, _} = _el | _els],
                            Retract, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:message-retract:0">> ->
            decode_message_moderate_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        xep0424:decode_message_retract(<<"urn:xmpp:message-retract:0">>,
                                                                       __Opts,
                                                                       _el),
                                        Reason);
        _ ->
            decode_message_moderate_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Retract,
                                        Reason)
    end;
decode_message_moderate_els(__TopXMLNS, __Opts,
                            [_ | _els], Retract, Reason) ->
    decode_message_moderate_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Retract,
                                Reason).

encode_message_moderate({message_moderate,
                         Reason,
                         Retract},
                        __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:message-moderate:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_message_moderate_$retract'(Retract,
                                                         __NewTopXMLNS,
                                                         'encode_message_moderate_$reason'(Reason,
                                                                                           __NewTopXMLNS,
                                                                                           []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"moderate">>, _attrs, _els}.

'encode_message_moderate_$retract'(undefined,
                                   __TopXMLNS, _acc) ->
    _acc;
'encode_message_moderate_$retract'(Retract, __TopXMLNS,
                                   _acc) ->
    [xep0424:encode_message_retract(Retract, __TopXMLNS)
     | _acc].

'encode_message_moderate_$reason'(undefined, __TopXMLNS,
                                  _acc) ->
    _acc;
'encode_message_moderate_$reason'(Reason, __TopXMLNS,
                                  _acc) ->
    [encode_message_moderate_reason(Reason, __TopXMLNS)
     | _acc].
