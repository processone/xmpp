%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0198).

-compile(export_all).

do_decode(<<"failed">>, <<"urn:xmpp:sm:2">>, El,
	  Opts) ->
    decode_sm_failed(<<"urn:xmpp:sm:2">>, Opts, El);
do_decode(<<"failed">>, <<"urn:xmpp:sm:3">>, El,
	  Opts) ->
    decode_sm_failed(<<"urn:xmpp:sm:3">>, Opts, El);
do_decode(<<"a">>, <<"urn:xmpp:sm:2">>, El, Opts) ->
    decode_sm_a(<<"urn:xmpp:sm:2">>, Opts, El);
do_decode(<<"a">>, <<"urn:xmpp:sm:3">>, El, Opts) ->
    decode_sm_a(<<"urn:xmpp:sm:3">>, Opts, El);
do_decode(<<"r">>, <<"urn:xmpp:sm:2">>, El, Opts) ->
    decode_sm_r(<<"urn:xmpp:sm:2">>, Opts, El);
do_decode(<<"r">>, <<"urn:xmpp:sm:3">>, El, Opts) ->
    decode_sm_r(<<"urn:xmpp:sm:3">>, Opts, El);
do_decode(<<"resumed">>, <<"urn:xmpp:sm:2">>, El,
	  Opts) ->
    decode_sm_resumed(<<"urn:xmpp:sm:2">>, Opts, El);
do_decode(<<"resumed">>, <<"urn:xmpp:sm:3">>, El,
	  Opts) ->
    decode_sm_resumed(<<"urn:xmpp:sm:3">>, Opts, El);
do_decode(<<"resume">>, <<"urn:xmpp:sm:2">>, El,
	  Opts) ->
    decode_sm_resume(<<"urn:xmpp:sm:2">>, Opts, El);
do_decode(<<"resume">>, <<"urn:xmpp:sm:3">>, El,
	  Opts) ->
    decode_sm_resume(<<"urn:xmpp:sm:3">>, Opts, El);
do_decode(<<"enabled">>, <<"urn:xmpp:sm:2">>, El,
	  Opts) ->
    decode_sm_enabled(<<"urn:xmpp:sm:2">>, Opts, El);
do_decode(<<"enabled">>, <<"urn:xmpp:sm:3">>, El,
	  Opts) ->
    decode_sm_enabled(<<"urn:xmpp:sm:3">>, Opts, El);
do_decode(<<"enable">>, <<"urn:xmpp:sm:2">>, El,
	  Opts) ->
    decode_sm_enable(<<"urn:xmpp:sm:2">>, Opts, El);
do_decode(<<"enable">>, <<"urn:xmpp:sm:3">>, El,
	  Opts) ->
    decode_sm_enable(<<"urn:xmpp:sm:3">>, Opts, El);
do_decode(<<"sm">>, <<"urn:xmpp:sm:2">>, El, Opts) ->
    decode_feature_sm(<<"urn:xmpp:sm:2">>, Opts, El);
do_decode(<<"sm">>, <<"urn:xmpp:sm:3">>, El, Opts) ->
    decode_feature_sm(<<"urn:xmpp:sm:3">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"failed">>, <<"urn:xmpp:sm:2">>},
     {<<"failed">>, <<"urn:xmpp:sm:3">>},
     {<<"a">>, <<"urn:xmpp:sm:2">>},
     {<<"a">>, <<"urn:xmpp:sm:3">>},
     {<<"r">>, <<"urn:xmpp:sm:2">>},
     {<<"r">>, <<"urn:xmpp:sm:3">>},
     {<<"resumed">>, <<"urn:xmpp:sm:2">>},
     {<<"resumed">>, <<"urn:xmpp:sm:3">>},
     {<<"resume">>, <<"urn:xmpp:sm:2">>},
     {<<"resume">>, <<"urn:xmpp:sm:3">>},
     {<<"enabled">>, <<"urn:xmpp:sm:2">>},
     {<<"enabled">>, <<"urn:xmpp:sm:3">>},
     {<<"enable">>, <<"urn:xmpp:sm:2">>},
     {<<"enable">>, <<"urn:xmpp:sm:3">>},
     {<<"sm">>, <<"urn:xmpp:sm:2">>},
     {<<"sm">>, <<"urn:xmpp:sm:3">>}].

do_encode({feature_sm, _} = Sm, TopXMLNS) ->
    encode_feature_sm(Sm, TopXMLNS);
