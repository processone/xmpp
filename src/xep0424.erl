%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0424).

-compile(export_all).

do_decode(<<"retracted">>,
          <<"urn:xmpp:message-retract:0">>, El, Opts) ->
    decode_message_retracted_30(<<"urn:xmpp:message-retract:0">>,
                                Opts,
                                El);
do_decode(<<"retract">>,
          <<"urn:xmpp:message-retract:0">>, El, Opts) ->
    decode_message_retract_30(<<"urn:xmpp:message-retract:0">>,
                              Opts,
                              El);
do_decode(<<"retracted">>,
          <<"urn:xmpp:message-retract:1">>, El, Opts) ->
    decode_message_retracted(<<"urn:xmpp:message-retract:1">>,
                             Opts,
                             El);
do_decode(<<"retract">>,
          <<"urn:xmpp:message-retract:1">>, El, Opts) ->
    decode_message_retract(<<"urn:xmpp:message-retract:1">>,
                           Opts,
                           El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"retracted">>, <<"urn:xmpp:message-retract:0">>},
     {<<"retract">>, <<"urn:xmpp:message-retract:0">>},
     {<<"retracted">>, <<"urn:xmpp:message-retract:1">>},
     {<<"retract">>, <<"urn:xmpp:message-retract:1">>}].

do_encode({message_retract, _, _, _} = Retract,
          TopXMLNS) ->
    encode_message_retract(Retract, TopXMLNS);
do_encode({message_retracted, _, _, _, _, _} =
              Retracted,
          TopXMLNS) ->
    encode_message_retracted(Retracted, TopXMLNS);
do_encode({message_retract_30} = Retract, TopXMLNS) ->
    encode_message_retract_30(Retract, TopXMLNS);
do_encode({message_retracted_30, _, _, _, _} =
              Retracted,
          TopXMLNS) ->
    encode_message_retracted_30(Retracted, TopXMLNS).

do_get_name({message_retract, _, _, _}) ->
    <<"retract">>;
do_get_name({message_retract_30}) -> <<"retract">>;
do_get_name({message_retracted, _, _, _, _, _}) ->
    <<"retracted">>;
do_get_name({message_retracted_30, _, _, _, _}) ->
    <<"retracted">>.

do_get_ns({message_retract, _, _, _}) ->
    <<"urn:xmpp:message-retract:1">>;
do_get_ns({message_retract_30}) ->
    <<"urn:xmpp:message-retract:0">>;
do_get_ns({message_retracted, _, _, _, _, _}) ->
    <<"urn:xmpp:message-retract:1">>;
do_get_ns({message_retracted_30, _, _, _, _}) ->
    <<"urn:xmpp:message-retract:0">>.

get_els({message_retracted,
         _id,
         _by,
         _from,
         _stamp,
         _sub_els}) ->
    _sub_els;
get_els({message_retracted_30,
         _by,
         _from,
         _stamp,
         _sub_els}) ->
    _sub_els.

set_els({message_retracted, _id, _by, _from, _stamp, _},
        _sub_els) ->
    {message_retracted, _id, _by, _from, _stamp, _sub_els};
set_els({message_retracted_30, _by, _from, _stamp, _},
        _sub_els) ->
    {message_retracted_30, _by, _from, _stamp, _sub_els}.

pp(message_retract, 3) -> [id, reason, moderated];
pp(message_retracted, 5) ->
    [id, by, from, stamp, sub_els];
pp(message_retract_30, 0) -> [];
pp(message_retracted_30, 4) ->
    [by, from, stamp, sub_els];
pp(_, _) -> no.

records() ->
    [{message_retract, 3},
     {message_retracted, 5},
     {message_retract_30, 0},
     {message_retracted_30, 4}].

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_message_retracted_30(__TopXMLNS, __Opts,
                            {xmlel, <<"retracted">>, _attrs, _els}) ->
    __Els = decode_message_retracted_30_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            []),
    {By, From, Stamp} =
        decode_message_retracted_30_attrs(__TopXMLNS,
                                          _attrs,
                                          undefined,
                                          undefined,
                                          undefined),
    {message_retracted_30, By, From, Stamp, __Els}.

decode_message_retracted_30_els(__TopXMLNS, __Opts, [],
                                __Els) ->
    lists:reverse(__Els);
