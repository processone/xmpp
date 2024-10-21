%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0356).

-compile(export_all).

do_decode(<<"privileged_iq">>,
          <<"urn:xmpp:privilege:2">>, El, Opts) ->
    decode_privileged_iq(<<"urn:xmpp:privilege:2">>,
                         Opts,
                         El);
do_decode(<<"privilege">>, <<"urn:xmpp:privilege:2">>,
          El, Opts) ->
    decode_privilege(<<"urn:xmpp:privilege:2">>, Opts, El);
do_decode(<<"perm">>, <<"urn:xmpp:privilege:2">>, El,
          Opts) ->
    decode_privilege_perm(<<"urn:xmpp:privilege:2">>,
                          Opts,
                          El);
do_decode(<<"namespace">>, <<"urn:xmpp:privilege:2">>,
          El, Opts) ->
    decode_privilege_namespace(<<"urn:xmpp:privilege:2">>,
                               Opts,
                               El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"privileged_iq">>, <<"urn:xmpp:privilege:2">>},
     {<<"privilege">>, <<"urn:xmpp:privilege:2">>},
     {<<"perm">>, <<"urn:xmpp:privilege:2">>},
     {<<"namespace">>, <<"urn:xmpp:privilege:2">>}].

do_encode({privilege_namespace, _, _} = Namespace,
          TopXMLNS) ->
    encode_privilege_namespace(Namespace, TopXMLNS);
do_encode({privilege_perm, _, _, _, _} = Perm,
          TopXMLNS) ->
    encode_privilege_perm(Perm, TopXMLNS);
do_encode({privilege, _, _} = Privilege, TopXMLNS) ->
    encode_privilege(Privilege, TopXMLNS);
do_encode({privileged_iq, _} = Privileged_iq,
          TopXMLNS) ->
    encode_privileged_iq(Privileged_iq, TopXMLNS).

do_get_name({privilege, _, _}) -> <<"privilege">>;
do_get_name({privilege_namespace, _, _}) ->
    <<"namespace">>;
do_get_name({privilege_perm, _, _, _, _}) -> <<"perm">>;
do_get_name({privileged_iq, _}) -> <<"privileged_iq">>.

do_get_ns({privilege, _, _}) ->
    <<"urn:xmpp:privilege:2">>;
do_get_ns({privilege_namespace, _, _}) ->
    <<"urn:xmpp:privilege:2">>;
do_get_ns({privilege_perm, _, _, _, _}) ->
    <<"urn:xmpp:privilege:2">>;
do_get_ns({privileged_iq, _}) ->
    <<"urn:xmpp:privilege:2">>.

pp(privilege_namespace, 2) -> [ns, type];
pp(privilege_perm, 4) ->
    [access, type, push, namespaces];
pp(privilege, 2) -> [perms, forwarded];
pp(privileged_iq, 1) -> [iq];
pp(_, _) -> no.

records() ->
    [{privilege_namespace, 2},
     {privilege_perm, 4},
     {privilege, 2},
     {privileged_iq, 1}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
        true -> AtomVal
    end.

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_privileged_iq(__TopXMLNS, __Opts,
                     {xmlel, <<"privileged_iq">>, _attrs, _els}) ->
    Iq = decode_privileged_iq_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  undefined),
    {privileged_iq, Iq}.

decode_privileged_iq_els(__TopXMLNS, __Opts, [], Iq) ->
    Iq;
decode_privileged_iq_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"iq">>, _attrs, _} = _el | _els], Iq) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"jabber:client">> ->
            decode_privileged_iq_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     rfc6120:decode_iq(<<"jabber:client">>,
                                                       __Opts,
                                                       _el));
        <<"jabber:server">> ->
            decode_privileged_iq_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     rfc6120:decode_iq(<<"jabber:server">>,
                                                       __Opts,
                                                       _el));
        <<"jabber:component:accept">> ->
            decode_privileged_iq_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     rfc6120:decode_iq(<<"jabber:component:accept">>,
                                                       __Opts,
                                                       _el));
        _ ->
            decode_privileged_iq_els(__TopXMLNS, __Opts, _els, Iq)
    end;
decode_privileged_iq_els(__TopXMLNS, __Opts, [_ | _els],
                         Iq) ->
    decode_privileged_iq_els(__TopXMLNS, __Opts, _els, Iq).

