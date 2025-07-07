%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0485).

-compile(export_all).

do_decode(<<"connection">>, <<"urn:xmpp:serverinfo:0">>,
          El, Opts) ->
    decode_pubsub_serverinfo_connection(<<"urn:xmpp:serverinfo:0">>,
                                        Opts,
                                        El);
do_decode(<<"remote-domain">>,
          <<"urn:xmpp:serverinfo:0">>, El, Opts) ->
    decode_pubsub_serverinfo_remote_domain(<<"urn:xmpp:serverinfo:0">>,
                                           Opts,
                                           El);
do_decode(<<"federation">>, <<"urn:xmpp:serverinfo:0">>,
          El, Opts) ->
    decode_pubsub_serverinfo_federation(<<"urn:xmpp:serverinfo:0">>,
                                        Opts,
                                        El);
do_decode(<<"domain">>, <<"urn:xmpp:serverinfo:0">>, El,
          Opts) ->
    decode_pubsub_serverinfo_domain(<<"urn:xmpp:serverinfo:0">>,
                                    Opts,
                                    El);
do_decode(<<"serverinfo">>, <<"urn:xmpp:serverinfo:0">>,
          El, Opts) ->
    decode_pubsub_serverinfo(<<"urn:xmpp:serverinfo:0">>,
                             Opts,
                             El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"connection">>, <<"urn:xmpp:serverinfo:0">>},
     {<<"remote-domain">>, <<"urn:xmpp:serverinfo:0">>},
     {<<"federation">>, <<"urn:xmpp:serverinfo:0">>},
     {<<"domain">>, <<"urn:xmpp:serverinfo:0">>},
     {<<"serverinfo">>, <<"urn:xmpp:serverinfo:0">>}].

do_encode({pubsub_serverinfo, _} = Serverinfo,
          TopXMLNS) ->
    encode_pubsub_serverinfo(Serverinfo, TopXMLNS);
do_encode({pubsub_serverinfo_domain, _, _} = Domain,
          TopXMLNS) ->
    encode_pubsub_serverinfo_domain(Domain, TopXMLNS);
do_encode({pubsub_serverinfo_remote_domain, _, _} =
              Remote_domain,
          TopXMLNS) ->
    encode_pubsub_serverinfo_remote_domain(Remote_domain,
                                           TopXMLNS).

do_get_name({pubsub_serverinfo, _}) -> <<"serverinfo">>;
do_get_name({pubsub_serverinfo_domain, _, _}) ->
    <<"domain">>;
do_get_name({pubsub_serverinfo_remote_domain, _, _}) ->
    <<"remote-domain">>.

do_get_ns({pubsub_serverinfo, _}) ->
    <<"urn:xmpp:serverinfo:0">>;
do_get_ns({pubsub_serverinfo_domain, _, _}) ->
    <<"urn:xmpp:serverinfo:0">>;
do_get_ns({pubsub_serverinfo_remote_domain, _, _}) ->
    <<"urn:xmpp:serverinfo:0">>.

pp(pubsub_serverinfo, 1) -> [domain];
pp(pubsub_serverinfo_domain, 2) ->
    [name, remote_domain];
pp(pubsub_serverinfo_remote_domain, 2) -> [name, type];
pp(_, _) -> no.

