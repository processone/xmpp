%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0369).

-compile(export_all).

do_decode(<<"mix">>, <<"urn:xmpp:mix:core:0">>, El,
          Opts) ->
    decode_mix(<<"urn:xmpp:mix:core:0">>, Opts, El);
do_decode(<<"mix">>, <<"urn:xmpp:mix:core:1">>, El,
          Opts) ->
    decode_mix(<<"urn:xmpp:mix:core:1">>, Opts, El);
do_decode(<<"destroy">>, <<"urn:xmpp:mix:core:0">>, El,
          Opts) ->
    decode_mix_destroy(<<"urn:xmpp:mix:core:0">>, Opts, El);
do_decode(<<"destroy">>, <<"urn:xmpp:mix:core:1">>, El,
          Opts) ->
    decode_mix_destroy(<<"urn:xmpp:mix:core:1">>, Opts, El);
do_decode(<<"create">>, <<"urn:xmpp:mix:core:0">>, El,
          Opts) ->
    decode_mix_create(<<"urn:xmpp:mix:core:0">>, Opts, El);
do_decode(<<"create">>, <<"urn:xmpp:mix:core:1">>, El,
          Opts) ->
    decode_mix_create(<<"urn:xmpp:mix:core:1">>, Opts, El);
do_decode(<<"participant">>, <<"urn:xmpp:mix:core:0">>,
          El, Opts) ->
    decode_mix_participant(<<"urn:xmpp:mix:core:0">>,
                           Opts,
                           El);
do_decode(<<"participant">>, <<"urn:xmpp:mix:core:1">>,
          El, Opts) ->
    decode_mix_participant(<<"urn:xmpp:mix:core:1">>,
                           Opts,
                           El);
do_decode(<<"leave">>, <<"urn:xmpp:mix:core:0">>, El,
          Opts) ->
    decode_mix_leave(<<"urn:xmpp:mix:core:0">>, Opts, El);
do_decode(<<"leave">>, <<"urn:xmpp:mix:core:1">>, El,
          Opts) ->
    decode_mix_leave(<<"urn:xmpp:mix:core:1">>, Opts, El);
do_decode(<<"join">>, <<"urn:xmpp:mix:core:0">>, El,
          Opts) ->
    decode_mix_join(<<"urn:xmpp:mix:core:0">>, Opts, El);
do_decode(<<"join">>, <<"urn:xmpp:mix:core:1">>, El,
          Opts) ->
    decode_mix_join(<<"urn:xmpp:mix:core:1">>, Opts, El);
do_decode(<<"update-subscription">>,
          <<"urn:xmpp:mix:core:0">>, El, Opts) ->
    decode_mix_update_subscription(<<"urn:xmpp:mix:core:0">>,
                                   Opts,
                                   El);
do_decode(<<"update-subscription">>,
          <<"urn:xmpp:mix:core:1">>, El, Opts) ->
    decode_mix_update_subscription(<<"urn:xmpp:mix:core:1">>,
                                   Opts,
                                   El);
do_decode(<<"setnick">>, <<"urn:xmpp:mix:core:0">>, El,
          Opts) ->
    decode_mix_setnick(<<"urn:xmpp:mix:core:0">>, Opts, El);
do_decode(<<"setnick">>, <<"urn:xmpp:mix:core:1">>, El,
          Opts) ->
    decode_mix_setnick(<<"urn:xmpp:mix:core:1">>, Opts, El);
do_decode(<<"submission-id">>,
          <<"urn:xmpp:mix:core:0">>, El, Opts) ->
    decode_mix_submission_id(<<"urn:xmpp:mix:core:0">>,
                             Opts,
                             El);
do_decode(<<"jid">>, <<"urn:xmpp:mix:core:0">>, El,
          Opts) ->
    decode_mix_jid(<<"urn:xmpp:mix:core:0">>, Opts, El);
do_decode(<<"jid">>, <<"urn:xmpp:mix:core:1">>, El,
          Opts) ->
    decode_mix_jid(<<"urn:xmpp:mix:core:1">>, Opts, El);
do_decode(<<"jid">>, <<"urn:xmpp:mix:presence:0">>, El,
          Opts) ->
    decode_mix_jid(<<"urn:xmpp:mix:presence:0">>, Opts, El);
do_decode(<<"nick">>, <<"urn:xmpp:mix:core:0">>, El,
          Opts) ->
    decode_mix_nick(<<"urn:xmpp:mix:core:0">>, Opts, El);
do_decode(<<"nick">>, <<"urn:xmpp:mix:core:1">>, El,
          Opts) ->
    decode_mix_nick(<<"urn:xmpp:mix:core:1">>, Opts, El);
do_decode(<<"nick">>, <<"urn:xmpp:mix:presence:0">>, El,
          Opts) ->
    decode_mix_nick(<<"urn:xmpp:mix:presence:0">>,
                    Opts,
                    El);
do_decode(<<"unsubscribe">>, <<"urn:xmpp:mix:core:0">>,
          El, Opts) ->
    decode_mix_unsubscribe(<<"urn:xmpp:mix:core:0">>,
                           Opts,
                           El);
do_decode(<<"unsubscribe">>, <<"urn:xmpp:mix:core:1">>,
          El, Opts) ->
    decode_mix_unsubscribe(<<"urn:xmpp:mix:core:1">>,
                           Opts,
                           El);
do_decode(<<"subscribe">>, <<"urn:xmpp:mix:core:0">>,
          El, Opts) ->
    decode_mix_subscribe(<<"urn:xmpp:mix:core:0">>,
                         Opts,
                         El);
