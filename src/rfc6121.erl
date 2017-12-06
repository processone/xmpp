%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(rfc6121).

-compile(export_all).

do_decode(<<"ver">>, <<"urn:xmpp:features:rosterver">>,
	  El, Opts) ->
    decode_rosterver_feature(<<"urn:xmpp:features:rosterver">>,
			     Opts, El);
do_decode(<<"query">>, <<"jabber:iq:roster">>, El,
	  Opts) ->
    decode_roster_query(<<"jabber:iq:roster">>, Opts, El);
do_decode(<<"item">>, <<"jabber:iq:roster">>, El,
	  Opts) ->
    decode_roster_item(<<"jabber:iq:roster">>, Opts, El);
do_decode(<<"group">>, <<"jabber:iq:roster">>, El,
	  Opts) ->
    decode_roster_group(<<"jabber:iq:roster">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"ver">>, <<"urn:xmpp:features:rosterver">>},
     {<<"query">>, <<"jabber:iq:roster">>},
     {<<"item">>, <<"jabber:iq:roster">>},
     {<<"group">>, <<"jabber:iq:roster">>}].

do_encode({roster_item, _, _, _, _, _} = Item,
	  TopXMLNS) ->
    encode_roster_item(Item, TopXMLNS);
do_encode({roster_query, _, _} = Query, TopXMLNS) ->
    encode_roster_query(Query, TopXMLNS);
do_encode({rosterver_feature} = Ver, TopXMLNS) ->
    encode_rosterver_feature(Ver, TopXMLNS).

do_get_name({roster_item, _, _, _, _, _}) -> <<"item">>;
do_get_name({roster_query, _, _}) -> <<"query">>;
do_get_name({rosterver_feature}) -> <<"ver">>.

do_get_ns({roster_item, _, _, _, _, _}) ->
    <<"jabber:iq:roster">>;
do_get_ns({roster_query, _, _}) ->
    <<"jabber:iq:roster">>;
do_get_ns({rosterver_feature}) ->
    <<"urn:xmpp:features:rosterver">>.

pp(roster_item, 5) ->
    [jid, name, groups, subscription, ask];
pp(roster_query, 2) -> [items, ver];
pp(rosterver_feature, 0) -> [];
pp(_, _) -> no.

records() ->
    [{roster_item, 5}, {roster_query, 2},
     {rosterver_feature, 0}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_rosterver_feature(__TopXMLNS, __Opts,
			 {xmlel, <<"ver">>, _attrs, _els}) ->
    {rosterver_feature}.

encode_rosterver_feature({rosterver_feature},
			 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:features:rosterver">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ver">>, _attrs, _els}.

decode_roster_query(__TopXMLNS, __Opts,
		    {xmlel, <<"query">>, _attrs, _els}) ->
    Items = decode_roster_query_els(__TopXMLNS, __Opts,
				    _els, []),
    Ver = decode_roster_query_attrs(__TopXMLNS, _attrs,
				    undefined),
    {roster_query, Items, Ver}.

decode_roster_query_els(__TopXMLNS, __Opts, [],
			Items) ->
    lists:reverse(Items);
decode_roster_query_els(__TopXMLNS, __Opts,
			[{xmlel, <<"item">>, _attrs, _} = _el | _els], Items) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:roster">> ->
	  decode_roster_query_els(__TopXMLNS, __Opts, _els,
				  [decode_roster_item(<<"jabber:iq:roster">>,
						      __Opts, _el)
				   | Items]);
      _ ->
	  decode_roster_query_els(__TopXMLNS, __Opts, _els, Items)
    end;
decode_roster_query_els(__TopXMLNS, __Opts, [_ | _els],
			Items) ->
    decode_roster_query_els(__TopXMLNS, __Opts, _els,
			    Items).

decode_roster_query_attrs(__TopXMLNS,
			  [{<<"ver">>, _val} | _attrs], _Ver) ->
    decode_roster_query_attrs(__TopXMLNS, _attrs, _val);
decode_roster_query_attrs(__TopXMLNS, [_ | _attrs],
			  Ver) ->
    decode_roster_query_attrs(__TopXMLNS, _attrs, Ver);
decode_roster_query_attrs(__TopXMLNS, [], Ver) ->
    decode_roster_query_attr_ver(__TopXMLNS, Ver).

encode_roster_query({roster_query, Items, Ver},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:roster">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_roster_query_$items'(Items,
						      __NewTopXMLNS, [])),
    _attrs = encode_roster_query_attr_ver(Ver,
					  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								     __TopXMLNS)),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_roster_query_$items'([], __TopXMLNS, _acc) ->
    _acc;
'encode_roster_query_$items'([Items | _els], __TopXMLNS,
			     _acc) ->
    'encode_roster_query_$items'(_els, __TopXMLNS,
				 [encode_roster_item(Items, __TopXMLNS)
				  | _acc]).

decode_roster_query_attr_ver(__TopXMLNS, undefined) ->
    undefined;
decode_roster_query_attr_ver(__TopXMLNS, _val) -> _val.

encode_roster_query_attr_ver(undefined, _acc) -> _acc;
encode_roster_query_attr_ver(_val, _acc) ->
    [{<<"ver">>, _val} | _acc].

decode_roster_item(__TopXMLNS, __Opts,
		   {xmlel, <<"item">>, _attrs, _els}) ->
    Groups = decode_roster_item_els(__TopXMLNS, __Opts,
				    _els, []),
    {Jid, Name, Subscription, Ask} =
	decode_roster_item_attrs(__TopXMLNS, _attrs, undefined,
				 undefined, undefined, undefined),
    {roster_item, Jid, Name, Groups, Subscription, Ask}.

