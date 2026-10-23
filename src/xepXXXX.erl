%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xepXXXX).

-compile(export_all).

do_decode(<<"received-report">>,
          <<"urn:xmpp:incidents:report:0">>, El, Opts) ->
    decode_received_report(<<"urn:xmpp:incidents:report:0">>,
                           Opts,
                           El);
do_decode(<<"stanzas">>,
          <<"urn:xmpp:incidents:report:0">>, El, Opts) ->
    decode_stanzas(<<"urn:xmpp:incidents:report:0">>,
                   Opts,
                   El);
do_decode(<<"reporter">>,
          <<"urn:xmpp:incidents:report:0">>, El, Opts) ->
    decode_reporter(<<"urn:xmpp:incidents:report:0">>,
                    Opts,
                    El);
do_decode(<<"id">>, <<"urn:xmpp:incidents:report:0">>,
          El, Opts) ->
    decode_reporter_id(<<"urn:xmpp:incidents:report:0">>,
                       Opts,
                       El);
do_decode(<<"reported-entity">>,
          <<"urn:xmpp:incidents:report:0">>, El, Opts) ->
    decode_reported_entity(<<"urn:xmpp:incidents:report:0">>,
                           Opts,
                           El);
do_decode(<<"ip">>, <<"urn:xmpp:incidents:report:0">>,
          El, Opts) ->
    decode_reported_ip(<<"urn:xmpp:incidents:report:0">>,
                       Opts,
                       El);
do_decode(<<"jid">>, <<"urn:xmpp:incidents:report:0">>,
          El, Opts) ->
    decode_report_jid(<<"urn:xmpp:incidents:report:0">>,
                      Opts,
                      El);
do_decode(<<"reported-at">>,
          <<"urn:xmpp:incidents:report:0">>, El, Opts) ->
    decode_reported_at(<<"urn:xmpp:incidents:report:0">>,
                       Opts,
                       El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"received-report">>,
      <<"urn:xmpp:incidents:report:0">>},
     {<<"stanzas">>, <<"urn:xmpp:incidents:report:0">>},
     {<<"reporter">>, <<"urn:xmpp:incidents:report:0">>},
     {<<"id">>, <<"urn:xmpp:incidents:report:0">>},
     {<<"reported-entity">>,
      <<"urn:xmpp:incidents:report:0">>},
     {<<"ip">>, <<"urn:xmpp:incidents:report:0">>},
     {<<"jid">>, <<"urn:xmpp:incidents:report:0">>},
     {<<"reported-at">>, <<"urn:xmpp:incidents:report:0">>}].

do_encode({reported_ip, _, _} = Ip, TopXMLNS) ->
    encode_reported_ip(Ip, TopXMLNS);
do_encode({reported_entity, _, _} = Reported_entity,
          TopXMLNS) ->
    encode_reported_entity(Reported_entity, TopXMLNS);
do_encode({reporter, _, _} = Reporter, TopXMLNS) ->
    encode_reporter(Reporter, TopXMLNS);
do_encode({received_report, _, _, _, _, _, _} =
              Received_report,
          TopXMLNS) ->
    encode_received_report(Received_report, TopXMLNS).

do_get_name({received_report, _, _, _, _, _, _}) ->
    <<"received-report">>;
do_get_name({reported_entity, _, _}) ->
    <<"reported-entity">>;
do_get_name({reported_ip, _, _}) -> <<"ip">>;
do_get_name({reporter, _, _}) -> <<"reporter">>.

do_get_ns({received_report, _, _, _, _, _, _}) ->
    <<"urn:xmpp:incidents:report:0">>;
do_get_ns({reported_entity, _, _}) ->
    <<"urn:xmpp:incidents:report:0">>;
do_get_ns({reported_ip, _, _}) ->
    <<"urn:xmpp:incidents:report:0">>;
do_get_ns({reporter, _, _}) ->
    <<"urn:xmpp:incidents:report:0">>.

