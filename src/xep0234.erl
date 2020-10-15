%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0234).

-compile(export_all).

do_decode(<<"file-too-large">>,
          <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>, El,
          Opts) ->
    decode_jingle_ft_error_file_too_large(<<"urn:xmpp:jingle:apps:file-transfer:errors:0">>,
                                          Opts,
                                          El);
do_decode(<<"file-not-available">>,
          <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>, El,
          Opts) ->
    decode_jingle_ft_error_file_not_available(<<"urn:xmpp:jingle:apps:file-transfer:errors:0">>,
                                              Opts,
                                              El);
do_decode(<<"checksum">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_checksum(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                              Opts,
                              El);
do_decode(<<"received">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_received(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                              Opts,
                              El);
do_decode(<<"description">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_description(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                 Opts,
                                 El);
do_decode(<<"file">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_file(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                          Opts,
                          El);
do_decode(<<"range">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_range(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                           Opts,
                           El);
do_decode(<<"size">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_size(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                          Opts,
                          El);
do_decode(<<"name">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_name(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                          Opts,
                          El);
do_decode(<<"media-type">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_media_type(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                Opts,
                                El);
do_decode(<<"desc">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_desc(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                          Opts,
                          El);
do_decode(<<"date">>,
          <<"urn:xmpp:jingle:apps:file-transfer:5">>, El, Opts) ->
    decode_jingle_ft_date(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                          Opts,
                          El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"file-too-large">>,
      <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>},
     {<<"file-not-available">>,
      <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>},
     {<<"checksum">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>},
     {<<"received">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>},
     {<<"description">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>},
     {<<"file">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>},
     {<<"range">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>},
     {<<"size">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>},
     {<<"name">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>},
     {<<"media-type">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>},
     {<<"desc">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>},
     {<<"date">>,
      <<"urn:xmpp:jingle:apps:file-transfer:5">>}].

do_encode({text, _, _} = Desc, TopXMLNS) ->
    encode_jingle_ft_desc(Desc, TopXMLNS);
do_encode({jingle_ft_range, _, _, _} = Range,
          TopXMLNS) ->
    encode_jingle_ft_range(Range, TopXMLNS);
do_encode({jingle_ft_file, _, _, _, _, _, _, _, _} =
              File,
          TopXMLNS) ->
    encode_jingle_ft_file(File, TopXMLNS);
do_encode({jingle_ft_description, _} = Description,
          TopXMLNS) ->
    encode_jingle_ft_description(Description, TopXMLNS);
do_encode({jingle_ft_received, _, _} = Received,
          TopXMLNS) ->
    encode_jingle_ft_received(Received, TopXMLNS);
do_encode({jingle_ft_checksum, _, _, _} = Checksum,
          TopXMLNS) ->
    encode_jingle_ft_checksum(Checksum, TopXMLNS);
do_encode({jingle_ft_error, 'file-not-available'} =
              File_not_available,
          TopXMLNS) ->
    encode_jingle_ft_error_file_not_available(File_not_available,
                                              TopXMLNS);
do_encode({jingle_ft_error, 'file-too-large'} =
              File_too_large,
          TopXMLNS) ->
    encode_jingle_ft_error_file_too_large(File_too_large,
                                          TopXMLNS).

do_get_name({jingle_ft_checksum, _, _, _}) ->
    <<"checksum">>;
do_get_name({jingle_ft_description, _}) ->
    <<"description">>;
do_get_name({jingle_ft_error, 'file-not-available'}) ->
    <<"file-not-available">>;
do_get_name({jingle_ft_error, 'file-too-large'}) ->
    <<"file-too-large">>;
do_get_name({jingle_ft_file, _, _, _, _, _, _, _, _}) ->
    <<"file">>;
do_get_name({jingle_ft_range, _, _, _}) -> <<"range">>;
do_get_name({jingle_ft_received, _, _}) ->
    <<"received">>;
do_get_name({text, _, _}) -> <<"desc">>.

do_get_ns({jingle_ft_checksum, _, _, _}) ->
    <<"urn:xmpp:jingle:apps:file-transfer:5">>;
do_get_ns({jingle_ft_description, _}) ->
    <<"urn:xmpp:jingle:apps:file-transfer:5">>;
do_get_ns({jingle_ft_error, 'file-not-available'}) ->
    <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>;
do_get_ns({jingle_ft_error, 'file-too-large'}) ->
    <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>;
do_get_ns({jingle_ft_file, _, _, _, _, _, _, _, _}) ->
    <<"urn:xmpp:jingle:apps:file-transfer:5">>;
do_get_ns({jingle_ft_range, _, _, _}) ->
    <<"urn:xmpp:jingle:apps:file-transfer:5">>;
do_get_ns({jingle_ft_received, _, _}) ->
    <<"urn:xmpp:jingle:apps:file-transfer:5">>;
do_get_ns({text, _, _}) ->
    <<"urn:xmpp:jingle:apps:file-transfer:5">>.

pp(text, 2) -> [lang, data];
pp(jingle_ft_range, 3) -> [offset, length, hash];
pp(jingle_ft_file, 8) ->
    [date,
     desc,
     hash,
     'hash-used',
     'media-type',
     name,
     size,
     range];
pp(jingle_ft_description, 1) -> [file];
pp(jingle_ft_received, 2) -> [creator, name];
pp(jingle_ft_checksum, 3) -> [creator, name, file];
pp(jingle_ft_error, 1) -> [reason];
pp(_, _) -> no.

records() ->
    [{text, 2},
     {jingle_ft_range, 3},
     {jingle_ft_file, 8},
     {jingle_ft_description, 1},
     {jingle_ft_received, 2},
     {jingle_ft_checksum, 3},
     {jingle_ft_error, 1}].

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

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_jingle_ft_error_file_too_large(__TopXMLNS,
                                      __Opts,
                                      {xmlel,
                                       <<"file-too-large">>,
                                       _attrs,
                                       _els}) ->
    {jingle_ft_error, 'file-too-large'}.

encode_jingle_ft_error_file_too_large({jingle_ft_error,
                                       'file-too-large'},
                                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:errors:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"file-too-large">>, _attrs, _els}.

decode_jingle_ft_error_file_not_available(__TopXMLNS,
                                          __Opts,
                                          {xmlel,
                                           <<"file-not-available">>,
                                           _attrs,
                                           _els}) ->
    {jingle_ft_error, 'file-not-available'}.

encode_jingle_ft_error_file_not_available({jingle_ft_error,
                                           'file-not-available'},
                                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:errors:0">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"file-not-available">>, _attrs, _els}.

decode_jingle_ft_checksum(__TopXMLNS, __Opts,
                          {xmlel, <<"checksum">>, _attrs, _els}) ->
    File = decode_jingle_ft_checksum_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         error),
    {Creator, Name} =
        decode_jingle_ft_checksum_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined,
                                        undefined),
    {jingle_ft_checksum, Creator, Name, File}.

decode_jingle_ft_checksum_els(__TopXMLNS, __Opts, [],
                              File) ->
    case File of
        error ->
            erlang:error({xmpp_codec,
                          {missing_tag, <<"file">>, __TopXMLNS}});
        {value, File1} -> File1
    end;
decode_jingle_ft_checksum_els(__TopXMLNS, __Opts,
                              [{xmlel, <<"file">>, _attrs, _} = _el | _els],
                              File) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:apps:file-transfer:5">> ->
            decode_jingle_ft_checksum_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          {value,
                                           decode_jingle_ft_file(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                                                 __Opts,
                                                                 _el)});
        _ ->
            decode_jingle_ft_checksum_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          File)
    end;
decode_jingle_ft_checksum_els(__TopXMLNS, __Opts,
                              [_ | _els], File) ->
    decode_jingle_ft_checksum_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  File).

decode_jingle_ft_checksum_attrs(__TopXMLNS,
                                [{<<"creator">>, _val} | _attrs], _Creator,
                                Name) ->
    decode_jingle_ft_checksum_attrs(__TopXMLNS,
                                    _attrs,
                                    _val,
                                    Name);
decode_jingle_ft_checksum_attrs(__TopXMLNS,
                                [{<<"name">>, _val} | _attrs], Creator,
                                _Name) ->
    decode_jingle_ft_checksum_attrs(__TopXMLNS,
                                    _attrs,
                                    Creator,
                                    _val);
decode_jingle_ft_checksum_attrs(__TopXMLNS,
                                [_ | _attrs], Creator, Name) ->
    decode_jingle_ft_checksum_attrs(__TopXMLNS,
                                    _attrs,
                                    Creator,
                                    Name);
decode_jingle_ft_checksum_attrs(__TopXMLNS, [], Creator,
                                Name) ->
    {decode_jingle_ft_checksum_attr_creator(__TopXMLNS,
                                            Creator),
     decode_jingle_ft_checksum_attr_name(__TopXMLNS, Name)}.

encode_jingle_ft_checksum({jingle_ft_checksum,
                           Creator,
                           Name,
                           File},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_jingle_ft_checksum_$file'(File,
                                                        __NewTopXMLNS,
                                                        [])),
    _attrs = encode_jingle_ft_checksum_attr_name(Name,
                                                 encode_jingle_ft_checksum_attr_creator(Creator,
                                                                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                   __TopXMLNS))),
    {xmlel, <<"checksum">>, _attrs, _els}.

'encode_jingle_ft_checksum_$file'(File, __TopXMLNS,
                                  _acc) ->
    [encode_jingle_ft_file(File, __TopXMLNS) | _acc].

decode_jingle_ft_checksum_attr_creator(__TopXMLNS,
                                       undefined) ->
    undefined;
decode_jingle_ft_checksum_attr_creator(__TopXMLNS,
                                       _val) ->
    case catch dec_enum(_val, [initiator, responder]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"creator">>,
                           <<"checksum">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_ft_checksum_attr_creator(undefined,
                                       _acc) ->
    _acc;
encode_jingle_ft_checksum_attr_creator(_val, _acc) ->
    [{<<"creator">>, enc_enum(_val)} | _acc].

decode_jingle_ft_checksum_attr_name(__TopXMLNS,
                                    undefined) ->
    <<>>;
decode_jingle_ft_checksum_attr_name(__TopXMLNS, _val) ->
    _val.

encode_jingle_ft_checksum_attr_name(<<>>, _acc) -> _acc;
encode_jingle_ft_checksum_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_jingle_ft_received(__TopXMLNS, __Opts,
                          {xmlel, <<"received">>, _attrs, _els}) ->
    {Creator, Name} =
        decode_jingle_ft_received_attrs(__TopXMLNS,
                                        _attrs,
                                        undefined,
                                        undefined),
    {jingle_ft_received, Creator, Name}.

decode_jingle_ft_received_attrs(__TopXMLNS,
                                [{<<"creator">>, _val} | _attrs], _Creator,
                                Name) ->
    decode_jingle_ft_received_attrs(__TopXMLNS,
                                    _attrs,
                                    _val,
                                    Name);
decode_jingle_ft_received_attrs(__TopXMLNS,
                                [{<<"name">>, _val} | _attrs], Creator,
                                _Name) ->
    decode_jingle_ft_received_attrs(__TopXMLNS,
                                    _attrs,
                                    Creator,
                                    _val);
decode_jingle_ft_received_attrs(__TopXMLNS,
                                [_ | _attrs], Creator, Name) ->
    decode_jingle_ft_received_attrs(__TopXMLNS,
                                    _attrs,
                                    Creator,
                                    Name);
decode_jingle_ft_received_attrs(__TopXMLNS, [], Creator,
                                Name) ->
    {decode_jingle_ft_received_attr_creator(__TopXMLNS,
                                            Creator),
     decode_jingle_ft_received_attr_name(__TopXMLNS, Name)}.

encode_jingle_ft_received({jingle_ft_received,
                           Creator,
                           Name},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_jingle_ft_received_attr_name(Name,
                                                 encode_jingle_ft_received_attr_creator(Creator,
                                                                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                   __TopXMLNS))),
    {xmlel, <<"received">>, _attrs, _els}.

decode_jingle_ft_received_attr_creator(__TopXMLNS,
                                       undefined) ->
    undefined;
decode_jingle_ft_received_attr_creator(__TopXMLNS,
                                       _val) ->
    case catch dec_enum(_val, [initiator, responder]) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"creator">>,
                           <<"received">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_ft_received_attr_creator(undefined,
                                       _acc) ->
    _acc;
encode_jingle_ft_received_attr_creator(_val, _acc) ->
    [{<<"creator">>, enc_enum(_val)} | _acc].

decode_jingle_ft_received_attr_name(__TopXMLNS,
                                    undefined) ->
    <<>>;
decode_jingle_ft_received_attr_name(__TopXMLNS, _val) ->
    _val.

encode_jingle_ft_received_attr_name(<<>>, _acc) -> _acc;
encode_jingle_ft_received_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_jingle_ft_description(__TopXMLNS, __Opts,
                             {xmlel, <<"description">>, _attrs, _els}) ->
    File = decode_jingle_ft_description_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            undefined),
    {jingle_ft_description, File}.

decode_jingle_ft_description_els(__TopXMLNS, __Opts, [],
                                 File) ->
    File;
decode_jingle_ft_description_els(__TopXMLNS, __Opts,
                                 [{xmlel, <<"file">>, _attrs, _} = _el | _els],
                                 File) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:apps:file-transfer:5">> ->
            decode_jingle_ft_description_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             decode_jingle_ft_file(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                                                   __Opts,
                                                                   _el));
        _ ->
            decode_jingle_ft_description_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             File)
    end;