do_encode({sm_enable, _, _, _} = Enable, TopXMLNS) ->
    encode_sm_enable(Enable, TopXMLNS);
do_encode({sm_enabled, _, _, _, _, _} = Enabled,
	  TopXMLNS) ->
    encode_sm_enabled(Enabled, TopXMLNS);
do_encode({sm_resume, _, _, _} = Resume, TopXMLNS) ->
    encode_sm_resume(Resume, TopXMLNS);
do_encode({sm_resumed, _, _, _} = Resumed, TopXMLNS) ->
    encode_sm_resumed(Resumed, TopXMLNS);
do_encode({sm_r, _} = R, TopXMLNS) ->
    encode_sm_r(R, TopXMLNS);
do_encode({sm_a, _, _} = A, TopXMLNS) ->
    encode_sm_a(A, TopXMLNS);
do_encode({sm_failed, _, _, _, _} = Failed, TopXMLNS) ->
    encode_sm_failed(Failed, TopXMLNS).

do_get_name({feature_sm, _}) -> <<"sm">>;
do_get_name({sm_a, _, _}) -> <<"a">>;
do_get_name({sm_enable, _, _, _}) -> <<"enable">>;
do_get_name({sm_enabled, _, _, _, _, _}) ->
    <<"enabled">>;
do_get_name({sm_failed, _, _, _, _}) -> <<"failed">>;
do_get_name({sm_r, _}) -> <<"r">>;
do_get_name({sm_resume, _, _, _}) -> <<"resume">>;
do_get_name({sm_resumed, _, _, _}) -> <<"resumed">>.

do_get_ns({feature_sm, Xmlns}) -> Xmlns;
do_get_ns({sm_a, _, Xmlns}) -> Xmlns;
do_get_ns({sm_enable, _, _, Xmlns}) -> Xmlns;
do_get_ns({sm_enabled, _, _, _, _, Xmlns}) -> Xmlns;
do_get_ns({sm_failed, _, _, _, Xmlns}) -> Xmlns;
do_get_ns({sm_r, Xmlns}) -> Xmlns;
do_get_ns({sm_resume, _, _, Xmlns}) -> Xmlns;
do_get_ns({sm_resumed, _, _, Xmlns}) -> Xmlns.

pp(feature_sm, 1) -> [xmlns];
pp(sm_enable, 3) -> [max, resume, xmlns];
pp(sm_enabled, 5) -> [id, location, max, resume, xmlns];
pp(sm_resume, 3) -> [h, previd, xmlns];
pp(sm_resumed, 3) -> [h, previd, xmlns];
pp(sm_r, 1) -> [xmlns];
pp(sm_a, 2) -> [h, xmlns];
pp(sm_failed, 4) -> [reason, text, h, xmlns];
pp(_, _) -> no.

records() ->
    [{feature_sm, 1}, {sm_enable, 3}, {sm_enabled, 5},
     {sm_resume, 3}, {sm_resumed, 3}, {sm_r, 1}, {sm_a, 2},
     {sm_failed, 4}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_sm_failed(__TopXMLNS, __Opts,
		 {xmlel, <<"failed">>, _attrs, _els}) ->
    {Text, Reason} = decode_sm_failed_els(__TopXMLNS,
					  __Opts, _els, [], undefined),
    {H, Xmlns} = decode_sm_failed_attrs(__TopXMLNS, _attrs,
					undefined, undefined),
    {sm_failed, Reason, Text, H, Xmlns}.

decode_sm_failed_els(__TopXMLNS, __Opts, [], Text,
		     Reason) ->
    {lists:reverse(Text), Reason};
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
		     Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els,
			       [rfc6120:decode_error_text(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							  __Opts, _el)
				| Text],
			       Reason);
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"bad-request">>, _attrs, _} = _el | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_bad_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								__Opts, _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"conflict">>, _attrs, _} = _el | _els], Text,
		     Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_conflict(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							     __Opts, _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"feature-not-implemented">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_feature_not_implemented(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									    __Opts,
									    _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"forbidden">>, _attrs, _} = _el | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_forbidden(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"gone">>, _attrs, _} = _el | _els], Text,
		     Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_gone(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							 __Opts, _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"internal-server-error">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_internal_server_error(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									  __Opts,
									  _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"item-not-found">>, _attrs, _} = _el | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_item_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								   __Opts,
								   _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"jid-malformed">>, _attrs, _} = _el | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_jid_malformed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								  __Opts, _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"not-acceptable">>, _attrs, _} = _el | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_not_acceptable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								   __Opts,
								   _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"not-allowed">>, _attrs, _} = _el | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_not_allowed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								__Opts, _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"not-authorized">>, _attrs, _} = _el | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								   __Opts,
								   _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"policy-violation">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_policy_violation(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								     __Opts,
								     _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"recipient-unavailable">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_recipient_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									  __Opts,
									  _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"redirect">>, _attrs, _} = _el | _els], Text,
		     Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_redirect(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							     __Opts, _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"registration-required">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_registration_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									  __Opts,
									  _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"remote-server-not-found">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_remote_server_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									    __Opts,
									    _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"remote-server-timeout">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_remote_server_timeout(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									  __Opts,
									  _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"resource-constraint">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_resource_constraint(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									__Opts,
									_el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"service-unavailable">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_service_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									__Opts,
									_el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"subscription-required">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_subscription_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									  __Opts,
									  _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"undefined-condition">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_undefined_condition(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
									__Opts,
									_el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"unexpected-request">>, _attrs, _} = _el
		      | _els],
		     Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       rfc6120:decode_error_unexpected_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								       __Opts,
								       _el));
      _ ->
	  decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			       Reason)
    end;