pp(reported_ip, 2) -> [type, cdata];
pp(reported_entity, 2) -> [jid, ip];
pp(reporter, 2) -> [jid, id];
pp(received_report, 6) ->
    [id,
     report,
     reported_at,
     reported_entity,
     reporter,
     stanzas];
pp(_, _) -> no.

records() ->
    [{reported_ip, 2},
     {reported_entity, 2},
     {reporter, 2},
     {received_report, 6}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
        true -> AtomVal
    end.

dec_ip(S) ->
    {ok, Addr} = inet_parse:address(binary_to_list(S)),
    Addr.

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_ip({0, 0, 0, 0, 0, 65535, A, B}) ->
    enc_ip({(A bsr 8) band 255,
            A band 255,
            (B bsr 8) band 255,
            B band 255});
enc_ip(Addr) -> list_to_binary(inet_parse:ntoa(Addr)).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_received_report(__TopXMLNS, __Opts,
                       {xmlel, <<"received-report">>, _attrs, _els}) ->
    {Report,
     Reported_at,
     Reported_entity,
     Reporter,
     Stanzas} =
        decode_received_report_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   error,
                                   error,
                                   error,
                                   undefined,
                                   undefined),
    Id = decode_received_report_attrs(__TopXMLNS,
                                      _attrs,
                                      undefined),
    {received_report,
     Id,
     Report,
     Reported_at,
     Reported_entity,
     Reporter,
     Stanzas}.

decode_received_report_els(__TopXMLNS, __Opts, [],
                           Report, Reported_at, Reported_entity, Reporter,
                           Stanzas) ->
    {case Report of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"report">>, __TopXMLNS}});
         {value, Report1} -> Report1
     end,
     case Reported_at of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"reported-at">>, __TopXMLNS}});
         {value, Reported_at1} -> Reported_at1
     end,
     case Reported_entity of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"reported-entity">>, __TopXMLNS}});
         {value, Reported_entity1} -> Reported_entity1
     end,
     Reporter,
     Stanzas};
decode_received_report_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"report">>, _attrs, _} = _el | _els],
                           Report, Reported_at, Reported_entity, Reporter,
                           Stanzas) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:reporting:1">> ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       {value,
                                        xep0377:decode_report(<<"urn:xmpp:reporting:1">>,
                                                              __Opts,
                                                              _el)},
                                       Reported_at,
                                       Reported_entity,
                                       Reporter,
                                       Stanzas);
        _ ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Report,
                                       Reported_at,
                                       Reported_entity,
                                       Reporter,
                                       Stanzas)
    end;
decode_received_report_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"reported-at">>, _attrs, _} = _el | _els],
                           Report, Reported_at, Reported_entity, Reporter,
                           Stanzas) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:incidents:report:0">> ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Report,
                                       {value,
                                        decode_reported_at(<<"urn:xmpp:incidents:report:0">>,
                                                           __Opts,
                                                           _el)},
                                       Reported_entity,
                                       Reporter,
                                       Stanzas);
        _ ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Report,
                                       Reported_at,
                                       Reported_entity,
                                       Reporter,
                                       Stanzas)
    end;
decode_received_report_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"reported-entity">>, _attrs, _} = _el
                            | _els],
                           Report, Reported_at, Reported_entity, Reporter,
                           Stanzas) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:incidents:report:0">> ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Report,
                                       Reported_at,
                                       {value,
                                        decode_reported_entity(<<"urn:xmpp:incidents:report:0">>,
                                                               __Opts,
                                                               _el)},
                                       Reporter,
                                       Stanzas);
        _ ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Report,
                                       Reported_at,
                                       Reported_entity,
                                       Reporter,
                                       Stanzas)
    end;
decode_received_report_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"reporter">>, _attrs, _} = _el | _els],
                           Report, Reported_at, Reported_entity, Reporter,
                           Stanzas) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:incidents:report:0">> ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Report,
                                       Reported_at,
                                       Reported_entity,
                                       decode_reporter(<<"urn:xmpp:incidents:report:0">>,
                                                       __Opts,
                                                       _el),
                                       Stanzas);
        _ ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Report,
                                       Reported_at,
                                       Reported_entity,
                                       Reporter,
                                       Stanzas)
    end;
