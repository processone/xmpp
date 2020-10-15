%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0260).

-compile(export_all).

do_decode(<<"transport">>,
          <<"urn:xmpp:jingle:transports:s5b:1">>, El, Opts) ->
    decode_jingle_s5b_transport(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                Opts,
                                El);
do_decode(<<"proxy-error">>,
          <<"urn:xmpp:jingle:transports:s5b:1">>, El, Opts) ->
    decode_jingle_s5b_proxy_error(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                  Opts,
                                  El);
do_decode(<<"candidate-error">>,
          <<"urn:xmpp:jingle:transports:s5b:1">>, El, Opts) ->
    decode_jingle_s5b_candidate_error(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                      Opts,
                                      El);
do_decode(<<"activated">>,
          <<"urn:xmpp:jingle:transports:s5b:1">>, El, Opts) ->
    decode_jingle_s5b_activated(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                Opts,
                                El);
do_decode(<<"candidate">>,
          <<"urn:xmpp:jingle:transports:s5b:1">>, El, Opts) ->
    decode_jingle_s5b_candidate(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                Opts,
                                El);
do_decode(<<"candidate-used">>,
          <<"urn:xmpp:jingle:transports:s5b:1">>, El, Opts) ->
    decode_jingle_s5b_candidate_used(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                     Opts,
                                     El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"transport">>,
      <<"urn:xmpp:jingle:transports:s5b:1">>},
     {<<"proxy-error">>,
      <<"urn:xmpp:jingle:transports:s5b:1">>},
     {<<"candidate-error">>,
      <<"urn:xmpp:jingle:transports:s5b:1">>},
     {<<"activated">>,
      <<"urn:xmpp:jingle:transports:s5b:1">>},
     {<<"candidate">>,
      <<"urn:xmpp:jingle:transports:s5b:1">>},
     {<<"candidate-used">>,
      <<"urn:xmpp:jingle:transports:s5b:1">>}].

do_encode({jingle_s5b_candidate, _, _, _, _, _, _} =
              Candidate,
          TopXMLNS) ->
    encode_jingle_s5b_candidate(Candidate, TopXMLNS);
do_encode({jingle_s5b_transport, _, _, _, _, _, _, _} =
              Transport,
          TopXMLNS) ->
    encode_jingle_s5b_transport(Transport, TopXMLNS).

do_get_name({jingle_s5b_candidate, _, _, _, _, _, _}) ->
    <<"candidate">>;
do_get_name({jingle_s5b_transport,
             _,
             _,
             _,
             _,
             _,
             _,
             _}) ->
    <<"transport">>.

do_get_ns({jingle_s5b_candidate, _, _, _, _, _, _}) ->
    <<"urn:xmpp:jingle:transports:s5b:1">>;
do_get_ns({jingle_s5b_transport,
           _,
           _,
           _,
           _,
           _,
           _,
           _}) ->
    <<"urn:xmpp:jingle:transports:s5b:1">>.

pp(jingle_s5b_candidate, 6) ->
    [cid, host, port, jid, type, priority];
pp(jingle_s5b_transport, 7) ->
    [sid,
     dstaddr,
     mode,
     candidates,
     'candidate-used',
     activated,
     error];
pp(_, _) -> no.

records() ->
    [{jingle_s5b_candidate, 6}, {jingle_s5b_transport, 7}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
        true -> AtomVal
    end.

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

dec_ip(S) ->
    {ok, Addr} = inet_parse:address(binary_to_list(S)),
    Addr.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_ip({0, 0, 0, 0, 0, 65535, A, B}) ->
    enc_ip({(A bsr 8) band 255,
            A band 255,
            (B bsr 8) band 255,
            B band 255});
enc_ip(Addr) -> list_to_binary(inet_parse:ntoa(Addr)).

decode_jingle_s5b_transport(__TopXMLNS, __Opts,
                            {xmlel, <<"transport">>, _attrs, _els}) ->
    {Error, Candidates, Activated, Candidate_used} =
        decode_jingle_s5b_transport_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        undefined,
                                        [],
                                        undefined,
                                        undefined),
    {Sid, Dstaddr, Mode} =
        decode_jingle_s5b_transport_attrs(__TopXMLNS,
                                          _attrs,
                                          undefined,
                                          undefined,
                                          undefined),
    {jingle_s5b_transport,
     Sid,
     Dstaddr,
     Mode,
     Candidates,
     Candidate_used,
     Activated,
     Error}.

