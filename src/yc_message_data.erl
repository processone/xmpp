%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(yc_message_data).

-compile(export_all).

do_decode(<<"yc">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_message_data(<<"urn:yc:message:data">>, Opts,
			   El);
do_decode(<<"info">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_media_info(<<"urn:yc:message:data">>, Opts,
			 El);
do_decode(<<"media">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_media(<<"urn:yc:message:data">>, Opts, El);
do_decode(<<"item">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_media_item(<<"urn:yc:message:data">>, Opts,
			 El);
do_decode(<<"thumbnail">>, <<"urn:yc:message:data">>,
	  El, Opts) ->
    decode_yc_media_item_thumbnail(<<"urn:yc:message:data">>,
				   Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"yc">>, <<"urn:yc:message:data">>},
     {<<"info">>, <<"urn:yc:message:data">>},
     {<<"media">>, <<"urn:yc:message:data">>},
     {<<"item">>, <<"urn:yc:message:data">>},
     {<<"thumbnail">>, <<"urn:yc:message:data">>}].

do_encode({yc_thumbnail, _} = Thumbnail, TopXMLNS) ->
    encode_yc_media_item_thumbnail(Thumbnail, TopXMLNS);
do_encode({yc_media_item, _, _, _, _} = Item,
	  TopXMLNS) ->
    encode_yc_media_item(Item, TopXMLNS);
do_encode({yc_media, _} = Media, TopXMLNS) ->
    encode_yc_media(Media, TopXMLNS);
do_encode({yc_info, _, _} = Info, TopXMLNS) ->
    encode_yc_media_info(Info, TopXMLNS);
do_encode({yc_message_data, <<"urn:yc:message:data">>,
	   _, _} =
	      Yc,
	  TopXMLNS) ->
    encode_yc_message_data(Yc, TopXMLNS);
do_encode({yc_message_data, <<>>, _, _} = Yc,
	  TopXMLNS = <<"urn:yc:message:data">>) ->
    encode_yc_message_data(Yc, TopXMLNS).

do_get_name({yc_info, _, _}) -> <<"info">>;
do_get_name({yc_media, _}) -> <<"media">>;
do_get_name({yc_media_item, _, _, _, _}) -> <<"item">>;
do_get_name({yc_message_data, _, _, _}) -> <<"yc">>;
do_get_name({yc_thumbnail, _}) -> <<"thumbnail">>.

do_get_ns({yc_info, _, _}) -> <<"urn:yc:message:data">>;
do_get_ns({yc_media, _}) -> <<"urn:yc:message:data">>;
do_get_ns({yc_media_item, _, _, _, _}) ->
    <<"urn:yc:message:data">>;
do_get_ns({yc_message_data, Xmlns, _, _}) -> Xmlns;
do_get_ns({yc_thumbnail, _}) ->
    <<"urn:yc:message:data">>.

pp(yc_thumbnail, 1) -> [data];
pp(yc_media_item, 4) -> [type, uid, url, thumbnail];
pp(yc_media, 1) -> [media];
pp(yc_info, 2) -> [sent, uid];
pp(yc_message_data, 3) -> [xmlns, info, media];
pp(_, _) -> no.

records() ->
    [{yc_thumbnail, 1}, {yc_media_item, 4}, {yc_media, 1},
     {yc_info, 2}, {yc_message_data, 3}].

decode_yc_message_data(__TopXMLNS, __Opts,
		       {xmlel, <<"yc">>, _attrs, _els}) ->
    {Media, Info} = decode_yc_message_data_els(__TopXMLNS,
					       __Opts, _els, false, false),
    Xmlns = decode_yc_message_data_attrs(__TopXMLNS, _attrs,
					 undefined),
    {yc_message_data, Xmlns, Info, Media}.

decode_yc_message_data_els(__TopXMLNS, __Opts, [],
			   Media, Info) ->
    {Media, Info};
decode_yc_message_data_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"info">>, _attrs, _} = _el | _els], Media,
			   Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media,
				     decode_yc_media_info(<<"urn:yc:message:data">>,
							  __Opts, _el));
      _ ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media, Info)
    end;
decode_yc_message_data_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"media">>, _attrs, _} = _el | _els],
			   Media, Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     decode_yc_media(<<"urn:yc:message:data">>,
						     __Opts, _el),
				     Info);
      _ ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media, Info)
    end;
decode_yc_message_data_els(__TopXMLNS, __Opts,
			   [_ | _els], Media, Info) ->
    decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
			       Media, Info).

