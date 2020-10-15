%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0084).

-compile(export_all).

do_decode(<<"metadata">>,
          <<"urn:xmpp:avatar:metadata">>, El, Opts) ->
    decode_avatar_meta(<<"urn:xmpp:avatar:metadata">>,
                       Opts,
                       El);
do_decode(<<"pointer">>, <<"urn:xmpp:avatar:metadata">>,
          El, Opts) ->
    decode_avatar_pointer(<<"urn:xmpp:avatar:metadata">>,
                          Opts,
                          El);
do_decode(<<"info">>, <<"urn:xmpp:avatar:metadata">>,
          El, Opts) ->
    decode_avatar_info(<<"urn:xmpp:avatar:metadata">>,
                       Opts,
                       El);
do_decode(<<"data">>, <<"urn:xmpp:avatar:data">>, El,
          Opts) ->
    decode_avatar_data(<<"urn:xmpp:avatar:data">>,
                       Opts,
                       El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"metadata">>, <<"urn:xmpp:avatar:metadata">>},
     {<<"pointer">>, <<"urn:xmpp:avatar:metadata">>},
     {<<"info">>, <<"urn:xmpp:avatar:metadata">>},
     {<<"data">>, <<"urn:xmpp:avatar:data">>}].

do_encode({avatar_data, _} = Data, TopXMLNS) ->
    encode_avatar_data(Data, TopXMLNS);
do_encode({avatar_info, _, _, _, _, _, _} = Info,
          TopXMLNS) ->
    encode_avatar_info(Info, TopXMLNS);
do_encode({avatar_pointer, _, _, _, _, _, _} = Pointer,
          TopXMLNS) ->
    encode_avatar_pointer(Pointer, TopXMLNS);
do_encode({avatar_meta, _, _} = Metadata, TopXMLNS) ->
    encode_avatar_meta(Metadata, TopXMLNS).

do_get_name({avatar_data, _}) -> <<"data">>;
do_get_name({avatar_info, _, _, _, _, _, _}) ->
    <<"info">>;
do_get_name({avatar_meta, _, _}) -> <<"metadata">>;
do_get_name({avatar_pointer, _, _, _, _, _, _}) ->
    <<"pointer">>.

do_get_ns({avatar_data, _}) ->
    <<"urn:xmpp:avatar:data">>;
do_get_ns({avatar_info, _, _, _, _, _, _}) ->
    <<"urn:xmpp:avatar:metadata">>;
do_get_ns({avatar_meta, _, _}) ->
    <<"urn:xmpp:avatar:metadata">>;
do_get_ns({avatar_pointer, _, _, _, _, _, _}) ->
    <<"urn:xmpp:avatar:metadata">>.

get_els({avatar_pointer,
         _bytes,
         _id,
         _type,
         _height,
         _width,
         _sub_els}) ->
    _sub_els.

set_els({avatar_pointer,
         _bytes,
         _id,
         _type,
         _height,
         _width,
         _},
        _sub_els) ->
    {avatar_pointer,
     _bytes,
     _id,
     _type,
     _height,
     _width,
     _sub_els}.

pp(avatar_data, 1) -> [data];
pp(avatar_info, 6) ->
    [bytes, id, type, height, width, url];
pp(avatar_pointer, 6) ->
    [bytes, id, type, height, width, sub_els];
pp(avatar_meta, 2) -> [info, pointer];
pp(_, _) -> no.

records() ->
    [{avatar_data, 1},
     {avatar_info, 6},
     {avatar_pointer, 6},
     {avatar_meta, 2}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity -> Int;
        Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_avatar_meta(__TopXMLNS, __Opts,
                   {xmlel, <<"metadata">>, _attrs, _els}) ->
    {Pointer, Info} = decode_avatar_meta_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             undefined,
                                             []),
    {avatar_meta, Info, Pointer}.

decode_avatar_meta_els(__TopXMLNS, __Opts, [], Pointer,
                       Info) ->
    {Pointer, lists:reverse(Info)};
decode_avatar_meta_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"info">>, _attrs, _} = _el | _els], Pointer,
                       Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:avatar:metadata">> ->
            decode_avatar_meta_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Pointer,
                                   [decode_avatar_info(<<"urn:xmpp:avatar:metadata">>,
                                                       __Opts,
                                                       _el)
                                    | Info]);
        _ ->
            decode_avatar_meta_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Pointer,
                                   Info)
    end;
decode_avatar_meta_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"pointer">>, _attrs, _} = _el | _els],
                       Pointer, Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:avatar:metadata">> ->
            decode_avatar_meta_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   decode_avatar_pointer(<<"urn:xmpp:avatar:metadata">>,
                                                         __Opts,
                                                         _el),
                                   Info);
        _ ->
            decode_avatar_meta_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Pointer,
                                   Info)
    end;
