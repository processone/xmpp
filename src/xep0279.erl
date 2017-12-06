%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0279).

-compile(export_all).

do_decode(<<"address">>, <<"urn:xmpp:sic:0">>, El,
	  Opts) ->
    decode_sic(<<"urn:xmpp:sic:0">>, Opts, El);
do_decode(<<"address">>, <<"urn:xmpp:sic:1">>, El,
	  Opts) ->
    decode_sic(<<"urn:xmpp:sic:1">>, Opts, El);
do_decode(<<"port">>, <<"urn:xmpp:sic:1">>, El, Opts) ->
    decode_sic_port(<<"urn:xmpp:sic:1">>, Opts, El);
do_decode(<<"ip">>, <<"urn:xmpp:sic:0">>, El, Opts) ->
    decode_sic_ip(<<"urn:xmpp:sic:0">>, Opts, El);
do_decode(<<"ip">>, <<"urn:xmpp:sic:1">>, El, Opts) ->
    decode_sic_ip(<<"urn:xmpp:sic:1">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"address">>, <<"urn:xmpp:sic:0">>},
     {<<"address">>, <<"urn:xmpp:sic:1">>},
     {<<"port">>, <<"urn:xmpp:sic:1">>},
     {<<"ip">>, <<"urn:xmpp:sic:0">>},
     {<<"ip">>, <<"urn:xmpp:sic:1">>}].

do_encode({sic, _, _, _} = Address, TopXMLNS) ->
    encode_sic(Address, TopXMLNS).

do_get_name({sic, _, _, _}) -> <<"address">>.

do_get_ns({sic, _, _, Xmlns}) -> Xmlns.

pp(sic, 3) -> [ip, port, xmlns];
pp(_, _) -> no.

