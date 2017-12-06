%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0013).

-compile(export_all).

do_decode(<<"offline">>,
	  <<"http://jabber.org/protocol/offline">>, El, Opts) ->
    decode_offline(<<"http://jabber.org/protocol/offline">>,
		   Opts, El);
do_decode(<<"item">>,
	  <<"http://jabber.org/protocol/offline">>, El, Opts) ->
    decode_offline_item(<<"http://jabber.org/protocol/offline">>,
			Opts, El);
do_decode(<<"fetch">>,
	  <<"http://jabber.org/protocol/offline">>, El, Opts) ->
    decode_offline_fetch(<<"http://jabber.org/protocol/offline">>,
			 Opts, El);
do_decode(<<"purge">>,
	  <<"http://jabber.org/protocol/offline">>, El, Opts) ->
    decode_offline_purge(<<"http://jabber.org/protocol/offline">>,
			 Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"offline">>,
      <<"http://jabber.org/protocol/offline">>},
     {<<"item">>, <<"http://jabber.org/protocol/offline">>},
     {<<"fetch">>, <<"http://jabber.org/protocol/offline">>},
     {<<"purge">>,
      <<"http://jabber.org/protocol/offline">>}].

do_encode({offline_item, _, _} = Item, TopXMLNS) ->
    encode_offline_item(Item, TopXMLNS);
do_encode({offline, _, _, _} = Offline, TopXMLNS) ->
    encode_offline(Offline, TopXMLNS).

do_get_name({offline, _, _, _}) -> <<"offline">>;
do_get_name({offline_item, _, _}) -> <<"item">>.

do_get_ns({offline, _, _, _}) ->
    <<"http://jabber.org/protocol/offline">>;
do_get_ns({offline_item, _, _}) ->
    <<"http://jabber.org/protocol/offline">>.

pp(offline_item, 2) -> [node, action];
pp(offline, 3) -> [items, purge, fetch];
pp(_, _) -> no.

records() -> [{offline_item, 2}, {offline, 3}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_offline(__TopXMLNS, __Opts,
	       {xmlel, <<"offline">>, _attrs, _els}) ->
    {Items, Purge, Fetch} = decode_offline_els(__TopXMLNS,
					       __Opts, _els, [], false, false),
    {offline, Items, Purge, Fetch}.

decode_offline_els(__TopXMLNS, __Opts, [], Items, Purge,
		   Fetch) ->
    {lists:reverse(Items), Purge, Fetch};
decode_offline_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"purge">>, _attrs, _} = _el | _els], Items,
		   Purge, Fetch) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/offline">> ->
	  decode_offline_els(__TopXMLNS, __Opts, _els, Items,
			     decode_offline_purge(<<"http://jabber.org/protocol/offline">>,
						  __Opts, _el),
			     Fetch);
      _ ->
	  decode_offline_els(__TopXMLNS, __Opts, _els, Items,
			     Purge, Fetch)
    end;
decode_offline_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"fetch">>, _attrs, _} = _el | _els], Items,
		   Purge, Fetch) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/offline">> ->
	  decode_offline_els(__TopXMLNS, __Opts, _els, Items,
			     Purge,
			     decode_offline_fetch(<<"http://jabber.org/protocol/offline">>,
						  __Opts, _el));
      _ ->
	  decode_offline_els(__TopXMLNS, __Opts, _els, Items,
			     Purge, Fetch)
    end;
decode_offline_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"item">>, _attrs, _} = _el | _els], Items,
		   Purge, Fetch) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/offline">> ->
	  decode_offline_els(__TopXMLNS, __Opts, _els,
			     [decode_offline_item(<<"http://jabber.org/protocol/offline">>,
						  __Opts, _el)
			      | Items],
			     Purge, Fetch);
      _ ->
	  decode_offline_els(__TopXMLNS, __Opts, _els, Items,
			     Purge, Fetch)
    end;
decode_offline_els(__TopXMLNS, __Opts, [_ | _els],
		   Items, Purge, Fetch) ->
    decode_offline_els(__TopXMLNS, __Opts, _els, Items,
		       Purge, Fetch).

encode_offline({offline, Items, Purge, Fetch},
	       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/offline">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_offline_$items'(Items,
						 __NewTopXMLNS,
						 'encode_offline_$purge'(Purge,
									 __NewTopXMLNS,
									 'encode_offline_$fetch'(Fetch,
												 __NewTopXMLNS,
												 [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"offline">>, _attrs, _els}.

'encode_offline_$items'([], __TopXMLNS, _acc) -> _acc;
'encode_offline_$items'([Items | _els], __TopXMLNS,
			_acc) ->
    'encode_offline_$items'(_els, __TopXMLNS,
			    [encode_offline_item(Items, __TopXMLNS) | _acc]).

'encode_offline_$purge'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_offline_$purge'(Purge, __TopXMLNS, _acc) ->
    [encode_offline_purge(Purge, __TopXMLNS) | _acc].

'encode_offline_$fetch'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_offline_$fetch'(Fetch, __TopXMLNS, _acc) ->
    [encode_offline_fetch(Fetch, __TopXMLNS) | _acc].

decode_offline_item(__TopXMLNS, __Opts,
		    {xmlel, <<"item">>, _attrs, _els}) ->
    {Node, Action} = decode_offline_item_attrs(__TopXMLNS,
					       _attrs, undefined, undefined),
    {offline_item, Node, Action}.

decode_offline_item_attrs(__TopXMLNS,
			  [{<<"node">>, _val} | _attrs], _Node, Action) ->
    decode_offline_item_attrs(__TopXMLNS, _attrs, _val,
			      Action);
decode_offline_item_attrs(__TopXMLNS,
			  [{<<"action">>, _val} | _attrs], Node, _Action) ->
    decode_offline_item_attrs(__TopXMLNS, _attrs, Node,
			      _val);
decode_offline_item_attrs(__TopXMLNS, [_ | _attrs],
			  Node, Action) ->
    decode_offline_item_attrs(__TopXMLNS, _attrs, Node,
			      Action);
decode_offline_item_attrs(__TopXMLNS, [], Node,
			  Action) ->
    {decode_offline_item_attr_node(__TopXMLNS, Node),
     decode_offline_item_attr_action(__TopXMLNS, Action)}.

encode_offline_item({offline_item, Node, Action},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/offline">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_offline_item_attr_action(Action,
					     encode_offline_item_attr_node(Node,
									   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
												      __TopXMLNS))),
    {xmlel, <<"item">>, _attrs, _els}.

decode_offline_item_attr_node(__TopXMLNS, undefined) ->
    <<>>;
decode_offline_item_attr_node(__TopXMLNS, _val) -> _val.

encode_offline_item_attr_node(<<>>, _acc) -> _acc;
encode_offline_item_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_offline_item_attr_action(__TopXMLNS,
				undefined) ->
    undefined;
decode_offline_item_attr_action(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [view, remove]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"action">>, <<"item">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_offline_item_attr_action(undefined, _acc) ->
    _acc;
encode_offline_item_attr_action(_val, _acc) ->
    [{<<"action">>, enc_enum(_val)} | _acc].

decode_offline_fetch(__TopXMLNS, __Opts,
		     {xmlel, <<"fetch">>, _attrs, _els}) ->
    true.

encode_offline_fetch(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/offline">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"fetch">>, _attrs, _els}.

decode_offline_purge(__TopXMLNS, __Opts,
		     {xmlel, <<"purge">>, _attrs, _els}) ->
    true.

encode_offline_purge(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/offline">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"purge">>, _attrs, _els}.
