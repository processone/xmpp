%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0424).

-compile(export_all).

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
    [{<<"retracted">>, <<"urn:xmpp:message-retract:1">>},
     {<<"retract">>, <<"urn:xmpp:message-retract:1">>}].

do_encode({message_retract, _} = Retract, TopXMLNS) ->
    encode_message_retract(Retract, TopXMLNS);
do_encode({message_retracted, _, _, _, _, _} =
              Retracted,
          TopXMLNS) ->
    encode_message_retracted(Retracted, TopXMLNS).

do_get_name({message_retract, _}) -> <<"retract">>;
do_get_name({message_retracted, _, _, _, _, _}) ->
    <<"retracted">>.

do_get_ns({message_retract, _}) ->
    <<"urn:xmpp:message-retract:1">>;
do_get_ns({message_retracted, _, _, _, _, _}) ->
    <<"urn:xmpp:message-retract:1">>.

get_els({message_retracted,
         _id,
         _by,
         _from,
         _stamp,
         _sub_els}) ->
    _sub_els.

set_els({message_retracted, _id, _by, _from, _stamp, _},
        _sub_els) ->
    {message_retracted, _id, _by, _from, _stamp, _sub_els}.

pp(message_retract, 1) -> [id];
pp(message_retracted, 5) ->
    [id, by, from, stamp, sub_els];
pp(_, _) -> no.

records() ->
    [{message_retract, 1}, {message_retracted, 5}].

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

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
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"stamp">>,
                   <<"retracted">>,
                   __TopXMLNS}});
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

encode_message_retracted_attr_stamp(_val, _acc) ->
    [{<<"stamp">>, enc_utc(_val)} | _acc].

decode_message_retract(__TopXMLNS, __Opts,
                       {xmlel, <<"retract">>, _attrs, _els}) ->
    Id = decode_message_retract_attrs(__TopXMLNS,
                                      _attrs,
                                      undefined),
    {message_retract, Id}.

decode_message_retract_attrs(__TopXMLNS,
                             [{<<"id">>, _val} | _attrs], _Id) ->
    decode_message_retract_attrs(__TopXMLNS, _attrs, _val);
decode_message_retract_attrs(__TopXMLNS, [_ | _attrs],
                             Id) ->
    decode_message_retract_attrs(__TopXMLNS, _attrs, Id);
decode_message_retract_attrs(__TopXMLNS, [], Id) ->
    decode_message_retract_attr_id(__TopXMLNS, Id).

encode_message_retract({message_retract, Id},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:message-retract:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_message_retract_attr_id(Id,
                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                       __TopXMLNS)),
    {xmlel, <<"retract">>, _attrs, _els}.

decode_message_retract_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"id">>, <<"retract">>, __TopXMLNS}});
decode_message_retract_attr_id(__TopXMLNS, _val) ->
    _val.

encode_message_retract_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].
