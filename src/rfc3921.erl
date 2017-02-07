%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(rfc3921).

-compile(export_all).

do_decode(<<"session">>,
	  <<"urn:ietf:params:xml:ns:xmpp-session">>, El, Opts) ->
    decode_session(<<"urn:ietf:params:xml:ns:xmpp-session">>,
		   Opts, El);
do_decode(<<"optional">>,
	  <<"urn:ietf:params:xml:ns:xmpp-session">>, El, Opts) ->
    decode_session_optional(<<"urn:ietf:params:xml:ns:xmpp-session">>,
			    Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"session">>,
      <<"urn:ietf:params:xml:ns:xmpp-session">>},
     {<<"optional">>,
      <<"urn:ietf:params:xml:ns:xmpp-session">>}].

do_encode({xmpp_session, _} = Session, TopXMLNS) ->
    encode_session(Session, TopXMLNS).

do_get_name({xmpp_session, _}) -> <<"session">>.

do_get_ns({xmpp_session, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-session">>.

pp(xmpp_session, 1) -> [optional];
pp(_, _) -> no.

records() -> [{xmpp_session, 1}].

decode_session(__TopXMLNS, __Opts,
	       {xmlel, <<"session">>, _attrs, _els}) ->
    Optional = decode_session_els(__TopXMLNS, __Opts, _els,
				  false),
    {xmpp_session, Optional}.

decode_session_els(__TopXMLNS, __Opts, [], Optional) ->
    Optional;
decode_session_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"optional">>, _attrs, _} = _el | _els],
		   Optional) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-session">> ->
	  decode_session_els(__TopXMLNS, __Opts, _els,
			     decode_session_optional(<<"urn:ietf:params:xml:ns:xmpp-session">>,
						     __Opts, _el));
      _ ->
	  decode_session_els(__TopXMLNS, __Opts, _els, Optional)
    end;
decode_session_els(__TopXMLNS, __Opts, [_ | _els],
		   Optional) ->
    decode_session_els(__TopXMLNS, __Opts, _els, Optional).

encode_session({xmpp_session, Optional}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-session">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_session_$optional'(Optional,
						 __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"session">>, _attrs, _els}.

'encode_session_$optional'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_session_$optional'(Optional, __TopXMLNS,
			   _acc) ->
    [encode_session_optional(Optional, __TopXMLNS) | _acc].

decode_session_optional(__TopXMLNS, __Opts,
			{xmlel, <<"optional">>, _attrs, _els}) ->
    true.

encode_session_optional(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-session">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"optional">>, _attrs, _els}.
