%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0215).

-compile(export_all).

do_decode(<<"credentials">>, <<"urn:xmpp:extdisco:2">>,
          El, Opts) ->
    decode_credentials(<<"urn:xmpp:extdisco:2">>, Opts, El);
do_decode(<<"services">>, <<"urn:xmpp:extdisco:2">>, El,
          Opts) ->
    decode_services(<<"urn:xmpp:extdisco:2">>, Opts, El);
do_decode(<<"service">>, <<"urn:xmpp:extdisco:2">>, El,
          Opts) ->
    decode_service(<<"urn:xmpp:extdisco:2">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"credentials">>, <<"urn:xmpp:extdisco:2">>},
     {<<"services">>, <<"urn:xmpp:extdisco:2">>},
     {<<"service">>, <<"urn:xmpp:extdisco:2">>}].

do_encode({service, _, _, _, _, _, _, _, _, _, _, _} =
              Service,
          TopXMLNS) ->
    encode_service(Service, TopXMLNS);
do_encode({services, _, _} = Services, TopXMLNS) ->
    encode_services(Services, TopXMLNS);
do_encode({credentials, _} = Credentials, TopXMLNS) ->
    encode_credentials(Credentials, TopXMLNS).

do_get_name({credentials, _}) -> <<"credentials">>;
do_get_name({service,
             _,
             _,
             _,
             _,
             _,
             _,
             _,
             _,
             _,
             _,
             _}) ->
    <<"service">>;
do_get_name({services, _, _}) -> <<"services">>.

do_get_ns({credentials, _}) ->
    <<"urn:xmpp:extdisco:2">>;
do_get_ns({service, _, _, _, _, _, _, _, _, _, _, _}) ->
    <<"urn:xmpp:extdisco:2">>;
do_get_ns({services, _, _}) ->
    <<"urn:xmpp:extdisco:2">>.

pp(service, 11) ->
    [action,
     expires,
     host,
     name,
     password,
     port,
     restricted,
     transport,
     type,
     username,
     xdata];
pp(services, 2) -> [type, list];
pp(credentials, 1) -> [services];
pp(_, _) -> no.

records() ->
    [{service, 11}, {services, 2}, {credentials, 1}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
        true -> AtomVal
    end.

dec_host(S) -> try dec_ip(S) catch _:_ -> S end.

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

dec_ip(S) ->
    {ok, Addr} = inet_parse:address(binary_to_list(S)),
    Addr.

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_host(Addr) when is_tuple(Addr) -> enc_ip(Addr);
enc_host(Host) -> Host.

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_ip({0, 0, 0, 0, 0, 65535, A, B}) ->
    enc_ip({(A bsr 8) band 255,
            A band 255,
            (B bsr 8) band 255,
            B band 255});
enc_ip(Addr) -> list_to_binary(inet_parse:ntoa(Addr)).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_credentials(__TopXMLNS, __Opts,
                   {xmlel, <<"credentials">>, _attrs, _els}) ->
    Services = decode_credentials_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      []),
    {credentials, Services}.

decode_credentials_els(__TopXMLNS, __Opts, [],
                       Services) ->
    lists:reverse(Services);
decode_credentials_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"service">>, _attrs, _} = _el | _els],
                       Services) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:extdisco:2">> ->
            decode_credentials_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   [decode_service(<<"urn:xmpp:extdisco:2">>,
                                                   __Opts,
                                                   _el)
                                    | Services]);
        _ ->
            decode_credentials_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Services)
    end;
decode_credentials_els(__TopXMLNS, __Opts, [_ | _els],
                       Services) ->
    decode_credentials_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Services).

