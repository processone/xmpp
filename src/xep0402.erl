%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0402).

-compile(export_all).

do_decode(<<"conference">>, <<"urn:xmpp:bookmarks:1">>,
          El, Opts) ->
    decode_pep_bookmarks_conference(<<"urn:xmpp:bookmarks:1">>,
                                    Opts,
                                    El);
do_decode(<<"extensions">>, <<"urn:xmpp:bookmarks:1">>,
          El, Opts) ->
    decode_pep_conference_extensions(<<"urn:xmpp:bookmarks:1">>,
                                     Opts,
                                     El);
do_decode(<<"password">>, <<"urn:xmpp:bookmarks:1">>,
          El, Opts) ->
    decode_pep_conference_password(<<"urn:xmpp:bookmarks:1">>,
                                   Opts,
                                   El);
do_decode(<<"nick">>, <<"urn:xmpp:bookmarks:1">>, El,
          Opts) ->
    decode_pep_conference_nick(<<"urn:xmpp:bookmarks:1">>,
                               Opts,
                               El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"conference">>, <<"urn:xmpp:bookmarks:1">>},
     {<<"extensions">>, <<"urn:xmpp:bookmarks:1">>},
     {<<"password">>, <<"urn:xmpp:bookmarks:1">>},
     {<<"nick">>, <<"urn:xmpp:bookmarks:1">>}].

do_encode({pep_bookmarks_conference, _, _, _, _, _} =
              Conference,
          TopXMLNS) ->
    encode_pep_bookmarks_conference(Conference, TopXMLNS).

do_get_name({pep_bookmarks_conference,
             _,
             _,
             _,
             _,
             _}) ->
    <<"conference">>.

do_get_ns({pep_bookmarks_conference, _, _, _, _, _}) ->
    <<"urn:xmpp:bookmarks:1">>.

pp(pep_bookmarks_conference, 5) ->
    [name, autojoin, nick, password, extensions];
pp(_, _) -> no.

records() -> [{pep_bookmarks_conference, 5}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

decode_pep_bookmarks_conference(__TopXMLNS, __Opts,
                                {xmlel, <<"conference">>, _attrs, _els}) ->
    {Extensions, Password, Nick} =
        decode_pep_bookmarks_conference_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            undefined,
                                            undefined,
                                            undefined),
    {Name, Autojoin} =
        decode_pep_bookmarks_conference_attrs(__TopXMLNS,
                                              _attrs,
                                              undefined,
                                              undefined),
    {pep_bookmarks_conference,
     Name,
     Autojoin,
     Nick,
     Password,
     Extensions}.

decode_pep_bookmarks_conference_els(__TopXMLNS, __Opts,
                                    [], Extensions, Password, Nick) ->
    {Extensions, Password, Nick};
decode_pep_bookmarks_conference_els(__TopXMLNS, __Opts,
                                    [{xmlel, <<"nick">>, _attrs, _} = _el
                                     | _els],
                                    Extensions, Password, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:bookmarks:1">> ->
            decode_pep_bookmarks_conference_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                Extensions,
                                                Password,
                                                decode_pep_conference_nick(<<"urn:xmpp:bookmarks:1">>,
                                                                           __Opts,
                                                                           _el));
        _ ->
            decode_pep_bookmarks_conference_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                Extensions,
                                                Password,
                                                Nick)
    end;
decode_pep_bookmarks_conference_els(__TopXMLNS, __Opts,
                                    [{xmlel, <<"password">>, _attrs, _} = _el
                                     | _els],
                                    Extensions, Password, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:bookmarks:1">> ->
            decode_pep_bookmarks_conference_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                Extensions,
                                                decode_pep_conference_password(<<"urn:xmpp:bookmarks:1">>,
                                                                               __Opts,
                                                                               _el),
                                                Nick);
        _ ->
            decode_pep_bookmarks_conference_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                Extensions,
                                                Password,
                                                Nick)
    end;
