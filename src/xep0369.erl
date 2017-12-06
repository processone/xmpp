%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0369).

-compile(export_all).

do_decode(<<"participant">>, <<"urn:xmpp:mix:0">>, El,
	  Opts) ->
    decode_mix_participant(<<"urn:xmpp:mix:0">>, Opts, El);
do_decode(<<"leave">>, <<"urn:xmpp:mix:0">>, El,
	  Opts) ->
    decode_mix_leave(<<"urn:xmpp:mix:0">>, Opts, El);
do_decode(<<"join">>, <<"urn:xmpp:mix:0">>, El, Opts) ->
    decode_mix_join(<<"urn:xmpp:mix:0">>, Opts, El);
do_decode(<<"subscribe">>, <<"urn:xmpp:mix:0">>, El,
	  Opts) ->
    decode_mix_subscribe(<<"urn:xmpp:mix:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"participant">>, <<"urn:xmpp:mix:0">>},
     {<<"leave">>, <<"urn:xmpp:mix:0">>},
     {<<"join">>, <<"urn:xmpp:mix:0">>},
     {<<"subscribe">>, <<"urn:xmpp:mix:0">>}].

do_encode({mix_join, _, _} = Join, TopXMLNS) ->
    encode_mix_join(Join, TopXMLNS);
do_encode({mix_leave} = Leave, TopXMLNS) ->
    encode_mix_leave(Leave, TopXMLNS);
do_encode({mix_participant, _, _} = Participant,
	  TopXMLNS) ->
    encode_mix_participant(Participant, TopXMLNS).

do_get_name({mix_join, _, _}) -> <<"join">>;
do_get_name({mix_leave}) -> <<"leave">>;
do_get_name({mix_participant, _, _}) ->
    <<"participant">>.

do_get_ns({mix_join, _, _}) -> <<"urn:xmpp:mix:0">>;
do_get_ns({mix_leave}) -> <<"urn:xmpp:mix:0">>;
do_get_ns({mix_participant, _, _}) ->
    <<"urn:xmpp:mix:0">>.

pp(mix_join, 2) -> [jid, subscribe];
pp(mix_leave, 0) -> [];
pp(mix_participant, 2) -> [jid, nick];
pp(_, _) -> no.

records() ->
    [{mix_join, 2}, {mix_leave, 0}, {mix_participant, 2}].

decode_mix_participant(__TopXMLNS, __Opts,
		       {xmlel, <<"participant">>, _attrs, _els}) ->
    {Jid, Nick} = decode_mix_participant_attrs(__TopXMLNS,
					       _attrs, undefined, undefined),
    {mix_participant, Jid, Nick}.

decode_mix_participant_attrs(__TopXMLNS,
			     [{<<"jid">>, _val} | _attrs], _Jid, Nick) ->
    decode_mix_participant_attrs(__TopXMLNS, _attrs, _val,
				 Nick);
decode_mix_participant_attrs(__TopXMLNS,
			     [{<<"nick">>, _val} | _attrs], Jid, _Nick) ->
    decode_mix_participant_attrs(__TopXMLNS, _attrs, Jid,
				 _val);
decode_mix_participant_attrs(__TopXMLNS, [_ | _attrs],
			     Jid, Nick) ->
    decode_mix_participant_attrs(__TopXMLNS, _attrs, Jid,
				 Nick);
decode_mix_participant_attrs(__TopXMLNS, [], Jid,
			     Nick) ->
    {decode_mix_participant_attr_jid(__TopXMLNS, Jid),
     decode_mix_participant_attr_nick(__TopXMLNS, Nick)}.

encode_mix_participant({mix_participant, Jid, Nick},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mix:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_mix_participant_attr_nick(Nick,
					      encode_mix_participant_attr_jid(Jid,
									      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													 __TopXMLNS))),
    {xmlel, <<"participant">>, _attrs, _els}.

decode_mix_participant_attr_jid(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"participant">>,
		   __TopXMLNS}});