do_decode(<<"subscribe">>, <<"urn:xmpp:mix:core:1">>,
          El, Opts) ->
    decode_mix_subscribe(<<"urn:xmpp:mix:core:1">>,
                         Opts,
                         El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"mix">>, <<"urn:xmpp:mix:core:0">>},
     {<<"mix">>, <<"urn:xmpp:mix:core:1">>},
     {<<"destroy">>, <<"urn:xmpp:mix:core:0">>},
     {<<"destroy">>, <<"urn:xmpp:mix:core:1">>},
     {<<"create">>, <<"urn:xmpp:mix:core:0">>},
     {<<"create">>, <<"urn:xmpp:mix:core:1">>},
     {<<"participant">>, <<"urn:xmpp:mix:core:0">>},
     {<<"participant">>, <<"urn:xmpp:mix:core:1">>},
     {<<"leave">>, <<"urn:xmpp:mix:core:0">>},
     {<<"leave">>, <<"urn:xmpp:mix:core:1">>},
     {<<"join">>, <<"urn:xmpp:mix:core:0">>},
     {<<"join">>, <<"urn:xmpp:mix:core:1">>},
     {<<"update-subscription">>, <<"urn:xmpp:mix:core:0">>},
     {<<"update-subscription">>, <<"urn:xmpp:mix:core:1">>},
     {<<"setnick">>, <<"urn:xmpp:mix:core:0">>},
     {<<"setnick">>, <<"urn:xmpp:mix:core:1">>},
     {<<"submission-id">>, <<"urn:xmpp:mix:core:0">>},
     {<<"jid">>, <<"urn:xmpp:mix:core:0">>},
     {<<"jid">>, <<"urn:xmpp:mix:core:1">>},
     {<<"jid">>, <<"urn:xmpp:mix:presence:0">>},
     {<<"nick">>, <<"urn:xmpp:mix:core:0">>},
     {<<"nick">>, <<"urn:xmpp:mix:core:1">>},
     {<<"nick">>, <<"urn:xmpp:mix:presence:0">>},
     {<<"unsubscribe">>, <<"urn:xmpp:mix:core:0">>},
     {<<"unsubscribe">>, <<"urn:xmpp:mix:core:1">>},
     {<<"subscribe">>, <<"urn:xmpp:mix:core:0">>},
     {<<"subscribe">>, <<"urn:xmpp:mix:core:1">>}].

do_encode({mix_setnick, _, _} = Setnick, TopXMLNS) ->
    encode_mix_setnick(Setnick, TopXMLNS);
do_encode({mix_update_subscription, _, _, _, _} =
              Update_subscription,
          TopXMLNS) ->
    encode_mix_update_subscription(Update_subscription,
                                   TopXMLNS);
do_encode({mix_join, _, _, _, _, _} = Join, TopXMLNS) ->
    encode_mix_join(Join, TopXMLNS);
do_encode({mix_leave, _} = Leave, TopXMLNS) ->
    encode_mix_leave(Leave, TopXMLNS);
do_encode({mix_participant, _, _, _} = Participant,
          TopXMLNS) ->
    encode_mix_participant(Participant, TopXMLNS);
do_encode({mix_create, _, _} = Create, TopXMLNS) ->
    encode_mix_create(Create, TopXMLNS);
do_encode({mix_destroy, _, _} = Destroy, TopXMLNS) ->
    encode_mix_destroy(Destroy, TopXMLNS);
do_encode({mix, _, _, _, _} = Mix, TopXMLNS) ->
    encode_mix(Mix, TopXMLNS).

do_get_name({mix, _, _, _, _}) -> <<"mix">>;
do_get_name({mix_create, _, _}) -> <<"create">>;
do_get_name({mix_destroy, _, _}) -> <<"destroy">>;
do_get_name({mix_join, _, _, _, _, _}) -> <<"join">>;
do_get_name({mix_leave, _}) -> <<"leave">>;
do_get_name({mix_participant, _, _, _}) ->
    <<"participant">>;
do_get_name({mix_setnick, _, _}) -> <<"setnick">>;
do_get_name({mix_update_subscription, _, _, _, _}) ->
    <<"update-subscription">>.

do_get_ns({mix, _, _, _, Xmlns}) -> Xmlns;
do_get_ns({mix_create, _, Xmlns}) -> Xmlns;
do_get_ns({mix_destroy, _, Xmlns}) -> Xmlns;
do_get_ns({mix_join, _, _, _, _, Xmlns}) -> Xmlns;
do_get_ns({mix_leave, Xmlns}) -> Xmlns;
do_get_ns({mix_participant, _, _, Xmlns}) -> Xmlns;
do_get_ns({mix_setnick, _, Xmlns}) -> Xmlns;
do_get_ns({mix_update_subscription, Xmlns, _, _, _}) ->
    Xmlns.

pp(mix_setnick, 2) -> [nick, xmlns];
pp(mix_update_subscription, 4) ->
    [xmlns, jid, subscribe, unsubscribe];
pp(mix_join, 5) -> [id, jid, nick, subscribe, xmlns];
pp(mix_leave, 1) -> [xmlns];
pp(mix_participant, 3) -> [jid, nick, xmlns];
pp(mix_create, 2) -> [channel, xmlns];
pp(mix_destroy, 2) -> [channel, xmlns];
pp(mix, 4) -> [submission_id, jid, nick, xmlns];
pp(_, _) -> no.