decode_avatar_meta_els(__TopXMLNS, __Opts, [_ | _els],
                       Pointer, Info) ->
    decode_avatar_meta_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Pointer,
                           Info).

encode_avatar_meta({avatar_meta, Info, Pointer},
                   __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:avatar:metadata">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_avatar_meta_$pointer'(Pointer,
                                                    __NewTopXMLNS,
                                                    'encode_avatar_meta_$info'(Info,
                                                                               __NewTopXMLNS,
                                                                               []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"metadata">>, _attrs, _els}.

'encode_avatar_meta_$pointer'(undefined, __TopXMLNS,
                              _acc) ->
    _acc;
'encode_avatar_meta_$pointer'(Pointer, __TopXMLNS,
                              _acc) ->
    [encode_avatar_pointer(Pointer, __TopXMLNS) | _acc].

'encode_avatar_meta_$info'([], __TopXMLNS, _acc) ->
    _acc;
'encode_avatar_meta_$info'([Info | _els], __TopXMLNS,
                           _acc) ->
    'encode_avatar_meta_$info'(_els,
                               __TopXMLNS,
                               [encode_avatar_info(Info, __TopXMLNS) | _acc]).

decode_avatar_pointer(__TopXMLNS, __Opts,
                      {xmlel, <<"pointer">>, _attrs, _els}) ->
    __Els = decode_avatar_pointer_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      []),
    {Bytes, Id, Type, Height, Width} =
        decode_avatar_pointer_attrs(__TopXMLNS,
                                    _attrs,
                                    undefined,
                                    undefined,
                                    undefined,
                                    undefined,
                                    undefined),
    {avatar_pointer, Bytes, Id, Type, Height, Width, __Els}.

decode_avatar_pointer_els(__TopXMLNS, __Opts, [],
                          __Els) ->
    lists:reverse(__Els);