decode_jingle_ft_description_els(__TopXMLNS, __Opts,
                                 [_ | _els], File) ->
    decode_jingle_ft_description_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     File).

encode_jingle_ft_description({jingle_ft_description,
                              File},
                             __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_jingle_ft_description_$file'(File,
                                                           __NewTopXMLNS,
                                                           [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"description">>, _attrs, _els}.

'encode_jingle_ft_description_$file'(undefined,
                                     __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_ft_description_$file'(File, __TopXMLNS,
                                     _acc) ->
    [encode_jingle_ft_file(File, __TopXMLNS) | _acc].

decode_jingle_ft_file(__TopXMLNS, __Opts,
                      {xmlel, <<"file">>, _attrs, _els}) ->
    {Desc,
     Hash_used,
     Range,
     Size,
     Name,
     Media_type,
     Date,
     Hash} =
        decode_jingle_ft_file_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  [],
                                  undefined,
                                  undefined,
                                  undefined,
                                  undefined,
                                  undefined,
                                  undefined,
                                  []),
    {jingle_ft_file,
     Date,
     Desc,
     Hash,
     Hash_used,
     Media_type,
     Name,
     Size,
     Range}.

decode_jingle_ft_file_els(__TopXMLNS, __Opts, [], Desc,
                          Hash_used, Range, Size, Name, Media_type, Date,
                          Hash) ->
    {lists:reverse(Desc),
     Hash_used,
     Range,
     Size,
     Name,
     Media_type,
     Date,
     lists:reverse(Hash)};
