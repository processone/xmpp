%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0220).

-compile(export_all).

do_decode(<<"dialback">>,
	  <<"urn:xmpp:features:dialback">>, El, Opts) ->
    decode_db_feature(<<"urn:xmpp:features:dialback">>,
		      Opts, El);
do_decode(<<"errors">>,
	  <<"urn:xmpp:features:dialback">>, El, Opts) ->
    decode_db_errors(<<"urn:xmpp:features:dialback">>, Opts,
		     El);
do_decode(<<"db:verify">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_db_verify(<<"jabber:server">>, Opts, El);
do_decode(<<"db:result">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_db_result(<<"jabber:server">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"dialback">>, <<"urn:xmpp:features:dialback">>},
     {<<"errors">>, <<"urn:xmpp:features:dialback">>},
     {<<"db:verify">>, <<"jabber:server">>},
     {<<"db:result">>, <<"jabber:server">>}].

do_encode({db_result, _, _, _, _, _} = Db_result,
	  TopXMLNS) ->
    encode_db_result(Db_result, TopXMLNS);
do_encode({db_verify, _, _, _, _, _, _} = Db_verify,
	  TopXMLNS) ->
    encode_db_verify(Db_verify, TopXMLNS);
do_encode({db_feature, _} = Dialback, TopXMLNS) ->
    encode_db_feature(Dialback, TopXMLNS).

do_get_name({db_feature, _}) -> <<"dialback">>;
do_get_name({db_result, _, _, _, _, _}) ->
    <<"db:result">>;
do_get_name({db_verify, _, _, _, _, _, _}) ->
    <<"db:verify">>.

do_get_ns({db_feature, _}) ->
    <<"urn:xmpp:features:dialback">>;
do_get_ns({db_result, _, _, _, _, _}) ->
    <<"jabber:server">>;
do_get_ns({db_verify, _, _, _, _, _, _}) ->
    <<"jabber:server">>.

pp(db_result, 5) -> [from, to, type, key, sub_els];
pp(db_verify, 6) -> [from, to, id, type, key, sub_els];
pp(db_feature, 1) -> [errors];
pp(_, _) -> no.

records() ->
    [{db_result, 5}, {db_verify, 6}, {db_feature, 1}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

nameprep(S) ->
    case jid:nameprep(S) of
      error -> erlang:error(badarg);
      S1 -> S1
    end.

decode_db_feature(__TopXMLNS, __Opts,
		  {xmlel, <<"dialback">>, _attrs, _els}) ->
    Errors = decode_db_feature_els(__TopXMLNS, __Opts, _els,
				   false),
    {db_feature, Errors}.

decode_db_feature_els(__TopXMLNS, __Opts, [], Errors) ->
    Errors;
decode_db_feature_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"errors">>, _attrs, _} = _el | _els],
		      Errors) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:features:dialback">> ->
	  decode_db_feature_els(__TopXMLNS, __Opts, _els,
				decode_db_errors(<<"urn:xmpp:features:dialback">>,
						 __Opts, _el));
      _ ->
	  decode_db_feature_els(__TopXMLNS, __Opts, _els, Errors)
    end;
decode_db_feature_els(__TopXMLNS, __Opts, [_ | _els],
		      Errors) ->
    decode_db_feature_els(__TopXMLNS, __Opts, _els, Errors).

encode_db_feature({db_feature, Errors}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:features:dialback">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_db_feature_$errors'(Errors,
						     __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"dialback">>, _attrs, _els}.

'encode_db_feature_$errors'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_db_feature_$errors'(Errors, __TopXMLNS, _acc) ->
    [encode_db_errors(Errors, __TopXMLNS) | _acc].

decode_db_errors(__TopXMLNS, __Opts,
		 {xmlel, <<"errors">>, _attrs, _els}) ->
    true.

