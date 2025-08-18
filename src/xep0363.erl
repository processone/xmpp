%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0363).

-compile(export_all).

do_decode(<<"permanent">>,
          <<"urn:xmpp:http:upload:purpose:0">>, El, Opts) ->
    decode_upload_purpose_permanent_0(<<"urn:xmpp:http:upload:purpose:0">>,
                                      Opts,
                                      El);
do_decode(<<"ephemeral">>,
          <<"urn:xmpp:http:upload:purpose:0">>, El, Opts) ->
    decode_upload_purpose_ephemeral_0(<<"urn:xmpp:http:upload:purpose:0">>,
                                      Opts,
                                      El);
do_decode(<<"profile">>,
          <<"urn:xmpp:http:upload:purpose:0">>, El, Opts) ->
    decode_upload_purpose_profile_0(<<"urn:xmpp:http:upload:purpose:0">>,
                                    Opts,
                                    El);
do_decode(<<"message">>,
          <<"urn:xmpp:http:upload:purpose:0">>, El, Opts) ->
    decode_upload_purpose_message_0(<<"urn:xmpp:http:upload:purpose:0">>,
                                    Opts,
                                    El);
do_decode(<<"retry">>, <<"urn:xmpp:http:upload:0">>, El,
          Opts) ->
    decode_upload_retry(<<"urn:xmpp:http:upload:0">>,
                        Opts,
                        El);
do_decode(<<"file-too-large">>,
          <<"urn:xmpp:http:upload:0">>, El, Opts) ->
    decode_upload_file_too_large(<<"urn:xmpp:http:upload:0">>,
                                 Opts,
                                 El);
do_decode(<<"file-too-large">>,
          <<"urn:xmpp:http:upload">>, El, Opts) ->
    decode_upload_file_too_large(<<"urn:xmpp:http:upload">>,
                                 Opts,
                                 El);