records() ->
    [{pubsub_serverinfo, 1},
     {pubsub_serverinfo_domain, 2},
     {pubsub_serverinfo_remote_domain, 2}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
        true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_pubsub_serverinfo_connection(__TopXMLNS, __Opts,
                                    {xmlel, <<"connection">>, _attrs, _els}) ->
    Type =
        decode_pubsub_serverinfo_connection_attrs(__TopXMLNS,
                                                  _attrs,
                                                  undefined),
    Type.

decode_pubsub_serverinfo_connection_attrs(__TopXMLNS,
                                          [{<<"type">>, _val} | _attrs],
                                          _Type) ->
    decode_pubsub_serverinfo_connection_attrs(__TopXMLNS,
                                              _attrs,
                                              _val);
decode_pubsub_serverinfo_connection_attrs(__TopXMLNS,
                                          [_ | _attrs], Type) ->
    decode_pubsub_serverinfo_connection_attrs(__TopXMLNS,
                                              _attrs,
                                              Type);
decode_pubsub_serverinfo_connection_attrs(__TopXMLNS,
                                          [], Type) ->
    decode_pubsub_serverinfo_connection_attr_type(__TopXMLNS,
                                                  Type).

encode_pubsub_serverinfo_connection(Type, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:serverinfo:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs =
        encode_pubsub_serverinfo_connection_attr_type(Type,
                                                      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                 __TopXMLNS)),
    {xmlel, <<"connection">>, _attrs, _els}.

decode_pubsub_serverinfo_connection_attr_type(__TopXMLNS,
                                              undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"type">>,
                   <<"connection">>,
                   __TopXMLNS}});
decode_pubsub_serverinfo_connection_attr_type(__TopXMLNS,
                                              _val) ->
    case catch dec_enum(_val, [incoming, outgoing, bidi]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"type">>,
                           <<"connection">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_pubsub_serverinfo_connection_attr_type(_val,
                                              _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_pubsub_serverinfo_remote_domain(__TopXMLNS,
                                       __Opts,
                                       {xmlel,
                                        <<"remote-domain">>,
                                        _attrs,
                                        _els}) ->
    Type =
        decode_pubsub_serverinfo_remote_domain_els(__TopXMLNS,
                                                   __Opts,
                                                   _els,
                                                   []),
    Name =
        decode_pubsub_serverinfo_remote_domain_attrs(__TopXMLNS,
                                                     _attrs,
                                                     undefined),
    {pubsub_serverinfo_remote_domain, Name, Type}.

decode_pubsub_serverinfo_remote_domain_els(__TopXMLNS,
                                           __Opts, [], Type) ->
    lists:reverse(Type);
decode_pubsub_serverinfo_remote_domain_els(__TopXMLNS,
                                           __Opts,
                                           [{xmlel,
                                             <<"connection">>,
                                             _attrs,
                                             _} =
                                                _el
                                            | _els],
                                           Type) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:serverinfo:0">> ->
            decode_pubsub_serverinfo_remote_domain_els(__TopXMLNS,
                                                       __Opts,
                                                       _els,
                                                       [decode_pubsub_serverinfo_connection(<<"urn:xmpp:serverinfo:0">>,
                                                                                            __Opts,
                                                                                            _el)
                                                        | Type]);
        _ ->
            decode_pubsub_serverinfo_remote_domain_els(__TopXMLNS,
                                                       __Opts,
                                                       _els,
                                                       Type)
    end;
decode_pubsub_serverinfo_remote_domain_els(__TopXMLNS,
                                           __Opts, [_ | _els], Type) ->
    decode_pubsub_serverinfo_remote_domain_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               Type).

decode_pubsub_serverinfo_remote_domain_attrs(__TopXMLNS,
                                             [{<<"name">>, _val} | _attrs],
                                             _Name) ->
    decode_pubsub_serverinfo_remote_domain_attrs(__TopXMLNS,
                                                 _attrs,
                                                 _val);
decode_pubsub_serverinfo_remote_domain_attrs(__TopXMLNS,
                                             [_ | _attrs], Name) ->
    decode_pubsub_serverinfo_remote_domain_attrs(__TopXMLNS,
                                                 _attrs,
                                                 Name);
decode_pubsub_serverinfo_remote_domain_attrs(__TopXMLNS,
                                             [], Name) ->
    decode_pubsub_serverinfo_remote_domain_attr_name(__TopXMLNS,
                                                     Name).

encode_pubsub_serverinfo_remote_domain({pubsub_serverinfo_remote_domain,
                                        Name,
                                        Type},
                                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:serverinfo:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_pubsub_serverinfo_remote_domain_$type'(Type,
                                                                     __NewTopXMLNS,
                                                                     [])),
    _attrs =
        encode_pubsub_serverinfo_remote_domain_attr_name(Name,
                                                         xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                    __TopXMLNS)),
    {xmlel, <<"remote-domain">>, _attrs, _els}.