decode_jingle_ft_file_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"date">>, _attrs, _} = _el | _els], Desc,
                          Hash_used, Range, Size, Name, Media_type, Date,
                          Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:apps:file-transfer:5">> ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      decode_jingle_ft_date(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                                            __Opts,
                                                            _el),
                                      Hash);
        _ ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash)
    end;
decode_jingle_ft_file_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"desc">>, _attrs, _} = _el | _els], Desc,
                          Hash_used, Range, Size, Name, Media_type, Date,
                          Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:apps:file-transfer:5">> ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      [decode_jingle_ft_desc(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                                             __Opts,
                                                             _el)
                                       | Desc],
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash);
        _ ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash)
    end;
decode_jingle_ft_file_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"hash">>, _attrs, _} = _el | _els], Desc,
                          Hash_used, Range, Size, Name, Media_type, Date,
                          Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:hashes:2">> ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      [xep0300:decode_hash(<<"urn:xmpp:hashes:2">>,
                                                           __Opts,
                                                           _el)
                                       | Hash]);
        _ ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash)
    end;
decode_jingle_ft_file_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"hash-used">>, _attrs, _} = _el | _els],
                          Desc, Hash_used, Range, Size, Name, Media_type, Date,
                          Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:hashes:2">> ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      xep0300:decode_hash_used(<<"urn:xmpp:hashes:2">>,
                                                               __Opts,
                                                               _el),
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash);
        _ ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash)
    end;