decode_pep_bookmarks_conference_els(__TopXMLNS, __Opts,
                                    [{xmlel, <<"extensions">>, _attrs, _} = _el
                                     | _els],
                                    Extensions, Password, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:bookmarks:1">> ->
            decode_pep_bookmarks_conference_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                decode_pep_conference_extensions(<<"urn:xmpp:bookmarks:1">>,
                                                                                 __Opts,
                                                                                 _el),
                                                Password,
                                                Nick);
        _ ->
            decode_pep_bookmarks_conference_els(__TopXMLNS,
                                                __Opts,
                                                _els,
                                                Extensions,
                                                Password,
                                                Nick)
    end;
decode_pep_bookmarks_conference_els(__TopXMLNS, __Opts,
                                    [_ | _els], Extensions, Password, Nick) ->
    decode_pep_bookmarks_conference_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Extensions,
                                        Password,
                                        Nick).

decode_pep_bookmarks_conference_attrs(__TopXMLNS,
                                      [{<<"name">>, _val} | _attrs], _Name,
                                      Autojoin) ->
    decode_pep_bookmarks_conference_attrs(__TopXMLNS,
                                          _attrs,
                                          _val,
                                          Autojoin);
decode_pep_bookmarks_conference_attrs(__TopXMLNS,
                                      [{<<"autojoin">>, _val} | _attrs], Name,
                                      _Autojoin) ->
    decode_pep_bookmarks_conference_attrs(__TopXMLNS,
                                          _attrs,
                                          Name,
                                          _val);
decode_pep_bookmarks_conference_attrs(__TopXMLNS,
                                      [_ | _attrs], Name, Autojoin) ->
    decode_pep_bookmarks_conference_attrs(__TopXMLNS,
                                          _attrs,
                                          Name,
                                          Autojoin);
decode_pep_bookmarks_conference_attrs(__TopXMLNS, [],
                                      Name, Autojoin) ->
    {decode_pep_bookmarks_conference_attr_name(__TopXMLNS,
                                               Name),
     decode_pep_bookmarks_conference_attr_autojoin(__TopXMLNS,
                                                   Autojoin)}.

encode_pep_bookmarks_conference({pep_bookmarks_conference,
                                 Name,
                                 Autojoin,
                                 Nick,
                                 Password,
                                 Extensions},
                                __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bookmarks:1">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_pep_bookmarks_conference_$extensions'(Extensions,
                                                                    __NewTopXMLNS,
                                                                    'encode_pep_bookmarks_conference_$password'(Password,
                                                                                                                __NewTopXMLNS,
                                                                                                                'encode_pep_bookmarks_conference_$nick'(Nick,
                                                                                                                                                        __NewTopXMLNS,
                                                                                                                                                        [])))),
    _attrs =
        encode_pep_bookmarks_conference_attr_autojoin(Autojoin,
                                                      encode_pep_bookmarks_conference_attr_name(Name,
                                                                                                xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                                                                           __TopXMLNS))),
    {xmlel, <<"conference">>, _attrs, _els}.

'encode_pep_bookmarks_conference_$extensions'(undefined,
                                              __TopXMLNS, _acc) ->
    _acc;
'encode_pep_bookmarks_conference_$extensions'(Extensions,
                                              __TopXMLNS, _acc) ->
    [encode_pep_conference_extensions(Extensions,
                                      __TopXMLNS)
     | _acc].

'encode_pep_bookmarks_conference_$password'(undefined,
                                            __TopXMLNS, _acc) ->
    _acc;
'encode_pep_bookmarks_conference_$password'(Password,
                                            __TopXMLNS, _acc) ->
    [encode_pep_conference_password(Password, __TopXMLNS)
     | _acc].

'encode_pep_bookmarks_conference_$nick'(undefined,
                                        __TopXMLNS, _acc) ->
    _acc;
'encode_pep_bookmarks_conference_$nick'(Nick,
                                        __TopXMLNS, _acc) ->
    [encode_pep_conference_nick(Nick, __TopXMLNS) | _acc].

decode_pep_bookmarks_conference_attr_name(__TopXMLNS,
                                          undefined) ->
    <<>>;
decode_pep_bookmarks_conference_attr_name(__TopXMLNS,
                                          _val) ->
    _val.

