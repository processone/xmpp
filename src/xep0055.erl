%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0055).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:search">>, El,
	  Opts) ->
    decode_search(<<"jabber:iq:search">>, Opts, El);
do_decode(<<"item">>, <<"jabber:iq:search">>, El,
	  Opts) ->
    decode_search_item(<<"jabber:iq:search">>, Opts, El);
do_decode(<<"email">>, <<"jabber:iq:search">>, El,
	  Opts) ->
    decode_search_email(<<"jabber:iq:search">>, Opts, El);
do_decode(<<"nick">>, <<"jabber:iq:search">>, El,
	  Opts) ->
    decode_search_nick(<<"jabber:iq:search">>, Opts, El);
do_decode(<<"last">>, <<"jabber:iq:search">>, El,
	  Opts) ->
    decode_search_last(<<"jabber:iq:search">>, Opts, El);
do_decode(<<"first">>, <<"jabber:iq:search">>, El,
	  Opts) ->
    decode_search_first(<<"jabber:iq:search">>, Opts, El);
do_decode(<<"instructions">>, <<"jabber:iq:search">>,
	  El, Opts) ->
    decode_search_instructions(<<"jabber:iq:search">>, Opts,
			       El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:iq:search">>},
     {<<"item">>, <<"jabber:iq:search">>},
     {<<"email">>, <<"jabber:iq:search">>},
     {<<"nick">>, <<"jabber:iq:search">>},
     {<<"last">>, <<"jabber:iq:search">>},
     {<<"first">>, <<"jabber:iq:search">>},
     {<<"instructions">>, <<"jabber:iq:search">>}].

do_encode({search_item, _, _, _, _, _} = Item,
	  TopXMLNS) ->
    encode_search_item(Item, TopXMLNS);
do_encode({search, _, _, _, _, _, _, _} = Query,
	  TopXMLNS) ->
    encode_search(Query, TopXMLNS).

do_get_name({search, _, _, _, _, _, _, _}) ->
    <<"query">>;
do_get_name({search_item, _, _, _, _, _}) -> <<"item">>.

do_get_ns({search, _, _, _, _, _, _, _}) ->
    <<"jabber:iq:search">>;
do_get_ns({search_item, _, _, _, _, _}) ->
    <<"jabber:iq:search">>.

pp(search_item, 5) -> [jid, first, last, nick, email];
pp(search, 7) ->
    [instructions, first, last, nick, email, items, xdata];
pp(_, _) -> no.

records() -> [{search_item, 5}, {search, 7}].

decode_search(__TopXMLNS, __Opts,
	      {xmlel, <<"query">>, _attrs, _els}) ->
    {Xdata, Items, Instructions, Last, First, Nick, Email} =
	decode_search_els(__TopXMLNS, __Opts, _els, undefined,
			  [], undefined, undefined, undefined, undefined,
			  undefined),
    {search, Instructions, First, Last, Nick, Email, Items,
     Xdata}.

decode_search_els(__TopXMLNS, __Opts, [], Xdata, Items,
		  Instructions, Last, First, Nick, Email) ->
    {Xdata, lists:reverse(Items), Instructions, Last, First,
     Nick, Email};
decode_search_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"instructions">>, _attrs, _} = _el | _els],
		  Xdata, Items, Instructions, Last, First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items,
			    decode_search_instructions(<<"jabber:iq:search">>,
						       __Opts, _el),
			    Last, First, Nick, Email);
      _ ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last, First, Nick, Email)
    end;
decode_search_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"first">>, _attrs, _} = _el | _els], Xdata,
		  Items, Instructions, Last, First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last,
			    decode_search_first(<<"jabber:iq:search">>, __Opts,
						_el),
			    Nick, Email);
      _ ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last, First, Nick, Email)
    end;
decode_search_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"last">>, _attrs, _} = _el | _els], Xdata,
		  Items, Instructions, Last, First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions,
			    decode_search_last(<<"jabber:iq:search">>, __Opts,
					       _el),
			    First, Nick, Email);
      _ ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last, First, Nick, Email)
    end;
