%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(p1_mucsub).

-compile(export_all).

do_decode(<<"unsubscribe">>, <<"urn:xmpp:mucsub:0">>,
	  El, Opts) ->
    decode_muc_unsubscribe(<<"urn:xmpp:mucsub:0">>, Opts,
			   El);
do_decode(<<"subscribe">>, <<"urn:xmpp:mucsub:0">>, El,
	  Opts) ->
    decode_muc_subscribe(<<"urn:xmpp:mucsub:0">>, Opts, El);
do_decode(<<"event">>, <<"urn:xmpp:mucsub:0">>, El,
	  Opts) ->
    decode_muc_subscribe_event(<<"urn:xmpp:mucsub:0">>,
			       Opts, El);
do_decode(<<"subscriptions">>, <<"urn:xmpp:mucsub:0">>,
	  El, Opts) ->
    decode_muc_subscriptions(<<"urn:xmpp:mucsub:0">>, Opts,
			     El);
do_decode(<<"subscription">>, <<"urn:xmpp:mucsub:0">>,
	  El, Opts) ->
    decode_muc_subscription(<<"urn:xmpp:mucsub:0">>, Opts,
			    El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"unsubscribe">>, <<"urn:xmpp:mucsub:0">>},
     {<<"subscribe">>, <<"urn:xmpp:mucsub:0">>},
     {<<"event">>, <<"urn:xmpp:mucsub:0">>},
     {<<"subscriptions">>, <<"urn:xmpp:mucsub:0">>},
     {<<"subscription">>, <<"urn:xmpp:mucsub:0">>}].

do_encode({muc_subscriptions, _} = Subscriptions,
	  TopXMLNS) ->
    encode_muc_subscriptions(Subscriptions, TopXMLNS);
do_encode({muc_subscribe, _, _, _} = Subscribe,
	  TopXMLNS) ->
    encode_muc_subscribe(Subscribe, TopXMLNS);
do_encode({muc_unsubscribe} = Unsubscribe, TopXMLNS) ->
    encode_muc_unsubscribe(Unsubscribe, TopXMLNS).

do_get_name({muc_subscribe, _, _, _}) ->
    <<"subscribe">>;
do_get_name({muc_subscriptions, _}) ->
    <<"subscriptions">>;
do_get_name({muc_unsubscribe}) -> <<"unsubscribe">>.

do_get_ns({muc_subscribe, _, _, _}) ->
    <<"urn:xmpp:mucsub:0">>;
do_get_ns({muc_subscriptions, _}) ->
    <<"urn:xmpp:mucsub:0">>;
do_get_ns({muc_unsubscribe}) -> <<"urn:xmpp:mucsub:0">>.

pp(muc_subscriptions, 1) -> [list];
pp(muc_subscribe, 3) -> [nick, password, events];
pp(muc_unsubscribe, 0) -> [];
pp(_, _) -> no.

records() ->
    [{muc_subscriptions, 1}, {muc_subscribe, 3},
     {muc_unsubscribe, 0}].

decode_muc_unsubscribe(__TopXMLNS, __Opts,
		       {xmlel, <<"unsubscribe">>, _attrs, _els}) ->
    {muc_unsubscribe}.

encode_muc_unsubscribe({muc_unsubscribe}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mucsub:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsubscribe">>, _attrs, _els}.

decode_muc_subscribe(__TopXMLNS, __Opts,
		     {xmlel, <<"subscribe">>, _attrs, _els}) ->
    Events = decode_muc_subscribe_els(__TopXMLNS, __Opts,
				      _els, []),
    {Nick, Password} =
	decode_muc_subscribe_attrs(__TopXMLNS, _attrs,
				   undefined, undefined),
    {muc_subscribe, Nick, Password, Events}.

decode_muc_subscribe_els(__TopXMLNS, __Opts, [],
			 Events) ->
    lists:reverse(Events);
decode_muc_subscribe_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"event">>, _attrs, _} = _el | _els],
			 Events) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mucsub:0">> ->
	  decode_muc_subscribe_els(__TopXMLNS, __Opts, _els,
				   [decode_muc_subscribe_event(<<"urn:xmpp:mucsub:0">>,
							       __Opts, _el)
				    | Events]);
      _ ->
	  decode_muc_subscribe_els(__TopXMLNS, __Opts, _els,
				   Events)
    end;
decode_muc_subscribe_els(__TopXMLNS, __Opts, [_ | _els],
			 Events) ->
    decode_muc_subscribe_els(__TopXMLNS, __Opts, _els,
			     Events).

decode_muc_subscribe_attrs(__TopXMLNS,
			   [{<<"nick">>, _val} | _attrs], _Nick, Password) ->
    decode_muc_subscribe_attrs(__TopXMLNS, _attrs, _val,
			       Password);
decode_muc_subscribe_attrs(__TopXMLNS,
			   [{<<"password">>, _val} | _attrs], Nick,
			   _Password) ->
    decode_muc_subscribe_attrs(__TopXMLNS, _attrs, Nick,
			       _val);
decode_muc_subscribe_attrs(__TopXMLNS, [_ | _attrs],
			   Nick, Password) ->
    decode_muc_subscribe_attrs(__TopXMLNS, _attrs, Nick,
			       Password);
decode_muc_subscribe_attrs(__TopXMLNS, [], Nick,
			   Password) ->
    {decode_muc_subscribe_attr_nick(__TopXMLNS, Nick),
     decode_muc_subscribe_attr_password(__TopXMLNS,
					Password)}.