do_decode(<<"file-too-large">>,
          <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_file_too_large(<<"eu:siacs:conversations:http:upload">>,
                                 Opts,
                                 El);
do_decode(<<"max-file-size">>,
          <<"urn:xmpp:http:upload:0">>, El, Opts) ->
    decode_upload_max_file_size(<<"urn:xmpp:http:upload:0">>,
                                Opts,
                                El);
do_decode(<<"max-file-size">>,
          <<"urn:xmpp:http:upload">>, El, Opts) ->
    decode_upload_max_file_size(<<"urn:xmpp:http:upload">>,
                                Opts,
                                El);
do_decode(<<"max-file-size">>,
          <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_max_file_size(<<"eu:siacs:conversations:http:upload">>,
                                Opts,
                                El);
do_decode(<<"slot">>, <<"urn:xmpp:http:upload:0">>, El,
          Opts) ->
    decode_upload_slot_0(<<"urn:xmpp:http:upload:0">>,
                         Opts,
                         El);
do_decode(<<"put">>, <<"urn:xmpp:http:upload:0">>, El,
          Opts) ->
    decode_upload_put_0(<<"urn:xmpp:http:upload:0">>,
                        Opts,
                        El);
do_decode(<<"get">>, <<"urn:xmpp:http:upload:0">>, El,
          Opts) ->
    decode_upload_get_0(<<"urn:xmpp:http:upload:0">>,
                        Opts,
                        El);
do_decode(<<"request">>, <<"urn:xmpp:http:upload:0">>,
          El, Opts) ->
    decode_upload_request_0(<<"urn:xmpp:http:upload:0">>,
                            Opts,
                            El);
do_decode(<<"slot">>, <<"urn:xmpp:http:upload">>, El,
          Opts) ->
    decode_upload_slot(<<"urn:xmpp:http:upload">>,
                       Opts,
                       El);
do_decode(<<"slot">>,
          <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_slot(<<"eu:siacs:conversations:http:upload">>,
                       Opts,
                       El);
do_decode(<<"put">>, <<"urn:xmpp:http:upload">>, El,
          Opts) ->
    decode_upload_put(<<"urn:xmpp:http:upload">>, Opts, El);
do_decode(<<"put">>,
          <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_put(<<"eu:siacs:conversations:http:upload">>,
                      Opts,
                      El);
do_decode(<<"get">>, <<"urn:xmpp:http:upload">>, El,
          Opts) ->
    decode_upload_get(<<"urn:xmpp:http:upload">>, Opts, El);
do_decode(<<"get">>,
          <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_get(<<"eu:siacs:conversations:http:upload">>,
                      Opts,
                      El);
do_decode(<<"request">>, <<"urn:xmpp:http:upload">>, El,
          Opts) ->
    decode_upload_request(<<"urn:xmpp:http:upload">>,
                          Opts,
                          El);
do_decode(<<"request">>,
          <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_request(<<"eu:siacs:conversations:http:upload">>,
                          Opts,
                          El);
do_decode(<<"content-type">>,
          <<"urn:xmpp:http:upload">>, El, Opts) ->
    decode_upload_content_type(<<"urn:xmpp:http:upload">>,
                               Opts,
                               El);
do_decode(<<"content-type">>,
          <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_content_type(<<"eu:siacs:conversations:http:upload">>,
                               Opts,
                               El);
do_decode(<<"size">>, <<"urn:xmpp:http:upload">>, El,
          Opts) ->
    decode_upload_size(<<"urn:xmpp:http:upload">>,
                       Opts,
                       El);
do_decode(<<"size">>,
          <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_size(<<"eu:siacs:conversations:http:upload">>,
                       Opts,
                       El);
do_decode(<<"filename">>, <<"urn:xmpp:http:upload">>,
          El, Opts) ->
    decode_upload_filename(<<"urn:xmpp:http:upload">>,
                           Opts,
                           El);
do_decode(<<"filename">>,
          <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_filename(<<"eu:siacs:conversations:http:upload">>,
                           Opts,
                           El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"permanent">>,
      <<"urn:xmpp:http:upload:purpose:0">>},
     {<<"ephemeral">>, <<"urn:xmpp:http:upload:purpose:0">>},
     {<<"profile">>, <<"urn:xmpp:http:upload:purpose:0">>},
     {<<"message">>, <<"urn:xmpp:http:upload:purpose:0">>},
     {<<"retry">>, <<"urn:xmpp:http:upload:0">>},
     {<<"file-too-large">>, <<"urn:xmpp:http:upload:0">>},
     {<<"file-too-large">>, <<"urn:xmpp:http:upload">>},
     {<<"file-too-large">>,
      <<"eu:siacs:conversations:http:upload">>},
     {<<"max-file-size">>, <<"urn:xmpp:http:upload:0">>},
     {<<"max-file-size">>, <<"urn:xmpp:http:upload">>},
     {<<"max-file-size">>,
      <<"eu:siacs:conversations:http:upload">>},
     {<<"slot">>, <<"urn:xmpp:http:upload:0">>},
     {<<"put">>, <<"urn:xmpp:http:upload:0">>},
     {<<"get">>, <<"urn:xmpp:http:upload:0">>},
     {<<"request">>, <<"urn:xmpp:http:upload:0">>},
     {<<"slot">>, <<"urn:xmpp:http:upload">>},
     {<<"slot">>, <<"eu:siacs:conversations:http:upload">>},
     {<<"put">>, <<"urn:xmpp:http:upload">>},
     {<<"put">>, <<"eu:siacs:conversations:http:upload">>},
     {<<"get">>, <<"urn:xmpp:http:upload">>},
     {<<"get">>, <<"eu:siacs:conversations:http:upload">>},
     {<<"request">>, <<"urn:xmpp:http:upload">>},
     {<<"request">>,
      <<"eu:siacs:conversations:http:upload">>},
     {<<"content-type">>, <<"urn:xmpp:http:upload">>},
     {<<"content-type">>,
      <<"eu:siacs:conversations:http:upload">>},
     {<<"size">>, <<"urn:xmpp:http:upload">>},
     {<<"size">>, <<"eu:siacs:conversations:http:upload">>},
     {<<"filename">>, <<"urn:xmpp:http:upload">>},
     {<<"filename">>,
      <<"eu:siacs:conversations:http:upload">>}].

do_encode({upload_request, _, _, _, _} = Request,
          TopXMLNS) ->
    encode_upload_request(Request, TopXMLNS);
do_encode({upload_slot, _, _, _} = Slot, TopXMLNS) ->
    encode_upload_slot(Slot, TopXMLNS);
do_encode({upload_request_0,
           _,
           _,
           _,
           _,
           <<"urn:xmpp:http:upload:0">>} =
              Request,
          TopXMLNS) ->
    encode_upload_request_0(Request, TopXMLNS);
do_encode({upload_request_0, _, _, _, _, <<>>} =
              Request,
          TopXMLNS = <<"urn:xmpp:http:upload:0">>) ->
    encode_upload_request_0(Request, TopXMLNS);
do_encode({upload_slot_0,
           _,
           _,
           <<"urn:xmpp:http:upload:0">>} =
              Slot,
          TopXMLNS) ->
    encode_upload_slot_0(Slot, TopXMLNS);
do_encode({upload_slot_0, _, _, <<>>} = Slot,
          TopXMLNS = <<"urn:xmpp:http:upload:0">>) ->
    encode_upload_slot_0(Slot, TopXMLNS);
do_encode({upload_file_too_large, _, _} =
              File_too_large,
          TopXMLNS) ->
    encode_upload_file_too_large(File_too_large, TopXMLNS);
do_encode({upload_retry, _} = Retry, TopXMLNS) ->
    encode_upload_retry(Retry, TopXMLNS).

do_get_name({upload_file_too_large, _, _}) ->
    <<"file-too-large">>;
do_get_name({upload_request, _, _, _, _}) ->
    <<"request">>;
do_get_name({upload_request_0, _, _, _, _, _}) ->
    <<"request">>;
do_get_name({upload_retry, _}) -> <<"retry">>;
do_get_name({upload_slot, _, _, _}) -> <<"slot">>;
do_get_name({upload_slot_0, _, _, _}) -> <<"slot">>.

do_get_ns({upload_file_too_large, _, Xmlns}) -> Xmlns;
do_get_ns({upload_request, _, _, _, Xmlns}) -> Xmlns;
do_get_ns({upload_request_0, _, _, _, _, Xmlns}) ->
    Xmlns;
do_get_ns({upload_retry, _}) ->
    <<"urn:xmpp:http:upload:0">>;
do_get_ns({upload_slot, _, _, Xmlns}) -> Xmlns;
do_get_ns({upload_slot_0, _, _, Xmlns}) -> Xmlns.

pp(upload_request, 4) ->
    [filename, size, 'content-type', xmlns];
pp(upload_slot, 3) -> [get, put, xmlns];
pp(upload_request_0, 5) ->
    [filename, size, 'content-type', purpose, xmlns];
pp(upload_slot_0, 3) -> [get, put, xmlns];
pp(upload_file_too_large, 2) ->
    ['max-file-size', xmlns];
pp(upload_retry, 1) -> [stamp];
pp(_, _) -> no.

records() ->
    [{upload_request, 4},
     {upload_slot, 3},
     {upload_request_0, 5},
     {upload_slot_0, 3},
     {upload_file_too_large, 2},
     {upload_retry, 1}].

dec_int(Val) -> dec_int(Val, infinity, infinity).

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_upload_purpose_permanent_0(__TopXMLNS, __Opts,
                                  {xmlel, <<"permanent">>, _attrs, _els}) ->
    permanent.

encode_upload_purpose_permanent_0(permanent,
                                  __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:http:upload:purpose:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"permanent">>, _attrs, _els}.

decode_upload_purpose_ephemeral_0(__TopXMLNS, __Opts,
                                  {xmlel, <<"ephemeral">>, _attrs, _els}) ->
    ephemeral.

encode_upload_purpose_ephemeral_0(ephemeral,
                                  __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:http:upload:purpose:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"ephemeral">>, _attrs, _els}.

decode_upload_purpose_profile_0(__TopXMLNS, __Opts,
                                {xmlel, <<"profile">>, _attrs, _els}) ->
    profile.

encode_upload_purpose_profile_0(profile, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:http:upload:purpose:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"profile">>, _attrs, _els}.

decode_upload_purpose_message_0(__TopXMLNS, __Opts,
                                {xmlel, <<"message">>, _attrs, _els}) ->
    message.

encode_upload_purpose_message_0(message, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:http:upload:purpose:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"message">>, _attrs, _els}.

decode_upload_retry(__TopXMLNS, __Opts,
                    {xmlel, <<"retry">>, _attrs, _els}) ->
    Stamp = decode_upload_retry_attrs(__TopXMLNS,
                                      _attrs,
                                      undefined),
    {upload_retry, Stamp}.

decode_upload_retry_attrs(__TopXMLNS,
                          [{<<"stamp">>, _val} | _attrs], _Stamp) ->
    decode_upload_retry_attrs(__TopXMLNS, _attrs, _val);
decode_upload_retry_attrs(__TopXMLNS, [_ | _attrs],
                          Stamp) ->
    decode_upload_retry_attrs(__TopXMLNS, _attrs, Stamp);
decode_upload_retry_attrs(__TopXMLNS, [], Stamp) ->
    decode_upload_retry_attr_stamp(__TopXMLNS, Stamp).

encode_upload_retry({upload_retry, Stamp},
                    __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:http:upload:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_upload_retry_attr_stamp(Stamp,
                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                       __TopXMLNS)),
    {xmlel, <<"retry">>, _attrs, _els}.

decode_upload_retry_attr_stamp(__TopXMLNS, undefined) ->
    undefined;
decode_upload_retry_attr_stamp(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"stamp">>,
                           <<"retry">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_upload_retry_attr_stamp(undefined, _acc) -> _acc;
encode_upload_retry_attr_stamp(_val, _acc) ->
    [{<<"stamp">>, enc_utc(_val)} | _acc].

decode_upload_file_too_large(__TopXMLNS, __Opts,
                             {xmlel, <<"file-too-large">>, _attrs, _els}) ->
    Max_file_size =
        decode_upload_file_too_large_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         undefined),
    Xmlns = decode_upload_file_too_large_attrs(__TopXMLNS,
                                               _attrs,
                                               undefined),
    {upload_file_too_large, Max_file_size, Xmlns}.

decode_upload_file_too_large_els(__TopXMLNS, __Opts, [],
                                 Max_file_size) ->
    Max_file_size;
decode_upload_file_too_large_els(__TopXMLNS, __Opts,
                                 [{xmlel, <<"max-file-size">>, _attrs, _} = _el
                                  | _els],
                                 Max_file_size) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload:0">> ->
            decode_upload_file_too_large_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             decode_upload_max_file_size(<<"urn:xmpp:http:upload:0">>,
                                                                         __Opts,
                                                                         _el));
        <<"urn:xmpp:http:upload">> ->
            decode_upload_file_too_large_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             decode_upload_max_file_size(<<"urn:xmpp:http:upload">>,
                                                                         __Opts,
                                                                         _el));
        <<"eu:siacs:conversations:http:upload">> ->
            decode_upload_file_too_large_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             decode_upload_max_file_size(<<"eu:siacs:conversations:http:upload">>,
                                                                         __Opts,
                                                                         _el));
        _ ->
            decode_upload_file_too_large_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             Max_file_size)
    end;
decode_upload_file_too_large_els(__TopXMLNS, __Opts,
                                 [_ | _els], Max_file_size) ->
    decode_upload_file_too_large_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Max_file_size).

decode_upload_file_too_large_attrs(__TopXMLNS,
                                   [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_upload_file_too_large_attrs(__TopXMLNS,
                                       _attrs,
                                       _val);
decode_upload_file_too_large_attrs(__TopXMLNS,
                                   [_ | _attrs], Xmlns) ->
    decode_upload_file_too_large_attrs(__TopXMLNS,
                                       _attrs,
                                       Xmlns);
decode_upload_file_too_large_attrs(__TopXMLNS, [],
                                   Xmlns) ->
    decode_upload_file_too_large_attr_xmlns(__TopXMLNS,
                                            Xmlns).

encode_upload_file_too_large({upload_file_too_large,
                              Max_file_size,
                              Xmlns},
                             __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:http:upload:0">>,
                                                 <<"urn:xmpp:http:upload">>,
                                                 <<"eu:siacs:conversations:http:upload">>],
                                                __TopXMLNS),
    _els =
        lists:reverse('encode_upload_file_too_large_$max-file-size'(Max_file_size,
                                                                    __NewTopXMLNS,
                                                                    [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"file-too-large">>, _attrs, _els}.

'encode_upload_file_too_large_$max-file-size'(undefined,
                                              __TopXMLNS, _acc) ->
    _acc;
'encode_upload_file_too_large_$max-file-size'(Max_file_size,
                                              __TopXMLNS, _acc) ->
    [encode_upload_max_file_size(Max_file_size, __TopXMLNS)
     | _acc].

decode_upload_file_too_large_attr_xmlns(__TopXMLNS,
                                        undefined) ->
    <<>>;
decode_upload_file_too_large_attr_xmlns(__TopXMLNS,
                                        _val) ->
    _val.

decode_upload_max_file_size(__TopXMLNS, __Opts,
                            {xmlel, <<"max-file-size">>, _attrs, _els}) ->
    Cdata = decode_upload_max_file_size_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            <<>>),
    Cdata.

decode_upload_max_file_size_els(__TopXMLNS, __Opts, [],
                                Cdata) ->
    decode_upload_max_file_size_cdata(__TopXMLNS, Cdata);
decode_upload_max_file_size_els(__TopXMLNS, __Opts,
                                [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_max_file_size_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    <<Cdata/binary, _data/binary>>);
decode_upload_max_file_size_els(__TopXMLNS, __Opts,
                                [_ | _els], Cdata) ->
    decode_upload_max_file_size_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Cdata).

encode_upload_max_file_size(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:http:upload:0">>,
                                                 <<"urn:xmpp:http:upload">>,
                                                 <<"eu:siacs:conversations:http:upload">>],
                                                __TopXMLNS),
    _els = encode_upload_max_file_size_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"max-file-size">>, _attrs, _els}.

decode_upload_max_file_size_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata,
                   <<>>,
                   <<"max-file-size">>,
                   __TopXMLNS}});
