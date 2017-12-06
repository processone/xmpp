%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0066).

-compile(export_all).

do_decode(<<"x">>, <<"jabber:x:oob">>, El, Opts) ->
    decode_oob_x(<<"jabber:x:oob">>, Opts, El);
do_decode(<<"desc">>, <<"jabber:x:oob">>, El, Opts) ->
    decode_oob_desc(<<"jabber:x:oob">>, Opts, El);
do_decode(<<"url">>, <<"jabber:x:oob">>, El, Opts) ->
    decode_oob_url(<<"jabber:x:oob">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"x">>, <<"jabber:x:oob">>},
     {<<"desc">>, <<"jabber:x:oob">>},
     {<<"url">>, <<"jabber:x:oob">>}].

do_encode({oob_x, _, _, _} = X, TopXMLNS) ->
    encode_oob_x(X, TopXMLNS).

do_get_name({oob_x, _, _, _}) -> <<"x">>.

do_get_ns({oob_x, _, _, _}) -> <<"jabber:x:oob">>.

pp(oob_x, 3) -> [url, desc, sid];
pp(_, _) -> no.

records() -> [{oob_x, 3}].

decode_oob_x(__TopXMLNS, __Opts,
	     {xmlel, <<"x">>, _attrs, _els}) ->
    {Desc, Url} = decode_oob_x_els(__TopXMLNS, __Opts, _els,
				   <<>>, error),
    Sid = decode_oob_x_attrs(__TopXMLNS, _attrs, undefined),
    {oob_x, Url, Desc, Sid}.

decode_oob_x_els(__TopXMLNS, __Opts, [], Desc, Url) ->
    {Desc,
     case Url of
       error ->
	   erlang:error({xmpp_codec,
			 {missing_tag, <<"url">>, __TopXMLNS}});
       {value, Url1} -> Url1
     end};
decode_oob_x_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"url">>, _attrs, _} = _el | _els], Desc,
		 Url) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:oob">> ->
	  decode_oob_x_els(__TopXMLNS, __Opts, _els, Desc,
			   {value,
			    decode_oob_url(<<"jabber:x:oob">>, __Opts, _el)});
      _ ->
	  decode_oob_x_els(__TopXMLNS, __Opts, _els, Desc, Url)
    end;
decode_oob_x_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"desc">>, _attrs, _} = _el | _els], Desc,
		 Url) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:oob">> ->
	  decode_oob_x_els(__TopXMLNS, __Opts, _els,
			   decode_oob_desc(<<"jabber:x:oob">>, __Opts, _el),
			   Url);
      _ ->
	  decode_oob_x_els(__TopXMLNS, __Opts, _els, Desc, Url)
    end;
decode_oob_x_els(__TopXMLNS, __Opts, [_ | _els], Desc,
		 Url) ->
    decode_oob_x_els(__TopXMLNS, __Opts, _els, Desc, Url).

decode_oob_x_attrs(__TopXMLNS,
		   [{<<"sid">>, _val} | _attrs], _Sid) ->
    decode_oob_x_attrs(__TopXMLNS, _attrs, _val);
decode_oob_x_attrs(__TopXMLNS, [_ | _attrs], Sid) ->
    decode_oob_x_attrs(__TopXMLNS, _attrs, Sid);
decode_oob_x_attrs(__TopXMLNS, [], Sid) ->
    decode_oob_x_attr_sid(__TopXMLNS, Sid).

encode_oob_x({oob_x, Url, Desc, Sid}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:oob">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_oob_x_$desc'(Desc,
					      __NewTopXMLNS,
					      'encode_oob_x_$url'(Url,
								  __NewTopXMLNS,
								  []))),
    _attrs = encode_oob_x_attr_sid(Sid,
				   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
							      __TopXMLNS)),
    {xmlel, <<"x">>, _attrs, _els}.

'encode_oob_x_$desc'(<<>>, __TopXMLNS, _acc) -> _acc;
'encode_oob_x_$desc'(Desc, __TopXMLNS, _acc) ->
    [encode_oob_desc(Desc, __TopXMLNS) | _acc].

'encode_oob_x_$url'(Url, __TopXMLNS, _acc) ->
    [encode_oob_url(Url, __TopXMLNS) | _acc].

decode_oob_x_attr_sid(__TopXMLNS, undefined) -> <<>>;
decode_oob_x_attr_sid(__TopXMLNS, _val) -> _val.

encode_oob_x_attr_sid(<<>>, _acc) -> _acc;
encode_oob_x_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

decode_oob_desc(__TopXMLNS, __Opts,
		{xmlel, <<"desc">>, _attrs, _els}) ->
    Cdata = decode_oob_desc_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Cdata.

decode_oob_desc_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_oob_desc_cdata(__TopXMLNS, Cdata);
decode_oob_desc_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Cdata) ->
    decode_oob_desc_els(__TopXMLNS, __Opts, _els,
			<<Cdata/binary, _data/binary>>);
decode_oob_desc_els(__TopXMLNS, __Opts, [_ | _els],
		    Cdata) ->
    decode_oob_desc_els(__TopXMLNS, __Opts, _els, Cdata).

encode_oob_desc(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:oob">>, [],
				    __TopXMLNS),
    _els = encode_oob_desc_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"desc">>, _attrs, _els}.

decode_oob_desc_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_oob_desc_cdata(__TopXMLNS, _val) -> _val.

encode_oob_desc_cdata(<<>>, _acc) -> _acc;
encode_oob_desc_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_oob_url(__TopXMLNS, __Opts,
	       {xmlel, <<"url">>, _attrs, _els}) ->
    Cdata = decode_oob_url_els(__TopXMLNS, __Opts, _els,
			       <<>>),
    Cdata.

decode_oob_url_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_oob_url_cdata(__TopXMLNS, Cdata);
decode_oob_url_els(__TopXMLNS, __Opts,
		   [{xmlcdata, _data} | _els], Cdata) ->
    decode_oob_url_els(__TopXMLNS, __Opts, _els,
		       <<Cdata/binary, _data/binary>>);
decode_oob_url_els(__TopXMLNS, __Opts, [_ | _els],
		   Cdata) ->
    decode_oob_url_els(__TopXMLNS, __Opts, _els, Cdata).

encode_oob_url(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:oob">>, [],
				    __TopXMLNS),
    _els = encode_oob_url_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"url">>, _attrs, _els}.

decode_oob_url_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"url">>, __TopXMLNS}});
decode_oob_url_cdata(__TopXMLNS, _val) -> _val.

encode_oob_url_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