decode_avatar_pointer_els(__TopXMLNS, __Opts,
                          [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    decode_avatar_pointer_els(__TopXMLNS,
                              __Opts,
                              _els,
                              [_el | __Els]);
decode_avatar_pointer_els(__TopXMLNS, __Opts,
                          [_ | _els], __Els) ->
    decode_avatar_pointer_els(__TopXMLNS,
                              __Opts,
                              _els,
                              __Els).

decode_avatar_pointer_attrs(__TopXMLNS,
                            [{<<"bytes">>, _val} | _attrs], _Bytes, Id, Type,
                            Height, Width) ->
    decode_avatar_pointer_attrs(__TopXMLNS,
                                _attrs,
                                _val,
                                Id,
                                Type,
                                Height,
                                Width);
decode_avatar_pointer_attrs(__TopXMLNS,
                            [{<<"id">>, _val} | _attrs], Bytes, _Id, Type,
                            Height, Width) ->
    decode_avatar_pointer_attrs(__TopXMLNS,
                                _attrs,
                                Bytes,
                                _val,
                                Type,
                                Height,
                                Width);
decode_avatar_pointer_attrs(__TopXMLNS,
                            [{<<"type">>, _val} | _attrs], Bytes, Id, _Type,
                            Height, Width) ->
    decode_avatar_pointer_attrs(__TopXMLNS,
                                _attrs,
                                Bytes,
                                Id,
                                _val,
                                Height,
                                Width);
decode_avatar_pointer_attrs(__TopXMLNS,
                            [{<<"height">>, _val} | _attrs], Bytes, Id, Type,
                            _Height, Width) ->
    decode_avatar_pointer_attrs(__TopXMLNS,
                                _attrs,
                                Bytes,
                                Id,
                                Type,
                                _val,
                                Width);
decode_avatar_pointer_attrs(__TopXMLNS,
                            [{<<"width">>, _val} | _attrs], Bytes, Id, Type,
                            Height, _Width) ->
    decode_avatar_pointer_attrs(__TopXMLNS,
                                _attrs,
                                Bytes,
                                Id,
                                Type,
                                Height,
                                _val);
decode_avatar_pointer_attrs(__TopXMLNS, [_ | _attrs],
                            Bytes, Id, Type, Height, Width) ->
    decode_avatar_pointer_attrs(__TopXMLNS,
                                _attrs,
                                Bytes,
                                Id,
                                Type,
                                Height,
                                Width);
decode_avatar_pointer_attrs(__TopXMLNS, [], Bytes, Id,
                            Type, Height, Width) ->
    {decode_avatar_pointer_attr_bytes(__TopXMLNS, Bytes),
     decode_avatar_pointer_attr_id(__TopXMLNS, Id),
     decode_avatar_pointer_attr_type(__TopXMLNS, Type),
     decode_avatar_pointer_attr_height(__TopXMLNS, Height),
     decode_avatar_pointer_attr_width(__TopXMLNS, Width)}.

encode_avatar_pointer({avatar_pointer,
                       Bytes,
                       Id,
                       Type,
                       Height,
                       Width,
                       __Els},
                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:avatar:metadata">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = encode_avatar_pointer_attr_width(Width,
                                              encode_avatar_pointer_attr_height(Height,
                                                                                encode_avatar_pointer_attr_type(Type,
                                                                                                                encode_avatar_pointer_attr_id(Id,
                                                                                                                                              encode_avatar_pointer_attr_bytes(Bytes,
                                                                                                                                                                               xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                                                                          __TopXMLNS)))))),
    {xmlel, <<"pointer">>, _attrs, _els}.

decode_avatar_pointer_attr_bytes(__TopXMLNS,
                                 undefined) ->
    undefined;
decode_avatar_pointer_attr_bytes(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"bytes">>,
                           <<"pointer">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_avatar_pointer_attr_bytes(undefined, _acc) ->
    _acc;
encode_avatar_pointer_attr_bytes(_val, _acc) ->
    [{<<"bytes">>, enc_int(_val)} | _acc].

decode_avatar_pointer_attr_id(__TopXMLNS, undefined) ->
    <<>>;
decode_avatar_pointer_attr_id(__TopXMLNS, _val) -> _val.

encode_avatar_pointer_attr_id(<<>>, _acc) -> _acc;
encode_avatar_pointer_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_avatar_pointer_attr_type(__TopXMLNS,
                                undefined) ->
    <<>>;
decode_avatar_pointer_attr_type(__TopXMLNS, _val) ->
    _val.

encode_avatar_pointer_attr_type(<<>>, _acc) -> _acc;
encode_avatar_pointer_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].

decode_avatar_pointer_attr_height(__TopXMLNS,
                                  undefined) ->
    undefined;
decode_avatar_pointer_attr_height(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"height">>,
                           <<"pointer">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_avatar_pointer_attr_height(undefined, _acc) ->
    _acc;
encode_avatar_pointer_attr_height(_val, _acc) ->
    [{<<"height">>, enc_int(_val)} | _acc].

decode_avatar_pointer_attr_width(__TopXMLNS,
                                 undefined) ->
    undefined;
decode_avatar_pointer_attr_width(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"width">>,
                           <<"pointer">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_avatar_pointer_attr_width(undefined, _acc) ->
    _acc;
encode_avatar_pointer_attr_width(_val, _acc) ->
    [{<<"width">>, enc_int(_val)} | _acc].

decode_avatar_info(__TopXMLNS, __Opts,
                   {xmlel, <<"info">>, _attrs, _els}) ->
    {Bytes, Id, Type, Url, Height, Width} =
        decode_avatar_info_attrs(__TopXMLNS,
                                 _attrs,
                                 undefined,
                                 undefined,
                                 undefined,
                                 undefined,
                                 undefined,
                                 undefined),
    {avatar_info, Bytes, Id, Type, Height, Width, Url}.

decode_avatar_info_attrs(__TopXMLNS,
                         [{<<"bytes">>, _val} | _attrs], _Bytes, Id, Type, Url,
                         Height, Width) ->
    decode_avatar_info_attrs(__TopXMLNS,
                             _attrs,
                             _val,
                             Id,
                             Type,
                             Url,
                             Height,
                             Width);
decode_avatar_info_attrs(__TopXMLNS,
                         [{<<"id">>, _val} | _attrs], Bytes, _Id, Type, Url,
                         Height, Width) ->
    decode_avatar_info_attrs(__TopXMLNS,
                             _attrs,
                             Bytes,
                             _val,
                             Type,
                             Url,
                             Height,
                             Width);
decode_avatar_info_attrs(__TopXMLNS,
                         [{<<"type">>, _val} | _attrs], Bytes, Id, _Type, Url,
                         Height, Width) ->
    decode_avatar_info_attrs(__TopXMLNS,
                             _attrs,
                             Bytes,
                             Id,
                             _val,
                             Url,
                             Height,
                             Width);
decode_avatar_info_attrs(__TopXMLNS,
                         [{<<"url">>, _val} | _attrs], Bytes, Id, Type, _Url,
                         Height, Width) ->
    decode_avatar_info_attrs(__TopXMLNS,
                             _attrs,
                             Bytes,
                             Id,
                             Type,
                             _val,
                             Height,
                             Width);
decode_avatar_info_attrs(__TopXMLNS,
                         [{<<"height">>, _val} | _attrs], Bytes, Id, Type, Url,
                         _Height, Width) ->
    decode_avatar_info_attrs(__TopXMLNS,
                             _attrs,
                             Bytes,
                             Id,
                             Type,
                             Url,
                             _val,
                             Width);
decode_avatar_info_attrs(__TopXMLNS,
                         [{<<"width">>, _val} | _attrs], Bytes, Id, Type, Url,
                         Height, _Width) ->
    decode_avatar_info_attrs(__TopXMLNS,
                             _attrs,
                             Bytes,
                             Id,
                             Type,
                             Url,
                             Height,
                             _val);
decode_avatar_info_attrs(__TopXMLNS, [_ | _attrs],
                         Bytes, Id, Type, Url, Height, Width) ->
    decode_avatar_info_attrs(__TopXMLNS,
                             _attrs,
                             Bytes,
                             Id,
                             Type,
                             Url,
                             Height,
                             Width);
decode_avatar_info_attrs(__TopXMLNS, [], Bytes, Id,
                         Type, Url, Height, Width) ->
    {decode_avatar_info_attr_bytes(__TopXMLNS, Bytes),
     decode_avatar_info_attr_id(__TopXMLNS, Id),
     decode_avatar_info_attr_type(__TopXMLNS, Type),
     decode_avatar_info_attr_url(__TopXMLNS, Url),
     decode_avatar_info_attr_height(__TopXMLNS, Height),
     decode_avatar_info_attr_width(__TopXMLNS, Width)}.

encode_avatar_info({avatar_info,
                    Bytes,
                    Id,
                    Type,
                    Height,
                    Width,
                    Url},
                   __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:avatar:metadata">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_avatar_info_attr_width(Width,
                                           encode_avatar_info_attr_height(Height,
                                                                          encode_avatar_info_attr_url(Url,
                                                                                                      encode_avatar_info_attr_type(Type,
                                                                                                                                   encode_avatar_info_attr_id(Id,
                                                                                                                                                              encode_avatar_info_attr_bytes(Bytes,
                                                                                                                                                                                            xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                                                                                                                       __TopXMLNS))))))),
    {xmlel, <<"info">>, _attrs, _els}.

decode_avatar_info_attr_bytes(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"bytes">>, <<"info">>, __TopXMLNS}});
decode_avatar_info_attr_bytes(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"bytes">>,
                           <<"info">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_avatar_info_attr_bytes(_val, _acc) ->
    [{<<"bytes">>, enc_int(_val)} | _acc].

decode_avatar_info_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"id">>, <<"info">>, __TopXMLNS}});
decode_avatar_info_attr_id(__TopXMLNS, _val) -> _val.