records() ->
    [{mix_setnick, 2},
     {mix_update_subscription, 4},
     {mix_join, 5},
     {mix_leave, 1},
     {mix_participant, 3},
     {mix_create, 2},
     {mix_destroy, 2},
     {mix, 4}].

nodeprep(S) ->
    case jid:nodeprep(S) of
        error -> erlang:error(badarg);
        S1 -> S1
    end.

decode_mix(__TopXMLNS, __Opts,
           {xmlel, <<"mix">>, _attrs, _els}) ->
    {Jid, Submission_id, Nick} = decode_mix_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                undefined,
                                                <<>>,
                                                <<>>),
    Xmlns = decode_mix_attrs(__TopXMLNS, _attrs, undefined),
    {mix, Submission_id, Jid, Nick, Xmlns}.

decode_mix_els(__TopXMLNS, __Opts, [], Jid,
               Submission_id, Nick) ->
    {Jid, Submission_id, Nick};
decode_mix_els(__TopXMLNS, __Opts,
               [{xmlel, <<"submission-id">>, _attrs, _} = _el | _els],
               Jid, Submission_id, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Jid,
                           decode_mix_submission_id(<<"urn:xmpp:mix:core:0">>,
                                                    __Opts,
                                                    _el),
                           Nick);
        _ ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Jid,
                           Submission_id,
                           Nick)
    end;
decode_mix_els(__TopXMLNS, __Opts,
               [{xmlel, <<"jid">>, _attrs, _} = _el | _els], Jid,
               Submission_id, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           decode_mix_jid(<<"urn:xmpp:mix:core:0">>,
                                          __Opts,
                                          _el),
                           Submission_id,
                           Nick);
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           decode_mix_jid(<<"urn:xmpp:mix:core:1">>,
                                          __Opts,
                                          _el),
                           Submission_id,
                           Nick);
        <<"urn:xmpp:mix:presence:0">> ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           decode_mix_jid(<<"urn:xmpp:mix:presence:0">>,
                                          __Opts,
                                          _el),
                           Submission_id,
                           Nick);
        _ ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Jid,
                           Submission_id,
                           Nick)
    end;
decode_mix_els(__TopXMLNS, __Opts,
               [{xmlel, <<"nick">>, _attrs, _} = _el | _els], Jid,
               Submission_id, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Jid,
                           Submission_id,
                           decode_mix_nick(<<"urn:xmpp:mix:core:0">>,
                                           __Opts,
                                           _el));
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Jid,
                           Submission_id,
                           decode_mix_nick(<<"urn:xmpp:mix:core:1">>,
                                           __Opts,
                                           _el));
        <<"urn:xmpp:mix:presence:0">> ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Jid,
                           Submission_id,
                           decode_mix_nick(<<"urn:xmpp:mix:presence:0">>,
                                           __Opts,
                                           _el));
        _ ->
            decode_mix_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Jid,
                           Submission_id,
                           Nick)
    end;
decode_mix_els(__TopXMLNS, __Opts, [_ | _els], Jid,
               Submission_id, Nick) ->
    decode_mix_els(__TopXMLNS,
                   __Opts,
                   _els,
                   Jid,
                   Submission_id,
                   Nick).