decode_jingle_ft_file_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"media-type">>, _attrs, _} = _el | _els],
                          Desc, Hash_used, Range, Size, Name, Media_type, Date,
                          Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:apps:file-transfer:5">> ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      decode_jingle_ft_media_type(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                                                  __Opts,
                                                                  _el),
                                      Date,
                                      Hash);
        _ ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash)
    end;
decode_jingle_ft_file_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"name">>, _attrs, _} = _el | _els], Desc,
                          Hash_used, Range, Size, Name, Media_type, Date,
                          Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:apps:file-transfer:5">> ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      decode_jingle_ft_name(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                                            __Opts,
                                                            _el),
                                      Media_type,
                                      Date,
                                      Hash);
        _ ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash)
    end;
decode_jingle_ft_file_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"size">>, _attrs, _} = _el | _els], Desc,
                          Hash_used, Range, Size, Name, Media_type, Date,
                          Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:apps:file-transfer:5">> ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      decode_jingle_ft_size(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                                            __Opts,
                                                            _el),
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash);
        _ ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash)
    end;
decode_jingle_ft_file_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"range">>, _attrs, _} = _el | _els], Desc,
                          Hash_used, Range, Size, Name, Media_type, Date,
                          Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:jingle:apps:file-transfer:5">> ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      decode_jingle_ft_range(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                                             __Opts,
                                                             _el),
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash);
        _ ->
            decode_jingle_ft_file_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Desc,
                                      Hash_used,
                                      Range,
                                      Size,
                                      Name,
                                      Media_type,
                                      Date,
                                      Hash)
    end;