decode_upload_max_file_size_cdata(__TopXMLNS, _val) ->
    case catch dec_int(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value,
                           <<>>,
                           <<"max-file-size">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_upload_max_file_size_cdata(_val, _acc) ->
    [{xmlcdata, enc_int(_val)} | _acc].

decode_upload_slot_0(__TopXMLNS, __Opts,
                     {xmlel, <<"slot">>, _attrs, _els}) ->
    {Put, Get} = decode_upload_slot_0_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          error,
                                          error),
    Xmlns = decode_upload_slot_0_attrs(__TopXMLNS,
                                       _attrs,
                                       undefined),
    {upload_slot_0, Get, Put, Xmlns}.

decode_upload_slot_0_els(__TopXMLNS, __Opts, [], Put,
                         Get) ->
    {case Put of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"put">>, __TopXMLNS}});
         {value, Put1} -> Put1
     end,
     case Get of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"get">>, __TopXMLNS}});
         {value, Get1} -> Get1
     end};
decode_upload_slot_0_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"get">>, _attrs, _} = _el | _els], Put,
                         Get) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload:0">> ->
            decode_upload_slot_0_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Put,
                                     {value,
                                      decode_upload_get_0(<<"urn:xmpp:http:upload:0">>,
                                                          __Opts,
                                                          _el)});
        _ ->
            decode_upload_slot_0_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Put,
                                     Get)
    end;
