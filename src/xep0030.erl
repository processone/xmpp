%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0030).

-compile(export_all).

do_decode(<<"query">>,
	  <<"http://jabber.org/protocol/disco#items">>, El,
	  Opts) ->
    decode_disco_items(<<"http://jabber.org/protocol/disco#items">>,
		       Opts, El);
do_decode(<<"item">>,
	  <<"http://jabber.org/protocol/disco#items">>, El,
	  Opts) ->
    decode_disco_item(<<"http://jabber.org/protocol/disco#items">>,
		      Opts, El);
do_decode(<<"query">>,
	  <<"http://jabber.org/protocol/disco#info">>, El,
	  Opts) ->
    decode_disco_info(<<"http://jabber.org/protocol/disco#info">>,
		      Opts, El);
do_decode(<<"feature">>,
	  <<"http://jabber.org/protocol/disco#info">>, El,
	  Opts) ->
    decode_disco_feature(<<"http://jabber.org/protocol/disco#info">>,
			 Opts, El);
do_decode(<<"identity">>,
	  <<"http://jabber.org/protocol/disco#info">>, El,
	  Opts) ->
    decode_disco_identity(<<"http://jabber.org/protocol/disco#info">>,
			  Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>,
      <<"http://jabber.org/protocol/disco#items">>},
     {<<"item">>,
      <<"http://jabber.org/protocol/disco#items">>},
     {<<"query">>,
      <<"http://jabber.org/protocol/disco#info">>},
     {<<"feature">>,
      <<"http://jabber.org/protocol/disco#info">>},
     {<<"identity">>,
      <<"http://jabber.org/protocol/disco#info">>}].

do_encode({identity, _, _, _, _} = Identity,
	  TopXMLNS) ->
    encode_disco_identity(Identity, TopXMLNS);
do_encode({disco_info, _, _, _, _} = Query, TopXMLNS) ->
    encode_disco_info(Query, TopXMLNS);
do_encode({disco_item, _, _, _} = Item, TopXMLNS) ->
    encode_disco_item(Item, TopXMLNS);
do_encode({disco_items, _, _, _} = Query, TopXMLNS) ->
    encode_disco_items(Query, TopXMLNS).

do_get_name({disco_info, _, _, _, _}) -> <<"query">>;
do_get_name({disco_item, _, _, _}) -> <<"item">>;
do_get_name({disco_items, _, _, _}) -> <<"query">>;
do_get_name({identity, _, _, _, _}) -> <<"identity">>.

do_get_ns({disco_info, _, _, _, _}) ->
    <<"http://jabber.org/protocol/disco#info">>;
do_get_ns({disco_item, _, _, _}) ->
    <<"http://jabber.org/protocol/disco#items">>;
do_get_ns({disco_items, _, _, _}) ->
    <<"http://jabber.org/protocol/disco#items">>;
do_get_ns({identity, _, _, _, _}) ->
    <<"http://jabber.org/protocol/disco#info">>.

pp(identity, 4) -> [category, type, lang, name];
pp(disco_info, 4) ->
    [node, identities, features, xdata];
pp(disco_item, 3) -> [jid, name, node];
pp(disco_items, 3) -> [node, items, rsm];
pp(_, _) -> no.

records() ->
    [{identity, 4}, {disco_info, 4}, {disco_item, 3},
     {disco_items, 3}].

decode_disco_items(__TopXMLNS, __Opts,
		   {xmlel, <<"query">>, _attrs, _els}) ->
    {Items, Rsm} = decode_disco_items_els(__TopXMLNS,
					  __Opts, _els, [], undefined),
    Node = decode_disco_items_attrs(__TopXMLNS, _attrs,
				    undefined),
    {disco_items, Node, Items, Rsm}.

decode_disco_items_els(__TopXMLNS, __Opts, [], Items,
		       Rsm) ->
    {lists:reverse(Items), Rsm};
decode_disco_items_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"item">>, _attrs, _} = _el | _els], Items,
		       Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/disco#items">> ->
	  decode_disco_items_els(__TopXMLNS, __Opts, _els,
				 [decode_disco_item(<<"http://jabber.org/protocol/disco#items">>,
						    __Opts, _el)
				  | Items],
				 Rsm);
      _ ->
	  decode_disco_items_els(__TopXMLNS, __Opts, _els, Items,
				 Rsm)
    end;
decode_disco_items_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"set">>, _attrs, _} = _el | _els], Items,
		       Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_disco_items_els(__TopXMLNS, __Opts, _els, Items,
				 xep0059:decode_rsm_set(<<"http://jabber.org/protocol/rsm">>,
							__Opts, _el));
      _ ->
	  decode_disco_items_els(__TopXMLNS, __Opts, _els, Items,
				 Rsm)
    end;