decode_jingle_ft_file_els(__TopXMLNS, __Opts,
                          [_ | _els], Desc, Hash_used, Range, Size, Name,
                          Media_type, Date, Hash) ->
    decode_jingle_ft_file_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Desc,
                              Hash_used,
                              Range,
                              Size,
                              Name,
                              Media_type,
                              Date,
                              Hash).

encode_jingle_ft_file({jingle_ft_file,
                       Date,
                       Desc,
                       Hash,
                       Hash_used,
                       Media_type,
                       Name,
                       Size,
                       Range},
                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_jingle_ft_file_$desc'(Desc,
                                                       __NewTopXMLNS,
                                                       'encode_jingle_ft_file_$hash-used'(Hash_used,
                                                                                          __NewTopXMLNS,
                                                                                          'encode_jingle_ft_file_$range'(Range,
                                                                                                                         __NewTopXMLNS,
                                                                                                                         'encode_jingle_ft_file_$size'(Size,
                                                                                                                                                       __NewTopXMLNS,
                                                                                                                                                       'encode_jingle_ft_file_$name'(Name,
                                                                                                                                                                                     __NewTopXMLNS,
                                                                                                                                                                                     'encode_jingle_ft_file_$media-type'(Media_type,
                                                                                                                                                                                                                         __NewTopXMLNS,
                                                                                                                                                                                                                         'encode_jingle_ft_file_$date'(Date,
                                                                                                                                                                                                                                                       __NewTopXMLNS,
                                                                                                                                                                                                                                                       'encode_jingle_ft_file_$hash'(Hash,
                                                                                                                                                                                                                                                                                     __NewTopXMLNS,
                                                                                                                                                                                                                                                                                     []))))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"file">>, _attrs, _els}.

'encode_jingle_ft_file_$desc'([], __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_ft_file_$desc'([Desc | _els], __TopXMLNS,
                              _acc) ->
    'encode_jingle_ft_file_$desc'(_els,
                                  __TopXMLNS,
                                  [encode_jingle_ft_desc(Desc, __TopXMLNS)
                                   | _acc]).

'encode_jingle_ft_file_$hash-used'(undefined,
                                   __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_ft_file_$hash-used'(Hash_used,
                                   __TopXMLNS, _acc) ->
    [xep0300:encode_hash_used(Hash_used, __TopXMLNS)
     | _acc].

'encode_jingle_ft_file_$range'(undefined, __TopXMLNS,
                               _acc) ->
    _acc;
'encode_jingle_ft_file_$range'(Range, __TopXMLNS,
                               _acc) ->
    [encode_jingle_ft_range(Range, __TopXMLNS) | _acc].

'encode_jingle_ft_file_$size'(undefined, __TopXMLNS,
                              _acc) ->
    _acc;
'encode_jingle_ft_file_$size'(Size, __TopXMLNS, _acc) ->
    [encode_jingle_ft_size(Size, __TopXMLNS) | _acc].

'encode_jingle_ft_file_$name'(undefined, __TopXMLNS,
                              _acc) ->
    _acc;
'encode_jingle_ft_file_$name'(Name, __TopXMLNS, _acc) ->
    [encode_jingle_ft_name(Name, __TopXMLNS) | _acc].

'encode_jingle_ft_file_$media-type'(undefined,
                                    __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_ft_file_$media-type'(Media_type,
                                    __TopXMLNS, _acc) ->
    [encode_jingle_ft_media_type(Media_type, __TopXMLNS)
     | _acc].

'encode_jingle_ft_file_$date'(undefined, __TopXMLNS,
                              _acc) ->
    _acc;
'encode_jingle_ft_file_$date'(Date, __TopXMLNS, _acc) ->
    [encode_jingle_ft_date(Date, __TopXMLNS) | _acc].

'encode_jingle_ft_file_$hash'([], __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_ft_file_$hash'([Hash | _els], __TopXMLNS,
                              _acc) ->
    'encode_jingle_ft_file_$hash'(_els,
                                  __TopXMLNS,
                                  [xep0300:encode_hash(Hash, __TopXMLNS)
                                   | _acc]).

decode_jingle_ft_range(__TopXMLNS, __Opts,
                       {xmlel, <<"range">>, _attrs, _els}) ->
    Hash = decode_jingle_ft_range_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      []),
    {Offset, Length} =
        decode_jingle_ft_range_attrs(__TopXMLNS,
                                     _attrs,
                                     undefined,
                                     undefined),
    {jingle_ft_range, Offset, Length, Hash}.

decode_jingle_ft_range_els(__TopXMLNS, __Opts, [],
                           Hash) ->
    lists:reverse(Hash);
decode_jingle_ft_range_els(__TopXMLNS, __Opts,
                           [{xmlel, <<"hash">>, _attrs, _} = _el | _els],
                           Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:hashes:2">> ->
            decode_jingle_ft_range_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       [xep0300:decode_hash(<<"urn:xmpp:hashes:2">>,
                                                            __Opts,
                                                            _el)
                                        | Hash]);
        _ ->
            decode_jingle_ft_range_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Hash)
    end;
decode_jingle_ft_range_els(__TopXMLNS, __Opts,
                           [_ | _els], Hash) ->
    decode_jingle_ft_range_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Hash).