encode_privileged_iq({privileged_iq, Iq}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:privilege:2">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_privileged_iq_$iq'(Iq,
                                                    __NewTopXMLNS,
                                                    [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"privileged_iq">>, _attrs, _els}.

'encode_privileged_iq_$iq'(undefined, __TopXMLNS,
                           _acc) ->
    _acc;
'encode_privileged_iq_$iq'(Iq, __TopXMLNS, _acc) ->
    [rfc6120:encode_iq(Iq, __TopXMLNS) | _acc].

decode_privilege(__TopXMLNS, __Opts,
                 {xmlel, <<"privilege">>, _attrs, _els}) ->
    {Perms, Forwarded} = decode_privilege_els(__TopXMLNS,
                                              __Opts,
                                              _els,
                                              [],
                                              undefined),
    {privilege, Perms, Forwarded}.

decode_privilege_els(__TopXMLNS, __Opts, [], Perms,
                     Forwarded) ->
    {lists:reverse(Perms), Forwarded};
decode_privilege_els(__TopXMLNS, __Opts,
                     [{xmlel, <<"perm">>, _attrs, _} = _el | _els], Perms,
                     Forwarded) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:privilege:2">> ->
            decode_privilege_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 [decode_privilege_perm(<<"urn:xmpp:privilege:2">>,
                                                        __Opts,
                                                        _el)
                                  | Perms],
                                 Forwarded);
        _ ->
            decode_privilege_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 Perms,
                                 Forwarded)
    end;
decode_privilege_els(__TopXMLNS, __Opts,
                     [{xmlel, <<"forwarded">>, _attrs, _} = _el | _els],
                     Perms, Forwarded) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:forward:0">> ->
            decode_privilege_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 Perms,
                                 xep0297:decode_forwarded(<<"urn:xmpp:forward:0">>,
                                                          __Opts,
                                                          _el));
        _ ->
            decode_privilege_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 Perms,
                                 Forwarded)
    end;
decode_privilege_els(__TopXMLNS, __Opts, [_ | _els],
                     Perms, Forwarded) ->
    decode_privilege_els(__TopXMLNS,
                         __Opts,
                         _els,
                         Perms,
                         Forwarded).

encode_privilege({privilege, Perms, Forwarded},
                 __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:privilege:2">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_privilege_$perms'(Perms,
                                                   __NewTopXMLNS,
                                                   'encode_privilege_$forwarded'(Forwarded,
                                                                                 __NewTopXMLNS,
                                                                                 []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"privilege">>, _attrs, _els}.

'encode_privilege_$perms'([], __TopXMLNS, _acc) -> _acc;
'encode_privilege_$perms'([Perms | _els], __TopXMLNS,
                          _acc) ->
    'encode_privilege_$perms'(_els,
                              __TopXMLNS,
                              [encode_privilege_perm(Perms, __TopXMLNS)
                               | _acc]).

'encode_privilege_$forwarded'(undefined, __TopXMLNS,
                              _acc) ->
    _acc;
'encode_privilege_$forwarded'(Forwarded, __TopXMLNS,
                              _acc) ->
    [xep0297:encode_forwarded(Forwarded, __TopXMLNS)
     | _acc].

decode_privilege_perm(__TopXMLNS, __Opts,
                      {xmlel, <<"perm">>, _attrs, _els}) ->
    Namespaces = decode_privilege_perm_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           []),
    {Access, Type, Push} =
        decode_privilege_perm_attrs(__TopXMLNS,
                                    _attrs,
                                    undefined,
                                    undefined,
                                    undefined),
    {privilege_perm, Access, Type, Push, Namespaces}.

decode_privilege_perm_els(__TopXMLNS, __Opts, [],
                          Namespaces) ->
    lists:reverse(Namespaces);
decode_privilege_perm_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"namespace">>, _attrs, _} = _el | _els],
                          Namespaces) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:privilege:2">> ->
            decode_privilege_perm_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      [decode_privilege_namespace(<<"urn:xmpp:privilege:2">>,
                                                                  __Opts,
                                                                  _el)
                                       | Namespaces]);
        _ ->
            decode_privilege_perm_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Namespaces)
    end;
decode_privilege_perm_els(__TopXMLNS, __Opts,
                          [_ | _els], Namespaces) ->
    decode_privilege_perm_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Namespaces).

decode_privilege_perm_attrs(__TopXMLNS,
                            [{<<"access">>, _val} | _attrs], _Access, Type,
                            Push) ->
    decode_privilege_perm_attrs(__TopXMLNS,
                                _attrs,
                                _val,
                                Type,
                                Push);
decode_privilege_perm_attrs(__TopXMLNS,
                            [{<<"type">>, _val} | _attrs], Access, _Type,
                            Push) ->
    decode_privilege_perm_attrs(__TopXMLNS,
                                _attrs,
                                Access,
                                _val,
                                Push);
decode_privilege_perm_attrs(__TopXMLNS,
                            [{<<"push">>, _val} | _attrs], Access, Type,
                            _Push) ->
    decode_privilege_perm_attrs(__TopXMLNS,
                                _attrs,
                                Access,
                                Type,
                                _val);
decode_privilege_perm_attrs(__TopXMLNS, [_ | _attrs],
                            Access, Type, Push) ->
    decode_privilege_perm_attrs(__TopXMLNS,
                                _attrs,
                                Access,
                                Type,
                                Push);
