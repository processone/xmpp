%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0405).

-compile(export_all).

do_decode(<<"annotate">>, <<"urn:xmpp:mix:roster:0">>,
          El, Opts) ->
    decode_mix_roster_annotate(<<"urn:xmpp:mix:roster:0">>,
                               Opts,
                               El);
do_decode(<<"channel">>, <<"urn:xmpp:mix:roster:0">>,
          El, Opts) ->
    decode_mix_roster_channel(<<"urn:xmpp:mix:roster:0">>,
                              Opts,
                              El);
do_decode(<<"client-leave">>, <<"urn:xmpp:mix:pam:0">>,
          El, Opts) ->
    decode_mix_client_leave(<<"urn:xmpp:mix:pam:0">>,
                            Opts,
                            El);
do_decode(<<"client-leave">>, <<"urn:xmpp:mix:pam:2">>,
          El, Opts) ->
    decode_mix_client_leave(<<"urn:xmpp:mix:pam:2">>,
                            Opts,
                            El);
do_decode(<<"client-join">>, <<"urn:xmpp:mix:pam:0">>,
          El, Opts) ->
    decode_mix_client_join(<<"urn:xmpp:mix:pam:0">>,
                           Opts,
                           El);
do_decode(<<"client-join">>, <<"urn:xmpp:mix:pam:2">>,
          El, Opts) ->
    decode_mix_client_join(<<"urn:xmpp:mix:pam:2">>,
                           Opts,
                           El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"annotate">>, <<"urn:xmpp:mix:roster:0">>},
     {<<"channel">>, <<"urn:xmpp:mix:roster:0">>},
     {<<"client-leave">>, <<"urn:xmpp:mix:pam:0">>},
     {<<"client-leave">>, <<"urn:xmpp:mix:pam:2">>},
     {<<"client-join">>, <<"urn:xmpp:mix:pam:0">>},
     {<<"client-join">>, <<"urn:xmpp:mix:pam:2">>}].

do_encode({mix_client_join, _, _, _} = Client_join,
          TopXMLNS) ->
    encode_mix_client_join(Client_join, TopXMLNS);
do_encode({mix_client_leave, _, _, _} = Client_leave,
          TopXMLNS) ->
    encode_mix_client_leave(Client_leave, TopXMLNS);
do_encode({mix_roster_channel, _} = Channel,
          TopXMLNS) ->
    encode_mix_roster_channel(Channel, TopXMLNS).

do_get_name({mix_client_join, _, _, _}) ->
    <<"client-join">>;
do_get_name({mix_client_leave, _, _, _}) ->
    <<"client-leave">>;
do_get_name({mix_roster_channel, _}) -> <<"channel">>.

do_get_ns({mix_client_join, _, _, Xmlns}) -> Xmlns;
do_get_ns({mix_client_leave, _, _, Xmlns}) -> Xmlns;
do_get_ns({mix_roster_channel, _}) ->
    <<"urn:xmpp:mix:roster:0">>.

pp(mix_client_join, 3) -> [channel, join, xmlns];
pp(mix_client_leave, 3) -> [channel, leave, xmlns];
pp(mix_roster_channel, 1) -> [participant_id];
pp(_, _) -> no.

records() ->
    [{mix_client_join, 3},
     {mix_client_leave, 3},
     {mix_roster_channel, 1}].

decode_mix_roster_annotate(__TopXMLNS, __Opts,
                           {xmlel, <<"annotate">>, _attrs, _els}) ->
    true.

encode_mix_roster_annotate(true, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mix:roster:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"annotate">>, _attrs, _els}.

decode_mix_roster_channel(__TopXMLNS, __Opts,
                          {xmlel, <<"channel">>, _attrs, _els}) ->
    Participant_id =
        decode_mix_roster_channel_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined),
    {mix_roster_channel, Participant_id}.

decode_mix_roster_channel_attrs(__TopXMLNS,
                                [{<<"participant-id">>, _val} | _attrs],
                                _Participant_id) ->
    decode_mix_roster_channel_attrs(__TopXMLNS,
                                    _attrs,
                                    _val);
decode_mix_roster_channel_attrs(__TopXMLNS,
                                [_ | _attrs], Participant_id) ->
    decode_mix_roster_channel_attrs(__TopXMLNS,
                                    _attrs,
                                    Participant_id);