decode_jingle_ft_range_attrs(__TopXMLNS,
                             [{<<"offset">>, _val} | _attrs], _Offset,
                             Length) ->
    decode_jingle_ft_range_attrs(__TopXMLNS,
                                 _attrs,
                                 _val,
                                 Length);
decode_jingle_ft_range_attrs(__TopXMLNS,
                             [{<<"length">>, _val} | _attrs], Offset,
                             _Length) ->
    decode_jingle_ft_range_attrs(__TopXMLNS,
                                 _attrs,
                                 Offset,
                                 _val);
decode_jingle_ft_range_attrs(__TopXMLNS, [_ | _attrs],
                             Offset, Length) ->
    decode_jingle_ft_range_attrs(__TopXMLNS,
                                 _attrs,
                                 Offset,
                                 Length);
decode_jingle_ft_range_attrs(__TopXMLNS, [], Offset,
                             Length) ->
    {decode_jingle_ft_range_attr_offset(__TopXMLNS, Offset),
     decode_jingle_ft_range_attr_length(__TopXMLNS, Length)}.

encode_jingle_ft_range({jingle_ft_range,
                        Offset,
                        Length,
                        Hash},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_jingle_ft_range_$hash'(Hash,
                                                     __NewTopXMLNS,
                                                     [])),
    _attrs = encode_jingle_ft_range_attr_length(Length,
                                                encode_jingle_ft_range_attr_offset(Offset,
                                                                                   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                              __TopXMLNS))),
    {xmlel, <<"range">>, _attrs, _els}.

'encode_jingle_ft_range_$hash'([], __TopXMLNS, _acc) ->
    _acc;
