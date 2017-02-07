%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0016).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:privacy">>, El,
	  Opts) ->
    decode_privacy(<<"jabber:iq:privacy">>, Opts, El);
do_decode(<<"active">>, <<"jabber:iq:privacy">>, El,
	  Opts) ->
    decode_privacy_active_list(<<"jabber:iq:privacy">>,
			       Opts, El);
do_decode(<<"default">>, <<"jabber:iq:privacy">>, El,
	  Opts) ->
    decode_privacy_default_list(<<"jabber:iq:privacy">>,
				Opts, El);
do_decode(<<"list">>, <<"jabber:iq:privacy">>, El,
	  Opts) ->
    decode_privacy_list(<<"jabber:iq:privacy">>, Opts, El);
do_decode(<<"item">>, <<"jabber:iq:privacy">>, El,
	  Opts) ->
    decode_privacy_item(<<"jabber:iq:privacy">>, Opts, El);
do_decode(<<"presence-out">>, <<"jabber:iq:privacy">>,
	  El, Opts) ->
    decode_privacy_presence_out(<<"jabber:iq:privacy">>,
				Opts, El);
do_decode(<<"presence-in">>, <<"jabber:iq:privacy">>,
	  El, Opts) ->
    decode_privacy_presence_in(<<"jabber:iq:privacy">>,
			       Opts, El);
do_decode(<<"iq">>, <<"jabber:iq:privacy">>, El,
	  Opts) ->
    decode_privacy_iq(<<"jabber:iq:privacy">>, Opts, El);
do_decode(<<"message">>, <<"jabber:iq:privacy">>, El,
	  Opts) ->
    decode_privacy_message(<<"jabber:iq:privacy">>, Opts,
			   El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:iq:privacy">>},
     {<<"active">>, <<"jabber:iq:privacy">>},
     {<<"default">>, <<"jabber:iq:privacy">>},
     {<<"list">>, <<"jabber:iq:privacy">>},
     {<<"item">>, <<"jabber:iq:privacy">>},
     {<<"presence-out">>, <<"jabber:iq:privacy">>},
     {<<"presence-in">>, <<"jabber:iq:privacy">>},
     {<<"iq">>, <<"jabber:iq:privacy">>},
     {<<"message">>, <<"jabber:iq:privacy">>}].

do_encode({privacy_item, _, _, _, _, _, _, _, _} = Item,
	  TopXMLNS) ->
    encode_privacy_item(Item, TopXMLNS);
do_encode({privacy_list, _, _} = List, TopXMLNS) ->
    encode_privacy_list(List, TopXMLNS);
do_encode({privacy_query, _, _, _} = Query, TopXMLNS) ->
    encode_privacy(Query, TopXMLNS).

do_get_name({privacy_item, _, _, _, _, _, _, _, _}) ->
    <<"item">>;
do_get_name({privacy_list, _, _}) -> <<"list">>;
do_get_name({privacy_query, _, _, _}) -> <<"query">>.

do_get_ns({privacy_item, _, _, _, _, _, _, _, _}) ->
    <<"jabber:iq:privacy">>;
do_get_ns({privacy_list, _, _}) ->
    <<"jabber:iq:privacy">>;
do_get_ns({privacy_query, _, _, _}) ->
    <<"jabber:iq:privacy">>.

pp(privacy_item, 8) ->
    [order, action, type, value, message, iq, presence_in,
     presence_out];
pp(privacy_list, 2) -> [name, items];
pp(privacy_query, 3) -> [lists, default, active];
pp(_, _) -> no.

records() ->
    [{privacy_item, 8}, {privacy_list, 2},
     {privacy_query, 3}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_privacy(__TopXMLNS, __Opts,
	       {xmlel, <<"query">>, _attrs, _els}) ->
    {Lists, Default, Active} =
	decode_privacy_els(__TopXMLNS, __Opts, _els, [],
			   undefined, undefined),
    {privacy_query, Lists, Default, Active}.

decode_privacy_els(__TopXMLNS, __Opts, [], Lists,
		   Default, Active) ->
    {lists:reverse(Lists), Default, Active};
decode_privacy_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"list">>, _attrs, _} = _el | _els], Lists,
		   Default, Active) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:privacy">> ->
	  decode_privacy_els(__TopXMLNS, __Opts, _els,
			     [decode_privacy_list(<<"jabber:iq:privacy">>,
						  __Opts, _el)
			      | Lists],
			     Default, Active);
      _ ->
	  decode_privacy_els(__TopXMLNS, __Opts, _els, Lists,
			     Default, Active)
    end;