'encode_pubsub_serverinfo_remote_domain_$type'([],
                                               __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_serverinfo_remote_domain_$type'([Type
                                                | _els],
                                               __TopXMLNS, _acc) ->
    'encode_pubsub_serverinfo_remote_domain_$type'(_els,
                                                   __TopXMLNS,
                                                   [encode_pubsub_serverinfo_connection(Type,
                                                                                        __TopXMLNS)
                                                    | _acc]).

decode_pubsub_serverinfo_remote_domain_attr_name(__TopXMLNS,
                                                 undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"name">>,
                   <<"remote-domain">>,
                   __TopXMLNS}});
decode_pubsub_serverinfo_remote_domain_attr_name(__TopXMLNS,
                                                 _val) ->
    _val.

encode_pubsub_serverinfo_remote_domain_attr_name(_val,
                                                 _acc) ->
    [{<<"name">>, _val} | _acc].

decode_pubsub_serverinfo_federation(__TopXMLNS, __Opts,
                                    {xmlel, <<"federation">>, _attrs, _els}) ->
    Remote_domain =
        decode_pubsub_serverinfo_federation_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                []),
    Remote_domain.

decode_pubsub_serverinfo_federation_els(__TopXMLNS,
                                        __Opts, [], Remote_domain) ->
    lists:reverse(Remote_domain);
decode_pubsub_serverinfo_federation_els(__TopXMLNS,
                                        __Opts,
                                        [{xmlel,
                                          <<"remote-domain">>,
                                          _attrs,
                                          _} =
                                             _el
                                         | _els],
                                        Remote_domain) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:serverinfo:0">> ->
            decode_pubsub_serverinfo_federation_els(__TopXMLNS,
                                                    __Opts,
                                                    _els,
                                                    [decode_pubsub_serverinfo_remote_domain(<<"urn:xmpp:serverinfo:0">>,
                                                                                            __Opts,
                                                                                            _el)
                                                     | Remote_domain]);
        _ ->
            decode_pubsub_serverinfo_federation_els(__TopXMLNS,
                                                    __Opts,
                                                    _els,
                                                    Remote_domain)
    end;
decode_pubsub_serverinfo_federation_els(__TopXMLNS,
                                        __Opts, [_ | _els], Remote_domain) ->
    decode_pubsub_serverinfo_federation_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Remote_domain).

encode_pubsub_serverinfo_federation(Remote_domain,
                                    __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:serverinfo:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_pubsub_serverinfo_federation_$remote_domain'(Remote_domain,
                                                                           __NewTopXMLNS,
                                                                           [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"federation">>, _attrs, _els}.

'encode_pubsub_serverinfo_federation_$remote_domain'([],
                                                     __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_serverinfo_federation_$remote_domain'([Remote_domain
                                                      | _els],
                                                     __TopXMLNS, _acc) ->
    'encode_pubsub_serverinfo_federation_$remote_domain'(_els,
                                                         __TopXMLNS,
                                                         [encode_pubsub_serverinfo_remote_domain(Remote_domain,
                                                                                                 __TopXMLNS)
                                                          | _acc]).

decode_pubsub_serverinfo_domain(__TopXMLNS, __Opts,
                                {xmlel, <<"domain">>, _attrs, _els}) ->
    Remote_domain =
        decode_pubsub_serverinfo_domain_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            undefined),
    Name = decode_pubsub_serverinfo_domain_attrs(__TopXMLNS,
                                                 _attrs,
                                                 undefined),
    {pubsub_serverinfo_domain, Name, Remote_domain}.

decode_pubsub_serverinfo_domain_els(__TopXMLNS, __Opts,
                                    [], Remote_domain) ->
    Remote_domain;
decode_pubsub_serverinfo_domain_els(__TopXMLNS, __Opts,
                                    [{xmlel, <<"federation">>, _attrs, _} = _el
                                     | _els],
                                    Remote_domain) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:serverinfo:0">> ->
            decode_pubsub_serverinfo_domain_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                decode_pubsub_serverinfo_federation(<<"urn:xmpp:serverinfo:0">>,
                                                                                    __Opts,
                                                                                    _el));
        _ ->
            decode_pubsub_serverinfo_domain_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                Remote_domain)
    end;
