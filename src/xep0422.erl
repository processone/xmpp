%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0422).

-compile(export_all).

do_decode(<<"external">>, <<"urn:xmpp:fasten:0">>, El,
          Opts) ->
    decode_fasten_external(<<"urn:xmpp:fasten:0">>,
                           Opts,
                           El);
do_decode(<<"apply-to">>, <<"urn:xmpp:fasten:0">>, El,
          Opts) ->
    decode_fasten_apply_to(<<"urn:xmpp:fasten:0">>,
                           Opts,
                           El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"external">>, <<"urn:xmpp:fasten:0">>},
     {<<"apply-to">>, <<"urn:xmpp:fasten:0">>}].

do_encode({fasten_apply_to, _, _, _} = Apply_to,
          TopXMLNS) ->
    encode_fasten_apply_to(Apply_to, TopXMLNS);
do_encode({fasten_external, _} = External, TopXMLNS) ->
    encode_fasten_external(External, TopXMLNS).

do_get_name({fasten_apply_to, _, _, _}) ->
    <<"apply-to">>;
do_get_name({fasten_external, _}) -> <<"external">>.

do_get_ns({fasten_apply_to, _, _, _}) ->
    <<"urn:xmpp:fasten:0">>;
do_get_ns({fasten_external, _}) ->
    <<"urn:xmpp:fasten:0">>.

get_els({fasten_apply_to, _id, _external, _sub_els}) ->
    _sub_els.

set_els({fasten_apply_to, _id, _external, _},
        _sub_els) ->
    {fasten_apply_to, _id, _external, _sub_els}.

pp(fasten_apply_to, 3) -> [id, external, sub_els];
pp(fasten_external, 1) -> [name];
pp(_, _) -> no.

records() ->
    [{fasten_apply_to, 3}, {fasten_external, 1}].

decode_fasten_external(__TopXMLNS, __Opts,
                       {xmlel, <<"external">>, _attrs, _els}) ->
    Name = decode_fasten_external_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined),
    {fasten_external, Name}.

decode_fasten_external_attrs(__TopXMLNS,
                             [{<<"name">>, _val} | _attrs], _Name) ->
    decode_fasten_external_attrs(__TopXMLNS, _attrs, _val);
decode_fasten_external_attrs(__TopXMLNS, [_ | _attrs],
                             Name) ->
    decode_fasten_external_attrs(__TopXMLNS, _attrs, Name);
decode_fasten_external_attrs(__TopXMLNS, [], Name) ->
    decode_fasten_external_attr_name(__TopXMLNS, Name).

encode_fasten_external({fasten_external, Name},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:fasten:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_fasten_external_attr_name(Name,
                                              xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                         __TopXMLNS)),
    {xmlel, <<"external">>, _attrs, _els}.

decode_fasten_external_attr_name(__TopXMLNS,
                                 undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"name">>,
                   <<"external">>,
                   __TopXMLNS}});
decode_fasten_external_attr_name(__TopXMLNS, _val) ->
    _val.

encode_fasten_external_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_fasten_apply_to(__TopXMLNS, __Opts,
                       {xmlel, <<"apply-to">>, _attrs, _els}) ->
    {External, __Els} =
        decode_fasten_apply_to_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   undefined,
                                   []),
    Id = decode_fasten_apply_to_attrs(__TopXMLNS,
                                      _attrs,
                                      undefined),
    {fasten_apply_to, Id, External, __Els}.

decode_fasten_apply_to_els(__TopXMLNS, __Opts, [],
                           External, __Els) ->
    {External, lists:reverse(__Els)};
decode_fasten_apply_to_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"external">>, _attrs, _} = _el | _els],
                           External, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:fasten:0">> ->
            decode_fasten_apply_to_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       decode_fasten_external(<<"urn:xmpp:fasten:0">>,
                                                              __Opts,
                                                              _el),
                                       __Els);
        _ ->
            decode_fasten_apply_to_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       External,
                                       [_el | __Els])
    end;
decode_fasten_apply_to_els(__TopXMLNS, __Opts,
                           [{xmlel, _name, _attrs, _} = _el | _els], External,
                           __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_fasten_apply_to_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       External,
                                       [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_fasten_apply_to_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               External,
                                               [_el | __Els]);
                Mod ->
                    decode_fasten_apply_to_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               External,
                                               [Mod:do_decode(_name,
                                                              __XMLNS,
                                                              _el,
                                                              __Opts)
                                                | __Els])
            end
    end;
decode_fasten_apply_to_els(__TopXMLNS, __Opts,
                           [_ | _els], External, __Els) ->
    decode_fasten_apply_to_els(__TopXMLNS,
                               __Opts,
                               _els,
                               External,
                               __Els).

decode_fasten_apply_to_attrs(__TopXMLNS,
                             [{<<"id">>, _val} | _attrs], _Id) ->
    decode_fasten_apply_to_attrs(__TopXMLNS, _attrs, _val);
decode_fasten_apply_to_attrs(__TopXMLNS, [_ | _attrs],
                             Id) ->
    decode_fasten_apply_to_attrs(__TopXMLNS, _attrs, Id);
decode_fasten_apply_to_attrs(__TopXMLNS, [], Id) ->
    decode_fasten_apply_to_attr_id(__TopXMLNS, Id).

encode_fasten_apply_to({fasten_apply_to,
                        Id,
                        External,
                        __Els},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:fasten:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_fasten_apply_to_$external'(External,
                                                                __NewTopXMLNS,
                                                                [])),
    _attrs = encode_fasten_apply_to_attr_id(Id,
                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                       __TopXMLNS)),
    {xmlel, <<"apply-to">>, _attrs, _els}.

'encode_fasten_apply_to_$external'(undefined,
                                   __TopXMLNS, _acc) ->
    _acc;
'encode_fasten_apply_to_$external'(External, __TopXMLNS,
                                   _acc) ->
    [encode_fasten_external(External, __TopXMLNS) | _acc].

decode_fasten_apply_to_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"id">>, <<"apply-to">>, __TopXMLNS}});
decode_fasten_apply_to_attr_id(__TopXMLNS, _val) ->
    _val.

encode_fasten_apply_to_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].
