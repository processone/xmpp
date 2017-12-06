%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0221).

-compile(export_all).

do_decode(<<"media">>, <<"urn:xmpp:media-element">>, El,
	  Opts) ->
    decode_media(<<"urn:xmpp:media-element">>, Opts, El);
do_decode(<<"uri">>, <<"urn:xmpp:media-element">>, El,
	  Opts) ->
    decode_media_uri(<<"urn:xmpp:media-element">>, Opts,
		     El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"media">>, <<"urn:xmpp:media-element">>},
     {<<"uri">>, <<"urn:xmpp:media-element">>}].

do_encode({media_uri, _, _} = Uri, TopXMLNS) ->
    encode_media_uri(Uri, TopXMLNS);
do_encode({media, _, _, _} = Media, TopXMLNS) ->
    encode_media(Media, TopXMLNS).

do_get_name({media, _, _, _}) -> <<"media">>;
do_get_name({media_uri, _, _}) -> <<"uri">>.

do_get_ns({media, _, _, _}) ->
    <<"urn:xmpp:media-element">>;
do_get_ns({media_uri, _, _}) ->
    <<"urn:xmpp:media-element">>.

pp(media_uri, 2) -> [type, uri];
pp(media, 3) -> [height, width, uri];
pp(_, _) -> no.

records() -> [{media_uri, 2}, {media, 3}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_media(__TopXMLNS, __Opts,
	     {xmlel, <<"media">>, _attrs, _els}) ->
    Uri = decode_media_els(__TopXMLNS, __Opts, _els, []),
    {Height, Width} = decode_media_attrs(__TopXMLNS, _attrs,
					 undefined, undefined),
    {media, Height, Width, Uri}.

decode_media_els(__TopXMLNS, __Opts, [], Uri) ->
    lists:reverse(Uri);
decode_media_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"uri">>, _attrs, _} = _el | _els], Uri) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:media-element">> ->
	  decode_media_els(__TopXMLNS, __Opts, _els,
			   [decode_media_uri(<<"urn:xmpp:media-element">>,
					     __Opts, _el)
			    | Uri]);
      _ -> decode_media_els(__TopXMLNS, __Opts, _els, Uri)
    end;
decode_media_els(__TopXMLNS, __Opts, [_ | _els], Uri) ->
    decode_media_els(__TopXMLNS, __Opts, _els, Uri).

decode_media_attrs(__TopXMLNS,
		   [{<<"height">>, _val} | _attrs], _Height, Width) ->
    decode_media_attrs(__TopXMLNS, _attrs, _val, Width);
decode_media_attrs(__TopXMLNS,
		   [{<<"width">>, _val} | _attrs], Height, _Width) ->
    decode_media_attrs(__TopXMLNS, _attrs, Height, _val);
decode_media_attrs(__TopXMLNS, [_ | _attrs], Height,
		   Width) ->
    decode_media_attrs(__TopXMLNS, _attrs, Height, Width);
decode_media_attrs(__TopXMLNS, [], Height, Width) ->
    {decode_media_attr_height(__TopXMLNS, Height),
     decode_media_attr_width(__TopXMLNS, Width)}.

encode_media({media, Height, Width, Uri}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:media-element">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_media_$uri'(Uri,
					     __NewTopXMLNS, [])),
    _attrs = encode_media_attr_width(Width,
				     encode_media_attr_height(Height,
							      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
											 __TopXMLNS))),
    {xmlel, <<"media">>, _attrs, _els}.

'encode_media_$uri'([], __TopXMLNS, _acc) -> _acc;
'encode_media_$uri'([Uri | _els], __TopXMLNS, _acc) ->
    'encode_media_$uri'(_els, __TopXMLNS,
			[encode_media_uri(Uri, __TopXMLNS) | _acc]).

decode_media_attr_height(__TopXMLNS, undefined) ->
    undefined;
decode_media_attr_height(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"height">>, <<"media">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_media_attr_height(undefined, _acc) -> _acc;
encode_media_attr_height(_val, _acc) ->
    [{<<"height">>, enc_int(_val)} | _acc].

decode_media_attr_width(__TopXMLNS, undefined) ->
    undefined;
decode_media_attr_width(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, inifinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"width">>, <<"media">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_media_attr_width(undefined, _acc) -> _acc;
encode_media_attr_width(_val, _acc) ->
    [{<<"width">>, enc_int(_val)} | _acc].

decode_media_uri(__TopXMLNS, __Opts,
		 {xmlel, <<"uri">>, _attrs, _els}) ->
    Uri = decode_media_uri_els(__TopXMLNS, __Opts, _els,
			       <<>>),
    Type = decode_media_uri_attrs(__TopXMLNS, _attrs,
				  undefined),
    {media_uri, Type, Uri}.

decode_media_uri_els(__TopXMLNS, __Opts, [], Uri) ->
    decode_media_uri_cdata(__TopXMLNS, Uri);
decode_media_uri_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Uri) ->
    decode_media_uri_els(__TopXMLNS, __Opts, _els,
			 <<Uri/binary, _data/binary>>);
decode_media_uri_els(__TopXMLNS, __Opts, [_ | _els],
		     Uri) ->
    decode_media_uri_els(__TopXMLNS, __Opts, _els, Uri).

decode_media_uri_attrs(__TopXMLNS,
		       [{<<"type">>, _val} | _attrs], _Type) ->
    decode_media_uri_attrs(__TopXMLNS, _attrs, _val);
decode_media_uri_attrs(__TopXMLNS, [_ | _attrs],
		       Type) ->
    decode_media_uri_attrs(__TopXMLNS, _attrs, Type);
decode_media_uri_attrs(__TopXMLNS, [], Type) ->
    decode_media_uri_attr_type(__TopXMLNS, Type).

encode_media_uri({media_uri, Type, Uri}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:media-element">>,
				    [], __TopXMLNS),
    _els = encode_media_uri_cdata(Uri, []),
    _attrs = encode_media_uri_attr_type(Type,
					xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								   __TopXMLNS)),
    {xmlel, <<"uri">>, _attrs, _els}.

decode_media_uri_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"uri">>, __TopXMLNS}});
decode_media_uri_attr_type(__TopXMLNS, _val) -> _val.

encode_media_uri_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].

decode_media_uri_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_media_uri_cdata(__TopXMLNS, _val) -> _val.

encode_media_uri_cdata(<<>>, _acc) -> _acc;
encode_media_uri_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