decode_pubsub_serverinfo_domain_els(__TopXMLNS, __Opts,
                                    [_ | _els], Remote_domain) ->
    decode_pubsub_serverinfo_domain_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Remote_domain).

decode_pubsub_serverinfo_domain_attrs(__TopXMLNS,
                                      [{<<"name">>, _val} | _attrs], _Name) ->
    decode_pubsub_serverinfo_domain_attrs(__TopXMLNS,
                                          _attrs,
                                          _val);
decode_pubsub_serverinfo_domain_attrs(__TopXMLNS,
                                      [_ | _attrs], Name) ->
    decode_pubsub_serverinfo_domain_attrs(__TopXMLNS,
                                          _attrs,
                                          Name);
decode_pubsub_serverinfo_domain_attrs(__TopXMLNS, [],
                                      Name) ->
    decode_pubsub_serverinfo_domain_attr_name(__TopXMLNS,
                                              Name).

encode_pubsub_serverinfo_domain({pubsub_serverinfo_domain,
                                 Name,
                                 Remote_domain},
                                __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:serverinfo:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_pubsub_serverinfo_domain_$remote_domain'(Remote_domain,
                                                                       __NewTopXMLNS,
                                                                       [])),
    _attrs = encode_pubsub_serverinfo_domain_attr_name(Name,
                                                       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                  __TopXMLNS)),
    {xmlel, <<"domain">>, _attrs, _els}.

'encode_pubsub_serverinfo_domain_$remote_domain'(undefined,
                                                 __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_serverinfo_domain_$remote_domain'(Remote_domain,
                                                 __TopXMLNS, _acc) ->
    [encode_pubsub_serverinfo_federation(Remote_domain,
                                         __TopXMLNS)
     | _acc].

decode_pubsub_serverinfo_domain_attr_name(__TopXMLNS,
                                          undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"name">>, <<"domain">>, __TopXMLNS}});
decode_pubsub_serverinfo_domain_attr_name(__TopXMLNS,
                                          _val) ->
    _val.

encode_pubsub_serverinfo_domain_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_pubsub_serverinfo(__TopXMLNS, __Opts,
                         {xmlel, <<"serverinfo">>, _attrs, _els}) ->
    Domain = decode_pubsub_serverinfo_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          []),
    {pubsub_serverinfo, Domain}.

decode_pubsub_serverinfo_els(__TopXMLNS, __Opts, [],
                             Domain) ->
    lists:reverse(Domain);
decode_pubsub_serverinfo_els(__TopXMLNS, __Opts,
                             [{xmlel, <<"domain">>, _attrs, _} = _el | _els],
                             Domain) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:serverinfo:0">> ->
            decode_pubsub_serverinfo_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         [decode_pubsub_serverinfo_domain(<<"urn:xmpp:serverinfo:0">>,
                                                                          __Opts,
                                                                          _el)
                                          | Domain]);
        _ ->
            decode_pubsub_serverinfo_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         Domain)
    end;
decode_pubsub_serverinfo_els(__TopXMLNS, __Opts,
                             [_ | _els], Domain) ->
    decode_pubsub_serverinfo_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 Domain).

encode_pubsub_serverinfo({pubsub_serverinfo, Domain},
                         __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:serverinfo:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_pubsub_serverinfo_$domain'(Domain,
                                                         __NewTopXMLNS,
                                                         [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"serverinfo">>, _attrs, _els}.

'encode_pubsub_serverinfo_$domain'([], __TopXMLNS,
                                   _acc) ->
    _acc;
'encode_pubsub_serverinfo_$domain'([Domain | _els],
                                   __TopXMLNS, _acc) ->
    'encode_pubsub_serverinfo_$domain'(_els,
                                       __TopXMLNS,
                                       [encode_pubsub_serverinfo_domain(Domain,
                                                                        __TopXMLNS)
                                        | _acc]).