encode_credentials({credentials, Services},
                   __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:extdisco:2">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_credentials_$services'(Services,
                                                     __NewTopXMLNS,
                                                     [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"credentials">>, _attrs, _els}.

'encode_credentials_$services'([], __TopXMLNS, _acc) ->
    _acc;
'encode_credentials_$services'([Services | _els],
                               __TopXMLNS, _acc) ->
    'encode_credentials_$services'(_els,
                                   __TopXMLNS,
                                   [encode_service(Services, __TopXMLNS)
                                    | _acc]).

decode_services(__TopXMLNS, __Opts,
                {xmlel, <<"services">>, _attrs, _els}) ->
    List = decode_services_els(__TopXMLNS,
                               __Opts,
                               _els,
                               []),
    Type = decode_services_attrs(__TopXMLNS,
                                 _attrs,
                                 undefined),
    {services, Type, List}.

decode_services_els(__TopXMLNS, __Opts, [], List) ->
    lists:reverse(List);
decode_services_els(__TopXMLNS, __Opts,
                    [{xmlel, <<"service">>, _attrs, _} = _el | _els],
                    List) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:extdisco:2">> ->
            decode_services_els(__TopXMLNS,
                                __Opts,
                                _els,
                                [decode_service(<<"urn:xmpp:extdisco:2">>,
                                                __Opts,
                                                _el)
                                 | List]);
        _ -> decode_services_els(__TopXMLNS, __Opts, _els, List)
    end;
decode_services_els(__TopXMLNS, __Opts, [_ | _els],
                    List) ->
    decode_services_els(__TopXMLNS, __Opts, _els, List).

decode_services_attrs(__TopXMLNS,
                      [{<<"type">>, _val} | _attrs], _Type) ->
    decode_services_attrs(__TopXMLNS, _attrs, _val);
decode_services_attrs(__TopXMLNS, [_ | _attrs], Type) ->
    decode_services_attrs(__TopXMLNS, _attrs, Type);
decode_services_attrs(__TopXMLNS, [], Type) ->
    decode_services_attr_type(__TopXMLNS, Type).

encode_services({services, Type, List}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:extdisco:2">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_services_$list'(List,
                                                 __NewTopXMLNS,
                                                 [])),
    _attrs = encode_services_attr_type(Type,
                                       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                  __TopXMLNS)),
    {xmlel, <<"services">>, _attrs, _els}.

'encode_services_$list'([], __TopXMLNS, _acc) -> _acc;
'encode_services_$list'([List | _els], __TopXMLNS,
                        _acc) ->
    'encode_services_$list'(_els,
                            __TopXMLNS,
                            [encode_service(List, __TopXMLNS) | _acc]).

decode_services_attr_type(__TopXMLNS, undefined) ->
    undefined;
decode_services_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [stun, turn, stuns, turns]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"type">>,
                           <<"services">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_services_attr_type(undefined, _acc) -> _acc;
encode_services_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_service(__TopXMLNS, __Opts,
               {xmlel, <<"service">>, _attrs, _els}) ->
    Xdata = decode_service_els(__TopXMLNS,
                               __Opts,
                               _els,
                               undefined),
    {Action,
     Expires,
     Host,
     Name,
     Password,
     Port,
     Restricted,
     Transport,
     Type,
     Username} =
        decode_service_attrs(__TopXMLNS,
                             _attrs,
                             undefined,
                             undefined,
                             undefined,
                             undefined,
                             undefined,
                             undefined,
                             undefined,
                             undefined,
                             undefined,
                             undefined),
    {service,
     Action,
     Expires,
     Host,
     Name,
     Password,
     Port,
     Restricted,
     Transport,
     Type,
     Username,
     Xdata}.

decode_service_els(__TopXMLNS, __Opts, [], Xdata) ->
    Xdata;
decode_service_els(__TopXMLNS, __Opts,
                   [{xmlel, <<"x">>, _attrs, _} = _el | _els], Xdata) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"jabber:x:data">> ->
            decode_service_els(__TopXMLNS,
                               __Opts,
                               _els,
                               xep0004:decode_xdata(<<"jabber:x:data">>,
                                                    __Opts,
                                                    _el));
        _ -> decode_service_els(__TopXMLNS, __Opts, _els, Xdata)
    end;
decode_service_els(__TopXMLNS, __Opts, [_ | _els],
                   Xdata) ->
    decode_service_els(__TopXMLNS, __Opts, _els, Xdata).

decode_service_attrs(__TopXMLNS,
                     [{<<"action">>, _val} | _attrs], _Action, Expires, Host,
                     Name, Password, Port, Restricted, Transport, Type,
                     Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         _val,
                         Expires,
                         Host,
                         Name,
                         Password,
                         Port,
                         Restricted,
                         Transport,
                         Type,
                         Username);