decode_upload_slot_0_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"put">>, _attrs, _} = _el | _els], Put,
                         Get) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload:0">> ->
            decode_upload_slot_0_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     {value,
                                      decode_upload_put_0(<<"urn:xmpp:http:upload:0">>,
                                                          __Opts,
                                                          _el)},
                                     Get);
        _ ->
            decode_upload_slot_0_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Put,
                                     Get)
    end;
decode_upload_slot_0_els(__TopXMLNS, __Opts, [_ | _els],
                         Put, Get) ->
    decode_upload_slot_0_els(__TopXMLNS,
                             __Opts,
                             _els,
                             Put,
                             Get).

decode_upload_slot_0_attrs(__TopXMLNS,
                           [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_upload_slot_0_attrs(__TopXMLNS, _attrs, _val);
decode_upload_slot_0_attrs(__TopXMLNS, [_ | _attrs],
                           Xmlns) ->
    decode_upload_slot_0_attrs(__TopXMLNS, _attrs, Xmlns);
decode_upload_slot_0_attrs(__TopXMLNS, [], Xmlns) ->
    decode_upload_slot_0_attr_xmlns(__TopXMLNS, Xmlns).

encode_upload_slot_0({upload_slot_0, Get, Put, Xmlns},
                     __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:http:upload:0">>],
                                                __TopXMLNS),
    _els = lists:reverse('encode_upload_slot_0_$put'(Put,
                                                     __NewTopXMLNS,
                                                     'encode_upload_slot_0_$get'(Get,
                                                                                 __NewTopXMLNS,
                                                                                 []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"slot">>, _attrs, _els}.

'encode_upload_slot_0_$put'(Put, __TopXMLNS, _acc) ->
    [encode_upload_put_0(Put, __TopXMLNS) | _acc].

'encode_upload_slot_0_$get'(Get, __TopXMLNS, _acc) ->
    [encode_upload_get_0(Get, __TopXMLNS) | _acc].

decode_upload_slot_0_attr_xmlns(__TopXMLNS,
                                undefined) ->
    <<>>;
decode_upload_slot_0_attr_xmlns(__TopXMLNS, _val) ->
    _val.

decode_upload_put_0(__TopXMLNS, __Opts,
                    {xmlel, <<"put">>, _attrs, _els}) ->
    Url = decode_upload_put_0_attrs(__TopXMLNS,
                                    _attrs,
                                    undefined),
    Url.

decode_upload_put_0_attrs(__TopXMLNS,
                          [{<<"url">>, _val} | _attrs], _Url) ->
    decode_upload_put_0_attrs(__TopXMLNS, _attrs, _val);
decode_upload_put_0_attrs(__TopXMLNS, [_ | _attrs],
                          Url) ->
    decode_upload_put_0_attrs(__TopXMLNS, _attrs, Url);
decode_upload_put_0_attrs(__TopXMLNS, [], Url) ->
    decode_upload_put_0_attr_url(__TopXMLNS, Url).

encode_upload_put_0(Url, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:http:upload:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_upload_put_0_attr_url(Url,
                                          xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                     __TopXMLNS)),
    {xmlel, <<"put">>, _attrs, _els}.

decode_upload_put_0_attr_url(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"url">>, <<"put">>, __TopXMLNS}});
decode_upload_put_0_attr_url(__TopXMLNS, _val) -> _val.

encode_upload_put_0_attr_url(_val, _acc) ->
    [{<<"url">>, _val} | _acc].

decode_upload_get_0(__TopXMLNS, __Opts,
                    {xmlel, <<"get">>, _attrs, _els}) ->
    Url = decode_upload_get_0_attrs(__TopXMLNS,
                                    _attrs,
                                    undefined),
    Url.

decode_upload_get_0_attrs(__TopXMLNS,
                          [{<<"url">>, _val} | _attrs], _Url) ->
    decode_upload_get_0_attrs(__TopXMLNS, _attrs, _val);
decode_upload_get_0_attrs(__TopXMLNS, [_ | _attrs],
                          Url) ->
    decode_upload_get_0_attrs(__TopXMLNS, _attrs, Url);
decode_upload_get_0_attrs(__TopXMLNS, [], Url) ->
    decode_upload_get_0_attr_url(__TopXMLNS, Url).

encode_upload_get_0(Url, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:http:upload:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_upload_get_0_attr_url(Url,
                                          xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                     __TopXMLNS)),
    {xmlel, <<"get">>, _attrs, _els}.

decode_upload_get_0_attr_url(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"url">>, <<"get">>, __TopXMLNS}});
decode_upload_get_0_attr_url(__TopXMLNS, _val) -> _val.