decode_mix_participant_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"participant">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_mix_participant_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_mix_participant_attr_nick(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_mix_participant_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_mix_participant_attr_nick(<<>>, _acc) -> _acc;
encode_mix_participant_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_mix_leave(__TopXMLNS, __Opts,
		 {xmlel, <<"leave">>, _attrs, _els}) ->
    {mix_leave}.

encode_mix_leave({mix_leave}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mix:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"leave">>, _attrs, _els}.

decode_mix_join(__TopXMLNS, __Opts,
		{xmlel, <<"join">>, _attrs, _els}) ->
    Subscribe = decode_mix_join_els(__TopXMLNS, __Opts,
				    _els, []),
    Jid = decode_mix_join_attrs(__TopXMLNS, _attrs,
				undefined),
    {mix_join, Jid, Subscribe}.

decode_mix_join_els(__TopXMLNS, __Opts, [],
		    Subscribe) ->
    lists:reverse(Subscribe);
decode_mix_join_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"subscribe">>, _attrs, _} = _el | _els],
		    Subscribe) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mix:0">> ->
	  decode_mix_join_els(__TopXMLNS, __Opts, _els,
			      [decode_mix_subscribe(<<"urn:xmpp:mix:0">>,
						    __Opts, _el)
			       | Subscribe]);
      _ ->
	  decode_mix_join_els(__TopXMLNS, __Opts, _els, Subscribe)
    end;
decode_mix_join_els(__TopXMLNS, __Opts, [_ | _els],
		    Subscribe) ->
    decode_mix_join_els(__TopXMLNS, __Opts, _els,
			Subscribe).

decode_mix_join_attrs(__TopXMLNS,
		      [{<<"jid">>, _val} | _attrs], _Jid) ->
    decode_mix_join_attrs(__TopXMLNS, _attrs, _val);
decode_mix_join_attrs(__TopXMLNS, [_ | _attrs], Jid) ->
    decode_mix_join_attrs(__TopXMLNS, _attrs, Jid);
decode_mix_join_attrs(__TopXMLNS, [], Jid) ->
    decode_mix_join_attr_jid(__TopXMLNS, Jid).

encode_mix_join({mix_join, Jid, Subscribe},
		__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mix:0">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_mix_join_$subscribe'(Subscribe,
						   __NewTopXMLNS, [])),
    _attrs = encode_mix_join_attr_jid(Jid,
				      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								 __TopXMLNS)),
    {xmlel, <<"join">>, _attrs, _els}.

'encode_mix_join_$subscribe'([], __TopXMLNS, _acc) ->
    _acc;
'encode_mix_join_$subscribe'([Subscribe | _els],
			     __TopXMLNS, _acc) ->
    'encode_mix_join_$subscribe'(_els, __TopXMLNS,
				 [encode_mix_subscribe(Subscribe, __TopXMLNS)
				  | _acc]).

decode_mix_join_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_mix_join_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"join">>, __TopXMLNS}});
      _res -> _res
    end.

encode_mix_join_attr_jid(undefined, _acc) -> _acc;
encode_mix_join_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_mix_subscribe(__TopXMLNS, __Opts,
		     {xmlel, <<"subscribe">>, _attrs, _els}) ->
    Node = decode_mix_subscribe_attrs(__TopXMLNS, _attrs,
				      undefined),
    Node.

decode_mix_subscribe_attrs(__TopXMLNS,
			   [{<<"node">>, _val} | _attrs], _Node) ->
    decode_mix_subscribe_attrs(__TopXMLNS, _attrs, _val);
decode_mix_subscribe_attrs(__TopXMLNS, [_ | _attrs],
			   Node) ->
    decode_mix_subscribe_attrs(__TopXMLNS, _attrs, Node);
decode_mix_subscribe_attrs(__TopXMLNS, [], Node) ->
    decode_mix_subscribe_attr_node(__TopXMLNS, Node).

encode_mix_subscribe(Node, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mix:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_mix_subscribe_attr_node(Node,
					    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								       __TopXMLNS)),
    {xmlel, <<"subscribe">>, _attrs, _els}.

decode_mix_subscribe_attr_node(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"subscribe">>,
		   __TopXMLNS}});
decode_mix_subscribe_attr_node(__TopXMLNS, _val) ->
    _val.

encode_mix_subscribe_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].
