%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0386).

-compile(export_all).

do_decode(<<"feature">>, <<"urn:xmpp:bind:0">>, El,
          Opts) ->
    decode_bind2_feature(<<"urn:xmpp:bind:0">>, Opts, El);
do_decode(<<"bound">>, <<"urn:xmpp:bind:0">>, El,
          Opts) ->
    decode_bind2_bound(<<"urn:xmpp:bind:0">>, Opts, El);
do_decode(<<"tag">>, <<"urn:xmpp:bind:0">>, El, Opts) ->
    decode_bind2_tag(<<"urn:xmpp:bind:0">>, Opts, El);
do_decode(<<"inline">>, <<"urn:xmpp:bind:0">>, El,
          Opts) ->
    decode_bind2_inline(<<"urn:xmpp:bind:0">>, Opts, El);
do_decode(<<"bind">>, <<"urn:xmpp:bind:0">>, El,
          Opts) ->
    decode_bind2_bind(<<"urn:xmpp:bind:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"feature">>, <<"urn:xmpp:bind:0">>},
     {<<"bound">>, <<"urn:xmpp:bind:0">>},
     {<<"tag">>, <<"urn:xmpp:bind:0">>},
     {<<"inline">>, <<"urn:xmpp:bind:0">>},
     {<<"bind">>, <<"urn:xmpp:bind:0">>}].

do_encode({bind2_bind, _, _, _} = Bind, TopXMLNS) ->
    encode_bind2_bind(Bind, TopXMLNS);
do_encode({bind2_bound, _} = Bound, TopXMLNS) ->
    encode_bind2_bound(Bound, TopXMLNS);
do_encode({bind2_feature, _} = Feature, TopXMLNS) ->
    encode_bind2_feature(Feature, TopXMLNS).

do_get_name({bind2_bind, _, _, _}) -> <<"bind">>;
do_get_name({bind2_bound, _}) -> <<"bound">>;
do_get_name({bind2_feature, _}) -> <<"feature">>.

do_get_ns({bind2_bind, _, _, _}) ->
    <<"urn:xmpp:bind:0">>;
do_get_ns({bind2_bound, _}) -> <<"urn:xmpp:bind:0">>;
do_get_ns({bind2_feature, _}) -> <<"urn:xmpp:bind:0">>.

get_els({bind2_bind, _tag, _inline, _sub_els}) ->
    _sub_els;
get_els({bind2_bound, _sub_els}) -> _sub_els.

set_els({bind2_bind, _tag, _inline, _}, _sub_els) ->
    {bind2_bind, _tag, _inline, _sub_els};
set_els({bind2_bound, _}, _sub_els) ->
    {bind2_bound, _sub_els}.

pp(bind2_bind, 3) -> [tag, inline, sub_els];
pp(bind2_bound, 1) -> [sub_els];
pp(bind2_feature, 1) -> [var];
pp(_, _) -> no.

records() ->
    [{bind2_bind, 3}, {bind2_bound, 1}, {bind2_feature, 1}].

decode_bind2_feature(__TopXMLNS, __Opts,
                     {xmlel, <<"feature">>, _attrs, _els}) ->
    Var = decode_bind2_feature_attrs(__TopXMLNS,
                                     _attrs,
                                     undefined),
    {bind2_feature, Var}.

decode_bind2_feature_attrs(__TopXMLNS,
                           [{<<"var">>, _val} | _attrs], _Var) ->
    decode_bind2_feature_attrs(__TopXMLNS, _attrs, _val);
decode_bind2_feature_attrs(__TopXMLNS, [_ | _attrs],
                           Var) ->
    decode_bind2_feature_attrs(__TopXMLNS, _attrs, Var);
decode_bind2_feature_attrs(__TopXMLNS, [], Var) ->
    decode_bind2_feature_attr_var(__TopXMLNS, Var).

encode_bind2_feature({bind2_feature, Var},
                     __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bind:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_bind2_feature_attr_var(Var,
                                           xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                      __TopXMLNS)),
    {xmlel, <<"feature">>, _attrs, _els}.

decode_bind2_feature_attr_var(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"var">>, <<"feature">>, __TopXMLNS}});
decode_bind2_feature_attr_var(__TopXMLNS, _val) -> _val.

encode_bind2_feature_attr_var(_val, _acc) ->
    [{<<"var">>, _val} | _acc].

decode_bind2_bound(__TopXMLNS, __Opts,
                   {xmlel, <<"bound">>, _attrs, _els}) ->
    __Els = decode_bind2_bound_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   []),
    {bind2_bound, __Els}.

decode_bind2_bound_els(__TopXMLNS, __Opts, [], __Els) ->
    lists:reverse(__Els);
decode_bind2_bound_els(__TopXMLNS, __Opts,
                       [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_bind2_bound_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_bind2_bound_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           [_el | __Els]);
                Mod ->
                    decode_bind2_bound_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           [Mod:do_decode(_name,
                                                          __XMLNS,
                                                          _el,
                                                          __Opts)
                                            | __Els])
            end
    end;
decode_bind2_bound_els(__TopXMLNS, __Opts, [_ | _els],
                       __Els) ->
    decode_bind2_bound_els(__TopXMLNS, __Opts, _els, __Els).

encode_bind2_bound({bind2_bound, __Els}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bind:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"bound">>, _attrs, _els}.