decode_jingle_s5b_transport_els(__TopXMLNS, __Opts, [],
                                Error, Candidates, Activated, Candidate_used) ->
    {Error,
     lists:reverse(Candidates),
     Activated,
     Candidate_used};
decode_jingle_s5b_transport_els(__TopXMLNS, __Opts,
                                [{xmlel, <<"candidate">>, _attrs, _} = _el
                                 | _els],
                                Error, Candidates, Activated, Candidate_used) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:transports:s5b:1">> ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Error,
                                            [decode_jingle_s5b_candidate(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                                                         __Opts,
                                                                         _el)
                                             | Candidates],
                                            Activated,
                                            Candidate_used);
        _ ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Error,
                                            Candidates,
                                            Activated,
                                            Candidate_used)
    end;
decode_jingle_s5b_transport_els(__TopXMLNS, __Opts,
                                [{xmlel, <<"candidate-used">>, _attrs, _} = _el
                                 | _els],
                                Error, Candidates, Activated, Candidate_used) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:transports:s5b:1">> ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Error,
                                            Candidates,
                                            Activated,
                                            decode_jingle_s5b_candidate_used(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                                                             __Opts,
                                                                             _el));
        _ ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Error,
                                            Candidates,
                                            Activated,
                                            Candidate_used)
    end;
decode_jingle_s5b_transport_els(__TopXMLNS, __Opts,
                                [{xmlel, <<"activated">>, _attrs, _} = _el
                                 | _els],
                                Error, Candidates, Activated, Candidate_used) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:transports:s5b:1">> ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Error,
                                            Candidates,
                                            decode_jingle_s5b_activated(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                                                        __Opts,
                                                                        _el),
                                            Candidate_used);
        _ ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Error,
                                            Candidates,
                                            Activated,
                                            Candidate_used)
    end;
decode_jingle_s5b_transport_els(__TopXMLNS, __Opts,
                                [{xmlel, <<"candidate-error">>, _attrs, _} = _el
                                 | _els],
                                Error, Candidates, Activated, Candidate_used) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:transports:s5b:1">> ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            decode_jingle_s5b_candidate_error(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                                                              __Opts,
                                                                              _el),
                                            Candidates,
                                            Activated,
                                            Candidate_used);
        _ ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Error,
                                            Candidates,
                                            Activated,
                                            Candidate_used)
    end;
decode_jingle_s5b_transport_els(__TopXMLNS, __Opts,
                                [{xmlel, <<"proxy-error">>, _attrs, _} = _el
                                 | _els],
                                Error, Candidates, Activated, Candidate_used) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:transports:s5b:1">> ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            decode_jingle_s5b_proxy_error(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                                                          __Opts,
                                                                          _el),
                                            Candidates,
                                            Activated,
                                            Candidate_used);
        _ ->
            decode_jingle_s5b_transport_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Error,
                                            Candidates,
                                            Activated,
                                            Candidate_used)
    end;
decode_jingle_s5b_transport_els(__TopXMLNS, __Opts,
                                [_ | _els], Error, Candidates, Activated,
                                Candidate_used) ->
    decode_jingle_s5b_transport_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Error,
                                    Candidates,
                                    Activated,
                                    Candidate_used).

decode_jingle_s5b_transport_attrs(__TopXMLNS,
                                  [{<<"sid">>, _val} | _attrs], _Sid, Dstaddr,
                                  Mode) ->
    decode_jingle_s5b_transport_attrs(__TopXMLNS,
                                      _attrs,
                                      _val,
                                      Dstaddr,
                                      Mode);
