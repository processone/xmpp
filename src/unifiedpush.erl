%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(unifiedpush).

-compile(export_all).

do_decode(<<"push">>,
          <<"http://gultsch.de/xmpp/drafts/unified-push">>, El,
          Opts) ->
    decode_unified_push_push(<<"http://gultsch.de/xmpp/drafts/unified-push">>,
                             Opts,
                             El);
do_decode(<<"registered">>,
          <<"http://gultsch.de/xmpp/drafts/unified-push">>, El,
          Opts) ->
    decode_unified_push_registered(<<"http://gultsch.de/xmpp/drafts/unified-push">>,
                                   Opts,
                                   El);
do_decode(<<"register">>,
          <<"http://gultsch.de/xmpp/drafts/unified-push">>, El,
          Opts) ->
    decode_unified_push_register(<<"http://gultsch.de/xmpp/drafts/unified-push">>,
                                 Opts,
                                 El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"push">>,
      <<"http://gultsch.de/xmpp/drafts/unified-push">>},
     {<<"registered">>,
      <<"http://gultsch.de/xmpp/drafts/unified-push">>},
     {<<"register">>,
      <<"http://gultsch.de/xmpp/drafts/unified-push">>}].

do_encode({unified_push_register, _, _} = Register,
          TopXMLNS) ->
    encode_unified_push_register(Register, TopXMLNS);
do_encode({unified_push_registered, _, _} = Registered,
          TopXMLNS) ->
    encode_unified_push_registered(Registered, TopXMLNS);
do_encode({unified_push_push, _, _, _} = Push,
          TopXMLNS) ->
    encode_unified_push_push(Push, TopXMLNS).

do_get_name({unified_push_push, _, _, _}) -> <<"push">>;
do_get_name({unified_push_register, _, _}) ->
    <<"register">>;
do_get_name({unified_push_registered, _, _}) ->
    <<"registered">>.

do_get_ns({unified_push_push, _, _, _}) ->
    <<"http://gultsch.de/xmpp/drafts/unified-push">>;
do_get_ns({unified_push_register, _, _}) ->
    <<"http://gultsch.de/xmpp/drafts/unified-push">>;
do_get_ns({unified_push_registered, _, _}) ->
    <<"http://gultsch.de/xmpp/drafts/unified-push">>.

pp(unified_push_register, 2) -> [application, instance];
pp(unified_push_registered, 2) ->
    [expiration, endpoint];
pp(unified_push_push, 3) ->
    [application, instance, data];
pp(_, _) -> no.

records() ->
    [{unified_push_register, 2},
     {unified_push_registered, 2},
     {unified_push_push, 3}].

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_unified_push_push(__TopXMLNS, __Opts,
                         {xmlel, <<"push">>, _attrs, _els}) ->
    Data = decode_unified_push_push_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        <<>>),
    {Application, Instance} =
        decode_unified_push_push_attrs(__TopXMLNS,
                                       _attrs,
                                       undefined,
                                       undefined),
    {unified_push_push, Application, Instance, Data}.

decode_unified_push_push_els(__TopXMLNS, __Opts, [],
                             Data) ->
    decode_unified_push_push_cdata(__TopXMLNS, Data);
decode_unified_push_push_els(__TopXMLNS, __Opts,
                             [{xmlcdata, _data} | _els], Data) ->
    decode_unified_push_push_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 <<Data/binary, _data/binary>>);
decode_unified_push_push_els(__TopXMLNS, __Opts,
                             [_ | _els], Data) ->
    decode_unified_push_push_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 Data).

decode_unified_push_push_attrs(__TopXMLNS,
                               [{<<"application">>, _val} | _attrs],
                               _Application, Instance) ->
    decode_unified_push_push_attrs(__TopXMLNS,
                                   _attrs,
                                   _val,
                                   Instance);
decode_unified_push_push_attrs(__TopXMLNS,
                               [{<<"instance">>, _val} | _attrs], Application,
                               _Instance) ->
    decode_unified_push_push_attrs(__TopXMLNS,
                                   _attrs,
                                   Application,
                                   _val);
decode_unified_push_push_attrs(__TopXMLNS, [_ | _attrs],
                               Application, Instance) ->
    decode_unified_push_push_attrs(__TopXMLNS,
                                   _attrs,
                                   Application,
                                   Instance);
decode_unified_push_push_attrs(__TopXMLNS, [],
                               Application, Instance) ->
    {decode_unified_push_push_attr_application(__TopXMLNS,
                                               Application),
     decode_unified_push_push_attr_instance(__TopXMLNS,
                                            Instance)}.

encode_unified_push_push({unified_push_push,
                          Application,
                          Instance,
                          Data},
                         __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"http://gultsch.de/xmpp/drafts/unified-push">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_unified_push_push_cdata(Data, []),
    _attrs =
        encode_unified_push_push_attr_instance(Instance,
                                               encode_unified_push_push_attr_application(Application,
                                                                                         xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                    __TopXMLNS))),
    {xmlel, <<"push">>, _attrs, _els}.

decode_unified_push_push_attr_application(__TopXMLNS,
                                          undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"application">>,
                   <<"push">>,
                   __TopXMLNS}});
decode_unified_push_push_attr_application(__TopXMLNS,
                                          _val) ->
    _val.

encode_unified_push_push_attr_application(_val, _acc) ->
    [{<<"application">>, _val} | _acc].

decode_unified_push_push_attr_instance(__TopXMLNS,
                                       undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"instance">>,
                   <<"push">>,
                   __TopXMLNS}});
decode_unified_push_push_attr_instance(__TopXMLNS,
                                       _val) ->
    _val.

