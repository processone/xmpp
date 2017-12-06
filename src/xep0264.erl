%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0264).

-compile(export_all).

do_decode(<<"thumbnail">>, <<"urn:xmpp:thumbs:1">>, El,
	  Opts) ->
    decode_thumbnail(<<"urn:xmpp:thumbs:1">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"thumbnail">>, <<"urn:xmpp:thumbs:1">>}].

do_encode({thumbnail, _, _, _, _} = Thumbnail,
	  TopXMLNS) ->
    encode_thumbnail(Thumbnail, TopXMLNS).

do_get_name({thumbnail, _, _, _, _}) -> <<"thumbnail">>.

do_get_ns({thumbnail, _, _, _, _}) ->
    <<"urn:xmpp:thumbs:1">>.

pp(thumbnail, 4) -> [uri, 'media-type', width, height];
pp(_, _) -> no.

records() -> [{thumbnail, 4}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_thumbnail(__TopXMLNS, __Opts,
		 {xmlel, <<"thumbnail">>, _attrs, _els}) ->
    {Uri, Media_type, Width, Height} =
	decode_thumbnail_attrs(__TopXMLNS, _attrs, undefined,
			       undefined, undefined, undefined),
    {thumbnail, Uri, Media_type, Width, Height}.

decode_thumbnail_attrs(__TopXMLNS,
		       [{<<"uri">>, _val} | _attrs], _Uri, Media_type, Width,
		       Height) ->
    decode_thumbnail_attrs(__TopXMLNS, _attrs, _val,
			   Media_type, Width, Height);
decode_thumbnail_attrs(__TopXMLNS,
		       [{<<"media-type">>, _val} | _attrs], Uri, _Media_type,
		       Width, Height) ->
    decode_thumbnail_attrs(__TopXMLNS, _attrs, Uri, _val,
			   Width, Height);
decode_thumbnail_attrs(__TopXMLNS,
		       [{<<"width">>, _val} | _attrs], Uri, Media_type, _Width,
		       Height) ->
    decode_thumbnail_attrs(__TopXMLNS, _attrs, Uri,
			   Media_type, _val, Height);
decode_thumbnail_attrs(__TopXMLNS,
		       [{<<"height">>, _val} | _attrs], Uri, Media_type, Width,
		       _Height) ->
    decode_thumbnail_attrs(__TopXMLNS, _attrs, Uri,
			   Media_type, Width, _val);
decode_thumbnail_attrs(__TopXMLNS, [_ | _attrs], Uri,
		       Media_type, Width, Height) ->
    decode_thumbnail_attrs(__TopXMLNS, _attrs, Uri,
			   Media_type, Width, Height);
decode_thumbnail_attrs(__TopXMLNS, [], Uri, Media_type,
		       Width, Height) ->
    {decode_thumbnail_attr_uri(__TopXMLNS, Uri),
     'decode_thumbnail_attr_media-type'(__TopXMLNS,
					Media_type),
     decode_thumbnail_attr_width(__TopXMLNS, Width),
     decode_thumbnail_attr_height(__TopXMLNS, Height)}.

encode_thumbnail({thumbnail, Uri, Media_type, Width,
		  Height},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:thumbs:1">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_thumbnail_attr_height(Height,
					  encode_thumbnail_attr_width(Width,
								      'encode_thumbnail_attr_media-type'(Media_type,
													 encode_thumbnail_attr_uri(Uri,
																   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																			      __TopXMLNS))))),
    {xmlel, <<"thumbnail">>, _attrs, _els}.

decode_thumbnail_attr_uri(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"uri">>, <<"thumbnail">>,
		   __TopXMLNS}});
decode_thumbnail_attr_uri(__TopXMLNS, _val) -> _val.

encode_thumbnail_attr_uri(_val, _acc) ->
    [{<<"uri">>, _val} | _acc].

'decode_thumbnail_attr_media-type'(__TopXMLNS,
				   undefined) ->
    <<>>;
'decode_thumbnail_attr_media-type'(__TopXMLNS, _val) ->
    _val.

'encode_thumbnail_attr_media-type'(<<>>, _acc) -> _acc;
'encode_thumbnail_attr_media-type'(_val, _acc) ->
    [{<<"media-type">>, _val} | _acc].

decode_thumbnail_attr_width(__TopXMLNS, undefined) ->
    undefined;
decode_thumbnail_attr_width(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"width">>, <<"thumbnail">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_thumbnail_attr_width(undefined, _acc) -> _acc;
encode_thumbnail_attr_width(_val, _acc) ->
    [{<<"width">>, enc_int(_val)} | _acc].

decode_thumbnail_attr_height(__TopXMLNS, undefined) ->
    undefined;
decode_thumbnail_attr_height(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"height">>, <<"thumbnail">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_thumbnail_attr_height(undefined, _acc) -> _acc;
encode_thumbnail_attr_height(_val, _acc) ->
    [{<<"height">>, enc_int(_val)} | _acc].
