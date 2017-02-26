%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0355).

-compile(export_all).

do_decode(<<"query">>, <<"urn:xmpp:delegation:1">>, El,
	  Opts) ->
    decode_delegation_query(<<"urn:xmpp:delegation:1">>,
			    Opts, El);
do_decode(<<"delegate">>, <<"urn:xmpp:delegation:1">>,
	  El, Opts) ->
    decode_delegate(<<"urn:xmpp:delegation:1">>, Opts, El);
do_decode(<<"delegation">>, <<"urn:xmpp:delegation:1">>,
	  El, Opts) ->
    decode_delegation(<<"urn:xmpp:delegation:1">>, Opts,
		      El);
do_decode(<<"delegated">>, <<"urn:xmpp:delegation:1">>,
	  El, Opts) ->
    decode_delegated(<<"urn:xmpp:delegation:1">>, Opts, El);
do_decode(<<"attribute">>, <<"urn:xmpp:delegation:1">>,
	  El, Opts) ->
    decode_delegated_attribute(<<"urn:xmpp:delegation:1">>,
			       Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"urn:xmpp:delegation:1">>},
     {<<"delegate">>, <<"urn:xmpp:delegation:1">>},
     {<<"delegation">>, <<"urn:xmpp:delegation:1">>},
     {<<"delegated">>, <<"urn:xmpp:delegation:1">>},
     {<<"attribute">>, <<"urn:xmpp:delegation:1">>}].

do_encode({delegated, _, _} = Delegated, TopXMLNS) ->
    encode_delegated(Delegated, TopXMLNS);
do_encode({delegation, _, _} = Delegation, TopXMLNS) ->
    encode_delegation(Delegation, TopXMLNS);
do_encode({delegation_query, _, _} = Query, TopXMLNS) ->
    encode_delegation_query(Query, TopXMLNS).

do_get_name({delegated, _, _}) -> <<"delegated">>;
do_get_name({delegation, _, _}) -> <<"delegation">>;
do_get_name({delegation_query, _, _}) -> <<"query">>.

do_get_ns({delegated, _, _}) ->
    <<"urn:xmpp:delegation:1">>;
do_get_ns({delegation, _, _}) ->
    <<"urn:xmpp:delegation:1">>;
do_get_ns({delegation_query, _, _}) ->
    <<"urn:xmpp:delegation:1">>.

pp(delegated, 2) -> [ns, attrs];
pp(delegation, 2) -> [delegated, forwarded];
pp(delegation_query, 2) -> [to, delegate];
pp(_, _) -> no.

records() ->
    [{delegated, 2}, {delegation, 2},
     {delegation_query, 2}].

decode_delegation_query(__TopXMLNS, __Opts,
			{xmlel, <<"query">>, _attrs, _els}) ->
    Delegate = decode_delegation_query_els(__TopXMLNS,
					   __Opts, _els, []),
    To = decode_delegation_query_attrs(__TopXMLNS, _attrs,
				       undefined),
    {delegation_query, To, Delegate}.

decode_delegation_query_els(__TopXMLNS, __Opts, [],
			    Delegate) ->
    lists:reverse(Delegate);
decode_delegation_query_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"delegate">>, _attrs, _} = _el | _els],
			    Delegate) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:delegation:1">> ->
	  decode_delegation_query_els(__TopXMLNS, __Opts, _els,
				      [decode_delegate(<<"urn:xmpp:delegation:1">>,
						       __Opts, _el)
				       | Delegate]);
      _ ->
	  decode_delegation_query_els(__TopXMLNS, __Opts, _els,
				      Delegate)
    end;
decode_delegation_query_els(__TopXMLNS, __Opts,
			    [_ | _els], Delegate) ->
    decode_delegation_query_els(__TopXMLNS, __Opts, _els,
				Delegate).

decode_delegation_query_attrs(__TopXMLNS,
			      [{<<"to">>, _val} | _attrs], _To) ->
    decode_delegation_query_attrs(__TopXMLNS, _attrs, _val);
decode_delegation_query_attrs(__TopXMLNS, [_ | _attrs],
			      To) ->
    decode_delegation_query_attrs(__TopXMLNS, _attrs, To);
decode_delegation_query_attrs(__TopXMLNS, [], To) ->
    decode_delegation_query_attr_to(__TopXMLNS, To).

