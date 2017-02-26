%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0191).

-compile(export_all).

do_decode(<<"blocklist">>, <<"urn:xmpp:blocking">>, El,
	  Opts) ->
    decode_block_list(<<"urn:xmpp:blocking">>, Opts, El);
do_decode(<<"unblock">>, <<"urn:xmpp:blocking">>, El,
	  Opts) ->
    decode_unblock(<<"urn:xmpp:blocking">>, Opts, El);
do_decode(<<"block">>, <<"urn:xmpp:blocking">>, El,
	  Opts) ->
    decode_block(<<"urn:xmpp:blocking">>, Opts, El);
do_decode(<<"item">>, <<"urn:xmpp:blocking">>, El,
	  Opts) ->
    decode_block_item(<<"urn:xmpp:blocking">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"blocklist">>, <<"urn:xmpp:blocking">>},
     {<<"unblock">>, <<"urn:xmpp:blocking">>},
     {<<"block">>, <<"urn:xmpp:blocking">>},
     {<<"item">>, <<"urn:xmpp:blocking">>}].

do_encode({block, _} = Block, TopXMLNS) ->
    encode_block(Block, TopXMLNS);
do_encode({unblock, _} = Unblock, TopXMLNS) ->
    encode_unblock(Unblock, TopXMLNS);
do_encode({block_list, _} = Blocklist, TopXMLNS) ->
    encode_block_list(Blocklist, TopXMLNS).

do_get_name({block, _}) -> <<"block">>;
do_get_name({block_list, _}) -> <<"blocklist">>;
do_get_name({unblock, _}) -> <<"unblock">>.

do_get_ns({block, _}) -> <<"urn:xmpp:blocking">>;
do_get_ns({block_list, _}) -> <<"urn:xmpp:blocking">>;
do_get_ns({unblock, _}) -> <<"urn:xmpp:blocking">>.

pp(block, 1) -> [items];
pp(unblock, 1) -> [items];
pp(block_list, 1) -> [items];
pp(_, _) -> no.

records() ->
    [{block, 1}, {unblock, 1}, {block_list, 1}].

decode_block_list(__TopXMLNS, __Opts,
		  {xmlel, <<"blocklist">>, _attrs, _els}) ->
    Items = decode_block_list_els(__TopXMLNS, __Opts, _els,
				  []),
    {block_list, Items}.

decode_block_list_els(__TopXMLNS, __Opts, [], Items) ->
    lists:reverse(Items);
decode_block_list_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"item">>, _attrs, _} = _el | _els], Items) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:blocking">> ->
	  decode_block_list_els(__TopXMLNS, __Opts, _els,
				[decode_block_item(<<"urn:xmpp:blocking">>,
						   __Opts, _el)
				 | Items]);
      _ ->
	  decode_block_list_els(__TopXMLNS, __Opts, _els, Items)
    end;
decode_block_list_els(__TopXMLNS, __Opts, [_ | _els],
		      Items) ->
    decode_block_list_els(__TopXMLNS, __Opts, _els, Items).

encode_block_list({block_list, Items}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:blocking">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_block_list_$items'(Items,
						    __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"blocklist">>, _attrs, _els}.

'encode_block_list_$items'([], __TopXMLNS, _acc) ->
    _acc;
'encode_block_list_$items'([Items | _els], __TopXMLNS,
			   _acc) ->
    'encode_block_list_$items'(_els, __TopXMLNS,
			       [encode_block_item(Items, __TopXMLNS) | _acc]).

decode_unblock(__TopXMLNS, __Opts,
	       {xmlel, <<"unblock">>, _attrs, _els}) ->
    Items = decode_unblock_els(__TopXMLNS, __Opts, _els,
			       []),
    {unblock, Items}.

decode_unblock_els(__TopXMLNS, __Opts, [], Items) ->
    lists:reverse(Items);
decode_unblock_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"item">>, _attrs, _} = _el | _els], Items) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:blocking">> ->
	  decode_unblock_els(__TopXMLNS, __Opts, _els,
			     [decode_block_item(<<"urn:xmpp:blocking">>, __Opts,
						_el)
			      | Items]);
      _ -> decode_unblock_els(__TopXMLNS, __Opts, _els, Items)
    end;
decode_unblock_els(__TopXMLNS, __Opts, [_ | _els],
		   Items) ->
    decode_unblock_els(__TopXMLNS, __Opts, _els, Items).

encode_unblock({unblock, Items}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:blocking">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_unblock_$items'(Items,
						 __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unblock">>, _attrs, _els}.

'encode_unblock_$items'([], __TopXMLNS, _acc) -> _acc;
'encode_unblock_$items'([Items | _els], __TopXMLNS,
			_acc) ->
    'encode_unblock_$items'(_els, __TopXMLNS,
			    [encode_block_item(Items, __TopXMLNS) | _acc]).

decode_block(__TopXMLNS, __Opts,
	     {xmlel, <<"block">>, _attrs, _els}) ->
    Items = decode_block_els(__TopXMLNS, __Opts, _els, []),
    {block, Items}.

decode_block_els(__TopXMLNS, __Opts, [], Items) ->
    lists:reverse(Items);
decode_block_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"item">>, _attrs, _} = _el | _els], Items) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:blocking">> ->
	  decode_block_els(__TopXMLNS, __Opts, _els,
			   [decode_block_item(<<"urn:xmpp:blocking">>, __Opts,
					      _el)
			    | Items]);
      _ -> decode_block_els(__TopXMLNS, __Opts, _els, Items)
    end;
decode_block_els(__TopXMLNS, __Opts, [_ | _els],
		 Items) ->
    decode_block_els(__TopXMLNS, __Opts, _els, Items).

encode_block({block, Items}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:blocking">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_block_$items'(Items,
					       __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"block">>, _attrs, _els}.

'encode_block_$items'([], __TopXMLNS, _acc) -> _acc;
'encode_block_$items'([Items | _els], __TopXMLNS,
		      _acc) ->
    'encode_block_$items'(_els, __TopXMLNS,
			  [encode_block_item(Items, __TopXMLNS) | _acc]).

decode_block_item(__TopXMLNS, __Opts,
		  {xmlel, <<"item">>, _attrs, _els}) ->
    Jid = decode_block_item_attrs(__TopXMLNS, _attrs,
				  undefined),
    Jid.

decode_block_item_attrs(__TopXMLNS,
			[{<<"jid">>, _val} | _attrs], _Jid) ->
    decode_block_item_attrs(__TopXMLNS, _attrs, _val);
decode_block_item_attrs(__TopXMLNS, [_ | _attrs],
			Jid) ->
    decode_block_item_attrs(__TopXMLNS, _attrs, Jid);
decode_block_item_attrs(__TopXMLNS, [], Jid) ->
    decode_block_item_attr_jid(__TopXMLNS, Jid).

encode_block_item(Jid, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:blocking">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_block_item_attr_jid(Jid,
					xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								   __TopXMLNS)),
    {xmlel, <<"item">>, _attrs, _els}.

decode_block_item_attr_jid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"item">>, __TopXMLNS}});
decode_block_item_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_block_item_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].