decode_received_report_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"stanzas">>, _attrs, _} = _el | _els],
                           Report, Reported_at, Reported_entity, Reporter,
                           Stanzas) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:incidents:report:0">> ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Report,
                                       Reported_at,
                                       Reported_entity,
                                       Reporter,
                                       decode_stanzas(<<"urn:xmpp:incidents:report:0">>,
                                                      __Opts,
                                                      _el));
        _ ->
            decode_received_report_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Report,
                                       Reported_at,
                                       Reported_entity,
                                       Reporter,
                                       Stanzas)
    end;
decode_received_report_els(__TopXMLNS, __Opts,
                           [_ | _els], Report, Reported_at, Reported_entity,
                           Reporter, Stanzas) ->
    decode_received_report_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Report,
                               Reported_at,
                               Reported_entity,
                               Reporter,
                               Stanzas).

decode_received_report_attrs(__TopXMLNS,
                             [{<<"id">>, _val} | _attrs], _Id) ->
    decode_received_report_attrs(__TopXMLNS, _attrs, _val);
decode_received_report_attrs(__TopXMLNS, [_ | _attrs],
                             Id) ->
    decode_received_report_attrs(__TopXMLNS, _attrs, Id);
decode_received_report_attrs(__TopXMLNS, [], Id) ->
    decode_received_report_attr_id(__TopXMLNS, Id).

encode_received_report({received_report,
                        Id,
                        Report,
                        Reported_at,
                        Reported_entity,
                        Reporter,
                        Stanzas},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:incidents:report:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_received_report_$stanzas'(Stanzas,
                                                        __NewTopXMLNS,
                                                        'encode_received_report_$reporter'(Reporter,
                                                                                           __NewTopXMLNS,
                                                                                           'encode_received_report_$reported_entity'(Reported_entity,
                                                                                                                                     __NewTopXMLNS,
                                                                                                                                     'encode_received_report_$reported_at'(Reported_at,
                                                                                                                                                                           __NewTopXMLNS,
                                                                                                                                                                           'encode_received_report_$report'(Report,
                                                                                                                                                                                                            __NewTopXMLNS,
                                                                                                                                                                                                            [])))))),
    _attrs = encode_received_report_attr_id(Id,
                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                       __TopXMLNS)),
    {xmlel, <<"received-report">>, _attrs, _els}.

'encode_received_report_$report'(Report, __TopXMLNS,
                                 _acc) ->
    [xep0377:encode_report(Report, __TopXMLNS) | _acc].

'encode_received_report_$reported_at'(Reported_at,
                                      __TopXMLNS, _acc) ->
    [encode_reported_at(Reported_at, __TopXMLNS) | _acc].

'encode_received_report_$reported_entity'(Reported_entity,
                                          __TopXMLNS, _acc) ->
    [encode_reported_entity(Reported_entity, __TopXMLNS)
     | _acc].

'encode_received_report_$reporter'(undefined,
                                   __TopXMLNS, _acc) ->
    _acc;
'encode_received_report_$reporter'(Reporter, __TopXMLNS,
                                   _acc) ->
    [encode_reporter(Reporter, __TopXMLNS) | _acc].

'encode_received_report_$stanzas'(undefined, __TopXMLNS,
                                  _acc) ->
    _acc;
'encode_received_report_$stanzas'(Stanzas, __TopXMLNS,
                                  _acc) ->
    [encode_stanzas(Stanzas, __TopXMLNS) | _acc].

decode_received_report_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"id">>,
                   <<"received-report">>,
                   __TopXMLNS}});
decode_received_report_attr_id(__TopXMLNS, _val) ->
    _val.

encode_received_report_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_stanzas(__TopXMLNS, __Opts,
               {xmlel, <<"stanzas">>, _attrs, _els}) ->
    Forwarded = decode_stanzas_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   []),
    Forwarded.