encode_db_errors(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:features:dialback">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"errors">>, _attrs, _els}.

decode_db_verify(__TopXMLNS, __Opts,
		 {xmlel, <<"db:verify">>, _attrs, _els}) ->
    {Key, __Els} = decode_db_verify_els(__TopXMLNS, __Opts,
					_els, <<>>, []),
    {From, To, Id, Type} =
	decode_db_verify_attrs(__TopXMLNS, _attrs, undefined,
			       undefined, undefined, undefined),
    {db_verify, From, To, Id, Type, Key, __Els}.

decode_db_verify_els(__TopXMLNS, __Opts, [], Key,
		     __Els) ->
    {decode_db_verify_cdata(__TopXMLNS, Key),
     lists:reverse(__Els)};
decode_db_verify_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Key, __Els) ->
    decode_db_verify_els(__TopXMLNS, __Opts, _els,
			 <<Key/binary, _data/binary>>, __Els);
decode_db_verify_els(__TopXMLNS, __Opts,
		     [{xmlel, _name, _attrs, _} = _el | _els], Key, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_db_verify_els(__TopXMLNS, __Opts, _els, Key,
			       [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_db_verify_els(__TopXMLNS, __Opts, _els, Key,
				     __Els);
	    Mod ->
		decode_db_verify_els(__TopXMLNS, __Opts, _els, Key,
				     [Mod:do_decode(_name, __XMLNS, _el, __Opts)
				      | __Els])
	  end
    end.

decode_db_verify_attrs(__TopXMLNS,
		       [{<<"from">>, _val} | _attrs], _From, To, Id, Type) ->
    decode_db_verify_attrs(__TopXMLNS, _attrs, _val, To, Id,
			   Type);
decode_db_verify_attrs(__TopXMLNS,
		       [{<<"to">>, _val} | _attrs], From, _To, Id, Type) ->
    decode_db_verify_attrs(__TopXMLNS, _attrs, From, _val,
			   Id, Type);
decode_db_verify_attrs(__TopXMLNS,
		       [{<<"id">>, _val} | _attrs], From, To, _Id, Type) ->
    decode_db_verify_attrs(__TopXMLNS, _attrs, From, To,
			   _val, Type);
decode_db_verify_attrs(__TopXMLNS,
		       [{<<"type">>, _val} | _attrs], From, To, Id, _Type) ->
    decode_db_verify_attrs(__TopXMLNS, _attrs, From, To, Id,
			   _val);
decode_db_verify_attrs(__TopXMLNS, [_ | _attrs], From,
		       To, Id, Type) ->
    decode_db_verify_attrs(__TopXMLNS, _attrs, From, To, Id,
			   Type);
decode_db_verify_attrs(__TopXMLNS, [], From, To, Id,
		       Type) ->
    {decode_db_verify_attr_from(__TopXMLNS, From),
     decode_db_verify_attr_to(__TopXMLNS, To),
     decode_db_verify_attr_id(__TopXMLNS, Id),
     decode_db_verify_attr_type(__TopXMLNS, Type)}.

encode_db_verify({db_verify, From, To, Id, Type, Key,
		  __Els},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:server">>, [],
				    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els]
	     ++ encode_db_verify_cdata(Key, []),
    _attrs = encode_db_verify_attr_type(Type,
					encode_db_verify_attr_id(Id,
								 encode_db_verify_attr_to(To,
											  encode_db_verify_attr_from(From,
														     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																		__TopXMLNS))))),
    {xmlel, <<"db:verify">>, _attrs, _els}.

decode_db_verify_attr_from(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"from">>, <<"db:verify">>,
		   __TopXMLNS}});
decode_db_verify_attr_from(__TopXMLNS, _val) ->
    case catch nameprep(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"db:verify">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_db_verify_attr_from(_val, _acc) ->
    [{<<"from">>, nameprep(_val)} | _acc].

decode_db_verify_attr_to(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"to">>, <<"db:verify">>, __TopXMLNS}});
decode_db_verify_attr_to(__TopXMLNS, _val) ->
    case catch nameprep(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"db:verify">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_db_verify_attr_to(_val, _acc) ->
    [{<<"to">>, nameprep(_val)} | _acc].

decode_db_verify_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"id">>, <<"db:verify">>, __TopXMLNS}});
decode_db_verify_attr_id(__TopXMLNS, _val) -> _val.

encode_db_verify_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_db_verify_attr_type(__TopXMLNS, undefined) ->
    undefined;