encode_unified_push_push_attr_instance(_val, _acc) ->
    [{<<"instance">>, _val} | _acc].

decode_unified_push_push_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_unified_push_push_cdata(__TopXMLNS, _val) ->
    _val.

encode_unified_push_push_cdata(<<>>, _acc) -> _acc;
encode_unified_push_push_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_unified_push_registered(__TopXMLNS, __Opts,
                               {xmlel, <<"registered">>, _attrs, _els}) ->
    {Expiration, Endpoint} =
        decode_unified_push_registered_attrs(__TopXMLNS,
                                             _attrs,
                                             undefined,
                                             undefined),
    {unified_push_registered, Expiration, Endpoint}.

decode_unified_push_registered_attrs(__TopXMLNS,
                                     [{<<"expiration">>, _val} | _attrs],
                                     _Expiration, Endpoint) ->
    decode_unified_push_registered_attrs(__TopXMLNS,
                                         _attrs,
                                         _val,
                                         Endpoint);
decode_unified_push_registered_attrs(__TopXMLNS,
                                     [{<<"endpoint">>, _val} | _attrs],
                                     Expiration, _Endpoint) ->
    decode_unified_push_registered_attrs(__TopXMLNS,
                                         _attrs,
                                         Expiration,
                                         _val);
decode_unified_push_registered_attrs(__TopXMLNS,
                                     [_ | _attrs], Expiration, Endpoint) ->
    decode_unified_push_registered_attrs(__TopXMLNS,
                                         _attrs,
                                         Expiration,
                                         Endpoint);
decode_unified_push_registered_attrs(__TopXMLNS, [],
                                     Expiration, Endpoint) ->
    {decode_unified_push_registered_attr_expiration(__TopXMLNS,
                                                    Expiration),
     decode_unified_push_registered_attr_endpoint(__TopXMLNS,
                                                  Endpoint)}.

encode_unified_push_registered({unified_push_registered,
                                Expiration,
                                Endpoint},
                               __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"http://gultsch.de/xmpp/drafts/unified-push">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs =
        encode_unified_push_registered_attr_endpoint(Endpoint,
                                                     encode_unified_push_registered_attr_expiration(Expiration,
                                                                                                    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                               __TopXMLNS))),
    {xmlel, <<"registered">>, _attrs, _els}.

decode_unified_push_registered_attr_expiration(__TopXMLNS,
                                               undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"expiration">>,
                   <<"registered">>,
                   __TopXMLNS}});
decode_unified_push_registered_attr_expiration(__TopXMLNS,
                                               _val) ->
    case catch dec_utc(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"expiration">>,
                           <<"registered">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_unified_push_registered_attr_expiration(_val,
                                               _acc) ->
    [{<<"expiration">>, enc_utc(_val)} | _acc].

decode_unified_push_registered_attr_endpoint(__TopXMLNS,
                                             undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"endpoint">>,
                   <<"registered">>,
                   __TopXMLNS}});
decode_unified_push_registered_attr_endpoint(__TopXMLNS,
                                             _val) ->
    _val.

encode_unified_push_registered_attr_endpoint(_val,
                                             _acc) ->
    [{<<"endpoint">>, _val} | _acc].

decode_unified_push_register(__TopXMLNS, __Opts,
                             {xmlel, <<"register">>, _attrs, _els}) ->
    {Application, Instance} =
        decode_unified_push_register_attrs(__TopXMLNS,
                                           _attrs,
                                           undefined,
                                           undefined),
    {unified_push_register, Application, Instance}.

decode_unified_push_register_attrs(__TopXMLNS,
                                   [{<<"application">>, _val} | _attrs],
                                   _Application, Instance) ->
    decode_unified_push_register_attrs(__TopXMLNS,
                                       _attrs,
                                       _val,
                                       Instance);
decode_unified_push_register_attrs(__TopXMLNS,
                                   [{<<"instance">>, _val} | _attrs],
                                   Application, _Instance) ->
    decode_unified_push_register_attrs(__TopXMLNS,
                                       _attrs,
                                       Application,
                                       _val);
decode_unified_push_register_attrs(__TopXMLNS,
                                   [_ | _attrs], Application, Instance) ->
    decode_unified_push_register_attrs(__TopXMLNS,
                                       _attrs,
                                       Application,
                                       Instance);
decode_unified_push_register_attrs(__TopXMLNS, [],
                                   Application, Instance) ->
    {decode_unified_push_register_attr_application(__TopXMLNS,
                                                   Application),
     decode_unified_push_register_attr_instance(__TopXMLNS,
                                                Instance)}.

encode_unified_push_register({unified_push_register,
                              Application,
                              Instance},
                             __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"http://gultsch.de/xmpp/drafts/unified-push">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs =
        encode_unified_push_register_attr_instance(Instance,
                                                   encode_unified_push_register_attr_application(Application,
                                                                                                 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                            __TopXMLNS))),
    {xmlel, <<"register">>, _attrs, _els}.

decode_unified_push_register_attr_application(__TopXMLNS,
                                              undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"application">>,
                   <<"register">>,
                   __TopXMLNS}});
decode_unified_push_register_attr_application(__TopXMLNS,
                                              _val) ->
    _val.

encode_unified_push_register_attr_application(_val,
                                              _acc) ->
    [{<<"application">>, _val} | _acc].

decode_unified_push_register_attr_instance(__TopXMLNS,
                                           undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"instance">>,
                   <<"register">>,
                   __TopXMLNS}});
decode_unified_push_register_attr_instance(__TopXMLNS,
                                           _val) ->
    _val.

encode_unified_push_register_attr_instance(_val,
                                           _acc) ->
    [{<<"instance">>, _val} | _acc].