decode_privacy_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"default">>, _attrs, _} = _el | _els], Lists,
		   Default, Active) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:privacy">> ->
	  decode_privacy_els(__TopXMLNS, __Opts, _els, Lists,
			     decode_privacy_default_list(<<"jabber:iq:privacy">>,
							 __Opts, _el),
			     Active);
      _ ->
	  decode_privacy_els(__TopXMLNS, __Opts, _els, Lists,
			     Default, Active)
    end;
decode_privacy_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"active">>, _attrs, _} = _el | _els], Lists,
		   Default, Active) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:privacy">> ->
	  decode_privacy_els(__TopXMLNS, __Opts, _els, Lists,
			     Default,
			     decode_privacy_active_list(<<"jabber:iq:privacy">>,
							__Opts, _el));
      _ ->
	  decode_privacy_els(__TopXMLNS, __Opts, _els, Lists,
			     Default, Active)
    end;
decode_privacy_els(__TopXMLNS, __Opts, [_ | _els],
		   Lists, Default, Active) ->
    decode_privacy_els(__TopXMLNS, __Opts, _els, Lists,
		       Default, Active).

encode_privacy({privacy_query, Lists, Default, Active},
	       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:privacy">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_privacy_$lists'(Lists,
						 __NewTopXMLNS,
						 'encode_privacy_$default'(Default,
									   __NewTopXMLNS,
									   'encode_privacy_$active'(Active,
												    __NewTopXMLNS,
												    [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_privacy_$lists'([], __TopXMLNS, _acc) -> _acc;
'encode_privacy_$lists'([Lists | _els], __TopXMLNS,
			_acc) ->
    'encode_privacy_$lists'(_els, __TopXMLNS,
			    [encode_privacy_list(Lists, __TopXMLNS) | _acc]).

'encode_privacy_$default'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_privacy_$default'(Default, __TopXMLNS, _acc) ->
    [encode_privacy_default_list(Default, __TopXMLNS)
     | _acc].

'encode_privacy_$active'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_privacy_$active'(Active, __TopXMLNS, _acc) ->
    [encode_privacy_active_list(Active, __TopXMLNS) | _acc].

decode_privacy_active_list(__TopXMLNS, __Opts,
			   {xmlel, <<"active">>, _attrs, _els}) ->
    Name = decode_privacy_active_list_attrs(__TopXMLNS,
					    _attrs, undefined),
    Name.

decode_privacy_active_list_attrs(__TopXMLNS,
				 [{<<"name">>, _val} | _attrs], _Name) ->
    decode_privacy_active_list_attrs(__TopXMLNS, _attrs,
				     _val);
decode_privacy_active_list_attrs(__TopXMLNS,
				 [_ | _attrs], Name) ->
    decode_privacy_active_list_attrs(__TopXMLNS, _attrs,
				     Name);
decode_privacy_active_list_attrs(__TopXMLNS, [],
				 Name) ->
    decode_privacy_active_list_attr_name(__TopXMLNS, Name).

encode_privacy_active_list(Name, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:privacy">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_privacy_active_list_attr_name(Name,
						  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									     __TopXMLNS)),
    {xmlel, <<"active">>, _attrs, _els}.

decode_privacy_active_list_attr_name(__TopXMLNS,
				     undefined) ->
    none;
decode_privacy_active_list_attr_name(__TopXMLNS,
				     _val) ->
    _val.

encode_privacy_active_list_attr_name(none, _acc) ->
    _acc;
encode_privacy_active_list_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_privacy_default_list(__TopXMLNS, __Opts,
			    {xmlel, <<"default">>, _attrs, _els}) ->
    Name = decode_privacy_default_list_attrs(__TopXMLNS,
					     _attrs, undefined),
    Name.

decode_privacy_default_list_attrs(__TopXMLNS,
				  [{<<"name">>, _val} | _attrs], _Name) ->
    decode_privacy_default_list_attrs(__TopXMLNS, _attrs,
				      _val);
decode_privacy_default_list_attrs(__TopXMLNS,
				  [_ | _attrs], Name) ->
    decode_privacy_default_list_attrs(__TopXMLNS, _attrs,
				      Name);
decode_privacy_default_list_attrs(__TopXMLNS, [],
				  Name) ->
    decode_privacy_default_list_attr_name(__TopXMLNS, Name).

encode_privacy_default_list(Name, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:privacy">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_privacy_default_list_attr_name(Name,
						   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									      __TopXMLNS)),
    {xmlel, <<"default">>, _attrs, _els}.

decode_privacy_default_list_attr_name(__TopXMLNS,
				      undefined) ->
    none;
decode_privacy_default_list_attr_name(__TopXMLNS,
				      _val) ->
    _val.

encode_privacy_default_list_attr_name(none, _acc) ->
    _acc;
encode_privacy_default_list_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_privacy_list(__TopXMLNS, __Opts,
		    {xmlel, <<"list">>, _attrs, _els}) ->
    Items = decode_privacy_list_els(__TopXMLNS, __Opts,
				    _els, []),
    Name = decode_privacy_list_attrs(__TopXMLNS, _attrs,
				     undefined),
    {privacy_list, Name, Items}.

decode_privacy_list_els(__TopXMLNS, __Opts, [],
			Items) ->
    lists:reverse(Items);
decode_privacy_list_els(__TopXMLNS, __Opts,
			[{xmlel, <<"item">>, _attrs, _} = _el | _els], Items) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:privacy">> ->
	  decode_privacy_list_els(__TopXMLNS, __Opts, _els,
				  [decode_privacy_item(<<"jabber:iq:privacy">>,
						       __Opts, _el)
				   | Items]);
      _ ->
	  decode_privacy_list_els(__TopXMLNS, __Opts, _els, Items)
    end;
decode_privacy_list_els(__TopXMLNS, __Opts, [_ | _els],
			Items) ->
    decode_privacy_list_els(__TopXMLNS, __Opts, _els,
			    Items).

decode_privacy_list_attrs(__TopXMLNS,
			  [{<<"name">>, _val} | _attrs], _Name) ->
    decode_privacy_list_attrs(__TopXMLNS, _attrs, _val);
decode_privacy_list_attrs(__TopXMLNS, [_ | _attrs],
			  Name) ->
    decode_privacy_list_attrs(__TopXMLNS, _attrs, Name);
decode_privacy_list_attrs(__TopXMLNS, [], Name) ->
    decode_privacy_list_attr_name(__TopXMLNS, Name).

encode_privacy_list({privacy_list, Name, Items},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:privacy">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_privacy_list_$items'(Items,
						      __NewTopXMLNS, [])),
    _attrs = encode_privacy_list_attr_name(Name,
					   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								      __TopXMLNS)),
    {xmlel, <<"list">>, _attrs, _els}.