encode_pep_bookmarks_conference_attr_name(<<>>, _acc) ->
    _acc;
encode_pep_bookmarks_conference_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_pep_bookmarks_conference_attr_autojoin(__TopXMLNS,
                                              undefined) ->
    false;
decode_pep_bookmarks_conference_attr_autojoin(__TopXMLNS,
                                              _val) ->
    case catch dec_bool(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_attr_value,
                           <<"autojoin">>,
                           <<"conference">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_pep_bookmarks_conference_attr_autojoin(false,
                                              _acc) ->
    _acc;
encode_pep_bookmarks_conference_attr_autojoin(_val,
                                              _acc) ->
    [{<<"autojoin">>, enc_bool(_val)} | _acc].

decode_pep_conference_extensions(__TopXMLNS, __Opts,
                                 {xmlel, <<"extensions">>, _attrs, _els}) ->
    __Els = decode_pep_conference_extensions_els(__TopXMLNS,
                                                 __Opts,
                                                 _els,
                                                 []),
    __Els.

decode_pep_conference_extensions_els(__TopXMLNS, __Opts,
                                     [], __Els) ->
    lists:reverse(__Els);
decode_pep_conference_extensions_els(__TopXMLNS, __Opts,
                                     [{xmlel, _name, _attrs, _} = _el | _els],
                                     __Els) ->
    decode_pep_conference_extensions_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         [_el | __Els]);
decode_pep_conference_extensions_els(__TopXMLNS, __Opts,
                                     [_ | _els], __Els) ->
    decode_pep_conference_extensions_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         __Els).

encode_pep_conference_extensions(__Els, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bookmarks:1">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"extensions">>, _attrs, _els}.

decode_pep_conference_password(__TopXMLNS, __Opts,
                               {xmlel, <<"password">>, _attrs, _els}) ->
    Cdata = decode_pep_conference_password_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               <<>>),
    Cdata.

decode_pep_conference_password_els(__TopXMLNS, __Opts,
                                   [], Cdata) ->
    decode_pep_conference_password_cdata(__TopXMLNS, Cdata);
decode_pep_conference_password_els(__TopXMLNS, __Opts,
                                   [{xmlcdata, _data} | _els], Cdata) ->
    decode_pep_conference_password_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       <<Cdata/binary, _data/binary>>);
decode_pep_conference_password_els(__TopXMLNS, __Opts,
                                   [_ | _els], Cdata) ->
    decode_pep_conference_password_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Cdata).

encode_pep_conference_password(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bookmarks:1">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_pep_conference_password_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"password">>, _attrs, _els}.

decode_pep_conference_password_cdata(__TopXMLNS,
                                     <<>>) ->
    <<>>;
decode_pep_conference_password_cdata(__TopXMLNS,
                                     _val) ->
    _val.

encode_pep_conference_password_cdata(<<>>, _acc) ->
    _acc;
encode_pep_conference_password_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_pep_conference_nick(__TopXMLNS, __Opts,
                           {xmlel, <<"nick">>, _attrs, _els}) ->
    Cdata = decode_pep_conference_nick_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           <<>>),
    Cdata.

decode_pep_conference_nick_els(__TopXMLNS, __Opts, [],
                               Cdata) ->
    decode_pep_conference_nick_cdata(__TopXMLNS, Cdata);
decode_pep_conference_nick_els(__TopXMLNS, __Opts,
                               [{xmlcdata, _data} | _els], Cdata) ->
    decode_pep_conference_nick_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   <<Cdata/binary, _data/binary>>);
decode_pep_conference_nick_els(__TopXMLNS, __Opts,
                               [_ | _els], Cdata) ->
    decode_pep_conference_nick_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Cdata).

encode_pep_conference_nick(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bookmarks:1">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_pep_conference_nick_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"nick">>, _attrs, _els}.

decode_pep_conference_nick_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_pep_conference_nick_cdata(__TopXMLNS, _val) ->
    _val.

encode_pep_conference_nick_cdata(<<>>, _acc) -> _acc;
encode_pep_conference_nick_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