decode_roster_item_els(__TopXMLNS, __Opts, [],
		       Groups) ->
    lists:reverse(Groups);
decode_roster_item_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"group">>, _attrs, _} = _el | _els],
		       Groups) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:roster">> ->
	  decode_roster_item_els(__TopXMLNS, __Opts, _els,
				 [decode_roster_group(<<"jabber:iq:roster">>,
						      __Opts, _el)
				  | Groups]);
      _ ->
	  decode_roster_item_els(__TopXMLNS, __Opts, _els, Groups)
    end;
decode_roster_item_els(__TopXMLNS, __Opts, [_ | _els],
		       Groups) ->
    decode_roster_item_els(__TopXMLNS, __Opts, _els,
			   Groups).

decode_roster_item_attrs(__TopXMLNS,
			 [{<<"jid">>, _val} | _attrs], _Jid, Name, Subscription,
			 Ask) ->
    decode_roster_item_attrs(__TopXMLNS, _attrs, _val, Name,
			     Subscription, Ask);
decode_roster_item_attrs(__TopXMLNS,
			 [{<<"name">>, _val} | _attrs], Jid, _Name,
			 Subscription, Ask) ->
    decode_roster_item_attrs(__TopXMLNS, _attrs, Jid, _val,
			     Subscription, Ask);
decode_roster_item_attrs(__TopXMLNS,
			 [{<<"subscription">>, _val} | _attrs], Jid, Name,
			 _Subscription, Ask) ->
    decode_roster_item_attrs(__TopXMLNS, _attrs, Jid, Name,
			     _val, Ask);
decode_roster_item_attrs(__TopXMLNS,
			 [{<<"ask">>, _val} | _attrs], Jid, Name, Subscription,
			 _Ask) ->
    decode_roster_item_attrs(__TopXMLNS, _attrs, Jid, Name,
			     Subscription, _val);
decode_roster_item_attrs(__TopXMLNS, [_ | _attrs], Jid,
			 Name, Subscription, Ask) ->
    decode_roster_item_attrs(__TopXMLNS, _attrs, Jid, Name,
			     Subscription, Ask);
decode_roster_item_attrs(__TopXMLNS, [], Jid, Name,
			 Subscription, Ask) ->
    {decode_roster_item_attr_jid(__TopXMLNS, Jid),
     decode_roster_item_attr_name(__TopXMLNS, Name),
     decode_roster_item_attr_subscription(__TopXMLNS,
					  Subscription),
     decode_roster_item_attr_ask(__TopXMLNS, Ask)}.

encode_roster_item({roster_item, Jid, Name, Groups,
		    Subscription, Ask},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:roster">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_roster_item_$groups'(Groups,
						   __NewTopXMLNS, [])),
    _attrs = encode_roster_item_attr_ask(Ask,
					 encode_roster_item_attr_subscription(Subscription,
									      encode_roster_item_attr_name(Name,
													   encode_roster_item_attr_jid(Jid,
																       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																				  __TopXMLNS))))),
    {xmlel, <<"item">>, _attrs, _els}.

'encode_roster_item_$groups'([], __TopXMLNS, _acc) ->
    _acc;
'encode_roster_item_$groups'([Groups | _els],
			     __TopXMLNS, _acc) ->
    'encode_roster_item_$groups'(_els, __TopXMLNS,
				 [encode_roster_group(Groups, __TopXMLNS)
				  | _acc]).

decode_roster_item_attr_jid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"item">>, __TopXMLNS}});
decode_roster_item_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_roster_item_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_roster_item_attr_name(__TopXMLNS, undefined) ->
    <<>>;
decode_roster_item_attr_name(__TopXMLNS, _val) -> _val.

encode_roster_item_attr_name(<<>>, _acc) -> _acc;
encode_roster_item_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_roster_item_attr_subscription(__TopXMLNS,
				     undefined) ->
    none;
decode_roster_item_attr_subscription(__TopXMLNS,
				     _val) ->
    case catch dec_enum(_val,
			[none, to, from, both, remove])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"subscription">>, <<"item">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_roster_item_attr_subscription(none, _acc) ->
    _acc;
encode_roster_item_attr_subscription(_val, _acc) ->
    [{<<"subscription">>, enc_enum(_val)} | _acc].

decode_roster_item_attr_ask(__TopXMLNS, undefined) ->
    undefined;
decode_roster_item_attr_ask(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [subscribe]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"ask">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_roster_item_attr_ask(undefined, _acc) -> _acc;
encode_roster_item_attr_ask(_val, _acc) ->
    [{<<"ask">>, enc_enum(_val)} | _acc].

decode_roster_group(__TopXMLNS, __Opts,
		    {xmlel, <<"group">>, _attrs, _els}) ->
    Cdata = decode_roster_group_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_roster_group_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_roster_group_cdata(__TopXMLNS, Cdata);
decode_roster_group_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_roster_group_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_roster_group_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_roster_group_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_roster_group(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:roster">>, [],
				    __TopXMLNS),
    _els = encode_roster_group_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"group">>, _attrs, _els}.

decode_roster_group_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"group">>, __TopXMLNS}});
decode_roster_group_cdata(__TopXMLNS, _val) -> _val.

encode_roster_group_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
