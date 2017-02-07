%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0280).

-compile(export_all).

do_decode(<<"sent">>, <<"urn:xmpp:carbons:2">>, El,
	  Opts) ->
    decode_carbons_sent(<<"urn:xmpp:carbons:2">>, Opts, El);
do_decode(<<"received">>, <<"urn:xmpp:carbons:2">>, El,
	  Opts) ->
    decode_carbons_received(<<"urn:xmpp:carbons:2">>, Opts,
			    El);
do_decode(<<"private">>, <<"urn:xmpp:carbons:2">>, El,
	  Opts) ->
    decode_carbons_private(<<"urn:xmpp:carbons:2">>, Opts,
			   El);
do_decode(<<"enable">>, <<"urn:xmpp:carbons:2">>, El,
	  Opts) ->
    decode_carbons_enable(<<"urn:xmpp:carbons:2">>, Opts,
			  El);
do_decode(<<"disable">>, <<"urn:xmpp:carbons:2">>, El,
	  Opts) ->
    decode_carbons_disable(<<"urn:xmpp:carbons:2">>, Opts,
			   El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"sent">>, <<"urn:xmpp:carbons:2">>},
     {<<"received">>, <<"urn:xmpp:carbons:2">>},
     {<<"private">>, <<"urn:xmpp:carbons:2">>},
     {<<"enable">>, <<"urn:xmpp:carbons:2">>},
     {<<"disable">>, <<"urn:xmpp:carbons:2">>}].

do_encode({carbons_disable} = Disable, TopXMLNS) ->
    encode_carbons_disable(Disable, TopXMLNS);
do_encode({carbons_enable} = Enable, TopXMLNS) ->
    encode_carbons_enable(Enable, TopXMLNS);
do_encode({carbons_private} = Private, TopXMLNS) ->
    encode_carbons_private(Private, TopXMLNS);
do_encode({carbons_received, _} = Received, TopXMLNS) ->
    encode_carbons_received(Received, TopXMLNS);
do_encode({carbons_sent, _} = Sent, TopXMLNS) ->
    encode_carbons_sent(Sent, TopXMLNS).

do_get_name({carbons_disable}) -> <<"disable">>;
do_get_name({carbons_enable}) -> <<"enable">>;
do_get_name({carbons_private}) -> <<"private">>;
do_get_name({carbons_received, _}) -> <<"received">>;
do_get_name({carbons_sent, _}) -> <<"sent">>.

do_get_ns({carbons_disable}) ->
    <<"urn:xmpp:carbons:2">>;
do_get_ns({carbons_enable}) -> <<"urn:xmpp:carbons:2">>;
do_get_ns({carbons_private}) ->
    <<"urn:xmpp:carbons:2">>;
do_get_ns({carbons_received, _}) ->
    <<"urn:xmpp:carbons:2">>;
do_get_ns({carbons_sent, _}) ->
    <<"urn:xmpp:carbons:2">>.

pp(carbons_disable, 0) -> [];
pp(carbons_enable, 0) -> [];
pp(carbons_private, 0) -> [];
pp(carbons_received, 1) -> [forwarded];
pp(carbons_sent, 1) -> [forwarded];
pp(_, _) -> no.

records() ->
    [{carbons_disable, 0}, {carbons_enable, 0},
     {carbons_private, 0}, {carbons_received, 1},
     {carbons_sent, 1}].

decode_carbons_sent(__TopXMLNS, __Opts,
		    {xmlel, <<"sent">>, _attrs, _els}) ->
    Forwarded = decode_carbons_sent_els(__TopXMLNS, __Opts,
					_els, error),
    {carbons_sent, Forwarded}.

decode_carbons_sent_els(__TopXMLNS, __Opts, [],
			Forwarded) ->
    case Forwarded of
      error ->
	  erlang:error({xmpp_codec,
			{missing_tag, <<"forwarded">>, __TopXMLNS}});
      {value, Forwarded1} -> Forwarded1
    end;
decode_carbons_sent_els(__TopXMLNS, __Opts,
			[{xmlel, <<"forwarded">>, _attrs, _} = _el | _els],
			Forwarded) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:forward:0">> ->
	  decode_carbons_sent_els(__TopXMLNS, __Opts, _els,
				  {value,
				   xep0297:decode_forwarded(<<"urn:xmpp:forward:0">>,
							    __Opts, _el)});
      _ ->
	  decode_carbons_sent_els(__TopXMLNS, __Opts, _els,
				  Forwarded)
    end;
decode_carbons_sent_els(__TopXMLNS, __Opts, [_ | _els],
			Forwarded) ->
    decode_carbons_sent_els(__TopXMLNS, __Opts, _els,
			    Forwarded).

encode_carbons_sent({carbons_sent, Forwarded},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:carbons:2">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_carbons_sent_$forwarded'(Forwarded,
						       __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"sent">>, _attrs, _els}.

'encode_carbons_sent_$forwarded'(Forwarded, __TopXMLNS,
				 _acc) ->
    [xep0297:encode_forwarded(Forwarded, __TopXMLNS)
     | _acc].

decode_carbons_received(__TopXMLNS, __Opts,
			{xmlel, <<"received">>, _attrs, _els}) ->
    Forwarded = decode_carbons_received_els(__TopXMLNS,
					    __Opts, _els, error),
    {carbons_received, Forwarded}.

decode_carbons_received_els(__TopXMLNS, __Opts, [],
			    Forwarded) ->
    case Forwarded of
      error ->
	  erlang:error({xmpp_codec,
			{missing_tag, <<"forwarded">>, __TopXMLNS}});
      {value, Forwarded1} -> Forwarded1
    end;
decode_carbons_received_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"forwarded">>, _attrs, _} = _el | _els],
			    Forwarded) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:forward:0">> ->
	  decode_carbons_received_els(__TopXMLNS, __Opts, _els,
				      {value,
				       xep0297:decode_forwarded(<<"urn:xmpp:forward:0">>,
								__Opts, _el)});
      _ ->
	  decode_carbons_received_els(__TopXMLNS, __Opts, _els,
				      Forwarded)
    end;
decode_carbons_received_els(__TopXMLNS, __Opts,
			    [_ | _els], Forwarded) ->
    decode_carbons_received_els(__TopXMLNS, __Opts, _els,
				Forwarded).

encode_carbons_received({carbons_received, Forwarded},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:carbons:2">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_carbons_received_$forwarded'(Forwarded,
							   __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"received">>, _attrs, _els}.

'encode_carbons_received_$forwarded'(Forwarded,
				     __TopXMLNS, _acc) ->
    [xep0297:encode_forwarded(Forwarded, __TopXMLNS)
     | _acc].

decode_carbons_private(__TopXMLNS, __Opts,
		       {xmlel, <<"private">>, _attrs, _els}) ->
    {carbons_private}.

encode_carbons_private({carbons_private}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:carbons:2">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"private">>, _attrs, _els}.

decode_carbons_enable(__TopXMLNS, __Opts,
		      {xmlel, <<"enable">>, _attrs, _els}) ->
    {carbons_enable}.

encode_carbons_enable({carbons_enable}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:carbons:2">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"enable">>, _attrs, _els}.

decode_carbons_disable(__TopXMLNS, __Opts,
		       {xmlel, <<"disable">>, _attrs, _els}) ->
    {carbons_disable}.

encode_carbons_disable({carbons_disable}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:carbons:2">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"disable">>, _attrs, _els}.