encode_delegation_query({delegation_query, To,
			 Delegate},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:delegation:1">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_delegation_query_$delegate'(Delegate,
							  __NewTopXMLNS, [])),
    _attrs = encode_delegation_query_attr_to(To,
					     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									__TopXMLNS)),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_delegation_query_$delegate'([], __TopXMLNS,
				    _acc) ->
    _acc;
'encode_delegation_query_$delegate'([Delegate | _els],
				    __TopXMLNS, _acc) ->
    'encode_delegation_query_$delegate'(_els, __TopXMLNS,
					[encode_delegate(Delegate, __TopXMLNS)
					 | _acc]).

decode_delegation_query_attr_to(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"to">>, <<"query">>, __TopXMLNS}});
decode_delegation_query_attr_to(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"query">>, __TopXMLNS}});
      _res -> _res
    end.

encode_delegation_query_attr_to(_val, _acc) ->
    [{<<"to">>, jid:encode(_val)} | _acc].

decode_delegate(__TopXMLNS, __Opts,
		{xmlel, <<"delegate">>, _attrs, _els}) ->
    Namespace = decode_delegate_attrs(__TopXMLNS, _attrs,
				      undefined),
    Namespace.

decode_delegate_attrs(__TopXMLNS,
		      [{<<"namespace">>, _val} | _attrs], _Namespace) ->
    decode_delegate_attrs(__TopXMLNS, _attrs, _val);
decode_delegate_attrs(__TopXMLNS, [_ | _attrs],
		      Namespace) ->
    decode_delegate_attrs(__TopXMLNS, _attrs, Namespace);
decode_delegate_attrs(__TopXMLNS, [], Namespace) ->
    decode_delegate_attr_namespace(__TopXMLNS, Namespace).

encode_delegate(Namespace, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:delegation:1">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_delegate_attr_namespace(Namespace,
					    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								       __TopXMLNS)),
    {xmlel, <<"delegate">>, _attrs, _els}.

decode_delegate_attr_namespace(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"namespace">>, <<"delegate">>,
		   __TopXMLNS}});
decode_delegate_attr_namespace(__TopXMLNS, _val) ->
    _val.

encode_delegate_attr_namespace(_val, _acc) ->
    [{<<"namespace">>, _val} | _acc].

decode_delegation(__TopXMLNS, __Opts,
		  {xmlel, <<"delegation">>, _attrs, _els}) ->
    {Forwarded, Delegated} =
	decode_delegation_els(__TopXMLNS, __Opts, _els,
			      undefined, []),
    {delegation, Delegated, Forwarded}.

decode_delegation_els(__TopXMLNS, __Opts, [], Forwarded,
		      Delegated) ->
    {Forwarded, lists:reverse(Delegated)};
decode_delegation_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"delegated">>, _attrs, _} = _el | _els],
		      Forwarded, Delegated) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:delegation:1">> ->
	  decode_delegation_els(__TopXMLNS, __Opts, _els,
				Forwarded,
				[decode_delegated(<<"urn:xmpp:delegation:1">>,
						  __Opts, _el)
				 | Delegated]);
      _ ->
	  decode_delegation_els(__TopXMLNS, __Opts, _els,
				Forwarded, Delegated)
    end;
decode_delegation_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"forwarded">>, _attrs, _} = _el | _els],
		      Forwarded, Delegated) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:forward:0">> ->
	  decode_delegation_els(__TopXMLNS, __Opts, _els,
				xep0297:decode_forwarded(<<"urn:xmpp:forward:0">>,
							 __Opts, _el),
				Delegated);
      _ ->
	  decode_delegation_els(__TopXMLNS, __Opts, _els,
				Forwarded, Delegated)
    end;
decode_delegation_els(__TopXMLNS, __Opts, [_ | _els],
		      Forwarded, Delegated) ->
    decode_delegation_els(__TopXMLNS, __Opts, _els,
			  Forwarded, Delegated).

encode_delegation({delegation, Delegated, Forwarded},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:delegation:1">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_delegation_$forwarded'(Forwarded,
						     __NewTopXMLNS,
						     'encode_delegation_$delegated'(Delegated,
										    __NewTopXMLNS,
										    []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"delegation">>, _attrs, _els}.

'encode_delegation_$forwarded'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_delegation_$forwarded'(Forwarded, __TopXMLNS,
			       _acc) ->
    [xep0297:encode_forwarded(Forwarded, __TopXMLNS)
     | _acc].