decode_search_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"nick">>, _attrs, _} = _el | _els], Xdata,
		  Items, Instructions, Last, First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last, First,
			    decode_search_nick(<<"jabber:iq:search">>, __Opts,
					       _el),
			    Email);
      _ ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last, First, Nick, Email)
    end;
decode_search_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"email">>, _attrs, _} = _el | _els], Xdata,
		  Items, Instructions, Last, First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last, First, Nick,
			    decode_search_email(<<"jabber:iq:search">>, __Opts,
						_el));
      _ ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last, First, Nick, Email)
    end;
decode_search_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"item">>, _attrs, _} = _el | _els], Xdata,
		  Items, Instructions, Last, First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    [decode_search_item(<<"jabber:iq:search">>, __Opts,
						_el)
			     | Items],
			    Instructions, Last, First, Nick, Email);
      _ ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last, First, Nick, Email)
    end;
decode_search_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"x">>, _attrs, _} = _el | _els], Xdata,
		  Items, Instructions, Last, First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_search_els(__TopXMLNS, __Opts, _els,
			    xep0004:decode_xdata(<<"jabber:x:data">>, __Opts,
						 _el),
			    Items, Instructions, Last, First, Nick, Email);
      _ ->
	  decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
			    Items, Instructions, Last, First, Nick, Email)
    end;
decode_search_els(__TopXMLNS, __Opts, [_ | _els], Xdata,
		  Items, Instructions, Last, First, Nick, Email) ->
    decode_search_els(__TopXMLNS, __Opts, _els, Xdata,
		      Items, Instructions, Last, First, Nick, Email).

encode_search({search, Instructions, First, Last, Nick,
	       Email, Items, Xdata},
	      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:search">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_search_$xdata'(Xdata,
						__NewTopXMLNS,
						'encode_search_$items'(Items,
								       __NewTopXMLNS,
								       'encode_search_$instructions'(Instructions,
												     __NewTopXMLNS,
												     'encode_search_$last'(Last,
															   __NewTopXMLNS,
															   'encode_search_$first'(First,
																		  __NewTopXMLNS,
																		  'encode_search_$nick'(Nick,
																					__NewTopXMLNS,
																					'encode_search_$email'(Email,
																							       __NewTopXMLNS,
																							       [])))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_search_$xdata'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_search_$xdata'(Xdata, __TopXMLNS, _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

'encode_search_$items'([], __TopXMLNS, _acc) -> _acc;
'encode_search_$items'([Items | _els], __TopXMLNS,
		       _acc) ->
    'encode_search_$items'(_els, __TopXMLNS,
			   [encode_search_item(Items, __TopXMLNS) | _acc]).

'encode_search_$instructions'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_search_$instructions'(Instructions, __TopXMLNS,
			      _acc) ->
    [encode_search_instructions(Instructions, __TopXMLNS)
     | _acc].

'encode_search_$last'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_search_$last'(Last, __TopXMLNS, _acc) ->
    [encode_search_last(Last, __TopXMLNS) | _acc].

'encode_search_$first'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_search_$first'(First, __TopXMLNS, _acc) ->
    [encode_search_first(First, __TopXMLNS) | _acc].

'encode_search_$nick'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_search_$nick'(Nick, __TopXMLNS, _acc) ->
    [encode_search_nick(Nick, __TopXMLNS) | _acc].

'encode_search_$email'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_search_$email'(Email, __TopXMLNS, _acc) ->
    [encode_search_email(Email, __TopXMLNS) | _acc].

decode_search_item(__TopXMLNS, __Opts,
		   {xmlel, <<"item">>, _attrs, _els}) ->
    {Last, First, Nick, Email} =
	decode_search_item_els(__TopXMLNS, __Opts, _els,
			       undefined, undefined, undefined, undefined),
    Jid = decode_search_item_attrs(__TopXMLNS, _attrs,
				   undefined),
    {search_item, Jid, First, Last, Nick, Email}.

decode_search_item_els(__TopXMLNS, __Opts, [], Last,
		       First, Nick, Email) ->
    {Last, First, Nick, Email};
decode_search_item_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"first">>, _attrs, _} = _el | _els], Last,
		       First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_item_els(__TopXMLNS, __Opts, _els, Last,
				 decode_search_first(<<"jabber:iq:search">>,
						     __Opts, _el),
				 Nick, Email);
      _ ->
	  decode_search_item_els(__TopXMLNS, __Opts, _els, Last,
				 First, Nick, Email)
    end;
decode_search_item_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"last">>, _attrs, _} = _el | _els], Last,
		       First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_item_els(__TopXMLNS, __Opts, _els,
				 decode_search_last(<<"jabber:iq:search">>,
						    __Opts, _el),
				 First, Nick, Email);
      _ ->
	  decode_search_item_els(__TopXMLNS, __Opts, _els, Last,
				 First, Nick, Email)
    end;