decode_message_retracted_30_els(__TopXMLNS, __Opts,
                                [{xmlel, _name, _attrs, _} = _el | _els],
                                __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_message_retracted_30_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_message_retracted_30_els(__TopXMLNS,
                                                    __Opts,
                                                    _els,
                                                    [_el | __Els]);
                Mod ->
                    decode_message_retracted_30_els(__TopXMLNS,
                                                    __Opts,
                                                    _els,
                                                    [Mod:do_decode(_name,
                                                                   __XMLNS,
                                                                   _el,
                                                                   __Opts)
                                                     | __Els])
            end
    end;
decode_message_retracted_30_els(__TopXMLNS, __Opts,
                                [_ | _els], __Els) ->
    decode_message_retracted_30_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    __Els).

decode_message_retracted_30_attrs(__TopXMLNS,
                                  [{<<"by">>, _val} | _attrs], _By, From,
                                  Stamp) ->
    decode_message_retracted_30_attrs(__TopXMLNS,
                                      _attrs,
                                      _val,
                                      From,
                                      Stamp);
decode_message_retracted_30_attrs(__TopXMLNS,
                                  [{<<"from">>, _val} | _attrs], By, _From,
                                  Stamp) ->
    decode_message_retracted_30_attrs(__TopXMLNS,
                                      _attrs,
                                      By,
                                      _val,
                                      Stamp);
decode_message_retracted_30_attrs(__TopXMLNS,
                                  [{<<"stamp">>, _val} | _attrs], By, From,
                                  _Stamp) ->
    decode_message_retracted_30_attrs(__TopXMLNS,
                                      _attrs,
                                      By,
                                      From,
                                      _val);
decode_message_retracted_30_attrs(__TopXMLNS,
                                  [_ | _attrs], By, From, Stamp) ->
    decode_message_retracted_30_attrs(__TopXMLNS,
                                      _attrs,
                                      By,
                                      From,
                                      Stamp);
decode_message_retracted_30_attrs(__TopXMLNS, [], By,
                                  From, Stamp) ->
    {decode_message_retracted_30_attr_by(__TopXMLNS, By),
     decode_message_retracted_30_attr_from(__TopXMLNS, From),
     decode_message_retracted_30_attr_stamp(__TopXMLNS,
                                            Stamp)}.

encode_message_retracted_30({message_retracted_30,
                             By,
                             From,
                             Stamp,
                             __Els},
                            __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:message-retract:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = encode_message_retracted_30_attr_stamp(Stamp,
                                                    encode_message_retracted_30_attr_from(From,
                                                                                          encode_message_retracted_30_attr_by(By,
                                                                                                                              xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                         __TopXMLNS)))),
    {xmlel, <<"retracted">>, _attrs, _els}.

decode_message_retracted_30_attr_by(__TopXMLNS,
                                    undefined) ->
    undefined;