decode_disco_items_els(__TopXMLNS, __Opts, [_ | _els],
		       Items, Rsm) ->
    decode_disco_items_els(__TopXMLNS, __Opts, _els, Items,
			   Rsm).

decode_disco_items_attrs(__TopXMLNS,
			 [{<<"node">>, _val} | _attrs], _Node) ->
    decode_disco_items_attrs(__TopXMLNS, _attrs, _val);
decode_disco_items_attrs(__TopXMLNS, [_ | _attrs],
			 Node) ->
    decode_disco_items_attrs(__TopXMLNS, _attrs, Node);
decode_disco_items_attrs(__TopXMLNS, [], Node) ->
    decode_disco_items_attr_node(__TopXMLNS, Node).

encode_disco_items({disco_items, Node, Items, Rsm},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/disco#items">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_disco_items_$items'(Items,
						     __NewTopXMLNS,
						     'encode_disco_items_$rsm'(Rsm,
									       __NewTopXMLNS,
									       []))),
    _attrs = encode_disco_items_attr_node(Node,
					  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								     __TopXMLNS)),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_disco_items_$items'([], __TopXMLNS, _acc) ->
    _acc;
'encode_disco_items_$items'([Items | _els], __TopXMLNS,
			    _acc) ->
    'encode_disco_items_$items'(_els, __TopXMLNS,
				[encode_disco_item(Items, __TopXMLNS) | _acc]).

'encode_disco_items_$rsm'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_disco_items_$rsm'(Rsm, __TopXMLNS, _acc) ->
    [xep0059:encode_rsm_set(Rsm, __TopXMLNS) | _acc].

decode_disco_items_attr_node(__TopXMLNS, undefined) ->
    <<>>;
decode_disco_items_attr_node(__TopXMLNS, _val) -> _val.

encode_disco_items_attr_node(<<>>, _acc) -> _acc;
encode_disco_items_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_disco_item(__TopXMLNS, __Opts,
		  {xmlel, <<"item">>, _attrs, _els}) ->
    {Jid, Name, Node} = decode_disco_item_attrs(__TopXMLNS,
						_attrs, undefined, undefined,
						undefined),
    {disco_item, Jid, Name, Node}.

decode_disco_item_attrs(__TopXMLNS,
			[{<<"jid">>, _val} | _attrs], _Jid, Name, Node) ->
    decode_disco_item_attrs(__TopXMLNS, _attrs, _val, Name,
			    Node);
decode_disco_item_attrs(__TopXMLNS,
			[{<<"name">>, _val} | _attrs], Jid, _Name, Node) ->
    decode_disco_item_attrs(__TopXMLNS, _attrs, Jid, _val,
			    Node);
decode_disco_item_attrs(__TopXMLNS,
			[{<<"node">>, _val} | _attrs], Jid, Name, _Node) ->
    decode_disco_item_attrs(__TopXMLNS, _attrs, Jid, Name,
			    _val);
decode_disco_item_attrs(__TopXMLNS, [_ | _attrs], Jid,
			Name, Node) ->
    decode_disco_item_attrs(__TopXMLNS, _attrs, Jid, Name,
			    Node);
decode_disco_item_attrs(__TopXMLNS, [], Jid, Name,
			Node) ->
    {decode_disco_item_attr_jid(__TopXMLNS, Jid),
     decode_disco_item_attr_name(__TopXMLNS, Name),
     decode_disco_item_attr_node(__TopXMLNS, Node)}.

encode_disco_item({disco_item, Jid, Name, Node},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/disco#items">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_disco_item_attr_node(Node,
					 encode_disco_item_attr_name(Name,
								     encode_disco_item_attr_jid(Jid,
												xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
															   __TopXMLNS)))),
    {xmlel, <<"item">>, _attrs, _els}.

decode_disco_item_attr_jid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"item">>, __TopXMLNS}});
decode_disco_item_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_disco_item_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_disco_item_attr_name(__TopXMLNS, undefined) ->
    <<>>;
decode_disco_item_attr_name(__TopXMLNS, _val) -> _val.

encode_disco_item_attr_name(<<>>, _acc) -> _acc;
encode_disco_item_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_disco_item_attr_node(__TopXMLNS, undefined) ->
    <<>>;
decode_disco_item_attr_node(__TopXMLNS, _val) -> _val.

encode_disco_item_attr_node(<<>>, _acc) -> _acc;
encode_disco_item_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_disco_info(__TopXMLNS, __Opts,
		  {xmlel, <<"query">>, _attrs, _els}) ->
    {Xdata, Features, Identities} =
	decode_disco_info_els(__TopXMLNS, __Opts, _els, [], [],
			      []),
    Node = decode_disco_info_attrs(__TopXMLNS, _attrs,
				   undefined),
    {disco_info, Node, Identities, Features, Xdata}.