decode_mix_roster_channel_attrs(__TopXMLNS, [],
                                Participant_id) ->
    'decode_mix_roster_channel_attr_participant-id'(__TopXMLNS,
                                                    Participant_id).

encode_mix_roster_channel({mix_roster_channel,
                           Participant_id},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mix:roster:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs =
        'encode_mix_roster_channel_attr_participant-id'(Participant_id,
                                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                   __TopXMLNS)),
    {xmlel, <<"channel">>, _attrs, _els}.

'decode_mix_roster_channel_attr_participant-id'(__TopXMLNS,
                                                undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"participant-id">>,
                   <<"channel">>,
                   __TopXMLNS}});
'decode_mix_roster_channel_attr_participant-id'(__TopXMLNS,
                                                _val) ->
    _val.

'encode_mix_roster_channel_attr_participant-id'(_val,
                                                _acc) ->
    [{<<"participant-id">>, _val} | _acc].

decode_mix_client_leave(__TopXMLNS, __Opts,
                        {xmlel, <<"client-leave">>, _attrs, _els}) ->
    Leave = decode_mix_client_leave_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        error),
    {Channel, Xmlns} =
        decode_mix_client_leave_attrs(__TopXMLNS,
                                      _attrs,
                                      undefined,
                                      undefined),
    {mix_client_leave, Channel, Leave, Xmlns}.

decode_mix_client_leave_els(__TopXMLNS, __Opts, [],
                            Leave) ->
    case Leave of
        error ->
            erlang:error({xmpp_codec,
                          {missing_tag, <<"leave">>, __TopXMLNS}});
        {value, Leave1} -> Leave1
    end;
decode_mix_client_leave_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"leave">>, _attrs, _} = _el | _els],
                            Leave) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_client_leave_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        {value,
                                         xep0369:decode_mix_leave(<<"urn:xmpp:mix:core:0">>,
                                                                  __Opts,
                                                                  _el)});
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_client_leave_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        {value,
                                         xep0369:decode_mix_leave(<<"urn:xmpp:mix:core:1">>,
                                                                  __Opts,
                                                                  _el)});
        _ ->
            decode_mix_client_leave_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Leave)
    end;
decode_mix_client_leave_els(__TopXMLNS, __Opts,
                            [_ | _els], Leave) ->
    decode_mix_client_leave_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Leave).

decode_mix_client_leave_attrs(__TopXMLNS,
                              [{<<"channel">>, _val} | _attrs], _Channel,
                              Xmlns) ->
    decode_mix_client_leave_attrs(__TopXMLNS,
                                  _attrs,
                                  _val,
                                  Xmlns);
decode_mix_client_leave_attrs(__TopXMLNS,
                              [{<<"xmlns">>, _val} | _attrs], Channel,
                              _Xmlns) ->
    decode_mix_client_leave_attrs(__TopXMLNS,
                                  _attrs,
                                  Channel,
                                  _val);
decode_mix_client_leave_attrs(__TopXMLNS, [_ | _attrs],
                              Channel, Xmlns) ->
    decode_mix_client_leave_attrs(__TopXMLNS,
                                  _attrs,
                                  Channel,
                                  Xmlns);
decode_mix_client_leave_attrs(__TopXMLNS, [], Channel,
                              Xmlns) ->
    {decode_mix_client_leave_attr_channel(__TopXMLNS,
                                          Channel),
     decode_mix_client_leave_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_mix_client_leave({mix_client_leave,
                         Channel,
                         Leave,
                         Xmlns},
                        __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:pam:0">>,
                                                 <<"urn:xmpp:mix:pam:2">>],
                                                __TopXMLNS),
    _els =
        lists:reverse('encode_mix_client_leave_$leave'(Leave,
                                                       __NewTopXMLNS,
                                                       [])),
    _attrs = encode_mix_client_leave_attr_channel(Channel,
                                                  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                             __TopXMLNS)),
    {xmlel, <<"client-leave">>, _attrs, _els}.

'encode_mix_client_leave_$leave'(Leave, __TopXMLNS,
                                 _acc) ->
    [xep0369:encode_mix_leave(Leave, __TopXMLNS) | _acc].

decode_mix_client_leave_attr_channel(__TopXMLNS,
                                     undefined) ->
    undefined;
