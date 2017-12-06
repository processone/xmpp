%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0033).

-compile(export_all).

do_decode(<<"addresses">>,
	  <<"http://jabber.org/protocol/address">>, El, Opts) ->
    decode_addresses(<<"http://jabber.org/protocol/address">>,
		     Opts, El);
do_decode(<<"address">>,
	  <<"http://jabber.org/protocol/address">>, El, Opts) ->
    decode_address(<<"http://jabber.org/protocol/address">>,
		   Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"addresses">>,
      <<"http://jabber.org/protocol/address">>},
     {<<"address">>,
      <<"http://jabber.org/protocol/address">>}].

do_encode({address, _, _, _, _, _} = Address,
	  TopXMLNS) ->
    encode_address(Address, TopXMLNS);
do_encode({addresses, _} = Addresses, TopXMLNS) ->
    encode_addresses(Addresses, TopXMLNS).

do_get_name({address, _, _, _, _, _}) -> <<"address">>;
do_get_name({addresses, _}) -> <<"addresses">>.

do_get_ns({address, _, _, _, _, _}) ->
    <<"http://jabber.org/protocol/address">>;
do_get_ns({addresses, _}) ->
    <<"http://jabber.org/protocol/address">>.

pp(address, 5) -> [type, jid, desc, node, delivered];
pp(addresses, 1) -> [list];
pp(_, _) -> no.

records() -> [{address, 5}, {addresses, 1}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_addresses(__TopXMLNS, __Opts,
		 {xmlel, <<"addresses">>, _attrs, _els}) ->
    List = decode_addresses_els(__TopXMLNS, __Opts, _els,
				[]),
    {addresses, List}.

decode_addresses_els(__TopXMLNS, __Opts, [], List) ->
    lists:reverse(List);
decode_addresses_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"address">>, _attrs, _} = _el | _els],
		     List) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/address">> ->
	  decode_addresses_els(__TopXMLNS, __Opts, _els,
			       [decode_address(<<"http://jabber.org/protocol/address">>,
					       __Opts, _el)
				| List]);
      _ ->
	  decode_addresses_els(__TopXMLNS, __Opts, _els, List)
    end;
decode_addresses_els(__TopXMLNS, __Opts, [_ | _els],
		     List) ->
    decode_addresses_els(__TopXMLNS, __Opts, _els, List).

encode_addresses({addresses, List}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/address">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_addresses_$list'(List,
						  __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"addresses">>, _attrs, _els}.

'encode_addresses_$list'([], __TopXMLNS, _acc) -> _acc;
'encode_addresses_$list'([List | _els], __TopXMLNS,
			 _acc) ->
    'encode_addresses_$list'(_els, __TopXMLNS,
			     [encode_address(List, __TopXMLNS) | _acc]).

decode_address(__TopXMLNS, __Opts,
	       {xmlel, <<"address">>, _attrs, _els}) ->
    {Type, Jid, Desc, Node, Delivered} =
	decode_address_attrs(__TopXMLNS, _attrs, undefined,
			     undefined, undefined, undefined, undefined),
    {address, Type, Jid, Desc, Node, Delivered}.

decode_address_attrs(__TopXMLNS,
		     [{<<"type">>, _val} | _attrs], _Type, Jid, Desc, Node,
		     Delivered) ->
    decode_address_attrs(__TopXMLNS, _attrs, _val, Jid,
			 Desc, Node, Delivered);
decode_address_attrs(__TopXMLNS,
		     [{<<"jid">>, _val} | _attrs], Type, _Jid, Desc, Node,
		     Delivered) ->
    decode_address_attrs(__TopXMLNS, _attrs, Type, _val,
			 Desc, Node, Delivered);
decode_address_attrs(__TopXMLNS,
		     [{<<"desc">>, _val} | _attrs], Type, Jid, _Desc, Node,
		     Delivered) ->
    decode_address_attrs(__TopXMLNS, _attrs, Type, Jid,
			 _val, Node, Delivered);
decode_address_attrs(__TopXMLNS,
		     [{<<"node">>, _val} | _attrs], Type, Jid, Desc, _Node,
		     Delivered) ->
    decode_address_attrs(__TopXMLNS, _attrs, Type, Jid,
			 Desc, _val, Delivered);
decode_address_attrs(__TopXMLNS,
		     [{<<"delivered">>, _val} | _attrs], Type, Jid, Desc,
		     Node, _Delivered) ->
    decode_address_attrs(__TopXMLNS, _attrs, Type, Jid,
			 Desc, Node, _val);
decode_address_attrs(__TopXMLNS, [_ | _attrs], Type,
		     Jid, Desc, Node, Delivered) ->
    decode_address_attrs(__TopXMLNS, _attrs, Type, Jid,
			 Desc, Node, Delivered);
decode_address_attrs(__TopXMLNS, [], Type, Jid, Desc,
		     Node, Delivered) ->
    {decode_address_attr_type(__TopXMLNS, Type),
     decode_address_attr_jid(__TopXMLNS, Jid),
     decode_address_attr_desc(__TopXMLNS, Desc),
     decode_address_attr_node(__TopXMLNS, Node),
     decode_address_attr_delivered(__TopXMLNS, Delivered)}.

encode_address({address, Type, Jid, Desc, Node,
		Delivered},
	       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/address">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_address_attr_delivered(Delivered,
					   encode_address_attr_node(Node,
								    encode_address_attr_desc(Desc,
											     encode_address_attr_jid(Jid,
														     encode_address_attr_type(Type,
																	      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																					 __TopXMLNS)))))),
    {xmlel, <<"address">>, _attrs, _els}.

decode_address_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"address">>, __TopXMLNS}});
decode_address_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[bcc, cc, noreply, ofrom, replyroom, replyto, to])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"address">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_address_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_address_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_address_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"address">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_address_attr_jid(undefined, _acc) -> _acc;
encode_address_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_address_attr_desc(__TopXMLNS, undefined) -> <<>>;
decode_address_attr_desc(__TopXMLNS, _val) -> _val.

encode_address_attr_desc(<<>>, _acc) -> _acc;
encode_address_attr_desc(_val, _acc) ->
    [{<<"desc">>, _val} | _acc].

decode_address_attr_node(__TopXMLNS, undefined) -> <<>>;
decode_address_attr_node(__TopXMLNS, _val) -> _val.

encode_address_attr_node(<<>>, _acc) -> _acc;
encode_address_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_address_attr_delivered(__TopXMLNS, undefined) ->
    undefined;
decode_address_attr_delivered(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"delivered">>, <<"address">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_address_attr_delivered(undefined, _acc) -> _acc;
encode_address_attr_delivered(_val, _acc) ->
    [{<<"delivered">>, enc_bool(_val)} | _acc].