decode_message_retracted_30_attr_by(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"by">>,
                           <<"retracted">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_message_retracted_30_attr_by(undefined, _acc) ->
    _acc;
encode_message_retracted_30_attr_by(_val, _acc) ->
    [{<<"by">>, jid:encode(_val)} | _acc].

decode_message_retracted_30_attr_from(__TopXMLNS,
                                      undefined) ->
    <<>>;
decode_message_retracted_30_attr_from(__TopXMLNS,
                                      _val) ->
    _val.

encode_message_retracted_30_attr_from(<<>>, _acc) ->
    _acc;
encode_message_retracted_30_attr_from(_val, _acc) ->
    [{<<"from">>, _val} | _acc].

decode_message_retracted_30_attr_stamp(__TopXMLNS,
                                       undefined) ->
    undefined;
decode_message_retracted_30_attr_stamp(__TopXMLNS,
                                       _val) ->
    case catch dec_utc(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"stamp">>,
                           <<"retracted">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_message_retracted_30_attr_stamp(undefined,
                                       _acc) ->
    _acc;
encode_message_retracted_30_attr_stamp(_val, _acc) ->
    [{<<"stamp">>, enc_utc(_val)} | _acc].

decode_message_retract_30(__TopXMLNS, __Opts,
                          {xmlel, <<"retract">>, _attrs, _els}) ->
    {message_retract_30}.

encode_message_retract_30({message_retract_30},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:message-retract:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"retract">>, _attrs, _els}.

decode_message_retracted(__TopXMLNS, __Opts,
                         {xmlel, <<"retracted">>, _attrs, _els}) ->
    __Els = decode_message_retracted_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         []),
    {Id, By, From, Stamp} =
        decode_message_retracted_attrs(__TopXMLNS,
                                       _attrs,
                                       undefined,
                                       undefined,
                                       undefined,
                                       undefined),
    {message_retracted, Id, By, From, Stamp, __Els}.

decode_message_retracted_els(__TopXMLNS, __Opts, [],
                             __Els) ->
    lists:reverse(__Els);
decode_message_retracted_els(__TopXMLNS, __Opts,
                             [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_message_retracted_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_message_retracted_els(__TopXMLNS,
                                                 __Opts,
                                                 _els,
                                                 [_el | __Els]);
                Mod ->
                    decode_message_retracted_els(__TopXMLNS,
                                                 __Opts,
                                                 _els,
                                                 [Mod:do_decode(_name,
                                                                __XMLNS,
                                                                _el,
                                                                __Opts)
                                                  | __Els])
            end
    end;
decode_message_retracted_els(__TopXMLNS, __Opts,
                             [_ | _els], __Els) ->
    decode_message_retracted_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 __Els).

decode_message_retracted_attrs(__TopXMLNS,
                               [{<<"id">>, _val} | _attrs], _Id, By, From,
                               Stamp) ->
    decode_message_retracted_attrs(__TopXMLNS,
                                   _attrs,
                                   _val,
                                   By,
                                   From,
                                   Stamp);
decode_message_retracted_attrs(__TopXMLNS,
                               [{<<"by">>, _val} | _attrs], Id, _By, From,
                               Stamp) ->
    decode_message_retracted_attrs(__TopXMLNS,
                                   _attrs,
                                   Id,
                                   _val,
                                   From,
                                   Stamp);
decode_message_retracted_attrs(__TopXMLNS,
                               [{<<"from">>, _val} | _attrs], Id, By, _From,
                               Stamp) ->
    decode_message_retracted_attrs(__TopXMLNS,
                                   _attrs,
                                   Id,
                                   By,
                                   _val,
                                   Stamp);
decode_message_retracted_attrs(__TopXMLNS,
                               [{<<"stamp">>, _val} | _attrs], Id, By, From,
                               _Stamp) ->
    decode_message_retracted_attrs(__TopXMLNS,
                                   _attrs,
                                   Id,
                                   By,
                                   From,
                                   _val);
decode_message_retracted_attrs(__TopXMLNS, [_ | _attrs],
                               Id, By, From, Stamp) ->
    decode_message_retracted_attrs(__TopXMLNS,
                                   _attrs,
                                   Id,
                                   By,
                                   From,
                                   Stamp);
decode_message_retracted_attrs(__TopXMLNS, [], Id, By,
                               From, Stamp) ->
    {decode_message_retracted_attr_id(__TopXMLNS, Id),
     decode_message_retracted_attr_by(__TopXMLNS, By),
     decode_message_retracted_attr_from(__TopXMLNS, From),
     decode_message_retracted_attr_stamp(__TopXMLNS, Stamp)}.

encode_message_retracted({message_retracted,
                          Id,
                          By,
                          From,
                          Stamp,
                          __Els},
                         __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:message-retract:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = encode_message_retracted_attr_stamp(Stamp,
                                                 encode_message_retracted_attr_from(From,
                                                                                    encode_message_retracted_attr_by(By,
                                                                                                                     encode_message_retracted_attr_id(Id,
                                                                                                                                                      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                                                 __TopXMLNS))))),
    {xmlel, <<"retracted">>, _attrs, _els}.

decode_message_retracted_attr_id(__TopXMLNS,
                                 undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"id">>, <<"retracted">>, __TopXMLNS}});
decode_message_retracted_attr_id(__TopXMLNS, _val) ->
    _val.

encode_message_retracted_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_message_retracted_attr_by(__TopXMLNS,
                                 undefined) ->
    undefined;
