%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0115).

-compile(export_all).

do_decode(<<"c">>,
	  <<"http://jabber.org/protocol/caps">>, El, Opts) ->
    decode_caps(<<"http://jabber.org/protocol/caps">>, Opts,
		El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"c">>, <<"http://jabber.org/protocol/caps">>}].

do_encode({caps, _, _, _, _} = C, TopXMLNS) ->
    encode_caps(C, TopXMLNS).

do_get_name({caps, _, _, _, _}) -> <<"c">>.

do_get_ns({caps, _, _, _, _}) ->
    <<"http://jabber.org/protocol/caps">>.

pp(caps, 4) -> [node, version, hash, exts];
pp(_, _) -> no.

records() -> [{caps, 4}].

join([], _Sep) -> <<>>;
join([H | T], Sep) ->
    <<H/binary, << <<Sep, X/binary>>  || X <- T >>/binary>>.

decode_caps(__TopXMLNS, __Opts,
	    {xmlel, <<"c">>, _attrs, _els}) ->
    {Hash, Node, Exts, Version} =
	decode_caps_attrs(__TopXMLNS, _attrs, undefined,
			  undefined, undefined, undefined),
    {caps, Node, Version, Hash, Exts}.

decode_caps_attrs(__TopXMLNS,
		  [{<<"hash">>, _val} | _attrs], _Hash, Node, Exts,
		  Version) ->
    decode_caps_attrs(__TopXMLNS, _attrs, _val, Node, Exts,
		      Version);
decode_caps_attrs(__TopXMLNS,
		  [{<<"node">>, _val} | _attrs], Hash, _Node, Exts,
		  Version) ->
    decode_caps_attrs(__TopXMLNS, _attrs, Hash, _val, Exts,
		      Version);
decode_caps_attrs(__TopXMLNS,
		  [{<<"ext">>, _val} | _attrs], Hash, Node, _Exts,
		  Version) ->
    decode_caps_attrs(__TopXMLNS, _attrs, Hash, Node, _val,
		      Version);
decode_caps_attrs(__TopXMLNS,
		  [{<<"ver">>, _val} | _attrs], Hash, Node, Exts,
		  _Version) ->
    decode_caps_attrs(__TopXMLNS, _attrs, Hash, Node, Exts,
		      _val);
decode_caps_attrs(__TopXMLNS, [_ | _attrs], Hash, Node,
		  Exts, Version) ->
    decode_caps_attrs(__TopXMLNS, _attrs, Hash, Node, Exts,
		      Version);
decode_caps_attrs(__TopXMLNS, [], Hash, Node, Exts,
		  Version) ->
    {decode_caps_attr_hash(__TopXMLNS, Hash),
     decode_caps_attr_node(__TopXMLNS, Node),
     decode_caps_attr_ext(__TopXMLNS, Exts),
     decode_caps_attr_ver(__TopXMLNS, Version)}.

encode_caps({caps, Node, Version, Hash, Exts},
	    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/caps">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_caps_attr_ver(Version,
				  encode_caps_attr_ext(Exts,
						       encode_caps_attr_node(Node,
									     encode_caps_attr_hash(Hash,
												   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
															      __TopXMLNS))))),
    {xmlel, <<"c">>, _attrs, _els}.

decode_caps_attr_hash(__TopXMLNS, undefined) -> <<>>;
decode_caps_attr_hash(__TopXMLNS, _val) -> _val.

encode_caps_attr_hash(<<>>, _acc) -> _acc;
encode_caps_attr_hash(_val, _acc) ->
    [{<<"hash">>, _val} | _acc].

decode_caps_attr_node(__TopXMLNS, undefined) -> <<>>;
decode_caps_attr_node(__TopXMLNS, _val) -> _val.

encode_caps_attr_node(<<>>, _acc) -> _acc;
encode_caps_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_caps_attr_ext(__TopXMLNS, undefined) -> [];
decode_caps_attr_ext(__TopXMLNS, _val) ->
    case catch re:split(_val, "\\h+") of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"ext">>, <<"c">>, __TopXMLNS}});
      _res -> _res
    end.

encode_caps_attr_ext([], _acc) -> _acc;
encode_caps_attr_ext(_val, _acc) ->
    [{<<"ext">>, join(_val, 32)} | _acc].

decode_caps_attr_ver(__TopXMLNS, undefined) -> <<>>;
decode_caps_attr_ver(__TopXMLNS, _val) -> _val.

encode_caps_attr_ver(<<>>, _acc) -> _acc;
encode_caps_attr_ver(_val, _acc) ->
    [{<<"ver">>, _val} | _acc].