encode_avatar_info_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_avatar_info_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr, <<"type">>, <<"info">>, __TopXMLNS}});
decode_avatar_info_attr_type(__TopXMLNS, _val) -> _val.

encode_avatar_info_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].

decode_avatar_info_attr_url(__TopXMLNS, undefined) ->
    <<>>;
decode_avatar_info_attr_url(__TopXMLNS, _val) -> _val.

encode_avatar_info_attr_url(<<>>, _acc) -> _acc;
encode_avatar_info_attr_url(_val, _acc) ->
    [{<<"url">>, _val} | _acc].

decode_avatar_info_attr_height(__TopXMLNS, undefined) ->
    undefined;
decode_avatar_info_attr_height(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"height">>,
                           <<"info">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_avatar_info_attr_height(undefined, _acc) -> _acc;
encode_avatar_info_attr_height(_val, _acc) ->
    [{<<"height">>, enc_int(_val)} | _acc].

decode_avatar_info_attr_width(__TopXMLNS, undefined) ->
    undefined;
decode_avatar_info_attr_width(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"width">>,
                           <<"info">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_avatar_info_attr_width(undefined, _acc) -> _acc;
encode_avatar_info_attr_width(_val, _acc) ->
    [{<<"width">>, enc_int(_val)} | _acc].

decode_avatar_data(__TopXMLNS, __Opts,
                   {xmlel, <<"data">>, _attrs, _els}) ->
    Data = decode_avatar_data_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<>>),
    {avatar_data, Data}.

decode_avatar_data_els(__TopXMLNS, __Opts, [], Data) ->
    decode_avatar_data_cdata(__TopXMLNS, Data);
decode_avatar_data_els(__TopXMLNS, __Opts,
                       [{xmlcdata, _data} | _els], Data) ->
    decode_avatar_data_els(__TopXMLNS,
                           __Opts,
                           _els,
                           <<Data/binary, _data/binary>>);
decode_avatar_data_els(__TopXMLNS, __Opts, [_ | _els],
                       Data) ->
    decode_avatar_data_els(__TopXMLNS, __Opts, _els, Data).

encode_avatar_data({avatar_data, Data}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:avatar:data">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_avatar_data_cdata(Data, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"data">>, _attrs, _els}.

decode_avatar_data_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata, <<>>, <<"data">>, __TopXMLNS}});
decode_avatar_data_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"data">>, __TopXMLNS}});
        _res -> _res
    end.

encode_avatar_data_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].