decode_bind2_tag(__TopXMLNS, __Opts,
                 {xmlel, <<"tag">>, _attrs, _els}) ->
    Tag = decode_bind2_tag_els(__TopXMLNS,
                               __Opts,
                               _els,
                               <<>>),
    Tag.

decode_bind2_tag_els(__TopXMLNS, __Opts, [], Tag) ->
    decode_bind2_tag_cdata(__TopXMLNS, Tag);
decode_bind2_tag_els(__TopXMLNS, __Opts,
                     [{xmlcdata, _data} | _els], Tag) ->
    decode_bind2_tag_els(__TopXMLNS,
                         __Opts,
                         _els,
                         <<Tag/binary, _data/binary>>);
decode_bind2_tag_els(__TopXMLNS, __Opts, [_ | _els],
                     Tag) ->
    decode_bind2_tag_els(__TopXMLNS, __Opts, _els, Tag).

encode_bind2_tag(Tag, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bind:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_bind2_tag_cdata(Tag, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"tag">>, _attrs, _els}.

decode_bind2_tag_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"tag">>, __TopXMLNS}});
decode_bind2_tag_cdata(__TopXMLNS, _val) -> _val.

encode_bind2_tag_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_bind2_inline(__TopXMLNS, __Opts,
                    {xmlel, <<"inline">>, _attrs, _els}) ->
    __Els = decode_bind2_inline_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    []),
    __Els.

decode_bind2_inline_els(__TopXMLNS, __Opts, [],
                        __Els) ->
    lists:reverse(__Els);
decode_bind2_inline_els(__TopXMLNS, __Opts,
                        [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_bind2_inline_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_bind2_inline_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            [_el | __Els]);
                Mod ->
                    decode_bind2_inline_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            [Mod:do_decode(_name,
                                                           __XMLNS,
                                                           _el,
                                                           __Opts)
                                             | __Els])
            end
    end;
decode_bind2_inline_els(__TopXMLNS, __Opts, [_ | _els],
                        __Els) ->
    decode_bind2_inline_els(__TopXMLNS,
                            __Opts,
                            _els,
                            __Els).

encode_bind2_inline(__Els, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bind:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"inline">>, _attrs, _els}.

decode_bind2_bind(__TopXMLNS, __Opts,
                  {xmlel, <<"bind">>, _attrs, _els}) ->
    {Inline, Tag, __Els} = decode_bind2_bind_els(__TopXMLNS,
                                                 __Opts,
                                                 _els,
                                                 undefined,
                                                 undefined,
                                                 []),
    {bind2_bind, Tag, Inline, __Els}.

decode_bind2_bind_els(__TopXMLNS, __Opts, [], Inline,
                      Tag, __Els) ->
    {Inline, Tag, lists:reverse(__Els)};
decode_bind2_bind_els(__TopXMLNS, __Opts,
                      [{xmlel, <<"inline">>, _attrs, _} = _el | _els], Inline,
                      Tag, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:bind:0">> ->
            decode_bind2_bind_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  decode_bind2_inline(<<"urn:xmpp:bind:0">>,
                                                      __Opts,
                                                      _el),
                                  Tag,
                                  __Els);
        _ ->
            decode_bind2_bind_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  Inline,
                                  Tag,
                                  [_el | __Els])
    end;
decode_bind2_bind_els(__TopXMLNS, __Opts,
                      [{xmlel, <<"tag">>, _attrs, _} = _el | _els], Inline,
                      Tag, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:bind:0">> ->
            decode_bind2_bind_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  Inline,
                                  decode_bind2_tag(<<"urn:xmpp:bind:0">>,
                                                   __Opts,
                                                   _el),
                                  __Els);
        _ ->
            decode_bind2_bind_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  Inline,
                                  Tag,
                                  [_el | __Els])
    end;
decode_bind2_bind_els(__TopXMLNS, __Opts,
                      [{xmlel, _name, _attrs, _} = _el | _els], Inline, Tag,
                      __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_bind2_bind_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  Inline,
                                  Tag,
                                  [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_bind2_bind_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          Inline,
                                          Tag,
                                          [_el | __Els]);
                Mod ->
                    decode_bind2_bind_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          Inline,
                                          Tag,
                                          [Mod:do_decode(_name,
                                                         __XMLNS,
                                                         _el,
                                                         __Opts)
                                           | __Els])
            end
    end;
decode_bind2_bind_els(__TopXMLNS, __Opts, [_ | _els],
                      Inline, Tag, __Els) ->
    decode_bind2_bind_els(__TopXMLNS,
                          __Opts,
                          _els,
                          Inline,
                          Tag,
                          __Els).

encode_bind2_bind({bind2_bind, Tag, Inline, __Els},
                  __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bind:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_bind2_bind_$inline'(Inline,
                                                         __NewTopXMLNS,
                                                         'encode_bind2_bind_$tag'(Tag,
                                                                                  __NewTopXMLNS,
                                                                                  []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"bind">>, _attrs, _els}.

'encode_bind2_bind_$inline'(undefined, __TopXMLNS,
                            _acc) ->
    _acc;
'encode_bind2_bind_$inline'(Inline, __TopXMLNS, _acc) ->
    [encode_bind2_inline(Inline, __TopXMLNS) | _acc].

'encode_bind2_bind_$tag'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_bind2_bind_$tag'(Tag, __TopXMLNS, _acc) ->
    [encode_bind2_tag(Tag, __TopXMLNS) | _acc].