decode_service_attrs(__TopXMLNS,
                     [{<<"expires">>, _val} | _attrs], Action, _Expires,
                     Host, Name, Password, Port, Restricted, Transport, Type,
                     Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         _val,
                         Host,
                         Name,
                         Password,
                         Port,
                         Restricted,
                         Transport,
                         Type,
                         Username);
decode_service_attrs(__TopXMLNS,
                     [{<<"host">>, _val} | _attrs], Action, Expires, _Host,
                     Name, Password, Port, Restricted, Transport, Type,
                     Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         Expires,
                         _val,
                         Name,
                         Password,
                         Port,
                         Restricted,
                         Transport,
                         Type,
                         Username);
decode_service_attrs(__TopXMLNS,
                     [{<<"name">>, _val} | _attrs], Action, Expires, Host,
                     _Name, Password, Port, Restricted, Transport, Type,
                     Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         Expires,
                         Host,
                         _val,
                         Password,
                         Port,
                         Restricted,
                         Transport,
                         Type,
                         Username);
decode_service_attrs(__TopXMLNS,
                     [{<<"password">>, _val} | _attrs], Action, Expires,
                     Host, Name, _Password, Port, Restricted, Transport,
                     Type, Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         Expires,
                         Host,
                         Name,
                         _val,
                         Port,
                         Restricted,
                         Transport,
                         Type,
                         Username);
decode_service_attrs(__TopXMLNS,
                     [{<<"port">>, _val} | _attrs], Action, Expires, Host,
                     Name, Password, _Port, Restricted, Transport, Type,
                     Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         Expires,
                         Host,
                         Name,
                         Password,
                         _val,
                         Restricted,
                         Transport,
                         Type,
                         Username);
decode_service_attrs(__TopXMLNS,
                     [{<<"restricted">>, _val} | _attrs], Action, Expires,
                     Host, Name, Password, Port, _Restricted, Transport,
                     Type, Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         Expires,
                         Host,
                         Name,
                         Password,
                         Port,
                         _val,
                         Transport,
                         Type,
                         Username);
decode_service_attrs(__TopXMLNS,
                     [{<<"transport">>, _val} | _attrs], Action, Expires,
                     Host, Name, Password, Port, Restricted, _Transport,
                     Type, Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         Expires,
                         Host,
                         Name,
                         Password,
                         Port,
                         Restricted,
                         _val,
                         Type,
                         Username);
decode_service_attrs(__TopXMLNS,
                     [{<<"type">>, _val} | _attrs], Action, Expires, Host,
                     Name, Password, Port, Restricted, Transport, _Type,
                     Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         Expires,
                         Host,
                         Name,
                         Password,
                         Port,
                         Restricted,
                         Transport,
                         _val,
                         Username);
decode_service_attrs(__TopXMLNS,
                     [{<<"username">>, _val} | _attrs], Action, Expires,
                     Host, Name, Password, Port, Restricted, Transport, Type,
                     _Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         Expires,
                         Host,
                         Name,
                         Password,
                         Port,
                         Restricted,
                         Transport,
                         Type,
                         _val);
decode_service_attrs(__TopXMLNS, [_ | _attrs], Action,
                     Expires, Host, Name, Password, Port, Restricted,
                     Transport, Type, Username) ->
    decode_service_attrs(__TopXMLNS,
                         _attrs,
                         Action,
                         Expires,
                         Host,
                         Name,
                         Password,
                         Port,
                         Restricted,
                         Transport,
                         Type,
                         Username);
decode_service_attrs(__TopXMLNS, [], Action, Expires,
                     Host, Name, Password, Port, Restricted, Transport, Type,
                     Username) ->
    {decode_service_attr_action(__TopXMLNS, Action),
     decode_service_attr_expires(__TopXMLNS, Expires),
     decode_service_attr_host(__TopXMLNS, Host),
     decode_service_attr_name(__TopXMLNS, Name),
     decode_service_attr_password(__TopXMLNS, Password),
     decode_service_attr_port(__TopXMLNS, Port),
     decode_service_attr_restricted(__TopXMLNS, Restricted),
     decode_service_attr_transport(__TopXMLNS, Transport),
     decode_service_attr_type(__TopXMLNS, Type),
     decode_service_attr_username(__TopXMLNS, Username)}.