decode_mix_attrs(__TopXMLNS,
                 [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_mix_attrs(__TopXMLNS, _attrs, _val);
decode_mix_attrs(__TopXMLNS, [_ | _attrs], Xmlns) ->
    decode_mix_attrs(__TopXMLNS, _attrs, Xmlns);
decode_mix_attrs(__TopXMLNS, [], Xmlns) ->
    decode_mix_attr_xmlns(__TopXMLNS, Xmlns).

encode_mix({mix, Submission_id, Jid, Nick, Xmlns},
           __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els = lists:reverse('encode_mix_$jid'(Jid,
                                           __NewTopXMLNS,
                                           'encode_mix_$submission_id'(Submission_id,
                                                                       __NewTopXMLNS,
                                                                       'encode_mix_$nick'(Nick,
                                                                                          __NewTopXMLNS,
                                                                                          [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"mix">>, _attrs, _els}.

'encode_mix_$jid'(undefined, __TopXMLNS, _acc) -> _acc;
'encode_mix_$jid'(Jid, __TopXMLNS, _acc) ->
    [encode_mix_jid(Jid, __TopXMLNS) | _acc].

'encode_mix_$submission_id'(<<>>, __TopXMLNS, _acc) ->
    _acc;
'encode_mix_$submission_id'(Submission_id, __TopXMLNS,
                            _acc) ->
    [encode_mix_submission_id(Submission_id, __TopXMLNS)
     | _acc].

'encode_mix_$nick'(<<>>, __TopXMLNS, _acc) -> _acc;
'encode_mix_$nick'(Nick, __TopXMLNS, _acc) ->
    [encode_mix_nick(Nick, __TopXMLNS) | _acc].

decode_mix_attr_xmlns(__TopXMLNS, undefined) -> <<>>;
decode_mix_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mix_destroy(__TopXMLNS, __Opts,
                   {xmlel, <<"destroy">>, _attrs, _els}) ->
    {Channel, Xmlns} = decode_mix_destroy_attrs(__TopXMLNS,
                                                _attrs,
                                                undefined,
                                                undefined),
    {mix_destroy, Channel, Xmlns}.

decode_mix_destroy_attrs(__TopXMLNS,
                         [{<<"channel">>, _val} | _attrs], _Channel, Xmlns) ->
    decode_mix_destroy_attrs(__TopXMLNS,
                             _attrs,
                             _val,
                             Xmlns);
decode_mix_destroy_attrs(__TopXMLNS,
                         [{<<"xmlns">>, _val} | _attrs], Channel, _Xmlns) ->
    decode_mix_destroy_attrs(__TopXMLNS,
                             _attrs,
                             Channel,
                             _val);
decode_mix_destroy_attrs(__TopXMLNS, [_ | _attrs],
                         Channel, Xmlns) ->
    decode_mix_destroy_attrs(__TopXMLNS,
                             _attrs,
                             Channel,
                             Xmlns);
decode_mix_destroy_attrs(__TopXMLNS, [], Channel,
                         Xmlns) ->
    {decode_mix_destroy_attr_channel(__TopXMLNS, Channel),
     decode_mix_destroy_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_mix_destroy({mix_destroy, Channel, Xmlns},
                   __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els = [],
    _attrs = encode_mix_destroy_attr_channel(Channel,
                                             xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                        __TopXMLNS)),
    {xmlel, <<"destroy">>, _attrs, _els}.

decode_mix_destroy_attr_channel(__TopXMLNS,
                                undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"channel">>,
                   <<"destroy">>,
                   __TopXMLNS}});
decode_mix_destroy_attr_channel(__TopXMLNS, _val) ->
    case catch jid:nodeprep(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"channel">>,
                           <<"destroy">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_mix_destroy_attr_channel(_val, _acc) ->
    [{<<"channel">>, _val} | _acc].

decode_mix_destroy_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mix_destroy_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mix_create(__TopXMLNS, __Opts,
                  {xmlel, <<"create">>, _attrs, _els}) ->
    {Channel, Xmlns} = decode_mix_create_attrs(__TopXMLNS,
                                               _attrs,
                                               undefined,
                                               undefined),
    {mix_create, Channel, Xmlns}.

decode_mix_create_attrs(__TopXMLNS,
                        [{<<"channel">>, _val} | _attrs], _Channel, Xmlns) ->
    decode_mix_create_attrs(__TopXMLNS,
                            _attrs,
                            _val,
                            Xmlns);
decode_mix_create_attrs(__TopXMLNS,
                        [{<<"xmlns">>, _val} | _attrs], Channel, _Xmlns) ->
    decode_mix_create_attrs(__TopXMLNS,
                            _attrs,
                            Channel,
                            _val);
decode_mix_create_attrs(__TopXMLNS, [_ | _attrs],
                        Channel, Xmlns) ->
    decode_mix_create_attrs(__TopXMLNS,
                            _attrs,
                            Channel,
                            Xmlns);
decode_mix_create_attrs(__TopXMLNS, [], Channel,
                        Xmlns) ->
    {decode_mix_create_attr_channel(__TopXMLNS, Channel),
     decode_mix_create_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_mix_create({mix_create, Channel, Xmlns},
                  __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els = [],
    _attrs = encode_mix_create_attr_channel(Channel,
                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                       __TopXMLNS)),
    {xmlel, <<"create">>, _attrs, _els}.

decode_mix_create_attr_channel(__TopXMLNS, undefined) ->
    <<>>;
decode_mix_create_attr_channel(__TopXMLNS, _val) ->
    case catch nodeprep(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"channel">>,
                           <<"create">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_mix_create_attr_channel(<<>>, _acc) -> _acc;
encode_mix_create_attr_channel(_val, _acc) ->
    [{<<"channel">>, _val} | _acc].

decode_mix_create_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mix_create_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mix_participant(__TopXMLNS, __Opts,
                       {xmlel, <<"participant">>, _attrs, _els}) ->
    {Jid, Nick, Xmlns} =
        decode_mix_participant_attrs(__TopXMLNS,
                                     _attrs,
                                     undefined,
                                     undefined,
                                     undefined),
    {mix_participant, Jid, Nick, Xmlns}.

decode_mix_participant_attrs(__TopXMLNS,
                             [{<<"jid">>, _val} | _attrs], _Jid, Nick, Xmlns) ->
    decode_mix_participant_attrs(__TopXMLNS,
                                 _attrs,
                                 _val,
                                 Nick,
                                 Xmlns);
decode_mix_participant_attrs(__TopXMLNS,
                             [{<<"nick">>, _val} | _attrs], Jid, _Nick,
                             Xmlns) ->
    decode_mix_participant_attrs(__TopXMLNS,
                                 _attrs,
                                 Jid,
                                 _val,
                                 Xmlns);
decode_mix_participant_attrs(__TopXMLNS,
                             [{<<"xmlns">>, _val} | _attrs], Jid, Nick,
                             _Xmlns) ->
    decode_mix_participant_attrs(__TopXMLNS,
                                 _attrs,
                                 Jid,
                                 Nick,
                                 _val);
decode_mix_participant_attrs(__TopXMLNS, [_ | _attrs],
                             Jid, Nick, Xmlns) ->
    decode_mix_participant_attrs(__TopXMLNS,
                                 _attrs,
                                 Jid,
                                 Nick,
                                 Xmlns);
decode_mix_participant_attrs(__TopXMLNS, [], Jid, Nick,
                             Xmlns) ->
    {decode_mix_participant_attr_jid(__TopXMLNS, Jid),
     decode_mix_participant_attr_nick(__TopXMLNS, Nick),
     decode_mix_participant_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_mix_participant({mix_participant,
                        Jid,
                        Nick,
                        Xmlns},
                       __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els = [],
    _attrs = encode_mix_participant_attr_nick(Nick,
                                              encode_mix_participant_attr_jid(Jid,
                                                                              xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                         __TopXMLNS))),
    {xmlel, <<"participant">>, _attrs, _els}.

decode_mix_participant_attr_jid(__TopXMLNS,
                                undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"jid">>,
                   <<"participant">>,
                   __TopXMLNS}});
decode_mix_participant_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"jid">>,
                           <<"participant">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_mix_participant_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_mix_participant_attr_nick(__TopXMLNS,
                                 undefined) ->
    <<>>;
decode_mix_participant_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_mix_participant_attr_nick(<<>>, _acc) -> _acc;
encode_mix_participant_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_mix_participant_attr_xmlns(__TopXMLNS,
                                  undefined) ->
    <<>>;
decode_mix_participant_attr_xmlns(__TopXMLNS, _val) ->
    _val.

decode_mix_leave(__TopXMLNS, __Opts,
                 {xmlel, <<"leave">>, _attrs, _els}) ->
    Xmlns = decode_mix_leave_attrs(__TopXMLNS,
                                   _attrs,
                                   undefined),
    {mix_leave, Xmlns}.

decode_mix_leave_attrs(__TopXMLNS,
                       [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_mix_leave_attrs(__TopXMLNS, _attrs, _val);
decode_mix_leave_attrs(__TopXMLNS, [_ | _attrs],
                       Xmlns) ->
    decode_mix_leave_attrs(__TopXMLNS, _attrs, Xmlns);
decode_mix_leave_attrs(__TopXMLNS, [], Xmlns) ->
    decode_mix_leave_attr_xmlns(__TopXMLNS, Xmlns).

encode_mix_leave({mix_leave, Xmlns}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"leave">>, _attrs, _els}.

decode_mix_leave_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mix_leave_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mix_join(__TopXMLNS, __Opts,
                {xmlel, <<"join">>, _attrs, _els}) ->
    {Subscribe, Nick} = decode_mix_join_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            [],
                                            <<>>),
    {Id, Jid, Xmlns} = decode_mix_join_attrs(__TopXMLNS,
                                             _attrs,
                                             undefined,
                                             undefined,
                                             undefined),
    {mix_join, Id, Jid, Nick, Subscribe, Xmlns}.

decode_mix_join_els(__TopXMLNS, __Opts, [], Subscribe,
                    Nick) ->
    {lists:reverse(Subscribe), Nick};
decode_mix_join_els(__TopXMLNS, __Opts,
                    [{xmlel, <<"subscribe">>, _attrs, _} = _el | _els],
                    Subscribe, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_join_els(__TopXMLNS,
                                __Opts,
                                _els,
                                [decode_mix_subscribe(<<"urn:xmpp:mix:core:0">>,
                                                      __Opts,
                                                      _el)
                                 | Subscribe],
                                Nick);
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_join_els(__TopXMLNS,
                                __Opts,
                                _els,
                                [decode_mix_subscribe(<<"urn:xmpp:mix:core:1">>,
                                                      __Opts,
                                                      _el)
                                 | Subscribe],
                                Nick);
        _ ->
            decode_mix_join_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Subscribe,
                                Nick)
    end;
decode_mix_join_els(__TopXMLNS, __Opts,
                    [{xmlel, <<"nick">>, _attrs, _} = _el | _els],
                    Subscribe, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_join_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Subscribe,
                                decode_mix_nick(<<"urn:xmpp:mix:core:0">>,
                                                __Opts,
                                                _el));
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_join_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Subscribe,
                                decode_mix_nick(<<"urn:xmpp:mix:core:1">>,
                                                __Opts,
                                                _el));
        <<"urn:xmpp:mix:presence:0">> ->
            decode_mix_join_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Subscribe,
                                decode_mix_nick(<<"urn:xmpp:mix:presence:0">>,
                                                __Opts,
                                                _el));
        _ ->
            decode_mix_join_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Subscribe,
                                Nick)
    end;
decode_mix_join_els(__TopXMLNS, __Opts, [_ | _els],
                    Subscribe, Nick) ->
    decode_mix_join_els(__TopXMLNS,
                        __Opts,
                        _els,
                        Subscribe,
                        Nick).

decode_mix_join_attrs(__TopXMLNS,
                      [{<<"id">>, _val} | _attrs], _Id, Jid, Xmlns) ->
    decode_mix_join_attrs(__TopXMLNS,
                          _attrs,
                          _val,
                          Jid,
                          Xmlns);
decode_mix_join_attrs(__TopXMLNS,
                      [{<<"jid">>, _val} | _attrs], Id, _Jid, Xmlns) ->
    decode_mix_join_attrs(__TopXMLNS,
                          _attrs,
                          Id,
                          _val,
                          Xmlns);
decode_mix_join_attrs(__TopXMLNS,
                      [{<<"xmlns">>, _val} | _attrs], Id, Jid, _Xmlns) ->
    decode_mix_join_attrs(__TopXMLNS,
                          _attrs,
                          Id,
                          Jid,
                          _val);
decode_mix_join_attrs(__TopXMLNS, [_ | _attrs], Id, Jid,
                      Xmlns) ->
    decode_mix_join_attrs(__TopXMLNS,
                          _attrs,
                          Id,
                          Jid,
                          Xmlns);
decode_mix_join_attrs(__TopXMLNS, [], Id, Jid, Xmlns) ->
    {decode_mix_join_attr_id(__TopXMLNS, Id),
     decode_mix_join_attr_jid(__TopXMLNS, Jid),
     decode_mix_join_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_mix_join({mix_join,
                 Id,
                 Jid,
                 Nick,
                 Subscribe,
                 Xmlns},
                __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els =
        lists:reverse('encode_mix_join_$subscribe'(Subscribe,
                                                   __NewTopXMLNS,
                                                   'encode_mix_join_$nick'(Nick,
                                                                           __NewTopXMLNS,
                                                                           []))),
    _attrs = encode_mix_join_attr_jid(Jid,
                                      encode_mix_join_attr_id(Id,
                                                              xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                         __TopXMLNS))),
    {xmlel, <<"join">>, _attrs, _els}.

'encode_mix_join_$subscribe'([], __TopXMLNS, _acc) ->
    _acc;
'encode_mix_join_$subscribe'([Subscribe | _els],
                             __TopXMLNS, _acc) ->
    'encode_mix_join_$subscribe'(_els,
                                 __TopXMLNS,
                                 [encode_mix_subscribe(Subscribe, __TopXMLNS)
                                  | _acc]).

'encode_mix_join_$nick'(<<>>, __TopXMLNS, _acc) -> _acc;
'encode_mix_join_$nick'(Nick, __TopXMLNS, _acc) ->
    [encode_mix_nick(Nick, __TopXMLNS) | _acc].

decode_mix_join_attr_id(__TopXMLNS, undefined) -> <<>>;
decode_mix_join_attr_id(__TopXMLNS, _val) -> _val.

encode_mix_join_attr_id(<<>>, _acc) -> _acc;
encode_mix_join_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_mix_join_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_mix_join_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value, <<"jid">>, <<"join">>, __TopXMLNS}});
        _res -> _res
    end.

encode_mix_join_attr_jid(undefined, _acc) -> _acc;
encode_mix_join_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_mix_join_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mix_join_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mix_update_subscription(__TopXMLNS, __Opts,
                               {xmlel,
                                <<"update-subscription">>,
                                _attrs,
                                _els}) ->
    {Unsubscribe, Subscribe} =
        decode_mix_update_subscription_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           [],
                                           []),
    {Xmlns, Jid} =
        decode_mix_update_subscription_attrs(__TopXMLNS,
                                             _attrs,
                                             undefined,
                                             undefined),
    {mix_update_subscription,
     Xmlns,
     Jid,
     Subscribe,
     Unsubscribe}.

decode_mix_update_subscription_els(__TopXMLNS, __Opts,
                                   [], Unsubscribe, Subscribe) ->
    {lists:reverse(Unsubscribe), lists:reverse(Subscribe)};
decode_mix_update_subscription_els(__TopXMLNS, __Opts,
                                   [{xmlel, <<"subscribe">>, _attrs, _} = _el
                                    | _els],
                                   Unsubscribe, Subscribe) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_update_subscription_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               Unsubscribe,
                                               [decode_mix_subscribe(<<"urn:xmpp:mix:core:0">>,
                                                                     __Opts,
                                                                     _el)
                                                | Subscribe]);
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_update_subscription_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               Unsubscribe,
                                               [decode_mix_subscribe(<<"urn:xmpp:mix:core:1">>,
                                                                     __Opts,
                                                                     _el)
                                                | Subscribe]);
        _ ->
            decode_mix_update_subscription_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               Unsubscribe,
                                               Subscribe)
    end;