decode_message_retracted_attr_by(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"by">>,
                           <<"retracted">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_message_retracted_attr_by(undefined, _acc) ->
    _acc;
encode_message_retracted_attr_by(_val, _acc) ->
    [{<<"by">>, jid:encode(_val)} | _acc].

decode_message_retracted_attr_from(__TopXMLNS,
                                   undefined) ->
    <<>>;
decode_message_retracted_attr_from(__TopXMLNS, _val) ->
    _val.

encode_message_retracted_attr_from(<<>>, _acc) -> _acc;
encode_message_retracted_attr_from(_val, _acc) ->
    [{<<"from">>, _val} | _acc].

decode_message_retracted_attr_stamp(__TopXMLNS,
                                    undefined) ->
    undefined;
decode_message_retracted_attr_stamp(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"stamp">>,
                           <<"retracted">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_message_retracted_attr_stamp(undefined, _acc) ->
    _acc;
encode_message_retracted_attr_stamp(_val, _acc) ->
    [{<<"stamp">>, enc_utc(_val)} | _acc].

decode_message_retract(__TopXMLNS, __Opts,
                       {xmlel, <<"retract">>, _attrs, _els}) ->
    {Moderated, Reason} =
        decode_message_retract_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   undefined,
                                   undefined),
    Id = decode_message_retract_attrs(__TopXMLNS,
                                      _attrs,
                                      undefined),
    {message_retract, Id, Reason, Moderated}.

decode_message_retract_els(__TopXMLNS, __Opts, [],
                           Moderated, Reason) ->
    {Moderated, Reason};
decode_message_retract_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"reason">>, _attrs, _} = _el | _els],
                           Moderated, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:message-moderate:1">> ->
            decode_message_retract_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Moderated,
                                       xep0425:decode_message_moderate_reason(<<"urn:xmpp:message-moderate:1">>,
                                                                              __Opts,
                                                                              _el));
        _ ->
            decode_message_retract_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Moderated,
                                       Reason)
    end;
decode_message_retract_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"moderated">>, _attrs, _} = _el | _els],
                           Moderated, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:message-moderate:1">> ->
            decode_message_retract_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       xep0425:decode_message_moderated(<<"urn:xmpp:message-moderate:1">>,
                                                                        __Opts,
                                                                        _el),
                                       Reason);
        _ ->
            decode_message_retract_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Moderated,
                                       Reason)
    end;
decode_message_retract_els(__TopXMLNS, __Opts,
                           [_ | _els], Moderated, Reason) ->
    decode_message_retract_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Moderated,
                               Reason).

decode_message_retract_attrs(__TopXMLNS,
                             [{<<"id">>, _val} | _attrs], _Id) ->
    decode_message_retract_attrs(__TopXMLNS, _attrs, _val);
decode_message_retract_attrs(__TopXMLNS, [_ | _attrs],
                             Id) ->
    decode_message_retract_attrs(__TopXMLNS, _attrs, Id);
decode_message_retract_attrs(__TopXMLNS, [], Id) ->
    decode_message_retract_attr_id(__TopXMLNS, Id).

encode_message_retract({message_retract,
                        Id,
                        Reason,
                        Moderated},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:message-retract:1">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_message_retract_$moderated'(Moderated,
                                                          __NewTopXMLNS,
                                                          'encode_message_retract_$reason'(Reason,
                                                                                           __NewTopXMLNS,
                                                                                           []))),
    _attrs = encode_message_retract_attr_id(Id,
                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                       __TopXMLNS)),
    {xmlel, <<"retract">>, _attrs, _els}.

'encode_message_retract_$moderated'(undefined,
                                    __TopXMLNS, _acc) ->
    _acc;
'encode_message_retract_$moderated'(Moderated,
                                    __TopXMLNS, _acc) ->
    [xep0425:encode_message_moderated(Moderated, __TopXMLNS)
     | _acc].

'encode_message_retract_$reason'(undefined, __TopXMLNS,
                                 _acc) ->
    _acc;
'encode_message_retract_$reason'(Reason, __TopXMLNS,
                                 _acc) ->
    [xep0425:encode_message_moderate_reason(Reason,
                                            __TopXMLNS)
     | _acc].

decode_message_retract_attr_id(__TopXMLNS, undefined) ->
    <<>>;
decode_message_retract_attr_id(__TopXMLNS, _val) ->
    _val.

encode_message_retract_attr_id(<<>>, _acc) -> _acc;
encode_message_retract_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].