'encode_delegation_$delegated'([], __TopXMLNS, _acc) ->
    _acc;
'encode_delegation_$delegated'([Delegated | _els],
			       __TopXMLNS, _acc) ->
    'encode_delegation_$delegated'(_els, __TopXMLNS,
				   [encode_delegated(Delegated, __TopXMLNS)
				    | _acc]).

decode_delegated(__TopXMLNS, __Opts,
		 {xmlel, <<"delegated">>, _attrs, _els}) ->
    Attrs = decode_delegated_els(__TopXMLNS, __Opts, _els,
				 []),
    Ns = decode_delegated_attrs(__TopXMLNS, _attrs,
				undefined),
    {delegated, Ns, Attrs}.

decode_delegated_els(__TopXMLNS, __Opts, [], Attrs) ->
    lists:reverse(Attrs);
decode_delegated_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"attribute">>, _attrs, _} = _el | _els],
		     Attrs) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:delegation:1">> ->
	  decode_delegated_els(__TopXMLNS, __Opts, _els,
			       [decode_delegated_attribute(<<"urn:xmpp:delegation:1">>,
							   __Opts, _el)
				| Attrs]);
      _ ->
	  decode_delegated_els(__TopXMLNS, __Opts, _els, Attrs)
    end;
decode_delegated_els(__TopXMLNS, __Opts, [_ | _els],
		     Attrs) ->
    decode_delegated_els(__TopXMLNS, __Opts, _els, Attrs).

decode_delegated_attrs(__TopXMLNS,
		       [{<<"namespace">>, _val} | _attrs], _Ns) ->
    decode_delegated_attrs(__TopXMLNS, _attrs, _val);
decode_delegated_attrs(__TopXMLNS, [_ | _attrs], Ns) ->
    decode_delegated_attrs(__TopXMLNS, _attrs, Ns);
decode_delegated_attrs(__TopXMLNS, [], Ns) ->
    decode_delegated_attr_namespace(__TopXMLNS, Ns).

encode_delegated({delegated, Ns, Attrs}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:delegation:1">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_delegated_$attrs'(Attrs,
						   __NewTopXMLNS, [])),
    _attrs = encode_delegated_attr_namespace(Ns,
					     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									__TopXMLNS)),
    {xmlel, <<"delegated">>, _attrs, _els}.

'encode_delegated_$attrs'([], __TopXMLNS, _acc) -> _acc;
'encode_delegated_$attrs'([Attrs | _els], __TopXMLNS,
			  _acc) ->
    'encode_delegated_$attrs'(_els, __TopXMLNS,
			      [encode_delegated_attribute(Attrs, __TopXMLNS)
			       | _acc]).

decode_delegated_attr_namespace(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"namespace">>, <<"delegated">>,
		   __TopXMLNS}});
decode_delegated_attr_namespace(__TopXMLNS, _val) ->
    _val.

encode_delegated_attr_namespace(_val, _acc) ->
    [{<<"namespace">>, _val} | _acc].

decode_delegated_attribute(__TopXMLNS, __Opts,
			   {xmlel, <<"attribute">>, _attrs, _els}) ->
    Name = decode_delegated_attribute_attrs(__TopXMLNS,
					    _attrs, undefined),
    Name.

decode_delegated_attribute_attrs(__TopXMLNS,
				 [{<<"name">>, _val} | _attrs], _Name) ->
    decode_delegated_attribute_attrs(__TopXMLNS, _attrs,
				     _val);
decode_delegated_attribute_attrs(__TopXMLNS,
				 [_ | _attrs], Name) ->
    decode_delegated_attribute_attrs(__TopXMLNS, _attrs,
				     Name);
decode_delegated_attribute_attrs(__TopXMLNS, [],
				 Name) ->
    decode_delegated_attribute_attr_name(__TopXMLNS, Name).

encode_delegated_attribute(Name, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:delegation:1">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_delegated_attribute_attr_name(Name,
						  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									     __TopXMLNS)),
    {xmlel, <<"attribute">>, _attrs, _els}.

decode_delegated_attribute_attr_name(__TopXMLNS,
				     undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"name">>, <<"attribute">>,
		   __TopXMLNS}});
decode_delegated_attribute_attr_name(__TopXMLNS,
				     _val) ->
    _val.

encode_delegated_attribute_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].