decode_sm_failed_els(__TopXMLNS, __Opts, [_ | _els],
		     Text, Reason) ->
    decode_sm_failed_els(__TopXMLNS, __Opts, _els, Text,
			 Reason).

decode_sm_failed_attrs(__TopXMLNS,
		       [{<<"h">>, _val} | _attrs], _H, Xmlns) ->
    decode_sm_failed_attrs(__TopXMLNS, _attrs, _val, Xmlns);
decode_sm_failed_attrs(__TopXMLNS,
		       [{<<"xmlns">>, _val} | _attrs], H, _Xmlns) ->
    decode_sm_failed_attrs(__TopXMLNS, _attrs, H, _val);
decode_sm_failed_attrs(__TopXMLNS, [_ | _attrs], H,
		       Xmlns) ->
    decode_sm_failed_attrs(__TopXMLNS, _attrs, H, Xmlns);
decode_sm_failed_attrs(__TopXMLNS, [], H, Xmlns) ->
    {decode_sm_failed_attr_h(__TopXMLNS, H),
     decode_sm_failed_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_sm_failed({sm_failed, Reason, Text, H, Xmlns},
		 __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:sm:2">>,
						 <<"urn:xmpp:sm:3">>],
						__TopXMLNS),
    _els = lists:reverse('encode_sm_failed_$text'(Text,
						  __NewTopXMLNS,
						  'encode_sm_failed_$reason'(Reason,
									     __NewTopXMLNS,
									     []))),
    _attrs = encode_sm_failed_attr_h(H,
				     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								__TopXMLNS)),
    {xmlel, <<"failed">>, _attrs, _els}.

'encode_sm_failed_$text'([], __TopXMLNS, _acc) -> _acc;
'encode_sm_failed_$text'([Text | _els], __TopXMLNS,
			 _acc) ->
    'encode_sm_failed_$text'(_els, __TopXMLNS,
			     [rfc6120:encode_error_text(Text, __TopXMLNS)
			      | _acc]).