encode_muc_subscribe({muc_subscribe, Nick, Password,
		      Events},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mucsub:0">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_muc_subscribe_$events'(Events,
						     __NewTopXMLNS, [])),
    _attrs = encode_muc_subscribe_attr_password(Password,
						encode_muc_subscribe_attr_nick(Nick,
									       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													  __TopXMLNS))),
    {xmlel, <<"subscribe">>, _attrs, _els}.

'encode_muc_subscribe_$events'([], __TopXMLNS, _acc) ->
    _acc;
'encode_muc_subscribe_$events'([Events | _els],
			       __TopXMLNS, _acc) ->
    'encode_muc_subscribe_$events'(_els, __TopXMLNS,
				   [encode_muc_subscribe_event(Events,
							       __TopXMLNS)
				    | _acc]).

decode_muc_subscribe_attr_nick(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"nick">>, <<"subscribe">>,
		   __TopXMLNS}});
decode_muc_subscribe_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_muc_subscribe_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_muc_subscribe_attr_password(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_muc_subscribe_attr_password(__TopXMLNS, _val) ->
    _val.

encode_muc_subscribe_attr_password(<<>>, _acc) -> _acc;
encode_muc_subscribe_attr_password(_val, _acc) ->
    [{<<"password">>, _val} | _acc].

decode_muc_subscribe_event(__TopXMLNS, __Opts,
			   {xmlel, <<"event">>, _attrs, _els}) ->
    Node = decode_muc_subscribe_event_attrs(__TopXMLNS,
					    _attrs, undefined),
    Node.

decode_muc_subscribe_event_attrs(__TopXMLNS,
				 [{<<"node">>, _val} | _attrs], _Node) ->
    decode_muc_subscribe_event_attrs(__TopXMLNS, _attrs,
				     _val);
decode_muc_subscribe_event_attrs(__TopXMLNS,
				 [_ | _attrs], Node) ->
    decode_muc_subscribe_event_attrs(__TopXMLNS, _attrs,
				     Node);
decode_muc_subscribe_event_attrs(__TopXMLNS, [],
				 Node) ->
    decode_muc_subscribe_event_attr_node(__TopXMLNS, Node).

encode_muc_subscribe_event(Node, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mucsub:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_muc_subscribe_event_attr_node(Node,
						  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									     __TopXMLNS)),
    {xmlel, <<"event">>, _attrs, _els}.

decode_muc_subscribe_event_attr_node(__TopXMLNS,
				     undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"event">>, __TopXMLNS}});
decode_muc_subscribe_event_attr_node(__TopXMLNS,
				     _val) ->
    _val.

encode_muc_subscribe_event_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_muc_subscriptions(__TopXMLNS, __Opts,
			 {xmlel, <<"subscriptions">>, _attrs, _els}) ->
    List = decode_muc_subscriptions_els(__TopXMLNS, __Opts,
					_els, []),
    {muc_subscriptions, List}.

decode_muc_subscriptions_els(__TopXMLNS, __Opts, [],
			     List) ->
    lists:reverse(List);
decode_muc_subscriptions_els(__TopXMLNS, __Opts,
			     [{xmlel, <<"subscription">>, _attrs, _} = _el
			      | _els],
			     List) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mucsub:0">> ->
	  decode_muc_subscriptions_els(__TopXMLNS, __Opts, _els,
				       [decode_muc_subscription(<<"urn:xmpp:mucsub:0">>,
								__Opts, _el)
					| List]);
      _ ->
	  decode_muc_subscriptions_els(__TopXMLNS, __Opts, _els,
				       List)
    end;
decode_muc_subscriptions_els(__TopXMLNS, __Opts,
			     [_ | _els], List) ->
    decode_muc_subscriptions_els(__TopXMLNS, __Opts, _els,
				 List).

encode_muc_subscriptions({muc_subscriptions, List},
			 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mucsub:0">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_muc_subscriptions_$list'(List,
						       __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"subscriptions">>, _attrs, _els}.

'encode_muc_subscriptions_$list'([], __TopXMLNS,
				 _acc) ->
    _acc;
'encode_muc_subscriptions_$list'([List | _els],
				 __TopXMLNS, _acc) ->
    'encode_muc_subscriptions_$list'(_els, __TopXMLNS,
				     [encode_muc_subscription(List, __TopXMLNS)
				      | _acc]).

decode_muc_subscription(__TopXMLNS, __Opts,
			{xmlel, <<"subscription">>, _attrs, _els}) ->
    Jid = decode_muc_subscription_attrs(__TopXMLNS, _attrs,
					undefined),
    Jid.

decode_muc_subscription_attrs(__TopXMLNS,
			      [{<<"jid">>, _val} | _attrs], _Jid) ->
    decode_muc_subscription_attrs(__TopXMLNS, _attrs, _val);
decode_muc_subscription_attrs(__TopXMLNS, [_ | _attrs],
			      Jid) ->
    decode_muc_subscription_attrs(__TopXMLNS, _attrs, Jid);
decode_muc_subscription_attrs(__TopXMLNS, [], Jid) ->
    decode_muc_subscription_attr_jid(__TopXMLNS, Jid).

encode_muc_subscription(Jid, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mucsub:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_muc_subscription_attr_jid(Jid,
					      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									 __TopXMLNS)),
    {xmlel, <<"subscription">>, _attrs, _els}.

decode_muc_subscription_attr_jid(__TopXMLNS,
				 undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"subscription">>,
		   __TopXMLNS}});
decode_muc_subscription_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"subscription">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_subscription_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].