decode_privilege_perm_attrs(__TopXMLNS, [], Access,
                            Type, Push) ->
    {decode_privilege_perm_attr_access(__TopXMLNS, Access),
     decode_privilege_perm_attr_type(__TopXMLNS, Type),
     decode_privilege_perm_attr_push(__TopXMLNS, Push)}.

encode_privilege_perm({privilege_perm,
                       Access,
                       Type,
                       Push,
                       Namespaces},
                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:privilege:2">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_privilege_perm_$namespaces'(Namespaces,
                                                          __NewTopXMLNS,
                                                          [])),
    _attrs = encode_privilege_perm_attr_push(Push,
                                             encode_privilege_perm_attr_type(Type,
                                                                             encode_privilege_perm_attr_access(Access,
                                                                                                               xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                          __TopXMLNS)))),
    {xmlel, <<"perm">>, _attrs, _els}.

'encode_privilege_perm_$namespaces'([], __TopXMLNS,
                                    _acc) ->
    _acc;
'encode_privilege_perm_$namespaces'([Namespaces | _els],
                                    __TopXMLNS, _acc) ->
    'encode_privilege_perm_$namespaces'(_els,
                                        __TopXMLNS,
                                        [encode_privilege_namespace(Namespaces,
                                                                    __TopXMLNS)
                                         | _acc]).

decode_privilege_perm_attr_access(__TopXMLNS,
                                  undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"access">>, <<"perm">>, __TopXMLNS}});
decode_privilege_perm_attr_access(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
                        [iq, roster, message, presence])
        of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"access">>,
                           <<"perm">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_privilege_perm_attr_access(_val, _acc) ->
    [{<<"access">>, enc_enum(_val)} | _acc].

decode_privilege_perm_attr_type(__TopXMLNS,
                                undefined) ->
    undefined;
decode_privilege_perm_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
                        [none,
                         get,
                         set,
                         both,
                         outgoing,
                         roster,
                         managed_entity])
        of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"type">>,
                           <<"perm">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_privilege_perm_attr_type(undefined, _acc) ->
    _acc;
encode_privilege_perm_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_privilege_perm_attr_push(__TopXMLNS,
                                undefined) ->
    true;
decode_privilege_perm_attr_push(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"push">>,
                           <<"perm">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_privilege_perm_attr_push(true, _acc) -> _acc;
encode_privilege_perm_attr_push(_val, _acc) ->
    [{<<"push">>, enc_bool(_val)} | _acc].

decode_privilege_namespace(__TopXMLNS, __Opts,
                           {xmlel, <<"namespace">>, _attrs, _els}) ->
    {Ns, Type} =
        decode_privilege_namespace_attrs(__TopXMLNS,
                                         _attrs,
                                         undefined,
                                         undefined),
    {privilege_namespace, Ns, Type}.

decode_privilege_namespace_attrs(__TopXMLNS,
                                 [{<<"ns">>, _val} | _attrs], _Ns, Type) ->
    decode_privilege_namespace_attrs(__TopXMLNS,
                                     _attrs,
                                     _val,
                                     Type);
decode_privilege_namespace_attrs(__TopXMLNS,
                                 [{<<"type">>, _val} | _attrs], Ns, _Type) ->
    decode_privilege_namespace_attrs(__TopXMLNS,
                                     _attrs,
                                     Ns,
                                     _val);
decode_privilege_namespace_attrs(__TopXMLNS,
                                 [_ | _attrs], Ns, Type) ->
    decode_privilege_namespace_attrs(__TopXMLNS,
                                     _attrs,
                                     Ns,
                                     Type);
decode_privilege_namespace_attrs(__TopXMLNS, [], Ns,
                                 Type) ->
    {decode_privilege_namespace_attr_ns(__TopXMLNS, Ns),
     decode_privilege_namespace_attr_type(__TopXMLNS, Type)}.

encode_privilege_namespace({privilege_namespace,
                            Ns,
                            Type},
                           __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:privilege:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_privilege_namespace_attr_type(Type,
                                                  encode_privilege_namespace_attr_ns(Ns,
                                                                                     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                __TopXMLNS))),
    {xmlel, <<"namespace">>, _attrs, _els}.

decode_privilege_namespace_attr_ns(__TopXMLNS,
                                   undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"ns">>, <<"namespace">>, __TopXMLNS}});
decode_privilege_namespace_attr_ns(__TopXMLNS, _val) ->
    _val.

encode_privilege_namespace_attr_ns(_val, _acc) ->
    [{<<"ns">>, _val} | _acc].

decode_privilege_namespace_attr_type(__TopXMLNS,
                                     undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"type">>,
                   <<"namespace">>,
                   __TopXMLNS}});
decode_privilege_namespace_attr_type(__TopXMLNS,
                                     _val) ->
    case catch dec_enum(_val, [none, get, set, both]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"type">>,
                           <<"namespace">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_privilege_namespace_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].