'encode_sm_failed_$reason'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_sm_failed_$reason'('bad-request' = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_bad_request(Reason, __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'(conflict = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_conflict(Reason, __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('feature-not-implemented' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_feature_not_implemented(Reason,
						  __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'(forbidden = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_forbidden(Reason, __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'({gone, _} = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_gone(Reason, __TopXMLNS) | _acc];
'encode_sm_failed_$reason'('internal-server-error' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_internal_server_error(Reason,
						__TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('item-not-found' = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_item_not_found(Reason, __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('jid-malformed' = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_jid_malformed(Reason, __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('not-acceptable' = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_not_acceptable(Reason, __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('not-allowed' = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_not_allowed(Reason, __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('not-authorized' = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_not_authorized(Reason, __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('policy-violation' = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_policy_violation(Reason,
					   __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('recipient-unavailable' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_recipient_unavailable(Reason,
						__TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'({redirect, _} = Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_redirect(Reason, __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('registration-required' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_registration_required(Reason,
						__TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('remote-server-not-found' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_remote_server_not_found(Reason,
						  __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('remote-server-timeout' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_remote_server_timeout(Reason,
						__TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('resource-constraint' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_resource_constraint(Reason,
					      __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('service-unavailable' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_service_unavailable(Reason,
					      __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('subscription-required' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_subscription_required(Reason,
						__TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('undefined-condition' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_undefined_condition(Reason,
					      __TopXMLNS)
     | _acc];
'encode_sm_failed_$reason'('unexpected-request' =
			       Reason,
			   __TopXMLNS, _acc) ->
    [rfc6120:encode_error_unexpected_request(Reason,
					     __TopXMLNS)
     | _acc].

decode_sm_failed_attr_h(__TopXMLNS, undefined) ->
    undefined;
decode_sm_failed_attr_h(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"h">>, <<"failed">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sm_failed_attr_h(undefined, _acc) -> _acc;
encode_sm_failed_attr_h(_val, _acc) ->
    [{<<"h">>, enc_int(_val)} | _acc].

decode_sm_failed_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_sm_failed_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_sm_a(__TopXMLNS, __Opts,
	    {xmlel, <<"a">>, _attrs, _els}) ->
    {H, Xmlns} = decode_sm_a_attrs(__TopXMLNS, _attrs,
				   undefined, undefined),
    {sm_a, H, Xmlns}.

decode_sm_a_attrs(__TopXMLNS,
		  [{<<"h">>, _val} | _attrs], _H, Xmlns) ->
    decode_sm_a_attrs(__TopXMLNS, _attrs, _val, Xmlns);
decode_sm_a_attrs(__TopXMLNS,
		  [{<<"xmlns">>, _val} | _attrs], H, _Xmlns) ->
    decode_sm_a_attrs(__TopXMLNS, _attrs, H, _val);
decode_sm_a_attrs(__TopXMLNS, [_ | _attrs], H, Xmlns) ->
    decode_sm_a_attrs(__TopXMLNS, _attrs, H, Xmlns);
decode_sm_a_attrs(__TopXMLNS, [], H, Xmlns) ->
    {decode_sm_a_attr_h(__TopXMLNS, H),
     decode_sm_a_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_sm_a({sm_a, H, Xmlns}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:sm:2">>,
						 <<"urn:xmpp:sm:3">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_sm_a_attr_h(H,
				xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
							   __TopXMLNS)),
    {xmlel, <<"a">>, _attrs, _els}.

decode_sm_a_attr_h(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"h">>, <<"a">>, __TopXMLNS}});
decode_sm_a_attr_h(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"h">>, <<"a">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sm_a_attr_h(_val, _acc) ->
    [{<<"h">>, enc_int(_val)} | _acc].

decode_sm_a_attr_xmlns(__TopXMLNS, undefined) -> <<>>;
decode_sm_a_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_sm_r(__TopXMLNS, __Opts,
	    {xmlel, <<"r">>, _attrs, _els}) ->
    Xmlns = decode_sm_r_attrs(__TopXMLNS, _attrs,
			      undefined),
    {sm_r, Xmlns}.

decode_sm_r_attrs(__TopXMLNS,
		  [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_sm_r_attrs(__TopXMLNS, _attrs, _val);
decode_sm_r_attrs(__TopXMLNS, [_ | _attrs], Xmlns) ->
    decode_sm_r_attrs(__TopXMLNS, _attrs, Xmlns);
decode_sm_r_attrs(__TopXMLNS, [], Xmlns) ->
    decode_sm_r_attr_xmlns(__TopXMLNS, Xmlns).

encode_sm_r({sm_r, Xmlns}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:sm:2">>,
						 <<"urn:xmpp:sm:3">>],
						__TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"r">>, _attrs, _els}.

decode_sm_r_attr_xmlns(__TopXMLNS, undefined) -> <<>>;
decode_sm_r_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_sm_resumed(__TopXMLNS, __Opts,
		  {xmlel, <<"resumed">>, _attrs, _els}) ->
    {H, Xmlns, Previd} = decode_sm_resumed_attrs(__TopXMLNS,
						 _attrs, undefined, undefined,
						 undefined),
    {sm_resumed, H, Previd, Xmlns}.

decode_sm_resumed_attrs(__TopXMLNS,
			[{<<"h">>, _val} | _attrs], _H, Xmlns, Previd) ->
    decode_sm_resumed_attrs(__TopXMLNS, _attrs, _val, Xmlns,
			    Previd);
decode_sm_resumed_attrs(__TopXMLNS,
			[{<<"xmlns">>, _val} | _attrs], H, _Xmlns, Previd) ->
    decode_sm_resumed_attrs(__TopXMLNS, _attrs, H, _val,
			    Previd);
decode_sm_resumed_attrs(__TopXMLNS,
			[{<<"previd">>, _val} | _attrs], H, Xmlns, _Previd) ->
    decode_sm_resumed_attrs(__TopXMLNS, _attrs, H, Xmlns,
			    _val);
decode_sm_resumed_attrs(__TopXMLNS, [_ | _attrs], H,
			Xmlns, Previd) ->
    decode_sm_resumed_attrs(__TopXMLNS, _attrs, H, Xmlns,
			    Previd);
decode_sm_resumed_attrs(__TopXMLNS, [], H, Xmlns,
			Previd) ->
    {decode_sm_resumed_attr_h(__TopXMLNS, H),
     decode_sm_resumed_attr_xmlns(__TopXMLNS, Xmlns),
     decode_sm_resumed_attr_previd(__TopXMLNS, Previd)}.

encode_sm_resumed({sm_resumed, H, Previd, Xmlns},
		  __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:sm:2">>,
						 <<"urn:xmpp:sm:3">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_sm_resumed_attr_previd(Previd,
					   encode_sm_resumed_attr_h(H,
								    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
											       __TopXMLNS))),
    {xmlel, <<"resumed">>, _attrs, _els}.

decode_sm_resumed_attr_h(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"h">>, <<"resumed">>, __TopXMLNS}});
decode_sm_resumed_attr_h(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"h">>, <<"resumed">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sm_resumed_attr_h(_val, _acc) ->
    [{<<"h">>, enc_int(_val)} | _acc].

decode_sm_resumed_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_sm_resumed_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_sm_resumed_attr_previd(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"previd">>, <<"resumed">>,
		   __TopXMLNS}});
decode_sm_resumed_attr_previd(__TopXMLNS, _val) -> _val.

encode_sm_resumed_attr_previd(_val, _acc) ->
    [{<<"previd">>, _val} | _acc].

decode_sm_resume(__TopXMLNS, __Opts,
		 {xmlel, <<"resume">>, _attrs, _els}) ->
    {H, Xmlns, Previd} = decode_sm_resume_attrs(__TopXMLNS,
						_attrs, undefined, undefined,
						undefined),
    {sm_resume, H, Previd, Xmlns}.

decode_sm_resume_attrs(__TopXMLNS,
		       [{<<"h">>, _val} | _attrs], _H, Xmlns, Previd) ->
    decode_sm_resume_attrs(__TopXMLNS, _attrs, _val, Xmlns,
			   Previd);
decode_sm_resume_attrs(__TopXMLNS,
		       [{<<"xmlns">>, _val} | _attrs], H, _Xmlns, Previd) ->
    decode_sm_resume_attrs(__TopXMLNS, _attrs, H, _val,
			   Previd);
decode_sm_resume_attrs(__TopXMLNS,
		       [{<<"previd">>, _val} | _attrs], H, Xmlns, _Previd) ->
    decode_sm_resume_attrs(__TopXMLNS, _attrs, H, Xmlns,
			   _val);
decode_sm_resume_attrs(__TopXMLNS, [_ | _attrs], H,
		       Xmlns, Previd) ->
    decode_sm_resume_attrs(__TopXMLNS, _attrs, H, Xmlns,
			   Previd);
decode_sm_resume_attrs(__TopXMLNS, [], H, Xmlns,
		       Previd) ->
    {decode_sm_resume_attr_h(__TopXMLNS, H),
     decode_sm_resume_attr_xmlns(__TopXMLNS, Xmlns),
     decode_sm_resume_attr_previd(__TopXMLNS, Previd)}.

encode_sm_resume({sm_resume, H, Previd, Xmlns},
		 __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:sm:2">>,
						 <<"urn:xmpp:sm:3">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_sm_resume_attr_previd(Previd,
					  encode_sm_resume_attr_h(H,
								  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
											     __TopXMLNS))),
    {xmlel, <<"resume">>, _attrs, _els}.

decode_sm_resume_attr_h(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"h">>, <<"resume">>, __TopXMLNS}});
decode_sm_resume_attr_h(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"h">>, <<"resume">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sm_resume_attr_h(_val, _acc) ->
    [{<<"h">>, enc_int(_val)} | _acc].

decode_sm_resume_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_sm_resume_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_sm_resume_attr_previd(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"previd">>, <<"resume">>,
		   __TopXMLNS}});
decode_sm_resume_attr_previd(__TopXMLNS, _val) -> _val.

encode_sm_resume_attr_previd(_val, _acc) ->
    [{<<"previd">>, _val} | _acc].

decode_sm_enabled(__TopXMLNS, __Opts,
		  {xmlel, <<"enabled">>, _attrs, _els}) ->
    {Id, Location, Xmlns, Max, Resume} =
	decode_sm_enabled_attrs(__TopXMLNS, _attrs, undefined,
				undefined, undefined, undefined, undefined),
    {sm_enabled, Id, Location, Max, Resume, Xmlns}.

decode_sm_enabled_attrs(__TopXMLNS,
			[{<<"id">>, _val} | _attrs], _Id, Location, Xmlns, Max,
			Resume) ->
    decode_sm_enabled_attrs(__TopXMLNS, _attrs, _val,
			    Location, Xmlns, Max, Resume);
decode_sm_enabled_attrs(__TopXMLNS,
			[{<<"location">>, _val} | _attrs], Id, _Location, Xmlns,
			Max, Resume) ->
    decode_sm_enabled_attrs(__TopXMLNS, _attrs, Id, _val,
			    Xmlns, Max, Resume);
decode_sm_enabled_attrs(__TopXMLNS,
			[{<<"xmlns">>, _val} | _attrs], Id, Location, _Xmlns,
			Max, Resume) ->
    decode_sm_enabled_attrs(__TopXMLNS, _attrs, Id,
			    Location, _val, Max, Resume);
decode_sm_enabled_attrs(__TopXMLNS,
			[{<<"max">>, _val} | _attrs], Id, Location, Xmlns, _Max,
			Resume) ->
    decode_sm_enabled_attrs(__TopXMLNS, _attrs, Id,
			    Location, Xmlns, _val, Resume);
decode_sm_enabled_attrs(__TopXMLNS,
			[{<<"resume">>, _val} | _attrs], Id, Location, Xmlns,
			Max, _Resume) ->
    decode_sm_enabled_attrs(__TopXMLNS, _attrs, Id,
			    Location, Xmlns, Max, _val);
decode_sm_enabled_attrs(__TopXMLNS, [_ | _attrs], Id,
			Location, Xmlns, Max, Resume) ->
    decode_sm_enabled_attrs(__TopXMLNS, _attrs, Id,
			    Location, Xmlns, Max, Resume);
decode_sm_enabled_attrs(__TopXMLNS, [], Id, Location,
			Xmlns, Max, Resume) ->
    {decode_sm_enabled_attr_id(__TopXMLNS, Id),
     decode_sm_enabled_attr_location(__TopXMLNS, Location),
     decode_sm_enabled_attr_xmlns(__TopXMLNS, Xmlns),
     decode_sm_enabled_attr_max(__TopXMLNS, Max),
     decode_sm_enabled_attr_resume(__TopXMLNS, Resume)}.

encode_sm_enabled({sm_enabled, Id, Location, Max,
		   Resume, Xmlns},
		  __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:sm:2">>,
						 <<"urn:xmpp:sm:3">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_sm_enabled_attr_resume(Resume,
					   encode_sm_enabled_attr_max(Max,
								      encode_sm_enabled_attr_location(Location,
												      encode_sm_enabled_attr_id(Id,
																xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																			   __TopXMLNS))))),
    {xmlel, <<"enabled">>, _attrs, _els}.

decode_sm_enabled_attr_id(__TopXMLNS, undefined) ->
    <<>>;
decode_sm_enabled_attr_id(__TopXMLNS, _val) -> _val.

encode_sm_enabled_attr_id(<<>>, _acc) -> _acc;
encode_sm_enabled_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_sm_enabled_attr_location(__TopXMLNS,
				undefined) ->
    <<>>;
decode_sm_enabled_attr_location(__TopXMLNS, _val) ->
    _val.

encode_sm_enabled_attr_location(<<>>, _acc) -> _acc;
encode_sm_enabled_attr_location(_val, _acc) ->
    [{<<"location">>, _val} | _acc].

decode_sm_enabled_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_sm_enabled_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_sm_enabled_attr_max(__TopXMLNS, undefined) ->
    undefined;
decode_sm_enabled_attr_max(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"max">>, <<"enabled">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_sm_enabled_attr_max(undefined, _acc) -> _acc;
encode_sm_enabled_attr_max(_val, _acc) ->
    [{<<"max">>, enc_int(_val)} | _acc].

decode_sm_enabled_attr_resume(__TopXMLNS, undefined) ->
    false;
decode_sm_enabled_attr_resume(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"resume">>, <<"enabled">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_sm_enabled_attr_resume(false, _acc) -> _acc;
encode_sm_enabled_attr_resume(_val, _acc) ->
    [{<<"resume">>, enc_bool(_val)} | _acc].

decode_sm_enable(__TopXMLNS, __Opts,
		 {xmlel, <<"enable">>, _attrs, _els}) ->
    {Max, Xmlns, Resume} =
	decode_sm_enable_attrs(__TopXMLNS, _attrs, undefined,
			       undefined, undefined),
    {sm_enable, Max, Resume, Xmlns}.

decode_sm_enable_attrs(__TopXMLNS,
		       [{<<"max">>, _val} | _attrs], _Max, Xmlns, Resume) ->
    decode_sm_enable_attrs(__TopXMLNS, _attrs, _val, Xmlns,
			   Resume);
decode_sm_enable_attrs(__TopXMLNS,
		       [{<<"xmlns">>, _val} | _attrs], Max, _Xmlns, Resume) ->
    decode_sm_enable_attrs(__TopXMLNS, _attrs, Max, _val,
			   Resume);
decode_sm_enable_attrs(__TopXMLNS,
		       [{<<"resume">>, _val} | _attrs], Max, Xmlns, _Resume) ->
    decode_sm_enable_attrs(__TopXMLNS, _attrs, Max, Xmlns,
			   _val);
decode_sm_enable_attrs(__TopXMLNS, [_ | _attrs], Max,
		       Xmlns, Resume) ->
    decode_sm_enable_attrs(__TopXMLNS, _attrs, Max, Xmlns,
			   Resume);
decode_sm_enable_attrs(__TopXMLNS, [], Max, Xmlns,
		       Resume) ->
    {decode_sm_enable_attr_max(__TopXMLNS, Max),
     decode_sm_enable_attr_xmlns(__TopXMLNS, Xmlns),
     decode_sm_enable_attr_resume(__TopXMLNS, Resume)}.

encode_sm_enable({sm_enable, Max, Resume, Xmlns},
		 __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:sm:2">>,
						 <<"urn:xmpp:sm:3">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_sm_enable_attr_resume(Resume,
					  encode_sm_enable_attr_max(Max,
								    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
											       __TopXMLNS))),
    {xmlel, <<"enable">>, _attrs, _els}.

decode_sm_enable_attr_max(__TopXMLNS, undefined) ->
    undefined;
decode_sm_enable_attr_max(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"max">>, <<"enable">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sm_enable_attr_max(undefined, _acc) -> _acc;
encode_sm_enable_attr_max(_val, _acc) ->
    [{<<"max">>, enc_int(_val)} | _acc].

decode_sm_enable_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_sm_enable_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_sm_enable_attr_resume(__TopXMLNS, undefined) ->
    false;
decode_sm_enable_attr_resume(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"resume">>, <<"enable">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_sm_enable_attr_resume(false, _acc) -> _acc;
encode_sm_enable_attr_resume(_val, _acc) ->
    [{<<"resume">>, enc_bool(_val)} | _acc].

decode_feature_sm(__TopXMLNS, __Opts,
		  {xmlel, <<"sm">>, _attrs, _els}) ->
    Xmlns = decode_feature_sm_attrs(__TopXMLNS, _attrs,
				    undefined),
    {feature_sm, Xmlns}.

decode_feature_sm_attrs(__TopXMLNS,
			[{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_feature_sm_attrs(__TopXMLNS, _attrs, _val);
decode_feature_sm_attrs(__TopXMLNS, [_ | _attrs],
			Xmlns) ->
    decode_feature_sm_attrs(__TopXMLNS, _attrs, Xmlns);
decode_feature_sm_attrs(__TopXMLNS, [], Xmlns) ->
    decode_feature_sm_attr_xmlns(__TopXMLNS, Xmlns).

encode_feature_sm({feature_sm, Xmlns}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:sm:2">>,
						 <<"urn:xmpp:sm:3">>],
						__TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"sm">>, _attrs, _els}.

decode_feature_sm_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_feature_sm_attr_xmlns(__TopXMLNS, _val) -> _val.