decode_disco_info_els(__TopXMLNS, __Opts, [], Xdata,
		      Features, Identities) ->
    {lists:reverse(Xdata), lists:reverse(Features),
     lists:reverse(Identities)};
decode_disco_info_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"identity">>, _attrs, _} = _el | _els],
		      Xdata, Features, Identities) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/disco#info">> ->
	  decode_disco_info_els(__TopXMLNS, __Opts, _els, Xdata,
				Features,
				[decode_disco_identity(<<"http://jabber.org/protocol/disco#info">>,
						       __Opts, _el)
				 | Identities]);
      _ ->
	  decode_disco_info_els(__TopXMLNS, __Opts, _els, Xdata,
				Features, Identities)
    end;
decode_disco_info_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"feature">>, _attrs, _} = _el | _els], Xdata,
		      Features, Identities) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/disco#info">> ->
	  decode_disco_info_els(__TopXMLNS, __Opts, _els, Xdata,
				[decode_disco_feature(<<"http://jabber.org/protocol/disco#info">>,
						      __Opts, _el)
				 | Features],
				Identities);
      _ ->
	  decode_disco_info_els(__TopXMLNS, __Opts, _els, Xdata,
				Features, Identities)
    end;
decode_disco_info_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"x">>, _attrs, _} = _el | _els], Xdata,
		      Features, Identities) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_disco_info_els(__TopXMLNS, __Opts, _els,
				[xep0004:decode_xdata(<<"jabber:x:data">>,
						      __Opts, _el)
				 | Xdata],
				Features, Identities);
      _ ->
	  decode_disco_info_els(__TopXMLNS, __Opts, _els, Xdata,
				Features, Identities)
    end;
decode_disco_info_els(__TopXMLNS, __Opts, [_ | _els],
		      Xdata, Features, Identities) ->
    decode_disco_info_els(__TopXMLNS, __Opts, _els, Xdata,
			  Features, Identities).

decode_disco_info_attrs(__TopXMLNS,
			[{<<"node">>, _val} | _attrs], _Node) ->
    decode_disco_info_attrs(__TopXMLNS, _attrs, _val);
decode_disco_info_attrs(__TopXMLNS, [_ | _attrs],
			Node) ->
    decode_disco_info_attrs(__TopXMLNS, _attrs, Node);
decode_disco_info_attrs(__TopXMLNS, [], Node) ->
    decode_disco_info_attr_node(__TopXMLNS, Node).

encode_disco_info({disco_info, Node, Identities,
		   Features, Xdata},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/disco#info">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_disco_info_$xdata'(Xdata,
						    __NewTopXMLNS,
						    'encode_disco_info_$features'(Features,
										  __NewTopXMLNS,
										  'encode_disco_info_$identities'(Identities,
														  __NewTopXMLNS,
														  [])))),
    _attrs = encode_disco_info_attr_node(Node,
					 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								    __TopXMLNS)),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_disco_info_$xdata'([], __TopXMLNS, _acc) ->
    _acc;
'encode_disco_info_$xdata'([Xdata | _els], __TopXMLNS,
			   _acc) ->
    'encode_disco_info_$xdata'(_els, __TopXMLNS,
			       [xep0004:encode_xdata(Xdata, __TopXMLNS)
				| _acc]).

'encode_disco_info_$features'([], __TopXMLNS, _acc) ->
    _acc;
'encode_disco_info_$features'([Features | _els],
			      __TopXMLNS, _acc) ->
    'encode_disco_info_$features'(_els, __TopXMLNS,
				  [encode_disco_feature(Features, __TopXMLNS)
				   | _acc]).

'encode_disco_info_$identities'([], __TopXMLNS, _acc) ->
    _acc;
'encode_disco_info_$identities'([Identities | _els],
				__TopXMLNS, _acc) ->
    'encode_disco_info_$identities'(_els, __TopXMLNS,
				    [encode_disco_identity(Identities,
							   __TopXMLNS)
				     | _acc]).

decode_disco_info_attr_node(__TopXMLNS, undefined) ->
    <<>>;
decode_disco_info_attr_node(__TopXMLNS, _val) -> _val.

encode_disco_info_attr_node(<<>>, _acc) -> _acc;
encode_disco_info_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_disco_feature(__TopXMLNS, __Opts,
		     {xmlel, <<"feature">>, _attrs, _els}) ->
    Var = decode_disco_feature_attrs(__TopXMLNS, _attrs,
				     undefined),
    Var.