encode_service({service,
                Action,
                Expires,
                Host,
                Name,
                Password,
                Port,
                Restricted,
                Transport,
                Type,
                Username,
                Xdata},
               __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:extdisco:2">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_service_$xdata'(Xdata,
                                                 __NewTopXMLNS,
                                                 [])),
    _attrs = encode_service_attr_username(Username,
                                          encode_service_attr_type(Type,
                                                                   encode_service_attr_transport(Transport,
                                                                                                 encode_service_attr_restricted(Restricted,
                                                                                                                                encode_service_attr_port(Port,
                                                                                                                                                         encode_service_attr_password(Password,
                                                                                                                                                                                      encode_service_attr_name(Name,
                                                                                                                                                                                                               encode_service_attr_host(Host,
                                                                                                                                                                                                                                        encode_service_attr_expires(Expires,
                                                                                                                                                                                                                                                                    encode_service_attr_action(Action,
                                                                                                                                                                                                                                                                                               xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                                                                                                                                                                                          __TopXMLNS))))))))))),
    {xmlel, <<"service">>, _attrs, _els}.

'encode_service_$xdata'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_service_$xdata'(Xdata, __TopXMLNS, _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

decode_service_attr_action(__TopXMLNS, undefined) ->
    undefined;
decode_service_attr_action(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [add, remove, modify]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"action">>,
                           <<"service">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_service_attr_action(undefined, _acc) -> _acc;
encode_service_attr_action(_val, _acc) ->
    [{<<"action">>, enc_enum(_val)} | _acc].

decode_service_attr_expires(__TopXMLNS, undefined) ->
    undefined;
decode_service_attr_expires(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"expires">>,
                           <<"service">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_service_attr_expires(undefined, _acc) -> _acc;
encode_service_attr_expires(_val, _acc) ->
    [{<<"expires">>, enc_utc(_val)} | _acc].

decode_service_attr_host(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"host">>, <<"service">>, __TopXMLNS}});
decode_service_attr_host(__TopXMLNS, _val) ->
    case catch dec_host(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"host">>,
                           <<"service">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_service_attr_host(_val, _acc) ->
    [{<<"host">>, enc_host(_val)} | _acc].

decode_service_attr_name(__TopXMLNS, undefined) -> <<>>;
decode_service_attr_name(__TopXMLNS, _val) -> _val.

encode_service_attr_name(<<>>, _acc) -> _acc;
encode_service_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_service_attr_password(__TopXMLNS, undefined) ->
    <<>>;
decode_service_attr_password(__TopXMLNS, _val) -> _val.

encode_service_attr_password(<<>>, _acc) -> _acc;
encode_service_attr_password(_val, _acc) ->
    [{<<"password">>, _val} | _acc].

decode_service_attr_port(__TopXMLNS, undefined) ->
    undefined;
decode_service_attr_port(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, 65535) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"port">>,
                           <<"service">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_service_attr_port(undefined, _acc) -> _acc;
encode_service_attr_port(_val, _acc) ->
    [{<<"port">>, enc_int(_val)} | _acc].

decode_service_attr_restricted(__TopXMLNS, undefined) ->
    undefined;
decode_service_attr_restricted(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"restricted">>,
                           <<"service">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_service_attr_restricted(undefined, _acc) -> _acc;
encode_service_attr_restricted(_val, _acc) ->
    [{<<"restricted">>, enc_bool(_val)} | _acc].

decode_service_attr_transport(__TopXMLNS, undefined) ->
    undefined;
decode_service_attr_transport(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [tcp, udp]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"transport">>,
                           <<"service">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_service_attr_transport(undefined, _acc) -> _acc;
encode_service_attr_transport(_val, _acc) ->
    [{<<"transport">>, enc_enum(_val)} | _acc].

decode_service_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"type">>, <<"service">>, __TopXMLNS}});
decode_service_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [stun, turn, stuns, turns]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"type">>,
                           <<"service">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_service_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_service_attr_username(__TopXMLNS, undefined) ->
    <<>>;
decode_service_attr_username(__TopXMLNS, _val) -> _val.

encode_service_attr_username(<<>>, _acc) -> _acc;
encode_service_attr_username(_val, _acc) ->
    [{<<"username">>, _val} | _acc].
