%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0131).

-compile(export_all).

do_decode(<<"headers">>,
	  <<"http://jabber.org/protocol/shim">>, El, Opts) ->
    decode_shim_headers(<<"http://jabber.org/protocol/shim">>,
			Opts, El);
do_decode(<<"header">>,
	  <<"http://jabber.org/protocol/shim">>, El, Opts) ->
    decode_shim_header(<<"http://jabber.org/protocol/shim">>,
		       Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"headers">>, <<"http://jabber.org/protocol/shim">>},
     {<<"header">>, <<"http://jabber.org/protocol/shim">>}].

do_encode({shim, _} = Headers, TopXMLNS) ->
    encode_shim_headers(Headers, TopXMLNS).

do_get_name({shim, _}) -> <<"headers">>.

do_get_ns({shim, _}) ->
    <<"http://jabber.org/protocol/shim">>.

pp(shim, 1) -> [headers];
pp(_, _) -> no.

records() -> [{shim, 1}].

decode_shim_headers(__TopXMLNS, __Opts,
		    {xmlel, <<"headers">>, _attrs, _els}) ->
    Headers = decode_shim_headers_els(__TopXMLNS, __Opts,
				      _els, []),
    {shim, Headers}.

decode_shim_headers_els(__TopXMLNS, __Opts, [],
			Headers) ->
    lists:reverse(Headers);
decode_shim_headers_els(__TopXMLNS, __Opts,
			[{xmlel, <<"header">>, _attrs, _} = _el | _els],
			Headers) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/shim">> ->
	  decode_shim_headers_els(__TopXMLNS, __Opts, _els,
				  [decode_shim_header(<<"http://jabber.org/protocol/shim">>,
						      __Opts, _el)
				   | Headers]);
      _ ->
	  decode_shim_headers_els(__TopXMLNS, __Opts, _els,
				  Headers)
    end;
decode_shim_headers_els(__TopXMLNS, __Opts, [_ | _els],
			Headers) ->
    decode_shim_headers_els(__TopXMLNS, __Opts, _els,
			    Headers).

encode_shim_headers({shim, Headers}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/shim">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_shim_headers_$headers'(Headers,
						     __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"headers">>, _attrs, _els}.

'encode_shim_headers_$headers'([], __TopXMLNS, _acc) ->
    _acc;
'encode_shim_headers_$headers'([Headers | _els],
			       __TopXMLNS, _acc) ->
    'encode_shim_headers_$headers'(_els, __TopXMLNS,
				   [encode_shim_header(Headers, __TopXMLNS)
				    | _acc]).

decode_shim_header(__TopXMLNS, __Opts,
		   {xmlel, <<"header">>, _attrs, _els}) ->
    Cdata = decode_shim_header_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Name = decode_shim_header_attrs(__TopXMLNS, _attrs,
				    undefined),
    {Name, Cdata}.

decode_shim_header_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_shim_header_cdata(__TopXMLNS, Cdata);
decode_shim_header_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_shim_header_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_shim_header_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_shim_header_els(__TopXMLNS, __Opts, _els, Cdata).

decode_shim_header_attrs(__TopXMLNS,
			 [{<<"name">>, _val} | _attrs], _Name) ->
    decode_shim_header_attrs(__TopXMLNS, _attrs, _val);
decode_shim_header_attrs(__TopXMLNS, [_ | _attrs],
			 Name) ->
    decode_shim_header_attrs(__TopXMLNS, _attrs, Name);
decode_shim_header_attrs(__TopXMLNS, [], Name) ->
    decode_shim_header_attr_name(__TopXMLNS, Name).

encode_shim_header({Name, Cdata}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/shim">>,
				    [], __TopXMLNS),
    _els = encode_shim_header_cdata(Cdata, []),
    _attrs = encode_shim_header_attr_name(Name,
					  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								     __TopXMLNS)),
    {xmlel, <<"header">>, _attrs, _els}.

decode_shim_header_attr_name(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"name">>, <<"header">>, __TopXMLNS}});
decode_shim_header_attr_name(__TopXMLNS, _val) -> _val.

encode_shim_header_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_shim_header_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_shim_header_cdata(__TopXMLNS, _val) -> _val.

encode_shim_header_cdata(<<>>, _acc) -> _acc;
encode_shim_header_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
