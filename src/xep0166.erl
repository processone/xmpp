%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0166).

-compile(export_all).

do_decode(<<"jingle">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle(<<"urn:xmpp:jingle:1">>, Opts, El);
do_decode(<<"content">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_content(<<"urn:xmpp:jingle:1">>,
                          Opts,
                          El);
do_decode(<<"reason">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_reason(<<"urn:xmpp:jingle:1">>, Opts, El);
do_decode(<<"text">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_reason_text(<<"urn:xmpp:jingle:1">>,
                              Opts,
                              El);
do_decode(<<"unsupported-transports">>,
          <<"urn:xmpp:jingle:1">>, El, Opts) ->
    decode_jingle_reason_unsupported_transports(<<"urn:xmpp:jingle:1">>,
                                                Opts,
                                                El);
do_decode(<<"unsupported-applications">>,
          <<"urn:xmpp:jingle:1">>, El, Opts) ->
    decode_jingle_reason_unsupported_applications(<<"urn:xmpp:jingle:1">>,
                                                  Opts,
                                                  El);
do_decode(<<"timeout">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_reason_timeout(<<"urn:xmpp:jingle:1">>,
                                 Opts,
                                 El);
do_decode(<<"success">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_reason_success(<<"urn:xmpp:jingle:1">>,
                                 Opts,
                                 El);
do_decode(<<"security-error">>, <<"urn:xmpp:jingle:1">>,
          El, Opts) ->
    decode_jingle_reason_security_error(<<"urn:xmpp:jingle:1">>,
                                        Opts,
                                        El);
do_decode(<<"media-error">>, <<"urn:xmpp:jingle:1">>,
          El, Opts) ->
    decode_jingle_reason_media_error(<<"urn:xmpp:jingle:1">>,
                                     Opts,
                                     El);
do_decode(<<"incompatible-parameters">>,
          <<"urn:xmpp:jingle:1">>, El, Opts) ->
    decode_jingle_reason_incompatible_parameters(<<"urn:xmpp:jingle:1">>,
                                                 Opts,
                                                 El);
do_decode(<<"gone">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_reason_gone(<<"urn:xmpp:jingle:1">>,
                              Opts,
                              El);
do_decode(<<"general-error">>, <<"urn:xmpp:jingle:1">>,
          El, Opts) ->
    decode_jingle_reason_general_error(<<"urn:xmpp:jingle:1">>,
                                       Opts,
                                       El);
do_decode(<<"failed-transport">>,
          <<"urn:xmpp:jingle:1">>, El, Opts) ->
    decode_jingle_reason_failed_transport(<<"urn:xmpp:jingle:1">>,
                                          Opts,
                                          El);
do_decode(<<"failed-application">>,
          <<"urn:xmpp:jingle:1">>, El, Opts) ->
    decode_jingle_reason_failed_application(<<"urn:xmpp:jingle:1">>,
                                            Opts,
                                            El);
do_decode(<<"expired">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_reason_expired(<<"urn:xmpp:jingle:1">>,
                                 Opts,
                                 El);
do_decode(<<"decline">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_reason_decline(<<"urn:xmpp:jingle:1">>,
                                 Opts,
                                 El);
do_decode(<<"connectivity-error">>,
          <<"urn:xmpp:jingle:1">>, El, Opts) ->
    decode_jingle_reason_connectivity_error(<<"urn:xmpp:jingle:1">>,
                                            Opts,
                                            El);
do_decode(<<"cancel">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_reason_cancel(<<"urn:xmpp:jingle:1">>,
                                Opts,
                                El);
do_decode(<<"busy">>, <<"urn:xmpp:jingle:1">>, El,
          Opts) ->
    decode_jingle_reason_busy(<<"urn:xmpp:jingle:1">>,
                              Opts,
                              El);
do_decode(<<"alternative-session">>,
          <<"urn:xmpp:jingle:1">>, El, Opts) ->
    decode_jingle_reason_alternative_session(<<"urn:xmpp:jingle:1">>,
                                             Opts,
                                             El);
do_decode(<<"security-required">>,
          <<"urn:xmpp:jingle:errors:1">>, El, Opts) ->
    decode_jingle_error_security_required(<<"urn:xmpp:jingle:errors:1">>,
                                          Opts,
                                          El);
do_decode(<<"unsupported-info">>,
          <<"urn:xmpp:jingle:errors:1">>, El, Opts) ->
    decode_jingle_error_unsupported_info(<<"urn:xmpp:jingle:errors:1">>,
                                         Opts,
                                         El);
do_decode(<<"unknown-session">>,
          <<"urn:xmpp:jingle:errors:1">>, El, Opts) ->
    decode_jingle_error_unknown_session(<<"urn:xmpp:jingle:errors:1">>,
                                        Opts,
                                        El);
do_decode(<<"tie-break">>,
          <<"urn:xmpp:jingle:errors:1">>, El, Opts) ->
    decode_jingle_error_tie_break(<<"urn:xmpp:jingle:errors:1">>,
                                  Opts,
                                  El);
do_decode(<<"out-of-order">>,
          <<"urn:xmpp:jingle:errors:1">>, El, Opts) ->
    decode_jingle_error_out_of_order(<<"urn:xmpp:jingle:errors:1">>,
                                     Opts,
                                     El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"jingle">>, <<"urn:xmpp:jingle:1">>},
     {<<"content">>, <<"urn:xmpp:jingle:1">>},
     {<<"reason">>, <<"urn:xmpp:jingle:1">>},
     {<<"text">>, <<"urn:xmpp:jingle:1">>},
     {<<"unsupported-transports">>, <<"urn:xmpp:jingle:1">>},
     {<<"unsupported-applications">>,
      <<"urn:xmpp:jingle:1">>},
     {<<"timeout">>, <<"urn:xmpp:jingle:1">>},
     {<<"success">>, <<"urn:xmpp:jingle:1">>},
     {<<"security-error">>, <<"urn:xmpp:jingle:1">>},
     {<<"media-error">>, <<"urn:xmpp:jingle:1">>},
     {<<"incompatible-parameters">>,
      <<"urn:xmpp:jingle:1">>},
     {<<"gone">>, <<"urn:xmpp:jingle:1">>},
     {<<"general-error">>, <<"urn:xmpp:jingle:1">>},
     {<<"failed-transport">>, <<"urn:xmpp:jingle:1">>},
     {<<"failed-application">>, <<"urn:xmpp:jingle:1">>},
     {<<"expired">>, <<"urn:xmpp:jingle:1">>},
     {<<"decline">>, <<"urn:xmpp:jingle:1">>},
     {<<"connectivity-error">>, <<"urn:xmpp:jingle:1">>},
     {<<"cancel">>, <<"urn:xmpp:jingle:1">>},
     {<<"busy">>, <<"urn:xmpp:jingle:1">>},
     {<<"alternative-session">>, <<"urn:xmpp:jingle:1">>},
     {<<"security-required">>,
      <<"urn:xmpp:jingle:errors:1">>},
     {<<"unsupported-info">>,
      <<"urn:xmpp:jingle:errors:1">>},
     {<<"unknown-session">>, <<"urn:xmpp:jingle:errors:1">>},
     {<<"tie-break">>, <<"urn:xmpp:jingle:errors:1">>},
     {<<"out-of-order">>, <<"urn:xmpp:jingle:errors:1">>}].

do_encode({jingle_error, 'out-of-order'} = Out_of_order,
          TopXMLNS) ->
    encode_jingle_error_out_of_order(Out_of_order,
                                     TopXMLNS);
do_encode({jingle_error, 'tie-break'} = Tie_break,
          TopXMLNS) ->
    encode_jingle_error_tie_break(Tie_break, TopXMLNS);
do_encode({jingle_error, 'unknown-session'} =
              Unknown_session,
          TopXMLNS) ->
    encode_jingle_error_unknown_session(Unknown_session,
                                        TopXMLNS);
do_encode({jingle_error, 'unsupported-info'} =
              Unsupported_info,
          TopXMLNS) ->
    encode_jingle_error_unsupported_info(Unsupported_info,
                                         TopXMLNS);
do_encode({jingle_error, 'security-required'} =
              Security_required,
          TopXMLNS) ->
    encode_jingle_error_security_required(Security_required,
                                          TopXMLNS);
do_encode({text, _, _} = Text, TopXMLNS) ->
    encode_jingle_reason_text(Text, TopXMLNS);
do_encode({jingle_reason, _, _, _} = Reason,
          TopXMLNS) ->
    encode_jingle_reason(Reason, TopXMLNS);
do_encode({jingle_content, _, _, _, _, _} = Content,
          TopXMLNS) ->
    encode_jingle_content(Content, TopXMLNS);
do_encode({jingle, _, _, _, _, _, _, _} = Jingle,
          TopXMLNS) ->
    encode_jingle(Jingle, TopXMLNS).

do_get_name({jingle, _, _, _, _, _, _, _}) ->
    <<"jingle">>;
do_get_name({jingle_content, _, _, _, _, _}) ->
    <<"content">>;
do_get_name({jingle_error, 'out-of-order'}) ->
    <<"out-of-order">>;
do_get_name({jingle_error, 'security-required'}) ->
    <<"security-required">>;
do_get_name({jingle_error, 'tie-break'}) ->
    <<"tie-break">>;
do_get_name({jingle_error, 'unknown-session'}) ->
    <<"unknown-session">>;
do_get_name({jingle_error, 'unsupported-info'}) ->
    <<"unsupported-info">>;
do_get_name({jingle_reason, _, _, _}) -> <<"reason">>;
do_get_name({text, _, _}) -> <<"text">>.

do_get_ns({jingle, _, _, _, _, _, _, _}) ->
    <<"urn:xmpp:jingle:1">>;
do_get_ns({jingle_content, _, _, _, _, _}) ->
    <<"urn:xmpp:jingle:1">>;
do_get_ns({jingle_error, 'out-of-order'}) ->
    <<"urn:xmpp:jingle:errors:1">>;
do_get_ns({jingle_error, 'security-required'}) ->
    <<"urn:xmpp:jingle:errors:1">>;
do_get_ns({jingle_error, 'tie-break'}) ->
    <<"urn:xmpp:jingle:errors:1">>;
do_get_ns({jingle_error, 'unknown-session'}) ->
    <<"urn:xmpp:jingle:errors:1">>;
do_get_ns({jingle_error, 'unsupported-info'}) ->
    <<"urn:xmpp:jingle:errors:1">>;
do_get_ns({jingle_reason, _, _, _}) ->
    <<"urn:xmpp:jingle:1">>;
do_get_ns({text, _, _}) -> <<"urn:xmpp:jingle:1">>.

get_els({jingle_reason, _reason, _text, _sub_els}) ->
    _sub_els;
get_els({jingle_content,
         _creator,
         _disposition,
         _name,
         _senders,
         _sub_els}) ->
    _sub_els;
get_els({jingle,
         _action,
         _sid,
         _initiator,
         _responder,
         _content,
         _reason,
         _sub_els}) ->
    _sub_els.

set_els({jingle_reason, _reason, _text, _}, _sub_els) ->
    {jingle_reason, _reason, _text, _sub_els};
set_els({jingle_content,
         _creator,
         _disposition,
         _name,
         _senders,
         _},
        _sub_els) ->
    {jingle_content,
     _creator,
     _disposition,
     _name,
     _senders,
     _sub_els};
set_els({jingle,
         _action,
         _sid,
         _initiator,
         _responder,
         _content,
         _reason,
         _},
        _sub_els) ->
    {jingle,
     _action,
     _sid,
     _initiator,
     _responder,
     _content,
     _reason,
     _sub_els}.

pp(jingle_error, 1) -> [reason];
pp(text, 2) -> [lang, data];
pp(jingle_reason, 3) -> [reason, text, sub_els];
pp(jingle_content, 5) ->
    [creator, disposition, name, senders, sub_els];
pp(jingle, 7) ->
    [action,
     sid,
     initiator,
     responder,
     content,
     reason,
     sub_els];
pp(_, _) -> no.

records() ->
    [{jingle_error, 1},
     {text, 2},
     {jingle_reason, 3},
     {jingle_content, 5},
     {jingle, 7}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
        true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_jingle(__TopXMLNS, __Opts,
              {xmlel, <<"jingle">>, _attrs, _els}) ->
    {Content, Reason, __Els} = decode_jingle_els(__TopXMLNS,
                                                 __Opts,
                                                 _els,
                                                 [],
                                                 undefined,
                                                 []),
    {Action, Sid, Initiator, Responder} =
        decode_jingle_attrs(__TopXMLNS,
                            _attrs,
                            undefined,
                            undefined,
                            undefined,
                            undefined),
    {jingle,
     Action,
     Sid,
     Initiator,
     Responder,
     Content,
     Reason,
     __Els}.

decode_jingle_els(__TopXMLNS, __Opts, [], Content,
                  Reason, __Els) ->
    {lists:reverse(Content), Reason, lists:reverse(__Els)};
decode_jingle_els(__TopXMLNS, __Opts,
                  [{xmlel, <<"content">>, _attrs, _} = _el | _els],
                  Content, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_els(__TopXMLNS,
                              __Opts,
                              _els,
                              [decode_jingle_content(<<"urn:xmpp:jingle:1">>,
                                                     __Opts,
                                                     _el)
                               | Content],
                              Reason,
                              __Els);
        _ ->
            decode_jingle_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Content,
                              Reason,
                              [_el | __Els])
    end;
decode_jingle_els(__TopXMLNS, __Opts,
                  [{xmlel, <<"reason">>, _attrs, _} = _el | _els],
                  Content, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Content,
                              decode_jingle_reason(<<"urn:xmpp:jingle:1">>,
                                                   __Opts,
                                                   _el),
                              __Els);
        _ ->
            decode_jingle_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Content,
                              Reason,
                              [_el | __Els])
    end;
decode_jingle_els(__TopXMLNS, __Opts,
                  [{xmlel, _name, _attrs, _} = _el | _els], Content,
                  Reason, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_jingle_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Content,
                              Reason,
                              [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_jingle_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Content,
                                      Reason,
                                      [_el | __Els]);
                Mod ->
                    decode_jingle_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Content,
                                      Reason,
                                      [Mod:do_decode(_name,
                                                     __XMLNS,
                                                     _el,
                                                     __Opts)
                                       | __Els])
            end
    end;
decode_jingle_els(__TopXMLNS, __Opts, [_ | _els],
                  Content, Reason, __Els) ->
    decode_jingle_els(__TopXMLNS,
                      __Opts,
                      _els,
                      Content,
                      Reason,
                      __Els).

decode_jingle_attrs(__TopXMLNS,
                    [{<<"action">>, _val} | _attrs], _Action, Sid,
                    Initiator, Responder) ->
    decode_jingle_attrs(__TopXMLNS,
                        _attrs,
                        _val,
                        Sid,
                        Initiator,
                        Responder);
decode_jingle_attrs(__TopXMLNS,
                    [{<<"sid">>, _val} | _attrs], Action, _Sid, Initiator,
                    Responder) ->
    decode_jingle_attrs(__TopXMLNS,
                        _attrs,
                        Action,
                        _val,
                        Initiator,
                        Responder);
decode_jingle_attrs(__TopXMLNS,
                    [{<<"initiator">>, _val} | _attrs], Action, Sid,
                    _Initiator, Responder) ->
    decode_jingle_attrs(__TopXMLNS,
                        _attrs,
                        Action,
                        Sid,
                        _val,
                        Responder);
decode_jingle_attrs(__TopXMLNS,
                    [{<<"responder">>, _val} | _attrs], Action, Sid,
                    Initiator, _Responder) ->
    decode_jingle_attrs(__TopXMLNS,
                        _attrs,
                        Action,
                        Sid,
                        Initiator,
                        _val);
decode_jingle_attrs(__TopXMLNS, [_ | _attrs], Action,
                    Sid, Initiator, Responder) ->
    decode_jingle_attrs(__TopXMLNS,
                        _attrs,
                        Action,
                        Sid,
                        Initiator,
                        Responder);
decode_jingle_attrs(__TopXMLNS, [], Action, Sid,
                    Initiator, Responder) ->
    {decode_jingle_attr_action(__TopXMLNS, Action),
     decode_jingle_attr_sid(__TopXMLNS, Sid),
     decode_jingle_attr_initiator(__TopXMLNS, Initiator),
     decode_jingle_attr_responder(__TopXMLNS, Responder)}.

encode_jingle({jingle,
               Action,
               Sid,
               Initiator,
               Responder,
               Content,
               Reason,
               __Els},
              __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_jingle_$content'(Content,
                                                      __NewTopXMLNS,
                                                      'encode_jingle_$reason'(Reason,
                                                                              __NewTopXMLNS,
                                                                              []))),
    _attrs = encode_jingle_attr_responder(Responder,
                                          encode_jingle_attr_initiator(Initiator,
                                                                       encode_jingle_attr_sid(Sid,
                                                                                              encode_jingle_attr_action(Action,
                                                                                                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                   __TopXMLNS))))),
    {xmlel, <<"jingle">>, _attrs, _els}.

'encode_jingle_$content'([], __TopXMLNS, _acc) -> _acc;
'encode_jingle_$content'([Content | _els], __TopXMLNS,
                         _acc) ->
    'encode_jingle_$content'(_els,
                             __TopXMLNS,
                             [encode_jingle_content(Content, __TopXMLNS)
                              | _acc]).

'encode_jingle_$reason'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_$reason'(Reason, __TopXMLNS, _acc) ->
    [encode_jingle_reason(Reason, __TopXMLNS) | _acc].

decode_jingle_attr_action(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"action">>,
                   <<"jingle">>,
                   __TopXMLNS}});
decode_jingle_attr_action(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
                        ['content-accept',
                         'content-add',
                         'content-modify',
                         'content-reject',
                         'content-remove',
                         'description-info',
                         'security-info',
                         'session-accept',
                         'session-info',
                         'session-initiate',
                         'session-terminate',
                         'transport-accept',
                         'transport-info',
                         'transport-reject',
                         'transport-replace'])
        of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"action">>,
                           <<"jingle">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_attr_action(_val, _acc) ->
    [{<<"action">>, enc_enum(_val)} | _acc].

decode_jingle_attr_sid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"sid">>, <<"jingle">>, __TopXMLNS}});
decode_jingle_attr_sid(__TopXMLNS, _val) -> _val.

encode_jingle_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

decode_jingle_attr_initiator(__TopXMLNS, undefined) ->
    undefined;
decode_jingle_attr_initiator(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"initiator">>,
                           <<"jingle">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_attr_initiator(undefined, _acc) -> _acc;
encode_jingle_attr_initiator(_val, _acc) ->
    [{<<"initiator">>, jid:encode(_val)} | _acc].

decode_jingle_attr_responder(__TopXMLNS, undefined) ->
    undefined;
decode_jingle_attr_responder(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"responder">>,
                           <<"jingle">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_attr_responder(undefined, _acc) -> _acc;
encode_jingle_attr_responder(_val, _acc) ->
    [{<<"responder">>, jid:encode(_val)} | _acc].

decode_jingle_content(__TopXMLNS, __Opts,
                      {xmlel, <<"content">>, _attrs, _els}) ->
    __Els = decode_jingle_content_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      []),
    {Creator, Disposition, Name, Senders} =
        decode_jingle_content_attrs(__TopXMLNS,
                                    _attrs,
                                    undefined,
                                    undefined,
                                    undefined,
                                    undefined),
    {jingle_content,
     Creator,
     Disposition,
     Name,
     Senders,
     __Els}.

decode_jingle_content_els(__TopXMLNS, __Opts, [],
                          __Els) ->
    lists:reverse(__Els);
decode_jingle_content_els(__TopXMLNS, __Opts,
                          [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_jingle_content_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_jingle_content_els(__TopXMLNS,
                                              __Opts,
                                              _els,
                                              [_el | __Els]);
                Mod ->
                    decode_jingle_content_els(__TopXMLNS,
                                              __Opts,
                                              _els,
                                              [Mod:do_decode(_name,
                                                             __XMLNS,
                                                             _el,
                                                             __Opts)
                                               | __Els])
            end
    end;
decode_jingle_content_els(__TopXMLNS, __Opts,
                          [_ | _els], __Els) ->
    decode_jingle_content_els(__TopXMLNS,
                              __Opts,
                              _els,
                              __Els).

decode_jingle_content_attrs(__TopXMLNS,
                            [{<<"creator">>, _val} | _attrs], _Creator,
                            Disposition, Name, Senders) ->
    decode_jingle_content_attrs(__TopXMLNS,
                                _attrs,
                                _val,
                                Disposition,
                                Name,
                                Senders);
decode_jingle_content_attrs(__TopXMLNS,
                            [{<<"disposition">>, _val} | _attrs], Creator,
                            _Disposition, Name, Senders) ->
    decode_jingle_content_attrs(__TopXMLNS,
                                _attrs,
                                Creator,
                                _val,
                                Name,
                                Senders);
decode_jingle_content_attrs(__TopXMLNS,
                            [{<<"name">>, _val} | _attrs], Creator, Disposition,
                            _Name, Senders) ->
    decode_jingle_content_attrs(__TopXMLNS,
                                _attrs,
                                Creator,
                                Disposition,
                                _val,
                                Senders);
decode_jingle_content_attrs(__TopXMLNS,
                            [{<<"senders">>, _val} | _attrs], Creator,
                            Disposition, Name, _Senders) ->
    decode_jingle_content_attrs(__TopXMLNS,
                                _attrs,
                                Creator,
                                Disposition,
                                Name,
                                _val);
decode_jingle_content_attrs(__TopXMLNS, [_ | _attrs],
                            Creator, Disposition, Name, Senders) ->
    decode_jingle_content_attrs(__TopXMLNS,
                                _attrs,
                                Creator,
                                Disposition,
                                Name,
                                Senders);
decode_jingle_content_attrs(__TopXMLNS, [], Creator,
                            Disposition, Name, Senders) ->
    {decode_jingle_content_attr_creator(__TopXMLNS,
                                        Creator),
     decode_jingle_content_attr_disposition(__TopXMLNS,
                                            Disposition),
     decode_jingle_content_attr_name(__TopXMLNS, Name),
     decode_jingle_content_attr_senders(__TopXMLNS,
                                        Senders)}.

encode_jingle_content({jingle_content,
                       Creator,
                       Disposition,
                       Name,
                       Senders,
                       __Els},
                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = encode_jingle_content_attr_senders(Senders,
                                                encode_jingle_content_attr_name(Name,
                                                                                encode_jingle_content_attr_disposition(Disposition,
                                                                                                                       encode_jingle_content_attr_creator(Creator,
                                                                                                                                                          xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                                                     __TopXMLNS))))),
    {xmlel, <<"content">>, _attrs, _els}.

decode_jingle_content_attr_creator(__TopXMLNS,
                                   undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"creator">>,
                   <<"content">>,
                   __TopXMLNS}});
decode_jingle_content_attr_creator(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [initiator, responder]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"creator">>,
                           <<"content">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_content_attr_creator(_val, _acc) ->
    [{<<"creator">>, enc_enum(_val)} | _acc].

decode_jingle_content_attr_disposition(__TopXMLNS,
                                       undefined) ->
    <<>>;
decode_jingle_content_attr_disposition(__TopXMLNS,
                                       _val) ->
    _val.

encode_jingle_content_attr_disposition(<<>>, _acc) ->
    _acc;
encode_jingle_content_attr_disposition(_val, _acc) ->
    [{<<"disposition">>, _val} | _acc].

decode_jingle_content_attr_name(__TopXMLNS,
                                undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"name">>, <<"content">>, __TopXMLNS}});
decode_jingle_content_attr_name(__TopXMLNS, _val) ->
    _val.

encode_jingle_content_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_jingle_content_attr_senders(__TopXMLNS,
                                   undefined) ->
    both;
decode_jingle_content_attr_senders(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
                        [both, initiator, none, responder])
        of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"senders">>,
                           <<"content">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_content_attr_senders(both, _acc) -> _acc;
encode_jingle_content_attr_senders(_val, _acc) ->
    [{<<"senders">>, enc_enum(_val)} | _acc].

decode_jingle_reason(__TopXMLNS, __Opts,
                     {xmlel, <<"reason">>, _attrs, _els}) ->
    {Text, Reason, __Els} =
        decode_jingle_reason_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 [],
                                 undefined,
                                 []),
    {jingle_reason, Reason, Text, __Els}.

decode_jingle_reason_els(__TopXMLNS, __Opts, [], Text,
                         Reason, __Els) ->
    {lists:reverse(Text), Reason, lists:reverse(__Els)};
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     [decode_jingle_reason_text(<<"urn:xmpp:jingle:1">>,
                                                                __Opts,
                                                                _el)
                                      | Text],
                                     Reason,
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"alternative-session">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_alternative_session(<<"urn:xmpp:jingle:1">>,
                                                                              __Opts,
                                                                              _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"busy">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_busy(<<"urn:xmpp:jingle:1">>,
                                                               __Opts,
                                                               _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"cancel">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_cancel(<<"urn:xmpp:jingle:1">>,
                                                                 __Opts,
                                                                 _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"connectivity-error">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_connectivity_error(<<"urn:xmpp:jingle:1">>,
                                                                             __Opts,
                                                                             _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"decline">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_decline(<<"urn:xmpp:jingle:1">>,
                                                                  __Opts,
                                                                  _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"expired">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_expired(<<"urn:xmpp:jingle:1">>,
                                                                  __Opts,
                                                                  _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"failed-application">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_failed_application(<<"urn:xmpp:jingle:1">>,
                                                                             __Opts,
                                                                             _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"failed-transport">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_failed_transport(<<"urn:xmpp:jingle:1">>,
                                                                           __Opts,
                                                                           _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"general-error">>, _attrs, _} = _el | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_general_error(<<"urn:xmpp:jingle:1">>,
                                                                        __Opts,
                                                                        _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"gone">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_gone(<<"urn:xmpp:jingle:1">>,
                                                               __Opts,
                                                               _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"incompatible-parameters">>, _attrs, _} =
                              _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_incompatible_parameters(<<"urn:xmpp:jingle:1">>,
                                                                                  __Opts,
                                                                                  _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"media-error">>, _attrs, _} = _el | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_media_error(<<"urn:xmpp:jingle:1">>,
                                                                      __Opts,
                                                                      _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"security-error">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_security_error(<<"urn:xmpp:jingle:1">>,
                                                                         __Opts,
                                                                         _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"success">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_success(<<"urn:xmpp:jingle:1">>,
                                                                  __Opts,
                                                                  _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"timeout">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_timeout(<<"urn:xmpp:jingle:1">>,
                                                                  __Opts,
                                                                  _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"unsupported-applications">>, _attrs, _} =
                              _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_unsupported_applications(<<"urn:xmpp:jingle:1">>,
                                                                                   __Opts,
                                                                                   _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"unsupported-transports">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:1">> ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     decode_jingle_reason_unsupported_transports(<<"urn:xmpp:jingle:1">>,
                                                                                 __Opts,
                                                                                 _el),
                                     __Els);
        _ ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts,
                         [{xmlel, _name, _attrs, _} = _el | _els], Text, Reason,
                         __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_jingle_reason_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_jingle_reason_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             Text,
                                             Reason,
                                             [_el | __Els]);
                Mod ->
                    decode_jingle_reason_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             Text,
                                             Reason,
                                             [Mod:do_decode(_name,
                                                            __XMLNS,
                                                            _el,
                                                            __Opts)
                                              | __Els])
            end
    end;
decode_jingle_reason_els(__TopXMLNS, __Opts, [_ | _els],
                         Text, Reason, __Els) ->
    decode_jingle_reason_els(__TopXMLNS,
                             __Opts,
                             _els,
                             Text,
                             Reason,
                             __Els).

encode_jingle_reason({jingle_reason,
                      Reason,
                      Text,
                      __Els},
                     __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_jingle_reason_$text'(Text,
                                                          __NewTopXMLNS,
                                                          'encode_jingle_reason_$reason'(Reason,
                                                                                         __NewTopXMLNS,
                                                                                         []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"reason">>, _attrs, _els}.

'encode_jingle_reason_$text'([], __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_reason_$text'([Text | _els], __TopXMLNS,
                             _acc) ->
    'encode_jingle_reason_$text'(_els,
                                 __TopXMLNS,
                                 [encode_jingle_reason_text(Text, __TopXMLNS)
                                  | _acc]).

'encode_jingle_reason_$reason'(undefined, __TopXMLNS,
                               _acc) ->
    _acc;
'encode_jingle_reason_$reason'('alternative-session' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_alternative_session(Reason,
                                              __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'(busy = Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_busy(Reason, __TopXMLNS) | _acc];
'encode_jingle_reason_$reason'(cancel = Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_cancel(Reason, __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'('connectivity-error' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_connectivity_error(Reason,
                                             __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'(decline = Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_decline(Reason, __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'(expired = Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_expired(Reason, __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'('failed-application' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_failed_application(Reason,
                                             __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'('failed-transport' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_failed_transport(Reason,
                                           __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'('general-error' = Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_general_error(Reason, __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'(gone = Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_gone(Reason, __TopXMLNS) | _acc];
'encode_jingle_reason_$reason'('incompatible-parameters' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_incompatible_parameters(Reason,
                                                  __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'('media-error' = Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_media_error(Reason, __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'('security-error' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_security_error(Reason, __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'(success = Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_success(Reason, __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'(timeout = Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_timeout(Reason, __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'('unsupported-applications' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_unsupported_applications(Reason,
                                                   __TopXMLNS)
     | _acc];
'encode_jingle_reason_$reason'('unsupported-transports' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [encode_jingle_reason_unsupported_transports(Reason,
                                                 __TopXMLNS)
     | _acc].

decode_jingle_reason_text(__TopXMLNS, __Opts,
                          {xmlel, <<"text">>, _attrs, _els}) ->
    Data = decode_jingle_reason_text_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         <<>>),
    Lang = decode_jingle_reason_text_attrs(__TopXMLNS,
                                           _attrs,
                                           undefined),
    {text, Lang, Data}.

decode_jingle_reason_text_els(__TopXMLNS, __Opts, [],
                              Data) ->
    decode_jingle_reason_text_cdata(__TopXMLNS, Data);
decode_jingle_reason_text_els(__TopXMLNS, __Opts,
                              [{xmlcdata, _data} | _els], Data) ->
    decode_jingle_reason_text_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<Data/binary, _data/binary>>);
decode_jingle_reason_text_els(__TopXMLNS, __Opts,
                              [_ | _els], Data) ->
    decode_jingle_reason_text_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  Data).

decode_jingle_reason_text_attrs(__TopXMLNS,
                                [{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_jingle_reason_text_attrs(__TopXMLNS,
                                    _attrs,
                                    _val);
decode_jingle_reason_text_attrs(__TopXMLNS,
                                [_ | _attrs], Lang) ->
    decode_jingle_reason_text_attrs(__TopXMLNS,
                                    _attrs,
                                    Lang);
decode_jingle_reason_text_attrs(__TopXMLNS, [], Lang) ->
    'decode_jingle_reason_text_attr_xml:lang'(__TopXMLNS,
                                              Lang).

encode_jingle_reason_text({text, Lang, Data},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_jingle_reason_text_cdata(Data, []),
    _attrs = 'encode_jingle_reason_text_attr_xml:lang'(Lang,
                                                       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                  __TopXMLNS)),
    {xmlel, <<"text">>, _attrs, _els}.

'decode_jingle_reason_text_attr_xml:lang'(__TopXMLNS,
                                          undefined) ->
    <<>>;
'decode_jingle_reason_text_attr_xml:lang'(__TopXMLNS,
                                          _val) ->
    case catch xmpp_lang:check(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"xml:lang">>,
                           <<"text">>,
                           __TopXMLNS}});
        _res -> _res
    end.

'encode_jingle_reason_text_attr_xml:lang'(<<>>, _acc) ->
    _acc;
'encode_jingle_reason_text_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_jingle_reason_text_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_jingle_reason_text_cdata(__TopXMLNS, _val) ->
    _val.

encode_jingle_reason_text_cdata(<<>>, _acc) -> _acc;
encode_jingle_reason_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_jingle_reason_unsupported_transports(__TopXMLNS,
                                            __Opts,
                                            {xmlel,
                                             <<"unsupported-transports">>,
                                             _attrs,
                                             _els}) ->
    'unsupported-transports'.

encode_jingle_reason_unsupported_transports('unsupported-transports',
                                            __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"unsupported-transports">>, _attrs, _els}.

decode_jingle_reason_unsupported_applications(__TopXMLNS,
                                              __Opts,
                                              {xmlel,
                                               <<"unsupported-applications">>,
                                               _attrs,
                                               _els}) ->
    'unsupported-applications'.

encode_jingle_reason_unsupported_applications('unsupported-applications',
                                              __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"unsupported-applications">>, _attrs, _els}.

decode_jingle_reason_timeout(__TopXMLNS, __Opts,
                             {xmlel, <<"timeout">>, _attrs, _els}) ->
    timeout.

encode_jingle_reason_timeout(timeout, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"timeout">>, _attrs, _els}.

decode_jingle_reason_success(__TopXMLNS, __Opts,
                             {xmlel, <<"success">>, _attrs, _els}) ->
    success.

encode_jingle_reason_success(success, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"success">>, _attrs, _els}.

decode_jingle_reason_security_error(__TopXMLNS, __Opts,
                                    {xmlel,
                                     <<"security-error">>,
                                     _attrs,
                                     _els}) ->
    'security-error'.

encode_jingle_reason_security_error('security-error',
                                    __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"security-error">>, _attrs, _els}.

decode_jingle_reason_media_error(__TopXMLNS, __Opts,
                                 {xmlel, <<"media-error">>, _attrs, _els}) ->
    'media-error'.

encode_jingle_reason_media_error('media-error',
                                 __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"media-error">>, _attrs, _els}.

decode_jingle_reason_incompatible_parameters(__TopXMLNS,
                                             __Opts,
                                             {xmlel,
                                              <<"incompatible-parameters">>,
                                              _attrs,
                                              _els}) ->
    'incompatible-parameters'.

encode_jingle_reason_incompatible_parameters('incompatible-parameters',
                                             __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"incompatible-parameters">>, _attrs, _els}.

decode_jingle_reason_gone(__TopXMLNS, __Opts,
                          {xmlel, <<"gone">>, _attrs, _els}) ->
    gone.

encode_jingle_reason_gone(gone, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"gone">>, _attrs, _els}.

decode_jingle_reason_general_error(__TopXMLNS, __Opts,
                                   {xmlel,
                                    <<"general-error">>,
                                    _attrs,
                                    _els}) ->
    'general-error'.

encode_jingle_reason_general_error('general-error',
                                   __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"general-error">>, _attrs, _els}.

decode_jingle_reason_failed_transport(__TopXMLNS,
                                      __Opts,
                                      {xmlel,
                                       <<"failed-transport">>,
                                       _attrs,
                                       _els}) ->
    'failed-transport'.

encode_jingle_reason_failed_transport('failed-transport',
                                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"failed-transport">>, _attrs, _els}.

decode_jingle_reason_failed_application(__TopXMLNS,
                                        __Opts,
                                        {xmlel,
                                         <<"failed-application">>,
                                         _attrs,
                                         _els}) ->
    'failed-application'.

encode_jingle_reason_failed_application('failed-application',
                                        __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"failed-application">>, _attrs, _els}.

decode_jingle_reason_expired(__TopXMLNS, __Opts,
                             {xmlel, <<"expired">>, _attrs, _els}) ->
    expired.

encode_jingle_reason_expired(expired, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"expired">>, _attrs, _els}.

decode_jingle_reason_decline(__TopXMLNS, __Opts,
                             {xmlel, <<"decline">>, _attrs, _els}) ->
    decline.

encode_jingle_reason_decline(decline, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"decline">>, _attrs, _els}.

decode_jingle_reason_connectivity_error(__TopXMLNS,
                                        __Opts,
                                        {xmlel,
                                         <<"connectivity-error">>,
                                         _attrs,
                                         _els}) ->
    'connectivity-error'.

encode_jingle_reason_connectivity_error('connectivity-error',
                                        __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"connectivity-error">>, _attrs, _els}.

decode_jingle_reason_cancel(__TopXMLNS, __Opts,
                            {xmlel, <<"cancel">>, _attrs, _els}) ->
    cancel.

encode_jingle_reason_cancel(cancel, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"cancel">>, _attrs, _els}.

decode_jingle_reason_busy(__TopXMLNS, __Opts,
                          {xmlel, <<"busy">>, _attrs, _els}) ->
    busy.

encode_jingle_reason_busy(busy, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"busy">>, _attrs, _els}.

decode_jingle_reason_alternative_session(__TopXMLNS,
                                         __Opts,
                                         {xmlel,
                                          <<"alternative-session">>,
                                          _attrs,
                                          _els}) ->
    'alternative-session'.

encode_jingle_reason_alternative_session('alternative-session',
                                         __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"alternative-session">>, _attrs, _els}.

decode_jingle_error_security_required(__TopXMLNS,
                                      __Opts,
                                      {xmlel,
                                       <<"security-required">>,
                                       _attrs,
                                       _els}) ->
    {jingle_error, 'security-required'}.

encode_jingle_error_security_required({jingle_error,
                                       'security-required'},
                                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:errors:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"security-required">>, _attrs, _els}.

decode_jingle_error_unsupported_info(__TopXMLNS, __Opts,
                                     {xmlel,
                                      <<"unsupported-info">>,
                                      _attrs,
                                      _els}) ->
    {jingle_error, 'unsupported-info'}.

encode_jingle_error_unsupported_info({jingle_error,
                                      'unsupported-info'},
                                     __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:errors:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"unsupported-info">>, _attrs, _els}.

decode_jingle_error_unknown_session(__TopXMLNS, __Opts,
                                    {xmlel,
                                     <<"unknown-session">>,
                                     _attrs,
                                     _els}) ->
    {jingle_error, 'unknown-session'}.

encode_jingle_error_unknown_session({jingle_error,
                                     'unknown-session'},
                                    __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:errors:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"unknown-session">>, _attrs, _els}.

decode_jingle_error_tie_break(__TopXMLNS, __Opts,
                              {xmlel, <<"tie-break">>, _attrs, _els}) ->
    {jingle_error, 'tie-break'}.

encode_jingle_error_tie_break({jingle_error,
                               'tie-break'},
                              __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:errors:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"tie-break">>, _attrs, _els}.

decode_jingle_error_out_of_order(__TopXMLNS, __Opts,
                                 {xmlel, <<"out-of-order">>, _attrs, _els}) ->
    {jingle_error, 'out-of-order'}.

encode_jingle_error_out_of_order({jingle_error,
                                  'out-of-order'},
                                 __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:errors:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"out-of-order">>, _attrs, _els}.