encode_upload_get_0_attr_url(_val, _acc) ->
    [{<<"url">>, _val} | _acc].

decode_upload_request_0(__TopXMLNS, __Opts,
                        {xmlel, <<"request">>, _attrs, _els}) ->
    Purpose = decode_upload_request_0_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          undefined),
    {Xmlns, Filename, Size, Content_type} =
        decode_upload_request_0_attrs(__TopXMLNS,
                                      _attrs,
                                      undefined,
                                      undefined,
                                      undefined,
                                      undefined),
    {upload_request_0,
     Filename,
     Size,
     Content_type,
     Purpose,
     Xmlns}.

decode_upload_request_0_els(__TopXMLNS, __Opts, [],
                            Purpose) ->
    Purpose;
decode_upload_request_0_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"message">>, _attrs, _} = _el | _els],
                            Purpose) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload:purpose:0">> ->
            decode_upload_request_0_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        decode_upload_purpose_message_0(<<"urn:xmpp:http:upload:purpose:0">>,
                                                                        __Opts,
                                                                        _el));
        _ ->
            decode_upload_request_0_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Purpose)
    end;
decode_upload_request_0_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"profile">>, _attrs, _} = _el | _els],
                            Purpose) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload:purpose:0">> ->
            decode_upload_request_0_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        decode_upload_purpose_profile_0(<<"urn:xmpp:http:upload:purpose:0">>,
                                                                        __Opts,
                                                                        _el));
        _ ->
            decode_upload_request_0_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Purpose)
    end;
decode_upload_request_0_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"ephemeral">>, _attrs, _} = _el | _els],
                            Purpose) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload:purpose:0">> ->
            decode_upload_request_0_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        decode_upload_purpose_ephemeral_0(<<"urn:xmpp:http:upload:purpose:0">>,
                                                                          __Opts,
                                                                          _el));
        _ ->
            decode_upload_request_0_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Purpose)
    end;
decode_upload_request_0_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"permanent">>, _attrs, _} = _el | _els],
                            Purpose) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload:purpose:0">> ->
            decode_upload_request_0_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        decode_upload_purpose_permanent_0(<<"urn:xmpp:http:upload:purpose:0">>,
                                                                          __Opts,
                                                                          _el));
        _ ->
            decode_upload_request_0_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Purpose)
    end;
decode_upload_request_0_els(__TopXMLNS, __Opts,
                            [_ | _els], Purpose) ->
    decode_upload_request_0_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Purpose).

decode_upload_request_0_attrs(__TopXMLNS,
                              [{<<"xmlns">>, _val} | _attrs], _Xmlns, Filename,
                              Size, Content_type) ->
    decode_upload_request_0_attrs(__TopXMLNS,
                                  _attrs,
                                  _val,
                                  Filename,
                                  Size,
                                  Content_type);
decode_upload_request_0_attrs(__TopXMLNS,
                              [{<<"filename">>, _val} | _attrs], Xmlns,
                              _Filename, Size, Content_type) ->
    decode_upload_request_0_attrs(__TopXMLNS,
                                  _attrs,
                                  Xmlns,
                                  _val,
                                  Size,
                                  Content_type);
decode_upload_request_0_attrs(__TopXMLNS,
                              [{<<"size">>, _val} | _attrs], Xmlns, Filename,
                              _Size, Content_type) ->
    decode_upload_request_0_attrs(__TopXMLNS,
                                  _attrs,
                                  Xmlns,
                                  Filename,
                                  _val,
                                  Content_type);
decode_upload_request_0_attrs(__TopXMLNS,
                              [{<<"content-type">>, _val} | _attrs], Xmlns,
                              Filename, Size, _Content_type) ->
    decode_upload_request_0_attrs(__TopXMLNS,
                                  _attrs,
                                  Xmlns,
                                  Filename,
                                  Size,
                                  _val);
decode_upload_request_0_attrs(__TopXMLNS, [_ | _attrs],
                              Xmlns, Filename, Size, Content_type) ->
    decode_upload_request_0_attrs(__TopXMLNS,
                                  _attrs,
                                  Xmlns,
                                  Filename,
                                  Size,
                                  Content_type);