decode_yc_message_data_attrs(__TopXMLNS,
			     [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_yc_message_data_attrs(__TopXMLNS, _attrs, _val);
decode_yc_message_data_attrs(__TopXMLNS, [_ | _attrs],
			     Xmlns) ->
    decode_yc_message_data_attrs(__TopXMLNS, _attrs, Xmlns);
decode_yc_message_data_attrs(__TopXMLNS, [], Xmlns) ->
    decode_yc_message_data_attr_xmlns(__TopXMLNS, Xmlns).

encode_yc_message_data({yc_message_data, Xmlns, Info,
			Media},
		       __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:yc:message:data">>],
						__TopXMLNS),
    _els =
	lists:reverse('encode_yc_message_data_$media'(Media,
						      __NewTopXMLNS,
						      'encode_yc_message_data_$info'(Info,
										     __NewTopXMLNS,
										     []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"yc">>, _attrs, _els}.

'encode_yc_message_data_$media'(false, __TopXMLNS,
				_acc) ->
    _acc;
'encode_yc_message_data_$media'(Media, __TopXMLNS,
				_acc) ->
    [encode_yc_media(Media, __TopXMLNS) | _acc].

'encode_yc_message_data_$info'(false, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_yc_message_data_$info'(Info, __TopXMLNS,
			       _acc) ->
    [encode_yc_media_info(Info, __TopXMLNS) | _acc].

decode_yc_message_data_attr_xmlns(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_yc_message_data_attr_xmlns(__TopXMLNS, _val) ->
    _val.

decode_yc_media_info(__TopXMLNS, __Opts,
		     {xmlel, <<"info">>, _attrs, _els}) ->
    {Sent, Uid} = decode_yc_media_info_attrs(__TopXMLNS,
					     _attrs, undefined, undefined),
    {yc_info, Sent, Uid}.

decode_yc_media_info_attrs(__TopXMLNS,
			   [{<<"sent">>, _val} | _attrs], _Sent, Uid) ->
    decode_yc_media_info_attrs(__TopXMLNS, _attrs, _val,
			       Uid);
decode_yc_media_info_attrs(__TopXMLNS,
			   [{<<"uid">>, _val} | _attrs], Sent, _Uid) ->
    decode_yc_media_info_attrs(__TopXMLNS, _attrs, Sent,
			       _val);
decode_yc_media_info_attrs(__TopXMLNS, [_ | _attrs],
			   Sent, Uid) ->
    decode_yc_media_info_attrs(__TopXMLNS, _attrs, Sent,
			       Uid);
decode_yc_media_info_attrs(__TopXMLNS, [], Sent, Uid) ->
    {decode_yc_media_info_attr_sent(__TopXMLNS, Sent),
     decode_yc_media_info_attr_uid(__TopXMLNS, Uid)}.

encode_yc_media_info({yc_info, Sent, Uid},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_yc_media_info_attr_uid(Uid,
					   encode_yc_media_info_attr_sent(Sent,
									  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
												     __TopXMLNS))),
    {xmlel, <<"info">>, _attrs, _els}.

decode_yc_media_info_attr_sent(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"sent">>, <<"info">>, __TopXMLNS}});
decode_yc_media_info_attr_sent(__TopXMLNS, _val) ->
    _val.

encode_yc_media_info_attr_sent(_val, _acc) ->
    [{<<"sent">>, _val} | _acc].

decode_yc_media_info_attr_uid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"uid">>, <<"info">>, __TopXMLNS}});
decode_yc_media_info_attr_uid(__TopXMLNS, _val) -> _val.

encode_yc_media_info_attr_uid(_val, _acc) ->
    [{<<"uid">>, _val} | _acc].

decode_yc_media(__TopXMLNS, __Opts,
		{xmlel, <<"media">>, _attrs, _els}) ->
    Media = decode_yc_media_els(__TopXMLNS, __Opts, _els,
				[]),
    {yc_media, Media}.

decode_yc_media_els(__TopXMLNS, __Opts, [], Media) ->
    lists:reverse(Media);
decode_yc_media_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"item">>, _attrs, _} = _el | _els], Media) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_media_els(__TopXMLNS, __Opts, _els,
			      [decode_yc_media_item(<<"urn:yc:message:data">>,
						    __Opts, _el)
			       | Media]);
      _ ->
	  decode_yc_media_els(__TopXMLNS, __Opts, _els, Media)
    end;
decode_yc_media_els(__TopXMLNS, __Opts, [_ | _els],
		    Media) ->
    decode_yc_media_els(__TopXMLNS, __Opts, _els, Media).

encode_yc_media({yc_media, Media}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_yc_media_$media'(Media,
						  __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"media">>, _attrs, _els}.

'encode_yc_media_$media'([], __TopXMLNS, _acc) -> _acc;
'encode_yc_media_$media'([Media | _els], __TopXMLNS,
			 _acc) ->
    'encode_yc_media_$media'(_els, __TopXMLNS,
			     [encode_yc_media_item(Media, __TopXMLNS) | _acc]).