decode_stanzas_els(__TopXMLNS, __Opts, [], Forwarded) ->
    lists:reverse(Forwarded);
decode_stanzas_els(__TopXMLNS, __Opts,
                   [{xmlel, <<"forwarded">>, _attrs, _} = _el | _els],
                   Forwarded) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:forward:0">> ->
            decode_stanzas_els(__TopXMLNS,
                               __Opts,
                               _els,
                               [xep0297:decode_forwarded(<<"urn:xmpp:forward:0">>,
                                                         __Opts,
                                                         _el)
                                | Forwarded]);
        _ ->
            decode_stanzas_els(__TopXMLNS, __Opts, _els, Forwarded)
    end;
decode_stanzas_els(__TopXMLNS, __Opts, [_ | _els],
                   Forwarded) ->
    decode_stanzas_els(__TopXMLNS, __Opts, _els, Forwarded).

encode_stanzas(Forwarded, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:incidents:report:0">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_stanzas_$forwarded'(Forwarded,
                                                  __NewTopXMLNS,
                                                  [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"stanzas">>, _attrs, _els}.

'encode_stanzas_$forwarded'([], __TopXMLNS, _acc) ->
    _acc;
'encode_stanzas_$forwarded'([Forwarded | _els],
                            __TopXMLNS, _acc) ->
    'encode_stanzas_$forwarded'(_els,
                                __TopXMLNS,
                                [xep0297:encode_forwarded(Forwarded, __TopXMLNS)
                                 | _acc]).

decode_reporter(__TopXMLNS, __Opts,
                {xmlel, <<"reporter">>, _attrs, _els}) ->
    {Jid, Id} = decode_reporter_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    undefined,
                                    undefined),
    {reporter, Jid, Id}.

decode_reporter_els(__TopXMLNS, __Opts, [], Jid, Id) ->
    {Jid, Id};
decode_reporter_els(__TopXMLNS, __Opts,
                    [{xmlel, <<"jid">>, _attrs, _} = _el | _els], Jid,
                    Id) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:incidents:report:0">> ->
            decode_reporter_els(__TopXMLNS,
                                __Opts,
                                _els,
                                decode_report_jid(<<"urn:xmpp:incidents:report:0">>,
                                                  __Opts,
                                                  _el),
                                Id);
        _ ->
            decode_reporter_els(__TopXMLNS, __Opts, _els, Jid, Id)
    end;
decode_reporter_els(__TopXMLNS, __Opts,
                    [{xmlel, <<"id">>, _attrs, _} = _el | _els], Jid, Id) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:incidents:report:0">> ->
            decode_reporter_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Jid,
                                decode_reporter_id(<<"urn:xmpp:incidents:report:0">>,
                                                   __Opts,
                                                   _el));
        _ ->
            decode_reporter_els(__TopXMLNS, __Opts, _els, Jid, Id)
    end;
decode_reporter_els(__TopXMLNS, __Opts, [_ | _els], Jid,
                    Id) ->
    decode_reporter_els(__TopXMLNS, __Opts, _els, Jid, Id).

encode_reporter({reporter, Jid, Id}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:incidents:report:0">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_reporter_$id'(Id,
                                               __NewTopXMLNS,
                                               'encode_reporter_$jid'(Jid,
                                                                      __NewTopXMLNS,
                                                                      []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"reporter">>, _attrs, _els}.

'encode_reporter_$jid'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_reporter_$jid'(Jid, __TopXMLNS, _acc) ->
    [encode_report_jid(Jid, __TopXMLNS) | _acc].

'encode_reporter_$id'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_reporter_$id'(Id, __TopXMLNS, _acc) ->
    [encode_reporter_id(Id, __TopXMLNS) | _acc].

decode_reporter_id(__TopXMLNS, __Opts,
                   {xmlel, <<"id">>, _attrs, _els}) ->
    Cdata = decode_reporter_id_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   <<>>),
    Cdata.