'encode_jingle_ft_range_$hash'([Hash | _els],
                               __TopXMLNS, _acc) ->
    'encode_jingle_ft_range_$hash'(_els,
                                   __TopXMLNS,
                                   [xep0300:encode_hash(Hash, __TopXMLNS)
                                    | _acc]).

decode_jingle_ft_range_attr_offset(__TopXMLNS,
                                   undefined) ->
    0;
decode_jingle_ft_range_attr_offset(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"offset">>,
                           <<"range">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_ft_range_attr_offset(0, _acc) -> _acc;
encode_jingle_ft_range_attr_offset(_val, _acc) ->
    [{<<"offset">>, enc_int(_val)} | _acc].

decode_jingle_ft_range_attr_length(__TopXMLNS,
                                   undefined) ->
    undefined;
decode_jingle_ft_range_attr_length(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"length">>,
                           <<"range">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_ft_range_attr_length(undefined, _acc) ->
    _acc;
encode_jingle_ft_range_attr_length(_val, _acc) ->
    [{<<"length">>, enc_int(_val)} | _acc].

decode_jingle_ft_size(__TopXMLNS, __Opts,
                      {xmlel, <<"size">>, _attrs, _els}) ->
    Cdata = decode_jingle_ft_size_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      <<>>),
    Cdata.

decode_jingle_ft_size_els(__TopXMLNS, __Opts, [],
                          Cdata) ->
    decode_jingle_ft_size_cdata(__TopXMLNS, Cdata);
decode_jingle_ft_size_els(__TopXMLNS, __Opts,
                          [{xmlcdata, _data} | _els], Cdata) ->
    decode_jingle_ft_size_els(__TopXMLNS,
                              __Opts,
                              _els,
                              <<Cdata/binary, _data/binary>>);
decode_jingle_ft_size_els(__TopXMLNS, __Opts,
                          [_ | _els], Cdata) ->
    decode_jingle_ft_size_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Cdata).

encode_jingle_ft_size(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_jingle_ft_size_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"size">>, _attrs, _els}.

decode_jingle_ft_size_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"size">>, __TopXMLNS}});
decode_jingle_ft_size_cdata(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"size">>, __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_ft_size_cdata(_val, _acc) ->
    [{xmlcdata, enc_int(_val)} | _acc].

decode_jingle_ft_name(__TopXMLNS, __Opts,
                      {xmlel, <<"name">>, _attrs, _els}) ->
    Cdata = decode_jingle_ft_name_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      <<>>),
    Cdata.

decode_jingle_ft_name_els(__TopXMLNS, __Opts, [],
                          Cdata) ->
    decode_jingle_ft_name_cdata(__TopXMLNS, Cdata);
decode_jingle_ft_name_els(__TopXMLNS, __Opts,
                          [{xmlcdata, _data} | _els], Cdata) ->
    decode_jingle_ft_name_els(__TopXMLNS,
                              __Opts,
                              _els,
                              <<Cdata/binary, _data/binary>>);
decode_jingle_ft_name_els(__TopXMLNS, __Opts,
                          [_ | _els], Cdata) ->
    decode_jingle_ft_name_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Cdata).

encode_jingle_ft_name(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_jingle_ft_name_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"name">>, _attrs, _els}.

decode_jingle_ft_name_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"name">>, __TopXMLNS}});
decode_jingle_ft_name_cdata(__TopXMLNS, _val) -> _val.

encode_jingle_ft_name_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_jingle_ft_media_type(__TopXMLNS, __Opts,
                            {xmlel, <<"media-type">>, _attrs, _els}) ->
    Cdata = decode_jingle_ft_media_type_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            <<>>),
    Cdata.

decode_jingle_ft_media_type_els(__TopXMLNS, __Opts, [],
                                Cdata) ->
    decode_jingle_ft_media_type_cdata(__TopXMLNS, Cdata);
decode_jingle_ft_media_type_els(__TopXMLNS, __Opts,
                                [{xmlcdata, _data} | _els], Cdata) ->
    decode_jingle_ft_media_type_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    <<Cdata/binary, _data/binary>>);
decode_jingle_ft_media_type_els(__TopXMLNS, __Opts,
                                [_ | _els], Cdata) ->
    decode_jingle_ft_media_type_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Cdata).