decode_search_item_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"nick">>, _attrs, _} = _el | _els], Last,
		       First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_item_els(__TopXMLNS, __Opts, _els, Last,
				 First,
				 decode_search_nick(<<"jabber:iq:search">>,
						    __Opts, _el),
				 Email);
      _ ->
	  decode_search_item_els(__TopXMLNS, __Opts, _els, Last,
				 First, Nick, Email)
    end;
decode_search_item_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"email">>, _attrs, _} = _el | _els], Last,
		       First, Nick, Email) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:search">> ->
	  decode_search_item_els(__TopXMLNS, __Opts, _els, Last,
				 First, Nick,
				 decode_search_email(<<"jabber:iq:search">>,
						     __Opts, _el));
      _ ->
	  decode_search_item_els(__TopXMLNS, __Opts, _els, Last,
				 First, Nick, Email)
    end;
decode_search_item_els(__TopXMLNS, __Opts, [_ | _els],
		       Last, First, Nick, Email) ->
    decode_search_item_els(__TopXMLNS, __Opts, _els, Last,
			   First, Nick, Email).

decode_search_item_attrs(__TopXMLNS,
			 [{<<"jid">>, _val} | _attrs], _Jid) ->
    decode_search_item_attrs(__TopXMLNS, _attrs, _val);
decode_search_item_attrs(__TopXMLNS, [_ | _attrs],
			 Jid) ->
    decode_search_item_attrs(__TopXMLNS, _attrs, Jid);
decode_search_item_attrs(__TopXMLNS, [], Jid) ->
    decode_search_item_attr_jid(__TopXMLNS, Jid).

encode_search_item({search_item, Jid, First, Last, Nick,
		    Email},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:search">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_search_item_$last'(Last,
						    __NewTopXMLNS,
						    'encode_search_item_$first'(First,
										__NewTopXMLNS,
										'encode_search_item_$nick'(Nick,
													   __NewTopXMLNS,
													   'encode_search_item_$email'(Email,
																       __NewTopXMLNS,
																       []))))),
    _attrs = encode_search_item_attr_jid(Jid,
					 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								    __TopXMLNS)),
    {xmlel, <<"item">>, _attrs, _els}.

'encode_search_item_$last'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_search_item_$last'(Last, __TopXMLNS, _acc) ->
    [encode_search_last(Last, __TopXMLNS) | _acc].

'encode_search_item_$first'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_search_item_$first'(First, __TopXMLNS, _acc) ->
    [encode_search_first(First, __TopXMLNS) | _acc].

'encode_search_item_$nick'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_search_item_$nick'(Nick, __TopXMLNS, _acc) ->
    [encode_search_nick(Nick, __TopXMLNS) | _acc].

'encode_search_item_$email'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_search_item_$email'(Email, __TopXMLNS, _acc) ->
    [encode_search_email(Email, __TopXMLNS) | _acc].