decode_reporter_id_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_reporter_id_cdata(__TopXMLNS, Cdata);
decode_reporter_id_els(__TopXMLNS, __Opts,
                       [{xmlcdata, _data} | _els], Cdata) ->
    decode_reporter_id_els(__TopXMLNS,
                           __Opts,
                           _els,
                           <<Cdata/binary, _data/binary>>);
decode_reporter_id_els(__TopXMLNS, __Opts, [_ | _els],
                       Cdata) ->
    decode_reporter_id_els(__TopXMLNS, __Opts, _els, Cdata).

encode_reporter_id(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:incidents:report:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_reporter_id_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"id">>, _attrs, _els}.

decode_reporter_id_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"id">>, __TopXMLNS}});
decode_reporter_id_cdata(__TopXMLNS, _val) -> _val.

encode_reporter_id_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_reported_entity(__TopXMLNS, __Opts,
                       {xmlel, <<"reported-entity">>, _attrs, _els}) ->
    {Jid, Ip} = decode_reported_entity_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           error,
                                           undefined),
    {reported_entity, Jid, Ip}.

decode_reported_entity_els(__TopXMLNS, __Opts, [], Jid,
                           Ip) ->
    {case Jid of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"jid">>, __TopXMLNS}});
         {value, Jid1} -> Jid1
     end,
     Ip};
decode_reported_entity_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"jid">>, _attrs, _} = _el | _els], Jid,
                           Ip) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:incidents:report:0">> ->
            decode_reported_entity_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       {value,
                                        decode_report_jid(<<"urn:xmpp:incidents:report:0">>,
                                                          __Opts,
                                                          _el)},
                                       Ip);
        _ ->
            decode_reported_entity_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Jid,
                                       Ip)
    end;
decode_reported_entity_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"ip">>, _attrs, _} = _el | _els], Jid,
                           Ip) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:incidents:report:0">> ->
            decode_reported_entity_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Jid,
                                       decode_reported_ip(<<"urn:xmpp:incidents:report:0">>,
                                                          __Opts,
                                                          _el));
        _ ->
            decode_reported_entity_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Jid,
                                       Ip)
    end;
decode_reported_entity_els(__TopXMLNS, __Opts,
                           [_ | _els], Jid, Ip) ->
    decode_reported_entity_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Jid,
                               Ip).

encode_reported_entity({reported_entity, Jid, Ip},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:incidents:report:0">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_reported_entity_$ip'(Ip,
                                                      __NewTopXMLNS,
                                                      'encode_reported_entity_$jid'(Jid,
                                                                                    __NewTopXMLNS,
                                                                                    []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"reported-entity">>, _attrs, _els}.

'encode_reported_entity_$jid'(Jid, __TopXMLNS, _acc) ->
    [encode_report_jid(Jid, __TopXMLNS) | _acc].

'encode_reported_entity_$ip'(undefined, __TopXMLNS,
                             _acc) ->
    _acc;
'encode_reported_entity_$ip'(Ip, __TopXMLNS, _acc) ->
    [encode_reported_ip(Ip, __TopXMLNS) | _acc].

decode_reported_ip(__TopXMLNS, __Opts,
                   {xmlel, <<"ip">>, _attrs, _els}) ->
    Cdata = decode_reported_ip_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   <<>>),
    Type = decode_reported_ip_attrs(__TopXMLNS,
                                    _attrs,
                                    undefined),
    {reported_ip, Type, Cdata}.

decode_reported_ip_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_reported_ip_cdata(__TopXMLNS, Cdata);
decode_reported_ip_els(__TopXMLNS, __Opts,
                       [{xmlcdata, _data} | _els], Cdata) ->
    decode_reported_ip_els(__TopXMLNS,
                           __Opts,
                           _els,
                           <<Cdata/binary, _data/binary>>);
decode_reported_ip_els(__TopXMLNS, __Opts, [_ | _els],
                       Cdata) ->
    decode_reported_ip_els(__TopXMLNS, __Opts, _els, Cdata).