decode_mix_update_subscription_els(__TopXMLNS, __Opts,
                                   [{xmlel, <<"unsubscribe">>, _attrs, _} = _el
                                    | _els],
                                   Unsubscribe, Subscribe) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_update_subscription_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               [decode_mix_unsubscribe(<<"urn:xmpp:mix:core:0">>,
                                                                       __Opts,
                                                                       _el)
                                                | Unsubscribe],
                                               Subscribe);
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_update_subscription_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               [decode_mix_unsubscribe(<<"urn:xmpp:mix:core:1">>,
                                                                       __Opts,
                                                                       _el)
                                                | Unsubscribe],
                                               Subscribe);
        _ ->
            decode_mix_update_subscription_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               Unsubscribe,
                                               Subscribe)
    end;
decode_mix_update_subscription_els(__TopXMLNS, __Opts,
                                   [_ | _els], Unsubscribe, Subscribe) ->
    decode_mix_update_subscription_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Unsubscribe,
                                       Subscribe).

decode_mix_update_subscription_attrs(__TopXMLNS,
                                     [{<<"xmlns">>, _val} | _attrs], _Xmlns,
                                     Jid) ->
    decode_mix_update_subscription_attrs(__TopXMLNS,
                                         _attrs,
                                         _val,
                                         Jid);
