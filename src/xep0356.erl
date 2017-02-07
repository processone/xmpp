%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0356).

-compile(export_all).

do_decode(<<"privilege">>, <<"urn:xmpp:privilege:1">>,
	  El, Opts) ->
    decode_privilege(<<"urn:xmpp:privilege:1">>, Opts, El);
do_decode(<<"perm">>, <<"urn:xmpp:privilege:1">>, El,
	  Opts) ->
    decode_privilege_perm(<<"urn:xmpp:privilege:1">>, Opts,
			  El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"privilege">>, <<"urn:xmpp:privilege:1">>},
     {<<"perm">>, <<"urn:xmpp:privilege:1">>}].

do_encode({privilege_perm, _, _} = Perm, TopXMLNS) ->
    encode_privilege_perm(Perm, TopXMLNS);
do_encode({privilege, _, _} = Privilege, TopXMLNS) ->
    encode_privilege(Privilege, TopXMLNS).

do_get_name({privilege, _, _}) -> <<"privilege">>;
do_get_name({privilege_perm, _, _}) -> <<"perm">>.

do_get_ns({privilege, _, _}) ->
    <<"urn:xmpp:privilege:1">>;
do_get_ns({privilege_perm, _, _}) ->
    <<"urn:xmpp:privilege:1">>.

pp(privilege_perm, 2) -> [access, type];
pp(privilege, 2) -> [perms, forwarded];
pp(_, _) -> no.

records() -> [{privilege_perm, 2}, {privilege, 2}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_privilege(__TopXMLNS, __Opts,
		 {xmlel, <<"privilege">>, _attrs, _els}) ->
    {Perms, Forwarded} = decode_privilege_els(__TopXMLNS,
					      __Opts, _els, [], undefined),
    {privilege, Perms, Forwarded}.

decode_privilege_els(__TopXMLNS, __Opts, [], Perms,
		     Forwarded) ->
    {lists:reverse(Perms), Forwarded};
decode_privilege_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"perm">>, _attrs, _} = _el | _els], Perms,
		     Forwarded) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:privilege:1">> ->
	  decode_privilege_els(__TopXMLNS, __Opts, _els,
			       [decode_privilege_perm(<<"urn:xmpp:privilege:1">>,
						      __Opts, _el)
				| Perms],
			       Forwarded);
      _ ->
	  decode_privilege_els(__TopXMLNS, __Opts, _els, Perms,
			       Forwarded)
    end;
decode_privilege_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"forwarded">>, _attrs, _} = _el | _els],
		     Perms, Forwarded) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:forward:0">> ->
	  decode_privilege_els(__TopXMLNS, __Opts, _els, Perms,
			       xep0297:decode_forwarded(<<"urn:xmpp:forward:0">>,
							__Opts, _el));
      _ ->
	  decode_privilege_els(__TopXMLNS, __Opts, _els, Perms,
			       Forwarded)
    end;
decode_privilege_els(__TopXMLNS, __Opts, [_ | _els],
		     Perms, Forwarded) ->
    decode_privilege_els(__TopXMLNS, __Opts, _els, Perms,
			 Forwarded).

encode_privilege({privilege, Perms, Forwarded},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:privilege:1">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_privilege_$perms'(Perms,
						   __NewTopXMLNS,
						   'encode_privilege_$forwarded'(Forwarded,
										 __NewTopXMLNS,
										 []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"privilege">>, _attrs, _els}.

'encode_privilege_$perms'([], __TopXMLNS, _acc) -> _acc;
'encode_privilege_$perms'([Perms | _els], __TopXMLNS,
			  _acc) ->
    'encode_privilege_$perms'(_els, __TopXMLNS,
			      [encode_privilege_perm(Perms, __TopXMLNS)
			       | _acc]).

'encode_privilege_$forwarded'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_privilege_$forwarded'(Forwarded, __TopXMLNS,
			      _acc) ->
    [xep0297:encode_forwarded(Forwarded, __TopXMLNS)
     | _acc].

decode_privilege_perm(__TopXMLNS, __Opts,
		      {xmlel, <<"perm">>, _attrs, _els}) ->
    {Access, Type} = decode_privilege_perm_attrs(__TopXMLNS,
						 _attrs, undefined, undefined),
    {privilege_perm, Access, Type}.

decode_privilege_perm_attrs(__TopXMLNS,
			    [{<<"access">>, _val} | _attrs], _Access, Type) ->
    decode_privilege_perm_attrs(__TopXMLNS, _attrs, _val,
				Type);
decode_privilege_perm_attrs(__TopXMLNS,
			    [{<<"type">>, _val} | _attrs], Access, _Type) ->
    decode_privilege_perm_attrs(__TopXMLNS, _attrs, Access,
				_val);
decode_privilege_perm_attrs(__TopXMLNS, [_ | _attrs],
			    Access, Type) ->
    decode_privilege_perm_attrs(__TopXMLNS, _attrs, Access,
				Type);
decode_privilege_perm_attrs(__TopXMLNS, [], Access,
			    Type) ->
    {decode_privilege_perm_attr_access(__TopXMLNS, Access),
     decode_privilege_perm_attr_type(__TopXMLNS, Type)}.

encode_privilege_perm({privilege_perm, Access, Type},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:privilege:1">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_privilege_perm_attr_type(Type,
					     encode_privilege_perm_attr_access(Access,
									       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													  __TopXMLNS))),
    {xmlel, <<"perm">>, _attrs, _els}.

decode_privilege_perm_attr_access(__TopXMLNS,
				  undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"access">>, <<"perm">>, __TopXMLNS}});
decode_privilege_perm_attr_access(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [roster, message, presence])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"access">>, <<"perm">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_privilege_perm_attr_access(_val, _acc) ->
    [{<<"access">>, enc_enum(_val)} | _acc].

decode_privilege_perm_attr_type(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"perm">>, __TopXMLNS}});
decode_privilege_perm_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[none, get, set, both, outgoing, roster,
			 managed_entity])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"perm">>, __TopXMLNS}});
      _res -> _res
    end.

encode_privilege_perm_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].