decode_reported_ip_attrs(__TopXMLNS,
                         [{<<"type">>, _val} | _attrs], _Type) ->
    decode_reported_ip_attrs(__TopXMLNS, _attrs, _val);
decode_reported_ip_attrs(__TopXMLNS, [_ | _attrs],
                         Type) ->
    decode_reported_ip_attrs(__TopXMLNS, _attrs, Type);
decode_reported_ip_attrs(__TopXMLNS, [], Type) ->
    decode_reported_ip_attr_type(__TopXMLNS, Type).

encode_reported_ip({reported_ip, Type, Cdata},
                   __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:incidents:report:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_reported_ip_cdata(Cdata, []),
    _attrs = encode_reported_ip_attr_type(Type,
                                          xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                     __TopXMLNS)),
    {xmlel, <<"ip">>, _attrs, _els}.

decode_reported_ip_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"type">>, <<"ip">>, __TopXMLNS}});
decode_reported_ip_attr_type(__TopXMLNS, _val) ->
    try dec_enum(_val, [server, client]) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_attr_value, <<"type">>, <<"ip">>, __TopXMLNS}})
    end.

encode_reported_ip_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_reported_ip_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"ip">>, __TopXMLNS}});
decode_reported_ip_cdata(__TopXMLNS, _val) ->
    try dec_ip(_val) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"ip">>, __TopXMLNS}})
    end.

encode_reported_ip_cdata(_val, _acc) ->
    [{xmlcdata, enc_ip(_val)} | _acc].

decode_report_jid(__TopXMLNS, __Opts,
                  {xmlel, <<"jid">>, _attrs, _els}) ->
    Cdata = decode_report_jid_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<>>),
    Cdata.

decode_report_jid_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_report_jid_cdata(__TopXMLNS, Cdata);
decode_report_jid_els(__TopXMLNS, __Opts,
                      [{xmlcdata, _data} | _els], Cdata) ->
    decode_report_jid_els(__TopXMLNS,
                          __Opts,
                          _els,
                          <<Cdata/binary, _data/binary>>);
decode_report_jid_els(__TopXMLNS, __Opts, [_ | _els],
                      Cdata) ->
    decode_report_jid_els(__TopXMLNS, __Opts, _els, Cdata).

encode_report_jid(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:incidents:report:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_report_jid_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"jid">>, _attrs, _els}.

decode_report_jid_cdata(__TopXMLNS, <<>>) -> undefined;
decode_report_jid_cdata(__TopXMLNS, _val) ->
    try jid:decode(_val) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"jid">>, __TopXMLNS}})
    end.

encode_report_jid_cdata(undefined, _acc) -> _acc;
encode_report_jid_cdata(_val, _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].

decode_reported_at(__TopXMLNS, __Opts,
                   {xmlel, <<"reported-at">>, _attrs, _els}) ->
    Cdata = decode_reported_at_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   <<>>),
    Cdata.

decode_reported_at_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_reported_at_cdata(__TopXMLNS, Cdata);
decode_reported_at_els(__TopXMLNS, __Opts,
                       [{xmlcdata, _data} | _els], Cdata) ->
    decode_reported_at_els(__TopXMLNS,
                           __Opts,
                           _els,
                           <<Cdata/binary, _data/binary>>);
decode_reported_at_els(__TopXMLNS, __Opts, [_ | _els],
                       Cdata) ->
    decode_reported_at_els(__TopXMLNS, __Opts, _els, Cdata).

encode_reported_at(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:incidents:report:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_reported_at_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"reported-at">>, _attrs, _els}.

decode_reported_at_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"reported-at">>, __TopXMLNS}});
decode_reported_at_cdata(__TopXMLNS, _val) ->
    try dec_utc(_val) of
        _res -> _res
    catch
        error:_ ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value,
                           <<>>,
                           <<"reported-at">>,
                           __TopXMLNS}})
    end.

encode_reported_at_cdata(_val, _acc) ->
    [{xmlcdata, enc_utc(_val)} | _acc].