decode_mix_update_subscription_attrs(__TopXMLNS,
                                     [{<<"jid">>, _val} | _attrs], Xmlns,
                                     _Jid) ->
    decode_mix_update_subscription_attrs(__TopXMLNS,
                                         _attrs,
                                         Xmlns,
                                         _val);
decode_mix_update_subscription_attrs(__TopXMLNS,
                                     [_ | _attrs], Xmlns, Jid) ->
    decode_mix_update_subscription_attrs(__TopXMLNS,
                                         _attrs,
                                         Xmlns,
                                         Jid);
decode_mix_update_subscription_attrs(__TopXMLNS, [],
                                     Xmlns, Jid) ->
    {decode_mix_update_subscription_attr_xmlns(__TopXMLNS,
                                               Xmlns),
     decode_mix_update_subscription_attr_jid(__TopXMLNS,
                                             Jid)}.

encode_mix_update_subscription({mix_update_subscription,
                                Xmlns,
                                Jid,
                                Subscribe,
                                Unsubscribe},
                               __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els =
        lists:reverse('encode_mix_update_subscription_$unsubscribe'(Unsubscribe,
                                                                    __NewTopXMLNS,
                                                                    'encode_mix_update_subscription_$subscribe'(Subscribe,
                                                                                                                __NewTopXMLNS,
                                                                                                                []))),
    _attrs = encode_mix_update_subscription_attr_jid(Jid,
                                                     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                __TopXMLNS)),
    {xmlel, <<"update-subscription">>, _attrs, _els}.