decode_jingle_s5b_transport_attrs(__TopXMLNS,
                                  [{<<"dstaddr">>, _val} | _attrs], Sid,
                                  _Dstaddr, Mode) ->
    decode_jingle_s5b_transport_attrs(__TopXMLNS,
                                      _attrs,
                                      Sid,
                                      _val,
                                      Mode);
decode_jingle_s5b_transport_attrs(__TopXMLNS,
                                  [{<<"mode">>, _val} | _attrs], Sid, Dstaddr,
                                  _Mode) ->
    decode_jingle_s5b_transport_attrs(__TopXMLNS,
                                      _attrs,
                                      Sid,
                                      Dstaddr,
                                      _val);
decode_jingle_s5b_transport_attrs(__TopXMLNS,
                                  [_ | _attrs], Sid, Dstaddr, Mode) ->
    decode_jingle_s5b_transport_attrs(__TopXMLNS,
                                      _attrs,
                                      Sid,
                                      Dstaddr,
                                      Mode);
decode_jingle_s5b_transport_attrs(__TopXMLNS, [], Sid,
                                  Dstaddr, Mode) ->
    {decode_jingle_s5b_transport_attr_sid(__TopXMLNS, Sid),
     decode_jingle_s5b_transport_attr_dstaddr(__TopXMLNS,
                                              Dstaddr),
     decode_jingle_s5b_transport_attr_mode(__TopXMLNS,
                                           Mode)}.

encode_jingle_s5b_transport({jingle_s5b_transport,
                             Sid,
                             Dstaddr,
                             Mode,
                             Candidates,
                             Candidate_used,
                             Activated,
                             Error},
                            __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_jingle_s5b_transport_$error'(Error,
                                                           __NewTopXMLNS,
                                                           'encode_jingle_s5b_transport_$candidates'(Candidates,
                                                                                                     __NewTopXMLNS,
                                                                                                     'encode_jingle_s5b_transport_$activated'(Activated,
                                                                                                                                              __NewTopXMLNS,
                                                                                                                                              'encode_jingle_s5b_transport_$candidate-used'(Candidate_used,
                                                                                                                                                                                            __NewTopXMLNS,
                                                                                                                                                                                            []))))),
    _attrs = encode_jingle_s5b_transport_attr_mode(Mode,
                                                   encode_jingle_s5b_transport_attr_dstaddr(Dstaddr,
                                                                                            encode_jingle_s5b_transport_attr_sid(Sid,
                                                                                                                                 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                            __TopXMLNS)))),
    {xmlel, <<"transport">>, _attrs, _els}.

'encode_jingle_s5b_transport_$error'(undefined,
                                     __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_s5b_transport_$error'('candidate-error' =
                                         Error,
                                     __TopXMLNS, _acc) ->
    [encode_jingle_s5b_candidate_error(Error, __TopXMLNS)
     | _acc];
'encode_jingle_s5b_transport_$error'('proxy-error' =
                                         Error,
                                     __TopXMLNS, _acc) ->
    [encode_jingle_s5b_proxy_error(Error, __TopXMLNS)
     | _acc].

'encode_jingle_s5b_transport_$candidates'([],
                                          __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_s5b_transport_$candidates'([Candidates
                                           | _els],
                                          __TopXMLNS, _acc) ->
    'encode_jingle_s5b_transport_$candidates'(_els,
                                              __TopXMLNS,
                                              [encode_jingle_s5b_candidate(Candidates,
                                                                           __TopXMLNS)
                                               | _acc]).

'encode_jingle_s5b_transport_$activated'(undefined,
                                         __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_s5b_transport_$activated'(Activated,
                                         __TopXMLNS, _acc) ->
    [encode_jingle_s5b_activated(Activated, __TopXMLNS)
     | _acc].

'encode_jingle_s5b_transport_$candidate-used'(undefined,
                                              __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_s5b_transport_$candidate-used'(Candidate_used,
                                              __TopXMLNS, _acc) ->
    [encode_jingle_s5b_candidate_used(Candidate_used,
                                      __TopXMLNS)
     | _acc].