decode_upload_request_0_attrs(__TopXMLNS, [], Xmlns,
                              Filename, Size, Content_type) ->
    {decode_upload_request_0_attr_xmlns(__TopXMLNS, Xmlns),
     decode_upload_request_0_attr_filename(__TopXMLNS,
                                           Filename),
     decode_upload_request_0_attr_size(__TopXMLNS, Size),
     'decode_upload_request_0_attr_content-type'(__TopXMLNS,
                                                 Content_type)}.

encode_upload_request_0({upload_request_0,
                         Filename,
                         Size,
                         Content_type,
                         Purpose,
                         Xmlns},
                        __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:http:upload:0">>],
                                                __TopXMLNS),
    _els =
        lists:reverse('encode_upload_request_0_$purpose'(Purpose,
                                                         __NewTopXMLNS,
                                                         [])),
    _attrs =
        'encode_upload_request_0_attr_content-type'(Content_type,
                                                    encode_upload_request_0_attr_size(Size,
                                                                                      encode_upload_request_0_attr_filename(Filename,
                                                                                                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                       __TopXMLNS)))),
    {xmlel, <<"request">>, _attrs, _els}.

'encode_upload_request_0_$purpose'(undefined,
                                   __TopXMLNS, _acc) ->
    _acc;
'encode_upload_request_0_$purpose'(message = Purpose,
                                   __TopXMLNS, _acc) ->
    [encode_upload_purpose_message_0(Purpose, __TopXMLNS)
     | _acc];
'encode_upload_request_0_$purpose'(profile = Purpose,
                                   __TopXMLNS, _acc) ->
    [encode_upload_purpose_profile_0(Purpose, __TopXMLNS)
     | _acc];
'encode_upload_request_0_$purpose'(ephemeral = Purpose,
                                   __TopXMLNS, _acc) ->
    [encode_upload_purpose_ephemeral_0(Purpose, __TopXMLNS)
     | _acc];
'encode_upload_request_0_$purpose'(permanent = Purpose,
                                   __TopXMLNS, _acc) ->
    [encode_upload_purpose_permanent_0(Purpose, __TopXMLNS)
     | _acc].

decode_upload_request_0_attr_xmlns(__TopXMLNS,
                                   undefined) ->
    <<>>;
decode_upload_request_0_attr_xmlns(__TopXMLNS, _val) ->
    _val.

decode_upload_request_0_attr_filename(__TopXMLNS,
                                      undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"filename">>,
                   <<"request">>,
                   __TopXMLNS}});
decode_upload_request_0_attr_filename(__TopXMLNS,
                                      _val) ->
    _val.

encode_upload_request_0_attr_filename(_val, _acc) ->
    [{<<"filename">>, _val} | _acc].

decode_upload_request_0_attr_size(__TopXMLNS,
                                  undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"size">>, <<"request">>, __TopXMLNS}});
decode_upload_request_0_attr_size(__TopXMLNS, _val) ->
    case catch dec_int(_val, 1, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"size">>,
                           <<"request">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_upload_request_0_attr_size(_val, _acc) ->
    [{<<"size">>, enc_int(_val)} | _acc].

'decode_upload_request_0_attr_content-type'(__TopXMLNS,
                                            undefined) ->
    <<>>;
'decode_upload_request_0_attr_content-type'(__TopXMLNS,
                                            _val) ->
    _val.

'encode_upload_request_0_attr_content-type'(<<>>,
                                            _acc) ->
    _acc;
'encode_upload_request_0_attr_content-type'(_val,
                                            _acc) ->
    [{<<"content-type">>, _val} | _acc].

decode_upload_slot(__TopXMLNS, __Opts,
                   {xmlel, <<"slot">>, _attrs, _els}) ->
    {Put, Get} = decode_upload_slot_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        undefined,
                                        undefined),
    Xmlns = decode_upload_slot_attrs(__TopXMLNS,
                                     _attrs,
                                     undefined),
    {upload_slot, Get, Put, Xmlns}.

decode_upload_slot_els(__TopXMLNS, __Opts, [], Put,
                       Get) ->
    {Put, Get};
decode_upload_slot_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"get">>, _attrs, _} = _el | _els], Put,
                       Get) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload">> ->
            decode_upload_slot_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Put,
                                   decode_upload_get(<<"urn:xmpp:http:upload">>,
                                                     __Opts,
                                                     _el));
        <<"eu:siacs:conversations:http:upload">> ->
            decode_upload_slot_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Put,
                                   decode_upload_get(<<"eu:siacs:conversations:http:upload">>,
                                                     __Opts,
                                                     _el));
        _ ->
            decode_upload_slot_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Put,
                                   Get)
    end;
decode_upload_slot_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"put">>, _attrs, _} = _el | _els], Put,
                       Get) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload">> ->
            decode_upload_slot_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   decode_upload_put(<<"urn:xmpp:http:upload">>,
                                                     __Opts,
                                                     _el),
                                   Get);
        <<"eu:siacs:conversations:http:upload">> ->
            decode_upload_slot_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   decode_upload_put(<<"eu:siacs:conversations:http:upload">>,
                                                     __Opts,
                                                     _el),
                                   Get);
        _ ->
            decode_upload_slot_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Put,
                                   Get)
    end;
decode_upload_slot_els(__TopXMLNS, __Opts, [_ | _els],
                       Put, Get) ->
    decode_upload_slot_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Put,
                           Get).