records() -> [{sic, 3}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

dec_ip(S) ->
    {ok, Addr} = inet_parse:address(binary_to_list(S)),
    Addr.

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_ip({0, 0, 0, 0, 0, 65535, A, B}) ->
    enc_ip({(A bsr 8) band 255, A band 255,
	    (B bsr 8) band 255, B band 255});
enc_ip(Addr) -> list_to_binary(inet_parse:ntoa(Addr)).

decode_sic(__TopXMLNS, __Opts,
	   {xmlel, <<"address">>, _attrs, _els}) ->
    {Ip, Port} = decode_sic_els(__TopXMLNS, __Opts, _els,
				undefined, undefined),
    Xmlns = decode_sic_attrs(__TopXMLNS, _attrs, undefined),
    {sic, Ip, Port, Xmlns}.

decode_sic_els(__TopXMLNS, __Opts, [], Ip, Port) ->
    {Ip, Port};
decode_sic_els(__TopXMLNS, __Opts,
	       [{xmlel, <<"ip">>, _attrs, _} = _el | _els], Ip,
	       Port) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:sic:0">> ->
	  decode_sic_els(__TopXMLNS, __Opts, _els,
			 decode_sic_ip(<<"urn:xmpp:sic:0">>, __Opts, _el),
			 Port);
      <<"urn:xmpp:sic:1">> ->
	  decode_sic_els(__TopXMLNS, __Opts, _els,
			 decode_sic_ip(<<"urn:xmpp:sic:1">>, __Opts, _el),
			 Port);
      _ -> decode_sic_els(__TopXMLNS, __Opts, _els, Ip, Port)
    end;
decode_sic_els(__TopXMLNS, __Opts,
	       [{xmlel, <<"port">>, _attrs, _} = _el | _els], Ip,
	       Port) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:sic:1">> ->
	  decode_sic_els(__TopXMLNS, __Opts, _els, Ip,
			 decode_sic_port(<<"urn:xmpp:sic:1">>, __Opts, _el));
      _ -> decode_sic_els(__TopXMLNS, __Opts, _els, Ip, Port)
    end;
decode_sic_els(__TopXMLNS, __Opts, [_ | _els], Ip,
	       Port) ->
    decode_sic_els(__TopXMLNS, __Opts, _els, Ip, Port).

decode_sic_attrs(__TopXMLNS,
		 [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_sic_attrs(__TopXMLNS, _attrs, _val);
decode_sic_attrs(__TopXMLNS, [_ | _attrs], Xmlns) ->
    decode_sic_attrs(__TopXMLNS, _attrs, Xmlns);
decode_sic_attrs(__TopXMLNS, [], Xmlns) ->
    decode_sic_attr_xmlns(__TopXMLNS, Xmlns).

encode_sic({sic, Ip, Port, Xmlns}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:sic:0">>,
						 <<"urn:xmpp:sic:1">>],
						__TopXMLNS),
    _els = lists:reverse('encode_sic_$ip'(Ip, __NewTopXMLNS,
					  'encode_sic_$port'(Port,
							     __NewTopXMLNS,
							     []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"address">>, _attrs, _els}.

'encode_sic_$ip'(undefined, __TopXMLNS, _acc) -> _acc;
'encode_sic_$ip'(Ip, __TopXMLNS, _acc) ->
    [encode_sic_ip(Ip, __TopXMLNS) | _acc].

'encode_sic_$port'(undefined, __TopXMLNS, _acc) -> _acc;
'encode_sic_$port'(Port, __TopXMLNS, _acc) ->
    [encode_sic_port(Port, __TopXMLNS) | _acc].

decode_sic_attr_xmlns(__TopXMLNS, undefined) -> <<>>;
decode_sic_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_sic_port(__TopXMLNS, __Opts,
		{xmlel, <<"port">>, _attrs, _els}) ->
    Cdata = decode_sic_port_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Cdata.

decode_sic_port_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_sic_port_cdata(__TopXMLNS, Cdata);
decode_sic_port_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Cdata) ->
    decode_sic_port_els(__TopXMLNS, __Opts, _els,
			<<Cdata/binary, _data/binary>>);
decode_sic_port_els(__TopXMLNS, __Opts, [_ | _els],
		    Cdata) ->
    decode_sic_port_els(__TopXMLNS, __Opts, _els, Cdata).

encode_sic_port(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sic:1">>, [],
				    __TopXMLNS),
    _els = encode_sic_port_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"port">>, _attrs, _els}.

decode_sic_port_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"port">>, __TopXMLNS}});
decode_sic_port_cdata(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, 65535) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"port">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sic_port_cdata(_val, _acc) ->
    [{xmlcdata, enc_int(_val)} | _acc].

decode_sic_ip(__TopXMLNS, __Opts,
	      {xmlel, <<"ip">>, _attrs, _els}) ->
    Cdata = decode_sic_ip_els(__TopXMLNS, __Opts, _els,
			      <<>>),
    Cdata.

decode_sic_ip_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_sic_ip_cdata(__TopXMLNS, Cdata);
decode_sic_ip_els(__TopXMLNS, __Opts,
		  [{xmlcdata, _data} | _els], Cdata) ->
    decode_sic_ip_els(__TopXMLNS, __Opts, _els,
		      <<Cdata/binary, _data/binary>>);
decode_sic_ip_els(__TopXMLNS, __Opts, [_ | _els],
		  Cdata) ->
    decode_sic_ip_els(__TopXMLNS, __Opts, _els, Cdata).

encode_sic_ip(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:xmpp:sic:0">>,
						 <<"urn:xmpp:sic:1">>],
						__TopXMLNS),
    _els = encode_sic_ip_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ip">>, _attrs, _els}.

decode_sic_ip_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"ip">>, __TopXMLNS}});
decode_sic_ip_cdata(__TopXMLNS, _val) ->
    case catch dec_ip(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"ip">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sic_ip_cdata(_val, _acc) ->
    [{xmlcdata, enc_ip(_val)} | _acc].