'encode_privacy_list_$items'([], __TopXMLNS, _acc) ->
    _acc;
'encode_privacy_list_$items'([Items | _els], __TopXMLNS,
			     _acc) ->
    'encode_privacy_list_$items'(_els, __TopXMLNS,
				 [encode_privacy_item(Items, __TopXMLNS)
				  | _acc]).

decode_privacy_list_attr_name(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"name">>, <<"list">>, __TopXMLNS}});
decode_privacy_list_attr_name(__TopXMLNS, _val) -> _val.

encode_privacy_list_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_privacy_item(__TopXMLNS, __Opts,
		    {xmlel, <<"item">>, _attrs, _els}) ->
    {Iq, Presence_out, Message, Presence_in} =
	decode_privacy_item_els(__TopXMLNS, __Opts, _els, false,
				false, false, false),
    {Action, Order, Type, Value} =
	decode_privacy_item_attrs(__TopXMLNS, _attrs, undefined,
				  undefined, undefined, undefined),
    {privacy_item, Order, Action, Type, Value, Message, Iq,
     Presence_in, Presence_out}.

decode_privacy_item_els(__TopXMLNS, __Opts, [], Iq,
			Presence_out, Message, Presence_in) ->
    {Iq, Presence_out, Message, Presence_in};
decode_privacy_item_els(__TopXMLNS, __Opts,
			[{xmlel, <<"message">>, _attrs, _} = _el | _els], Iq,
			Presence_out, Message, Presence_in) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:privacy">> ->
	  decode_privacy_item_els(__TopXMLNS, __Opts, _els, Iq,
				  Presence_out,
				  decode_privacy_message(<<"jabber:iq:privacy">>,
							 __Opts, _el),
				  Presence_in);
      _ ->
	  decode_privacy_item_els(__TopXMLNS, __Opts, _els, Iq,
				  Presence_out, Message, Presence_in)
    end;