decode_db_verify_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [valid, invalid, error]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"db:verify">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_db_verify_attr_type(undefined, _acc) -> _acc;
encode_db_verify_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_db_verify_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_db_verify_cdata(__TopXMLNS, _val) -> _val.

encode_db_verify_cdata(<<>>, _acc) -> _acc;
encode_db_verify_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_db_result(__TopXMLNS, __Opts,
		 {xmlel, <<"db:result">>, _attrs, _els}) ->
    {Key, __Els} = decode_db_result_els(__TopXMLNS, __Opts,
					_els, <<>>, []),
    {From, To, Type} = decode_db_result_attrs(__TopXMLNS,
					      _attrs, undefined, undefined,
					      undefined),
    {db_result, From, To, Type, Key, __Els}.

decode_db_result_els(__TopXMLNS, __Opts, [], Key,
		     __Els) ->
    {decode_db_result_cdata(__TopXMLNS, Key),
     lists:reverse(__Els)};
decode_db_result_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Key, __Els) ->
    decode_db_result_els(__TopXMLNS, __Opts, _els,
			 <<Key/binary, _data/binary>>, __Els);
decode_db_result_els(__TopXMLNS, __Opts,
		     [{xmlel, _name, _attrs, _} = _el | _els], Key, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_db_result_els(__TopXMLNS, __Opts, _els, Key,
			       [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_db_result_els(__TopXMLNS, __Opts, _els, Key,
				     __Els);
	    Mod ->
		decode_db_result_els(__TopXMLNS, __Opts, _els, Key,
				     [Mod:do_decode(_name, __XMLNS, _el, __Opts)
				      | __Els])
	  end
    end.

decode_db_result_attrs(__TopXMLNS,
		       [{<<"from">>, _val} | _attrs], _From, To, Type) ->
    decode_db_result_attrs(__TopXMLNS, _attrs, _val, To,
			   Type);
decode_db_result_attrs(__TopXMLNS,
		       [{<<"to">>, _val} | _attrs], From, _To, Type) ->
    decode_db_result_attrs(__TopXMLNS, _attrs, From, _val,
			   Type);
decode_db_result_attrs(__TopXMLNS,
		       [{<<"type">>, _val} | _attrs], From, To, _Type) ->
    decode_db_result_attrs(__TopXMLNS, _attrs, From, To,
			   _val);
decode_db_result_attrs(__TopXMLNS, [_ | _attrs], From,
		       To, Type) ->
    decode_db_result_attrs(__TopXMLNS, _attrs, From, To,
			   Type);
decode_db_result_attrs(__TopXMLNS, [], From, To,
		       Type) ->
    {decode_db_result_attr_from(__TopXMLNS, From),
     decode_db_result_attr_to(__TopXMLNS, To),
     decode_db_result_attr_type(__TopXMLNS, Type)}.

encode_db_result({db_result, From, To, Type, Key,
		  __Els},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:server">>, [],
				    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els]
	     ++ encode_db_result_cdata(Key, []),
    _attrs = encode_db_result_attr_type(Type,
					encode_db_result_attr_to(To,
								 encode_db_result_attr_from(From,
											    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
														       __TopXMLNS)))),
    {xmlel, <<"db:result">>, _attrs, _els}.

decode_db_result_attr_from(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"from">>, <<"db:result">>,
		   __TopXMLNS}});
decode_db_result_attr_from(__TopXMLNS, _val) ->
    case catch nameprep(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"db:result">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_db_result_attr_from(_val, _acc) ->
    [{<<"from">>, nameprep(_val)} | _acc].

decode_db_result_attr_to(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"to">>, <<"db:result">>, __TopXMLNS}});
decode_db_result_attr_to(__TopXMLNS, _val) ->
    case catch nameprep(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"db:result">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_db_result_attr_to(_val, _acc) ->
    [{<<"to">>, nameprep(_val)} | _acc].

decode_db_result_attr_type(__TopXMLNS, undefined) ->
    undefined;
decode_db_result_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [valid, invalid, error]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"db:result">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_db_result_attr_type(undefined, _acc) -> _acc;
encode_db_result_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_db_result_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_db_result_cdata(__TopXMLNS, _val) -> _val.

encode_db_result_cdata(<<>>, _acc) -> _acc;
encode_db_result_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