decode_jingle_s5b_transport_attr_sid(__TopXMLNS,
                                     undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"sid">>,
                   <<"transport">>,
                   __TopXMLNS}});
decode_jingle_s5b_transport_attr_sid(__TopXMLNS,
                                     _val) ->
    _val.

encode_jingle_s5b_transport_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

decode_jingle_s5b_transport_attr_dstaddr(__TopXMLNS,
                                         undefined) ->
    <<>>;
decode_jingle_s5b_transport_attr_dstaddr(__TopXMLNS,
                                         _val) ->
    _val.

encode_jingle_s5b_transport_attr_dstaddr(<<>>, _acc) ->
    _acc;
encode_jingle_s5b_transport_attr_dstaddr(_val, _acc) ->
    [{<<"dstaddr">>, _val} | _acc].

decode_jingle_s5b_transport_attr_mode(__TopXMLNS,
                                      undefined) ->
    tcp;
decode_jingle_s5b_transport_attr_mode(__TopXMLNS,
                                      _val) ->
    case catch dec_enum(_val, [tcp, udp]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"mode">>,
                           <<"transport">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_s5b_transport_attr_mode(tcp, _acc) ->
    _acc;
encode_jingle_s5b_transport_attr_mode(_val, _acc) ->
    [{<<"mode">>, enc_enum(_val)} | _acc].

decode_jingle_s5b_proxy_error(__TopXMLNS, __Opts,
                              {xmlel, <<"proxy-error">>, _attrs, _els}) ->
    'proxy-error'.

encode_jingle_s5b_proxy_error('proxy-error',
                              __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"proxy-error">>, _attrs, _els}.

decode_jingle_s5b_candidate_error(__TopXMLNS, __Opts,
                                  {xmlel,
                                   <<"candidate-error">>,
                                   _attrs,
                                   _els}) ->
    'candidate-error'.

encode_jingle_s5b_candidate_error('candidate-error',
                                  __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"candidate-error">>, _attrs, _els}.

decode_jingle_s5b_activated(__TopXMLNS, __Opts,
                            {xmlel, <<"activated">>, _attrs, _els}) ->
    Cid = decode_jingle_s5b_activated_attrs(__TopXMLNS,
                                            _attrs,
                                            undefined),
    Cid.

decode_jingle_s5b_activated_attrs(__TopXMLNS,
                                  [{<<"cid">>, _val} | _attrs], _Cid) ->
    decode_jingle_s5b_activated_attrs(__TopXMLNS,
                                      _attrs,
                                      _val);
decode_jingle_s5b_activated_attrs(__TopXMLNS,
                                  [_ | _attrs], Cid) ->
    decode_jingle_s5b_activated_attrs(__TopXMLNS,
                                      _attrs,
                                      Cid);
decode_jingle_s5b_activated_attrs(__TopXMLNS, [],
                                  Cid) ->
    decode_jingle_s5b_activated_attr_cid(__TopXMLNS, Cid).

encode_jingle_s5b_activated(Cid, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_jingle_s5b_activated_attr_cid(Cid,
                                                  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                             __TopXMLNS)),
    {xmlel, <<"activated">>, _attrs, _els}.

decode_jingle_s5b_activated_attr_cid(__TopXMLNS,
                                     undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"cid">>,
                   <<"activated">>,
                   __TopXMLNS}});
decode_jingle_s5b_activated_attr_cid(__TopXMLNS,
                                     _val) ->
    _val.

encode_jingle_s5b_activated_attr_cid(_val, _acc) ->
    [{<<"cid">>, _val} | _acc].

decode_jingle_s5b_candidate(__TopXMLNS, __Opts,
                            {xmlel, <<"candidate">>, _attrs, _els}) ->
    {Cid, Host, Jid, Port, Priority, Type} =
        decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                          _attrs,
                                          undefined,
                                          undefined,
                                          undefined,
                                          undefined,
                                          undefined,
                                          undefined),
    {jingle_s5b_candidate,
     Cid,
     Host,
     Port,
     Jid,
     Type,
     Priority}.

decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                  [{<<"cid">>, _val} | _attrs], _Cid, Host, Jid,
                                  Port, Priority, Type) ->
    decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                      _attrs,
                                      _val,
                                      Host,
                                      Jid,
                                      Port,
                                      Priority,
                                      Type);
decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                  [{<<"host">>, _val} | _attrs], Cid, _Host,
                                  Jid, Port, Priority, Type) ->
    decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                      _attrs,
                                      Cid,
                                      _val,
                                      Jid,
                                      Port,
                                      Priority,
                                      Type);
decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                  [{<<"jid">>, _val} | _attrs], Cid, Host, _Jid,
                                  Port, Priority, Type) ->
    decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                      _attrs,
                                      Cid,
                                      Host,
                                      _val,
                                      Port,
                                      Priority,
                                      Type);
decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                  [{<<"port">>, _val} | _attrs], Cid, Host, Jid,
                                  _Port, Priority, Type) ->
    decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                      _attrs,
                                      Cid,
                                      Host,
                                      Jid,
                                      _val,
                                      Priority,
                                      Type);
decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                  [{<<"priority">>, _val} | _attrs], Cid, Host,
                                  Jid, Port, _Priority, Type) ->
    decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                      _attrs,
                                      Cid,
                                      Host,
                                      Jid,
                                      Port,
                                      _val,
                                      Type);
decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                  [{<<"type">>, _val} | _attrs], Cid, Host, Jid,
                                  Port, Priority, _Type) ->
    decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                      _attrs,
                                      Cid,
                                      Host,
                                      Jid,
                                      Port,
                                      Priority,
                                      _val);
decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                  [_ | _attrs], Cid, Host, Jid, Port, Priority,
                                  Type) ->
    decode_jingle_s5b_candidate_attrs(__TopXMLNS,
                                      _attrs,
                                      Cid,
                                      Host,
                                      Jid,
                                      Port,
                                      Priority,
                                      Type);
decode_jingle_s5b_candidate_attrs(__TopXMLNS, [], Cid,
                                  Host, Jid, Port, Priority, Type) ->
    {decode_jingle_s5b_candidate_attr_cid(__TopXMLNS, Cid),
     decode_jingle_s5b_candidate_attr_host(__TopXMLNS, Host),
     decode_jingle_s5b_candidate_attr_jid(__TopXMLNS, Jid),
     decode_jingle_s5b_candidate_attr_port(__TopXMLNS, Port),
     decode_jingle_s5b_candidate_attr_priority(__TopXMLNS,
                                               Priority),
     decode_jingle_s5b_candidate_attr_type(__TopXMLNS,
                                           Type)}.

encode_jingle_s5b_candidate({jingle_s5b_candidate,
                             Cid,
                             Host,
                             Port,
                             Jid,
                             Type,
                             Priority},
                            __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_jingle_s5b_candidate_attr_type(Type,
                                                   encode_jingle_s5b_candidate_attr_priority(Priority,
                                                                                             encode_jingle_s5b_candidate_attr_port(Port,
                                                                                                                                   encode_jingle_s5b_candidate_attr_jid(Jid,
                                                                                                                                                                        encode_jingle_s5b_candidate_attr_host(Host,
                                                                                                                                                                                                              encode_jingle_s5b_candidate_attr_cid(Cid,
                                                                                                                                                                                                                                                   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                                                                                                                                              __TopXMLNS))))))),
    {xmlel, <<"candidate">>, _attrs, _els}.

decode_jingle_s5b_candidate_attr_cid(__TopXMLNS,
                                     undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"cid">>,
                   <<"candidate">>,
                   __TopXMLNS}});
decode_jingle_s5b_candidate_attr_cid(__TopXMLNS,
                                     _val) ->
    _val.

encode_jingle_s5b_candidate_attr_cid(_val, _acc) ->
    [{<<"cid">>, _val} | _acc].