decode_privacy_item_els(__TopXMLNS, __Opts,
			[{xmlel, <<"iq">>, _attrs, _} = _el | _els], Iq,
			Presence_out, Message, Presence_in) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:privacy">> ->
	  decode_privacy_item_els(__TopXMLNS, __Opts, _els,
				  decode_privacy_iq(<<"jabber:iq:privacy">>,
						    __Opts, _el),
				  Presence_out, Message, Presence_in);
      _ ->
	  decode_privacy_item_els(__TopXMLNS, __Opts, _els, Iq,
				  Presence_out, Message, Presence_in)
    end;
decode_privacy_item_els(__TopXMLNS, __Opts,
			[{xmlel, <<"presence-in">>, _attrs, _} = _el | _els],
			Iq, Presence_out, Message, Presence_in) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:privacy">> ->
	  decode_privacy_item_els(__TopXMLNS, __Opts, _els, Iq,
				  Presence_out, Message,
				  decode_privacy_presence_in(<<"jabber:iq:privacy">>,
							     __Opts, _el));
      _ ->
	  decode_privacy_item_els(__TopXMLNS, __Opts, _els, Iq,
				  Presence_out, Message, Presence_in)
    end;
decode_privacy_item_els(__TopXMLNS, __Opts,
			[{xmlel, <<"presence-out">>, _attrs, _} = _el | _els],
			Iq, Presence_out, Message, Presence_in) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:privacy">> ->
	  decode_privacy_item_els(__TopXMLNS, __Opts, _els, Iq,
				  decode_privacy_presence_out(<<"jabber:iq:privacy">>,
							      __Opts, _el),
				  Message, Presence_in);
      _ ->
	  decode_privacy_item_els(__TopXMLNS, __Opts, _els, Iq,
				  Presence_out, Message, Presence_in)
    end;
decode_privacy_item_els(__TopXMLNS, __Opts, [_ | _els],
			Iq, Presence_out, Message, Presence_in) ->
    decode_privacy_item_els(__TopXMLNS, __Opts, _els, Iq,
			    Presence_out, Message, Presence_in).

decode_privacy_item_attrs(__TopXMLNS,
			  [{<<"action">>, _val} | _attrs], _Action, Order, Type,
			  Value) ->
    decode_privacy_item_attrs(__TopXMLNS, _attrs, _val,
			      Order, Type, Value);
decode_privacy_item_attrs(__TopXMLNS,
			  [{<<"order">>, _val} | _attrs], Action, _Order, Type,
			  Value) ->
    decode_privacy_item_attrs(__TopXMLNS, _attrs, Action,
			      _val, Type, Value);
decode_privacy_item_attrs(__TopXMLNS,
			  [{<<"type">>, _val} | _attrs], Action, Order, _Type,
			  Value) ->
    decode_privacy_item_attrs(__TopXMLNS, _attrs, Action,
			      Order, _val, Value);
decode_privacy_item_attrs(__TopXMLNS,
			  [{<<"value">>, _val} | _attrs], Action, Order, Type,
			  _Value) ->
    decode_privacy_item_attrs(__TopXMLNS, _attrs, Action,
			      Order, Type, _val);
decode_privacy_item_attrs(__TopXMLNS, [_ | _attrs],
			  Action, Order, Type, Value) ->
    decode_privacy_item_attrs(__TopXMLNS, _attrs, Action,
			      Order, Type, Value);