decode_mix_client_leave_attr_channel(__TopXMLNS,
                                     _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"channel">>,
                           <<"client-leave">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_mix_client_leave_attr_channel(undefined, _acc) ->
    _acc;
encode_mix_client_leave_attr_channel(_val, _acc) ->
    [{<<"channel">>, jid:encode(_val)} | _acc].

decode_mix_client_leave_attr_xmlns(__TopXMLNS,
                                   undefined) ->
    <<>>;
decode_mix_client_leave_attr_xmlns(__TopXMLNS, _val) ->
    _val.

decode_mix_client_join(__TopXMLNS, __Opts,
                       {xmlel, <<"client-join">>, _attrs, _els}) ->
    Join = decode_mix_client_join_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      error),
    {Channel, Xmlns} =
        decode_mix_client_join_attrs(__TopXMLNS,
                                     _attrs,
                                     undefined,
                                     undefined),
    {mix_client_join, Channel, Join, Xmlns}.

decode_mix_client_join_els(__TopXMLNS, __Opts, [],
                           Join) ->
    case Join of
        error ->
            erlang:error({xmpp_codec,
                          {missing_tag, <<"join">>, __TopXMLNS}});
        {value, Join1} -> Join1
    end;
decode_mix_client_join_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"join">>, _attrs, _} = _el | _els],
                           Join) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_client_join_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       {value,
                                        xep0369:decode_mix_join(<<"urn:xmpp:mix:core:0">>,
                                                                __Opts,
                                                                _el)});
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_client_join_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       {value,
                                        xep0369:decode_mix_join(<<"urn:xmpp:mix:core:1">>,
                                                                __Opts,
                                                                _el)});
        _ ->
            decode_mix_client_join_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Join)
    end;
decode_mix_client_join_els(__TopXMLNS, __Opts,
                           [_ | _els], Join) ->
    decode_mix_client_join_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Join).

decode_mix_client_join_attrs(__TopXMLNS,
                             [{<<"channel">>, _val} | _attrs], _Channel,
                             Xmlns) ->
    decode_mix_client_join_attrs(__TopXMLNS,
                                 _attrs,
                                 _val,
                                 Xmlns);
decode_mix_client_join_attrs(__TopXMLNS,
                             [{<<"xmlns">>, _val} | _attrs], Channel, _Xmlns) ->
    decode_mix_client_join_attrs(__TopXMLNS,
                                 _attrs,
                                 Channel,
                                 _val);
decode_mix_client_join_attrs(__TopXMLNS, [_ | _attrs],
                             Channel, Xmlns) ->
    decode_mix_client_join_attrs(__TopXMLNS,
                                 _attrs,
                                 Channel,
                                 Xmlns);
decode_mix_client_join_attrs(__TopXMLNS, [], Channel,
                             Xmlns) ->
    {decode_mix_client_join_attr_channel(__TopXMLNS,
                                         Channel),
     decode_mix_client_join_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_mix_client_join({mix_client_join,
                        Channel,
                        Join,
                        Xmlns},
                       __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:pam:0">>,
                                                 <<"urn:xmpp:mix:pam:2">>],
                                                __TopXMLNS),
    _els =
        lists:reverse('encode_mix_client_join_$join'(Join,
                                                     __NewTopXMLNS,
                                                     [])),
    _attrs = encode_mix_client_join_attr_channel(Channel,
                                                 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                            __TopXMLNS)),
    {xmlel, <<"client-join">>, _attrs, _els}.

'encode_mix_client_join_$join'(Join, __TopXMLNS,
                               _acc) ->
    [xep0369:encode_mix_join(Join, __TopXMLNS) | _acc].

decode_mix_client_join_attr_channel(__TopXMLNS,
                                    undefined) ->
    undefined;
decode_mix_client_join_attr_channel(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"channel">>,
                           <<"client-join">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_mix_client_join_attr_channel(undefined, _acc) ->
    _acc;
encode_mix_client_join_attr_channel(_val, _acc) ->
    [{<<"channel">>, jid:encode(_val)} | _acc].

decode_mix_client_join_attr_xmlns(__TopXMLNS,
                                  undefined) ->
    <<>>;
decode_mix_client_join_attr_xmlns(__TopXMLNS, _val) ->
    _val.