decode_yc_media_item(__TopXMLNS, __Opts,
		     {xmlel, <<"item">>, _attrs, _els}) ->
    Thumbnail = decode_yc_media_item_els(__TopXMLNS, __Opts,
					 _els, false),
    {Type, Uid, Url} =
	decode_yc_media_item_attrs(__TopXMLNS, _attrs,
				   undefined, undefined, undefined),
    {yc_media_item, Type, Uid, Url, Thumbnail}.

decode_yc_media_item_els(__TopXMLNS, __Opts, [],
			 Thumbnail) ->
    Thumbnail;
decode_yc_media_item_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"thumbnail">>, _attrs, _} = _el | _els],
			 Thumbnail) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_media_item_els(__TopXMLNS, __Opts, _els,
				   decode_yc_media_item_thumbnail(<<"urn:yc:message:data">>,
								  __Opts, _el));
      _ ->
	  decode_yc_media_item_els(__TopXMLNS, __Opts, _els,
				   Thumbnail)
    end;
decode_yc_media_item_els(__TopXMLNS, __Opts, [_ | _els],
			 Thumbnail) ->
    decode_yc_media_item_els(__TopXMLNS, __Opts, _els,
			     Thumbnail).

decode_yc_media_item_attrs(__TopXMLNS,
			   [{<<"type">>, _val} | _attrs], _Type, Uid, Url) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, _val,
			       Uid, Url);
decode_yc_media_item_attrs(__TopXMLNS,
			   [{<<"uid">>, _val} | _attrs], Type, _Uid, Url) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, Type,
			       _val, Url);
decode_yc_media_item_attrs(__TopXMLNS,
			   [{<<"url">>, _val} | _attrs], Type, Uid, _Url) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, Type,
			       Uid, _val);
decode_yc_media_item_attrs(__TopXMLNS, [_ | _attrs],
			   Type, Uid, Url) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, Type,
			       Uid, Url);
decode_yc_media_item_attrs(__TopXMLNS, [], Type, Uid,
			   Url) ->
    {decode_yc_media_item_attr_type(__TopXMLNS, Type),
     decode_yc_media_item_attr_uid(__TopXMLNS, Uid),
     decode_yc_media_item_attr_url(__TopXMLNS, Url)}.

encode_yc_media_item({yc_media_item, Type, Uid, Url,
		      Thumbnail},
		     __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:yc:message:data">>],
						__TopXMLNS),
    _els =
	lists:reverse('encode_yc_media_item_$thumbnail'(Thumbnail,
							__NewTopXMLNS, [])),
    _attrs = encode_yc_media_item_attr_url(Url,
					   encode_yc_media_item_attr_uid(Uid,
									 encode_yc_media_item_attr_type(Type,
													xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																   __TopXMLNS)))),
    {xmlel, <<"item">>, _attrs, _els}.

'encode_yc_media_item_$thumbnail'(false, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_yc_media_item_$thumbnail'(Thumbnail, __TopXMLNS,
				  _acc) ->
    [encode_yc_media_item_thumbnail(Thumbnail, __TopXMLNS)
     | _acc].

decode_yc_media_item_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"item">>, __TopXMLNS}});
decode_yc_media_item_attr_type(__TopXMLNS, _val) ->
    _val.

encode_yc_media_item_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].

decode_yc_media_item_attr_uid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"uid">>, <<"item">>, __TopXMLNS}});
decode_yc_media_item_attr_uid(__TopXMLNS, _val) -> _val.

encode_yc_media_item_attr_uid(_val, _acc) ->
    [{<<"uid">>, _val} | _acc].

decode_yc_media_item_attr_url(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"url">>, <<"item">>, __TopXMLNS}});
decode_yc_media_item_attr_url(__TopXMLNS, _val) -> _val.

encode_yc_media_item_attr_url(_val, _acc) ->
    [{<<"url">>, _val} | _acc].

decode_yc_media_item_thumbnail(__TopXMLNS, __Opts,
			       {xmlel, <<"thumbnail">>, _attrs, _els}) ->
    Data = decode_yc_media_item_thumbnail_els(__TopXMLNS,
					      __Opts, _els, <<>>),
    {yc_thumbnail, Data}.

decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				   [], Data) ->
    decode_yc_media_item_thumbnail_cdata(__TopXMLNS, Data);
decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				   [{xmlcdata, _data} | _els], Data) ->
    decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				       _els, <<Data/binary, _data/binary>>);
decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				   [_ | _els], Data) ->
    decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				       _els, Data).

encode_yc_media_item_thumbnail({yc_thumbnail, Data},
			       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els = encode_yc_media_item_thumbnail_cdata(Data, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"thumbnail">>, _attrs, _els}.

decode_yc_media_item_thumbnail_cdata(__TopXMLNS,
				     <<>>) ->
    <<>>;
decode_yc_media_item_thumbnail_cdata(__TopXMLNS,
				     _val) ->
    _val.

encode_yc_media_item_thumbnail_cdata(<<>>, _acc) ->
    _acc;
encode_yc_media_item_thumbnail_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