decode_upload_slot_attrs(__TopXMLNS,
                         [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_upload_slot_attrs(__TopXMLNS, _attrs, _val);
decode_upload_slot_attrs(__TopXMLNS, [_ | _attrs],
                         Xmlns) ->
    decode_upload_slot_attrs(__TopXMLNS, _attrs, Xmlns);
decode_upload_slot_attrs(__TopXMLNS, [], Xmlns) ->
    decode_upload_slot_attr_xmlns(__TopXMLNS, Xmlns).

encode_upload_slot({upload_slot, Get, Put, Xmlns},
                   __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:http:upload">>,
                                                 <<"eu:siacs:conversations:http:upload">>],
                                                __TopXMLNS),
    _els = lists:reverse('encode_upload_slot_$put'(Put,
                                                   __NewTopXMLNS,
                                                   'encode_upload_slot_$get'(Get,
                                                                             __NewTopXMLNS,
                                                                             []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"slot">>, _attrs, _els}.

'encode_upload_slot_$put'(undefined, __TopXMLNS,
                          _acc) ->
    _acc;
'encode_upload_slot_$put'(Put, __TopXMLNS, _acc) ->
    [encode_upload_put(Put, __TopXMLNS) | _acc].

'encode_upload_slot_$get'(undefined, __TopXMLNS,
                          _acc) ->
    _acc;
'encode_upload_slot_$get'(Get, __TopXMLNS, _acc) ->
    [encode_upload_get(Get, __TopXMLNS) | _acc].

decode_upload_slot_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_upload_slot_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_upload_put(__TopXMLNS, __Opts,
                  {xmlel, <<"put">>, _attrs, _els}) ->
    Cdata = decode_upload_put_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<>>),
    Cdata.

decode_upload_put_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_upload_put_cdata(__TopXMLNS, Cdata);
decode_upload_put_els(__TopXMLNS, __Opts,
                      [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_put_els(__TopXMLNS,
                          __Opts,
                          _els,
                          <<Cdata/binary, _data/binary>>);
decode_upload_put_els(__TopXMLNS, __Opts, [_ | _els],
                      Cdata) ->
    decode_upload_put_els(__TopXMLNS, __Opts, _els, Cdata).

encode_upload_put(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:http:upload">>,
                                                 <<"eu:siacs:conversations:http:upload">>],
                                                __TopXMLNS),
    _els = encode_upload_put_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"put">>, _attrs, _els}.

decode_upload_put_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"put">>, __TopXMLNS}});
decode_upload_put_cdata(__TopXMLNS, _val) -> _val.

encode_upload_put_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_upload_get(__TopXMLNS, __Opts,
                  {xmlel, <<"get">>, _attrs, _els}) ->
    Cdata = decode_upload_get_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<>>),
    Cdata.

decode_upload_get_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_upload_get_cdata(__TopXMLNS, Cdata);
decode_upload_get_els(__TopXMLNS, __Opts,
                      [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_get_els(__TopXMLNS,
                          __Opts,
                          _els,
                          <<Cdata/binary, _data/binary>>);
decode_upload_get_els(__TopXMLNS, __Opts, [_ | _els],
                      Cdata) ->
    decode_upload_get_els(__TopXMLNS, __Opts, _els, Cdata).

encode_upload_get(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:http:upload">>,
                                                 <<"eu:siacs:conversations:http:upload">>],
                                                __TopXMLNS),
    _els = encode_upload_get_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"get">>, _attrs, _els}.

decode_upload_get_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"get">>, __TopXMLNS}});
decode_upload_get_cdata(__TopXMLNS, _val) -> _val.

encode_upload_get_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_upload_request(__TopXMLNS, __Opts,
                      {xmlel, <<"request">>, _attrs, _els}) ->
    {Content_type, Size, Filename} =
        decode_upload_request_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<>>,
                                  error,
                                  error),
    Xmlns = decode_upload_request_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined),
    {upload_request, Filename, Size, Content_type, Xmlns}.

decode_upload_request_els(__TopXMLNS, __Opts, [],
                          Content_type, Size, Filename) ->
    {Content_type,
     case Size of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"size">>, __TopXMLNS}});
         {value, Size1} -> Size1
     end,
     case Filename of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag, <<"filename">>, __TopXMLNS}});
         {value, Filename1} -> Filename1
     end};
decode_upload_request_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"filename">>, _attrs, _} = _el | _els],
                          Content_type, Size, Filename) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload">> ->
            decode_upload_request_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Content_type,
                                      Size,
                                      {value,
                                       decode_upload_filename(<<"urn:xmpp:http:upload">>,
                                                              __Opts,
                                                              _el)});
        <<"eu:siacs:conversations:http:upload">> ->
            decode_upload_request_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Content_type,
                                      Size,
                                      {value,
                                       decode_upload_filename(<<"eu:siacs:conversations:http:upload">>,
                                                              __Opts,
                                                              _el)});
        _ ->
            decode_upload_request_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Content_type,
                                      Size,
                                      Filename)
    end;
decode_upload_request_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"size">>, _attrs, _} = _el | _els],
                          Content_type, Size, Filename) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload">> ->
            decode_upload_request_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Content_type,
                                      {value,
                                       decode_upload_size(<<"urn:xmpp:http:upload">>,
                                                          __Opts,
                                                          _el)},
                                      Filename);
        <<"eu:siacs:conversations:http:upload">> ->
            decode_upload_request_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Content_type,
                                      {value,
                                       decode_upload_size(<<"eu:siacs:conversations:http:upload">>,
                                                          __Opts,
                                                          _el)},
                                      Filename);
        _ ->
            decode_upload_request_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Content_type,
                                      Size,
                                      Filename)
    end;
decode_upload_request_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"content-type">>, _attrs, _} = _el | _els],
                          Content_type, Size, Filename) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:http:upload">> ->
            decode_upload_request_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      decode_upload_content_type(<<"urn:xmpp:http:upload">>,
                                                                 __Opts,
                                                                 _el),
                                      Size,
                                      Filename);
        <<"eu:siacs:conversations:http:upload">> ->
            decode_upload_request_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      decode_upload_content_type(<<"eu:siacs:conversations:http:upload">>,
                                                                 __Opts,
                                                                 _el),
                                      Size,
                                      Filename);
        _ ->
            decode_upload_request_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Content_type,
                                      Size,
                                      Filename)
    end;