encode_jingle_ft_media_type(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_jingle_ft_media_type_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"media-type">>, _attrs, _els}.

decode_jingle_ft_media_type_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"media-type">>, __TopXMLNS}});
decode_jingle_ft_media_type_cdata(__TopXMLNS, _val) ->
    _val.

encode_jingle_ft_media_type_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_jingle_ft_desc(__TopXMLNS, __Opts,
                      {xmlel, <<"desc">>, _attrs, _els}) ->
    Data = decode_jingle_ft_desc_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     <<>>),
    Lang = decode_jingle_ft_desc_attrs(__TopXMLNS,
                                       _attrs,
                                       undefined),
    {text, Lang, Data}.

decode_jingle_ft_desc_els(__TopXMLNS, __Opts, [],
                          Data) ->
    decode_jingle_ft_desc_cdata(__TopXMLNS, Data);
decode_jingle_ft_desc_els(__TopXMLNS, __Opts,
                          [{xmlcdata, _data} | _els], Data) ->
    decode_jingle_ft_desc_els(__TopXMLNS,
                              __Opts,
                              _els,
                              <<Data/binary, _data/binary>>);
decode_jingle_ft_desc_els(__TopXMLNS, __Opts,
                          [_ | _els], Data) ->
    decode_jingle_ft_desc_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Data).

decode_jingle_ft_desc_attrs(__TopXMLNS,
                            [{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_jingle_ft_desc_attrs(__TopXMLNS, _attrs, _val);
decode_jingle_ft_desc_attrs(__TopXMLNS, [_ | _attrs],
                            Lang) ->
    decode_jingle_ft_desc_attrs(__TopXMLNS, _attrs, Lang);
decode_jingle_ft_desc_attrs(__TopXMLNS, [], Lang) ->
    'decode_jingle_ft_desc_attr_xml:lang'(__TopXMLNS, Lang).

encode_jingle_ft_desc({text, Lang, Data}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_jingle_ft_desc_cdata(Data, []),
    _attrs = 'encode_jingle_ft_desc_attr_xml:lang'(Lang,
                                                   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                              __TopXMLNS)),
    {xmlel, <<"desc">>, _attrs, _els}.

'decode_jingle_ft_desc_attr_xml:lang'(__TopXMLNS,
                                      undefined) ->
    <<>>;
'decode_jingle_ft_desc_attr_xml:lang'(__TopXMLNS,
                                      _val) ->
    case catch xmpp_lang:check(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"xml:lang">>,
                           <<"desc">>,
                           __TopXMLNS}});
        _res -> _res
    end.

'encode_jingle_ft_desc_attr_xml:lang'(<<>>, _acc) ->
    _acc;
'encode_jingle_ft_desc_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_jingle_ft_desc_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_jingle_ft_desc_cdata(__TopXMLNS, _val) -> _val.

encode_jingle_ft_desc_cdata(<<>>, _acc) -> _acc;
encode_jingle_ft_desc_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_jingle_ft_date(__TopXMLNS, __Opts,
                      {xmlel, <<"date">>, _attrs, _els}) ->
    Cdata = decode_jingle_ft_date_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      <<>>),
    Cdata.

decode_jingle_ft_date_els(__TopXMLNS, __Opts, [],
                          Cdata) ->
    decode_jingle_ft_date_cdata(__TopXMLNS, Cdata);
decode_jingle_ft_date_els(__TopXMLNS, __Opts,
                          [{xmlcdata, _data} | _els], Cdata) ->
    decode_jingle_ft_date_els(__TopXMLNS,
                              __Opts,
                              _els,
                              <<Cdata/binary, _data/binary>>);
decode_jingle_ft_date_els(__TopXMLNS, __Opts,
                          [_ | _els], Cdata) ->
    decode_jingle_ft_date_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Cdata).

encode_jingle_ft_date(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:jingle:apps:file-transfer:5">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_jingle_ft_date_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"date">>, _attrs, _els}.

decode_jingle_ft_date_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"date">>, __TopXMLNS}});
decode_jingle_ft_date_cdata(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"date">>, __TopXMLNS}});
        _res -> _res
    end.

encode_jingle_ft_date_cdata(_val, _acc) ->
    [{xmlcdata, enc_utc(_val)} | _acc].