'encode_mix_update_subscription_$unsubscribe'([],
                                              __TopXMLNS, _acc) ->
    _acc;
'encode_mix_update_subscription_$unsubscribe'([Unsubscribe
                                               | _els],
                                              __TopXMLNS, _acc) ->
    'encode_mix_update_subscription_$unsubscribe'(_els,
                                                  __TopXMLNS,
                                                  [encode_mix_unsubscribe(Unsubscribe,
                                                                          __TopXMLNS)
                                                   | _acc]).

'encode_mix_update_subscription_$subscribe'([],
                                            __TopXMLNS, _acc) ->
    _acc;
'encode_mix_update_subscription_$subscribe'([Subscribe
                                             | _els],
                                            __TopXMLNS, _acc) ->
    'encode_mix_update_subscription_$subscribe'(_els,
                                                __TopXMLNS,
                                                [encode_mix_subscribe(Subscribe,
                                                                      __TopXMLNS)
                                                 | _acc]).

decode_mix_update_subscription_attr_xmlns(__TopXMLNS,
                                          undefined) ->
    <<>>;
decode_mix_update_subscription_attr_xmlns(__TopXMLNS,
                                          _val) ->
    _val.

decode_mix_update_subscription_attr_jid(__TopXMLNS,
                                        undefined) ->
    undefined;
decode_mix_update_subscription_attr_jid(__TopXMLNS,
                                        _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"jid">>,
                           <<"update-subscription">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_mix_update_subscription_attr_jid(undefined,
                                        _acc) ->
    _acc;
encode_mix_update_subscription_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_mix_setnick(__TopXMLNS, __Opts,
                   {xmlel, <<"setnick">>, _attrs, _els}) ->
    Nick = decode_mix_setnick_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  error),
    Xmlns = decode_mix_setnick_attrs(__TopXMLNS,
                                     _attrs,
                                     undefined),
    {mix_setnick, Nick, Xmlns}.

decode_mix_setnick_els(__TopXMLNS, __Opts, [], Nick) ->
    case Nick of
        error ->
            erlang:error({xmpp_codec,
                          {missing_tag, <<"nick">>, __TopXMLNS}});
        {value, Nick1} -> Nick1
    end;
decode_mix_setnick_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"nick">>, _attrs, _} = _el | _els], Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:mix:core:0">> ->
            decode_mix_setnick_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   {value,
                                    decode_mix_nick(<<"urn:xmpp:mix:core:0">>,
                                                    __Opts,
                                                    _el)});
        <<"urn:xmpp:mix:core:1">> ->
            decode_mix_setnick_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   {value,
                                    decode_mix_nick(<<"urn:xmpp:mix:core:1">>,
                                                    __Opts,
                                                    _el)});
        <<"urn:xmpp:mix:presence:0">> ->
            decode_mix_setnick_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   {value,
                                    decode_mix_nick(<<"urn:xmpp:mix:presence:0">>,
                                                    __Opts,
                                                    _el)});
        _ ->
            decode_mix_setnick_els(__TopXMLNS, __Opts, _els, Nick)
    end;
decode_mix_setnick_els(__TopXMLNS, __Opts, [_ | _els],
                       Nick) ->
    decode_mix_setnick_els(__TopXMLNS, __Opts, _els, Nick).

decode_mix_setnick_attrs(__TopXMLNS,
                         [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_mix_setnick_attrs(__TopXMLNS, _attrs, _val);
decode_mix_setnick_attrs(__TopXMLNS, [_ | _attrs],
                         Xmlns) ->
    decode_mix_setnick_attrs(__TopXMLNS, _attrs, Xmlns);
decode_mix_setnick_attrs(__TopXMLNS, [], Xmlns) ->
    decode_mix_setnick_attr_xmlns(__TopXMLNS, Xmlns).

encode_mix_setnick({mix_setnick, Nick, Xmlns},
                   __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els = lists:reverse('encode_mix_setnick_$nick'(Nick,
                                                    __NewTopXMLNS,
                                                    [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"setnick">>, _attrs, _els}.

'encode_mix_setnick_$nick'(Nick, __TopXMLNS, _acc) ->
    [encode_mix_nick(Nick, __TopXMLNS) | _acc].

decode_mix_setnick_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mix_setnick_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mix_submission_id(__TopXMLNS, __Opts,
                         {xmlel, <<"submission-id">>, _attrs, _els}) ->
    Cdata = decode_mix_submission_id_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         <<>>),
    Cdata.

decode_mix_submission_id_els(__TopXMLNS, __Opts, [],
                             Cdata) ->
    decode_mix_submission_id_cdata(__TopXMLNS, Cdata);
decode_mix_submission_id_els(__TopXMLNS, __Opts,
                             [{xmlcdata, _data} | _els], Cdata) ->
    decode_mix_submission_id_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 <<Cdata/binary, _data/binary>>);
decode_mix_submission_id_els(__TopXMLNS, __Opts,
                             [_ | _els], Cdata) ->
    decode_mix_submission_id_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 Cdata).

encode_mix_submission_id(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mix:core:0">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_mix_submission_id_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"submission-id">>, _attrs, _els}.

decode_mix_submission_id_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata,
                   <<>>,
                   <<"submission-id">>,
                   __TopXMLNS}});