decode_upload_request_els(__TopXMLNS, __Opts,
                          [_ | _els], Content_type, Size, Filename) ->
    decode_upload_request_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Content_type,
                              Size,
                              Filename).

decode_upload_request_attrs(__TopXMLNS,
                            [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_upload_request_attrs(__TopXMLNS, _attrs, _val);
decode_upload_request_attrs(__TopXMLNS, [_ | _attrs],
                            Xmlns) ->
    decode_upload_request_attrs(__TopXMLNS, _attrs, Xmlns);
decode_upload_request_attrs(__TopXMLNS, [], Xmlns) ->
    decode_upload_request_attr_xmlns(__TopXMLNS, Xmlns).

encode_upload_request({upload_request,
                       Filename,
                       Size,
                       Content_type,
                       Xmlns},
                      __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
                                                [<<"urn:xmpp:http:upload">>,
                                                 <<"eu:siacs:conversations:http:upload">>],
                                                __TopXMLNS),
    _els =
        lists:reverse('encode_upload_request_$content-type'(Content_type,
                                                            __NewTopXMLNS,
                                                            'encode_upload_request_$size'(Size,
                                                                                          __NewTopXMLNS,
                                                                                          'encode_upload_request_$filename'(Filename,
                                                                                                                            __NewTopXMLNS,
                                                                                                                            [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"request">>, _attrs, _els}.

'encode_upload_request_$content-type'(<<>>, __TopXMLNS,
                                      _acc) ->
    _acc;
'encode_upload_request_$content-type'(Content_type,
                                      __TopXMLNS, _acc) ->
    [encode_upload_content_type(Content_type, __TopXMLNS)
     | _acc].

'encode_upload_request_$size'(Size, __TopXMLNS, _acc) ->
    [encode_upload_size(Size, __TopXMLNS) | _acc].

'encode_upload_request_$filename'(Filename, __TopXMLNS,
                                  _acc) ->
    [encode_upload_filename(Filename, __TopXMLNS) | _acc].

decode_upload_request_attr_xmlns(__TopXMLNS,
                                 undefined) ->
    <<>>;
decode_upload_request_attr_xmlns(__TopXMLNS, _val) ->
    _val.

decode_upload_content_type(__TopXMLNS, __Opts,
                           {xmlel, <<"content-type">>, _attrs, _els}) ->
    Cdata = decode_upload_content_type_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           <<>>),
    Cdata.

decode_upload_content_type_els(__TopXMLNS, __Opts, [],
                               Cdata) ->
    decode_upload_content_type_cdata(__TopXMLNS, Cdata);
decode_upload_content_type_els(__TopXMLNS, __Opts,
                               [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_content_type_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   <<Cdata/binary, _data/binary>>);
decode_upload_content_type_els(__TopXMLNS, __Opts,
                               [_ | _els], Cdata) ->
    decode_upload_content_type_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Cdata).

encode_upload_content_type(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:http:upload">>,
                                                 <<"eu:siacs:conversations:http:upload">>],
                                                __TopXMLNS),
    _els = encode_upload_content_type_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"content-type">>, _attrs, _els}.

decode_upload_content_type_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_upload_content_type_cdata(__TopXMLNS, _val) ->
    _val.

encode_upload_content_type_cdata(<<>>, _acc) -> _acc;
encode_upload_content_type_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_upload_size(__TopXMLNS, __Opts,
                   {xmlel, <<"size">>, _attrs, _els}) ->
    Cdata = decode_upload_size_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   <<>>),
    Cdata.

decode_upload_size_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_upload_size_cdata(__TopXMLNS, Cdata);
decode_upload_size_els(__TopXMLNS, __Opts,
                       [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_size_els(__TopXMLNS,
                           __Opts,
                           _els,
                           <<Cdata/binary, _data/binary>>);
decode_upload_size_els(__TopXMLNS, __Opts, [_ | _els],
                       Cdata) ->
    decode_upload_size_els(__TopXMLNS, __Opts, _els, Cdata).

encode_upload_size(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:http:upload">>,
                                                 <<"eu:siacs:conversations:http:upload">>],
                                                __TopXMLNS),
    _els = encode_upload_size_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"size">>, _attrs, _els}.

decode_upload_size_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"size">>, __TopXMLNS}});
decode_upload_size_cdata(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"size">>, __TopXMLNS}});
        _res -> _res
    end.

encode_upload_size_cdata(_val, _acc) ->
    [{xmlcdata, enc_int(_val)} | _acc].

decode_upload_filename(__TopXMLNS, __Opts,
                       {xmlel, <<"filename">>, _attrs, _els}) ->
    Cdata = decode_upload_filename_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       <<>>),
    Cdata.

decode_upload_filename_els(__TopXMLNS, __Opts, [],
                           Cdata) ->
    decode_upload_filename_cdata(__TopXMLNS, Cdata);
decode_upload_filename_els(__TopXMLNS, __Opts,
                           [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_filename_els(__TopXMLNS,
                               __Opts,
                               _els,
                               <<Cdata/binary, _data/binary>>);
decode_upload_filename_els(__TopXMLNS, __Opts,
                           [_ | _els], Cdata) ->
    decode_upload_filename_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Cdata).

encode_upload_filename(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
                                                [<<"urn:xmpp:http:upload">>,
                                                 <<"eu:siacs:conversations:http:upload">>],
                                                __TopXMLNS),
    _els = encode_upload_filename_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"filename">>, _attrs, _els}.

decode_upload_filename_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"filename">>, __TopXMLNS}});
decode_upload_filename_cdata(__TopXMLNS, _val) -> _val.

encode_upload_filename_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