decode_disco_feature_attrs(__TopXMLNS,
			   [{<<"var">>, _val} | _attrs], _Var) ->
    decode_disco_feature_attrs(__TopXMLNS, _attrs, _val);
decode_disco_feature_attrs(__TopXMLNS, [_ | _attrs],
			   Var) ->
    decode_disco_feature_attrs(__TopXMLNS, _attrs, Var);
decode_disco_feature_attrs(__TopXMLNS, [], Var) ->
    decode_disco_feature_attr_var(__TopXMLNS, Var).

encode_disco_feature(Var, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/disco#info">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_disco_feature_attr_var(Var,
					   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								      __TopXMLNS)),
    {xmlel, <<"feature">>, _attrs, _els}.

decode_disco_feature_attr_var(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"var">>, <<"feature">>, __TopXMLNS}});
decode_disco_feature_attr_var(__TopXMLNS, _val) -> _val.

encode_disco_feature_attr_var(_val, _acc) ->
    [{<<"var">>, _val} | _acc].

decode_disco_identity(__TopXMLNS, __Opts,
		      {xmlel, <<"identity">>, _attrs, _els}) ->
    {Category, Type, Lang, Name} =
	decode_disco_identity_attrs(__TopXMLNS, _attrs,
				    undefined, undefined, undefined, undefined),
    {identity, Category, Type, Lang, Name}.

decode_disco_identity_attrs(__TopXMLNS,
			    [{<<"category">>, _val} | _attrs], _Category, Type,
			    Lang, Name) ->
    decode_disco_identity_attrs(__TopXMLNS, _attrs, _val,
				Type, Lang, Name);
decode_disco_identity_attrs(__TopXMLNS,
			    [{<<"type">>, _val} | _attrs], Category, _Type,
			    Lang, Name) ->
    decode_disco_identity_attrs(__TopXMLNS, _attrs,
				Category, _val, Lang, Name);
decode_disco_identity_attrs(__TopXMLNS,
			    [{<<"xml:lang">>, _val} | _attrs], Category, Type,
			    _Lang, Name) ->
    decode_disco_identity_attrs(__TopXMLNS, _attrs,
				Category, Type, _val, Name);
decode_disco_identity_attrs(__TopXMLNS,
			    [{<<"name">>, _val} | _attrs], Category, Type, Lang,
			    _Name) ->
    decode_disco_identity_attrs(__TopXMLNS, _attrs,
				Category, Type, Lang, _val);
decode_disco_identity_attrs(__TopXMLNS, [_ | _attrs],
			    Category, Type, Lang, Name) ->
    decode_disco_identity_attrs(__TopXMLNS, _attrs,
				Category, Type, Lang, Name);
decode_disco_identity_attrs(__TopXMLNS, [], Category,
			    Type, Lang, Name) ->
    {decode_disco_identity_attr_category(__TopXMLNS,
					 Category),
     decode_disco_identity_attr_type(__TopXMLNS, Type),
     'decode_disco_identity_attr_xml:lang'(__TopXMLNS, Lang),
     decode_disco_identity_attr_name(__TopXMLNS, Name)}.

encode_disco_identity({identity, Category, Type, Lang,
		       Name},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/disco#info">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_disco_identity_attr_name(Name,
					     'encode_disco_identity_attr_xml:lang'(Lang,
										   encode_disco_identity_attr_type(Type,
														   encode_disco_identity_attr_category(Category,
																		       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																						  __TopXMLNS))))),
    {xmlel, <<"identity">>, _attrs, _els}.

decode_disco_identity_attr_category(__TopXMLNS,
				    undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"category">>, <<"identity">>,
		   __TopXMLNS}});
decode_disco_identity_attr_category(__TopXMLNS, _val) ->
    _val.

encode_disco_identity_attr_category(_val, _acc) ->
    [{<<"category">>, _val} | _acc].

decode_disco_identity_attr_type(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"identity">>,
		   __TopXMLNS}});
decode_disco_identity_attr_type(__TopXMLNS, _val) ->
    _val.

encode_disco_identity_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].

'decode_disco_identity_attr_xml:lang'(__TopXMLNS,
				      undefined) ->
    <<>>;
'decode_disco_identity_attr_xml:lang'(__TopXMLNS,
				      _val) ->
    _val.

'encode_disco_identity_attr_xml:lang'(<<>>, _acc) ->
    _acc;
'encode_disco_identity_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_disco_identity_attr_name(__TopXMLNS,
				undefined) ->
    <<>>;
decode_disco_identity_attr_name(__TopXMLNS, _val) ->
    _val.

encode_disco_identity_attr_name(<<>>, _acc) -> _acc;
encode_disco_identity_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].