decode_mix_submission_id_cdata(__TopXMLNS, _val) ->
    _val.

encode_mix_submission_id_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_mix_jid(__TopXMLNS, __Opts,
               {xmlel, <<"jid">>, _attrs, _els}) ->
    Cdata = decode_mix_jid_els(__TopXMLNS,
                               __Opts,
                               _els,
                               <<>>),
    Cdata.

decode_mix_jid_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_mix_jid_cdata(__TopXMLNS, Cdata);
decode_mix_jid_els(__TopXMLNS, __Opts,
                   [{xmlcdata, _data} | _els], Cdata) ->
    decode_mix_jid_els(__TopXMLNS,
                       __Opts,
                       _els,
                       <<Cdata/binary, _data/binary>>);
decode_mix_jid_els(__TopXMLNS, __Opts, [_ | _els],
                   Cdata) ->
    decode_mix_jid_els(__TopXMLNS, __Opts, _els, Cdata).

encode_mix_jid(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>,
                                                 <<"urn:xmpp:mix:presence:0">>],
                                                __TopXMLNS),
    _els = encode_mix_jid_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"jid">>, _attrs, _els}.

decode_mix_jid_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"jid">>, __TopXMLNS}});
decode_mix_jid_cdata(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"jid">>, __TopXMLNS}});
        _res -> _res
    end.

encode_mix_jid_cdata(_val, _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].

decode_mix_nick(__TopXMLNS, __Opts,
                {xmlel, <<"nick">>, _attrs, _els}) ->
    Cdata = decode_mix_nick_els(__TopXMLNS,
                                __Opts,
                                _els,
                                <<>>),
    Cdata.

decode_mix_nick_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_mix_nick_cdata(__TopXMLNS, Cdata);
decode_mix_nick_els(__TopXMLNS, __Opts,
                    [{xmlcdata, _data} | _els], Cdata) ->
    decode_mix_nick_els(__TopXMLNS,
                        __Opts,
                        _els,
                        <<Cdata/binary, _data/binary>>);
decode_mix_nick_els(__TopXMLNS, __Opts, [_ | _els],
                    Cdata) ->
    decode_mix_nick_els(__TopXMLNS, __Opts, _els, Cdata).

encode_mix_nick(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>,
                                                 <<"urn:xmpp:mix:presence:0">>],
                                                __TopXMLNS),
    _els = encode_mix_nick_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"nick">>, _attrs, _els}.

decode_mix_nick_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"nick">>, __TopXMLNS}});
decode_mix_nick_cdata(__TopXMLNS, _val) -> _val.

encode_mix_nick_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_mix_unsubscribe(__TopXMLNS, __Opts,
                       {xmlel, <<"unsubscribe">>, _attrs, _els}) ->
    Node = decode_mix_unsubscribe_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined),
    Node.

decode_mix_unsubscribe_attrs(__TopXMLNS,
                             [{<<"node">>, _val} | _attrs], _Node) ->
    decode_mix_unsubscribe_attrs(__TopXMLNS, _attrs, _val);
decode_mix_unsubscribe_attrs(__TopXMLNS, [_ | _attrs],
                             Node) ->
    decode_mix_unsubscribe_attrs(__TopXMLNS, _attrs, Node);
decode_mix_unsubscribe_attrs(__TopXMLNS, [], Node) ->
    decode_mix_unsubscribe_attr_node(__TopXMLNS, Node).

encode_mix_unsubscribe(Node, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els = [],
    _attrs = encode_mix_unsubscribe_attr_node(Node,
                                              xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                         __TopXMLNS)),
    {xmlel, <<"unsubscribe">>, _attrs, _els}.

decode_mix_unsubscribe_attr_node(__TopXMLNS,
                                 undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"node">>,
                   <<"unsubscribe">>,
                   __TopXMLNS}});
decode_mix_unsubscribe_attr_node(__TopXMLNS, _val) ->
    _val.

encode_mix_unsubscribe_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_mix_subscribe(__TopXMLNS, __Opts,
                     {xmlel, <<"subscribe">>, _attrs, _els}) ->
    Node = decode_mix_subscribe_attrs(__TopXMLNS,
                                      _attrs,
                                      undefined),
    Node.

decode_mix_subscribe_attrs(__TopXMLNS,
                           [{<<"node">>, _val} | _attrs], _Node) ->
    decode_mix_subscribe_attrs(__TopXMLNS, _attrs, _val);
decode_mix_subscribe_attrs(__TopXMLNS, [_ | _attrs],
                           Node) ->
    decode_mix_subscribe_attrs(__TopXMLNS, _attrs, Node);
decode_mix_subscribe_attrs(__TopXMLNS, [], Node) ->
    decode_mix_subscribe_attr_node(__TopXMLNS, Node).

encode_mix_subscribe(Node, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:mix:core:0">>,
                                                 <<"urn:xmpp:mix:core:1">>],
                                                __TopXMLNS),
    _els = [],
    _attrs = encode_mix_subscribe_attr_node(Node,
                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                       __TopXMLNS)),
    {xmlel, <<"subscribe">>, _attrs, _els}.

decode_mix_subscribe_attr_node(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"node">>,
                   <<"subscribe">>,
                   __TopXMLNS}});
decode_mix_subscribe_attr_node(__TopXMLNS, _val) ->
    _val.

encode_mix_subscribe_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].