decode_privacy_item_attrs(__TopXMLNS, [], Action, Order,
			  Type, Value) ->
    {decode_privacy_item_attr_action(__TopXMLNS, Action),
     decode_privacy_item_attr_order(__TopXMLNS, Order),
     decode_privacy_item_attr_type(__TopXMLNS, Type),
     decode_privacy_item_attr_value(__TopXMLNS, Value)}.

encode_privacy_item({privacy_item, Order, Action, Type,
		     Value, Message, Iq, Presence_in, Presence_out},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:privacy">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_privacy_item_$iq'(Iq,
						   __NewTopXMLNS,
						   'encode_privacy_item_$presence_out'(Presence_out,
										       __NewTopXMLNS,
										       'encode_privacy_item_$message'(Message,
														      __NewTopXMLNS,
														      'encode_privacy_item_$presence_in'(Presence_in,
																			 __NewTopXMLNS,
																			 []))))),
    _attrs = encode_privacy_item_attr_value(Value,
					    encode_privacy_item_attr_type(Type,
									  encode_privacy_item_attr_order(Order,
													 encode_privacy_item_attr_action(Action,
																	 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																				    __TopXMLNS))))),
    {xmlel, <<"item">>, _attrs, _els}.

'encode_privacy_item_$iq'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_privacy_item_$iq'(Iq, __TopXMLNS, _acc) ->
    [encode_privacy_iq(Iq, __TopXMLNS) | _acc].

'encode_privacy_item_$presence_out'(false, __TopXMLNS,
				    _acc) ->
    _acc;
'encode_privacy_item_$presence_out'(Presence_out,
				    __TopXMLNS, _acc) ->
    [encode_privacy_presence_out(Presence_out, __TopXMLNS)
     | _acc].

'encode_privacy_item_$message'(false, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_privacy_item_$message'(Message, __TopXMLNS,
			       _acc) ->
    [encode_privacy_message(Message, __TopXMLNS) | _acc].

'encode_privacy_item_$presence_in'(false, __TopXMLNS,
				   _acc) ->
    _acc;
'encode_privacy_item_$presence_in'(Presence_in,
				   __TopXMLNS, _acc) ->
    [encode_privacy_presence_in(Presence_in, __TopXMLNS)
     | _acc].

decode_privacy_item_attr_action(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"action">>, <<"item">>, __TopXMLNS}});
decode_privacy_item_attr_action(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [allow, deny]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"action">>, <<"item">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_privacy_item_attr_action(_val, _acc) ->
    [{<<"action">>, enc_enum(_val)} | _acc].

decode_privacy_item_attr_order(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"order">>, <<"item">>, __TopXMLNS}});
decode_privacy_item_attr_order(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"order">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_privacy_item_attr_order(_val, _acc) ->
    [{<<"order">>, enc_int(_val)} | _acc].

decode_privacy_item_attr_type(__TopXMLNS, undefined) ->
    undefined;
decode_privacy_item_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [group, jid, subscription]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_privacy_item_attr_type(undefined, _acc) -> _acc;
encode_privacy_item_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_privacy_item_attr_value(__TopXMLNS, undefined) ->
    <<>>;
decode_privacy_item_attr_value(__TopXMLNS, _val) ->
    _val.

encode_privacy_item_attr_value(<<>>, _acc) -> _acc;
encode_privacy_item_attr_value(_val, _acc) ->
    [{<<"value">>, _val} | _acc].

decode_privacy_presence_out(__TopXMLNS, __Opts,
			    {xmlel, <<"presence-out">>, _attrs, _els}) ->
    true.

encode_privacy_presence_out(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:privacy">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"presence-out">>, _attrs, _els}.

decode_privacy_presence_in(__TopXMLNS, __Opts,
			   {xmlel, <<"presence-in">>, _attrs, _els}) ->
    true.

encode_privacy_presence_in(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:privacy">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"presence-in">>, _attrs, _els}.

decode_privacy_iq(__TopXMLNS, __Opts,
		  {xmlel, <<"iq">>, _attrs, _els}) ->
    true.

encode_privacy_iq(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:privacy">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"iq">>, _attrs, _els}.

decode_privacy_message(__TopXMLNS, __Opts,
		       {xmlel, <<"message">>, _attrs, _els}) ->
    true.

encode_privacy_message(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:privacy">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"message">>, _attrs, _els}.