decode_jingle_s5b_candidate_attr_host(__TopXMLNS,
                                      undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"host">>,
                   <<"candidate">>,
                   __TopXMLNS}});
decode_jingle_s5b_candidate_attr_host(__TopXMLNS,
                                      _val) ->
    case catch dec_ip(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"host">>,
                           <<"candidate">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_s5b_candidate_attr_host(_val, _acc) ->
    [{<<"host">>, enc_ip(_val)} | _acc].

decode_jingle_s5b_candidate_attr_jid(__TopXMLNS,
                                     undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"jid">>,
                   <<"candidate">>,
                   __TopXMLNS}});
decode_jingle_s5b_candidate_attr_jid(__TopXMLNS,
                                     _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"jid">>,
                           <<"candidate">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_s5b_candidate_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_jingle_s5b_candidate_attr_port(__TopXMLNS,
                                      undefined) ->
    undefined;
decode_jingle_s5b_candidate_attr_port(__TopXMLNS,
                                      _val) ->
    case catch dec_int(_val, 0, 65535) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"port">>,
                           <<"candidate">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_s5b_candidate_attr_port(undefined,
                                      _acc) ->
    _acc;
encode_jingle_s5b_candidate_attr_port(_val, _acc) ->
    [{<<"port">>, enc_int(_val)} | _acc].

decode_jingle_s5b_candidate_attr_priority(__TopXMLNS,
                                          undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"priority">>,
                   <<"candidate">>,
                   __TopXMLNS}});
decode_jingle_s5b_candidate_attr_priority(__TopXMLNS,
                                          _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"priority">>,
                           <<"candidate">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_s5b_candidate_attr_priority(_val, _acc) ->
    [{<<"priority">>, enc_int(_val)} | _acc].

decode_jingle_s5b_candidate_attr_type(__TopXMLNS,
                                      undefined) ->
    direct;
decode_jingle_s5b_candidate_attr_type(__TopXMLNS,
                                      _val) ->
    case catch dec_enum(_val,
                        [assisted, direct, proxy, tunnel])
        of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"type">>,
                           <<"candidate">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_s5b_candidate_attr_type(direct, _acc) ->
    _acc;
encode_jingle_s5b_candidate_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_jingle_s5b_candidate_used(__TopXMLNS, __Opts,
                                 {xmlel, <<"candidate-used">>, _attrs, _els}) ->
    Cid = decode_jingle_s5b_candidate_used_attrs(__TopXMLNS,
                                                 _attrs,
                                                 undefined),
    Cid.

decode_jingle_s5b_candidate_used_attrs(__TopXMLNS,
                                       [{<<"cid">>, _val} | _attrs], _Cid) ->
    decode_jingle_s5b_candidate_used_attrs(__TopXMLNS,
                                           _attrs,
                                           _val);
decode_jingle_s5b_candidate_used_attrs(__TopXMLNS,
                                       [_ | _attrs], Cid) ->
    decode_jingle_s5b_candidate_used_attrs(__TopXMLNS,
                                           _attrs,
                                           Cid);
decode_jingle_s5b_candidate_used_attrs(__TopXMLNS, [],
                                       Cid) ->
    decode_jingle_s5b_candidate_used_attr_cid(__TopXMLNS,
                                              Cid).

encode_jingle_s5b_candidate_used(Cid, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:transports:s5b:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_jingle_s5b_candidate_used_attr_cid(Cid,
                                                       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                  __TopXMLNS)),
    {xmlel, <<"candidate-used">>, _attrs, _els}.

decode_jingle_s5b_candidate_used_attr_cid(__TopXMLNS,
                                          undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"cid">>,
                   <<"candidate-used">>,
                   __TopXMLNS}});
decode_jingle_s5b_candidate_used_attr_cid(__TopXMLNS,
                                          _val) ->
    _val.

encode_jingle_s5b_candidate_used_attr_cid(_val, _acc) ->
    [{<<"cid">>, _val} | _acc].