decode_search_item_attr_jid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"item">>, __TopXMLNS}});
decode_search_item_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_search_item_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_search_email(__TopXMLNS, __Opts,
		    {xmlel, <<"email">>, _attrs, _els}) ->
    Cdata = decode_search_email_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_search_email_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_search_email_cdata(__TopXMLNS, Cdata);
decode_search_email_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_search_email_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_search_email_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_search_email_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_search_email(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:search">>, [],
				    __TopXMLNS),
    _els = encode_search_email_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"email">>, _attrs, _els}.

decode_search_email_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_search_email_cdata(__TopXMLNS, _val) -> _val.

encode_search_email_cdata(<<>>, _acc) -> _acc;
encode_search_email_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_search_nick(__TopXMLNS, __Opts,
		   {xmlel, <<"nick">>, _attrs, _els}) ->
    Cdata = decode_search_nick_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Cdata.

decode_search_nick_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_search_nick_cdata(__TopXMLNS, Cdata);
decode_search_nick_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_search_nick_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_search_nick_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_search_nick_els(__TopXMLNS, __Opts, _els, Cdata).

encode_search_nick(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:search">>, [],
				    __TopXMLNS),
    _els = encode_search_nick_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"nick">>, _attrs, _els}.

decode_search_nick_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_search_nick_cdata(__TopXMLNS, _val) -> _val.

encode_search_nick_cdata(<<>>, _acc) -> _acc;
encode_search_nick_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_search_last(__TopXMLNS, __Opts,
		   {xmlel, <<"last">>, _attrs, _els}) ->
    Cdata = decode_search_last_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Cdata.

decode_search_last_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_search_last_cdata(__TopXMLNS, Cdata);
decode_search_last_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_search_last_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_search_last_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_search_last_els(__TopXMLNS, __Opts, _els, Cdata).

encode_search_last(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:search">>, [],
				    __TopXMLNS),
    _els = encode_search_last_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"last">>, _attrs, _els}.

decode_search_last_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_search_last_cdata(__TopXMLNS, _val) -> _val.

encode_search_last_cdata(<<>>, _acc) -> _acc;
encode_search_last_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_search_first(__TopXMLNS, __Opts,
		    {xmlel, <<"first">>, _attrs, _els}) ->
    Cdata = decode_search_first_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_search_first_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_search_first_cdata(__TopXMLNS, Cdata);
decode_search_first_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_search_first_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_search_first_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_search_first_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_search_first(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:search">>, [],
				    __TopXMLNS),
    _els = encode_search_first_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"first">>, _attrs, _els}.

decode_search_first_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_search_first_cdata(__TopXMLNS, _val) -> _val.

encode_search_first_cdata(<<>>, _acc) -> _acc;
encode_search_first_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_search_instructions(__TopXMLNS, __Opts,
			   {xmlel, <<"instructions">>, _attrs, _els}) ->
    Cdata = decode_search_instructions_els(__TopXMLNS,
					   __Opts, _els, <<>>),
    Cdata.

decode_search_instructions_els(__TopXMLNS, __Opts, [],
			       Cdata) ->
    decode_search_instructions_cdata(__TopXMLNS, Cdata);
decode_search_instructions_els(__TopXMLNS, __Opts,
			       [{xmlcdata, _data} | _els], Cdata) ->
    decode_search_instructions_els(__TopXMLNS, __Opts, _els,
				   <<Cdata/binary, _data/binary>>);
decode_search_instructions_els(__TopXMLNS, __Opts,
			       [_ | _els], Cdata) ->
    decode_search_instructions_els(__TopXMLNS, __Opts, _els,
				   Cdata).

encode_search_instructions(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:search">>, [],
				    __TopXMLNS),
    _els = encode_search_instructions_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"instructions">>, _attrs, _els}.

decode_search_instructions_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_search_instructions_cdata(__TopXMLNS, _val) ->
    _val.

encode_search_instructions_cdata(<<>>, _acc) -> _acc;
encode_search_instructions_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
