%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0359).

-compile(export_all).

do_decode(<<"client-id">>, <<"urn:xmpp:sid:0">>, El,
	  Opts) ->
    decode_client_id(<<"urn:xmpp:sid:0">>, Opts, El);
do_decode(<<"stanza-id">>, <<"urn:xmpp:sid:0">>, El,
	  Opts) ->
    decode_stanza_id(<<"urn:xmpp:sid:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"client-id">>, <<"urn:xmpp:sid:0">>},
     {<<"stanza-id">>, <<"urn:xmpp:sid:0">>}].

do_encode({stanza_id, _, _} = Stanza_id, TopXMLNS) ->
    encode_stanza_id(Stanza_id, TopXMLNS);
do_encode({client_id, _} = Client_id, TopXMLNS) ->
    encode_client_id(Client_id, TopXMLNS).

do_get_name({client_id, _}) -> <<"client-id">>;
do_get_name({stanza_id, _, _}) -> <<"stanza-id">>.

do_get_ns({client_id, _}) -> <<"urn:xmpp:sid:0">>;
do_get_ns({stanza_id, _, _}) -> <<"urn:xmpp:sid:0">>.

pp(stanza_id, 2) -> [by, id];
pp(client_id, 1) -> [id];
pp(_, _) -> no.

records() -> [{stanza_id, 2}, {client_id, 1}].

decode_client_id(__TopXMLNS, __Opts,
		 {xmlel, <<"client-id">>, _attrs, _els}) ->
    Id = decode_client_id_attrs(__TopXMLNS, _attrs,
				undefined),
    {client_id, Id}.

decode_client_id_attrs(__TopXMLNS,
		       [{<<"id">>, _val} | _attrs], _Id) ->
    decode_client_id_attrs(__TopXMLNS, _attrs, _val);
decode_client_id_attrs(__TopXMLNS, [_ | _attrs], Id) ->
    decode_client_id_attrs(__TopXMLNS, _attrs, Id);
decode_client_id_attrs(__TopXMLNS, [], Id) ->
    decode_client_id_attr_id(__TopXMLNS, Id).

encode_client_id({client_id, Id}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sid:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_client_id_attr_id(Id,
				      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								 __TopXMLNS)),
    {xmlel, <<"client-id">>, _attrs, _els}.

decode_client_id_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"id">>, <<"client-id">>, __TopXMLNS}});
decode_client_id_attr_id(__TopXMLNS, _val) -> _val.

encode_client_id_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_stanza_id(__TopXMLNS, __Opts,
		 {xmlel, <<"stanza-id">>, _attrs, _els}) ->
    {Id, By} = decode_stanza_id_attrs(__TopXMLNS, _attrs,
				      undefined, undefined),
    {stanza_id, By, Id}.

decode_stanza_id_attrs(__TopXMLNS,
		       [{<<"id">>, _val} | _attrs], _Id, By) ->
    decode_stanza_id_attrs(__TopXMLNS, _attrs, _val, By);
decode_stanza_id_attrs(__TopXMLNS,
		       [{<<"by">>, _val} | _attrs], Id, _By) ->
    decode_stanza_id_attrs(__TopXMLNS, _attrs, Id, _val);
decode_stanza_id_attrs(__TopXMLNS, [_ | _attrs], Id,
		       By) ->
    decode_stanza_id_attrs(__TopXMLNS, _attrs, Id, By);
decode_stanza_id_attrs(__TopXMLNS, [], Id, By) ->
    {decode_stanza_id_attr_id(__TopXMLNS, Id),
     decode_stanza_id_attr_by(__TopXMLNS, By)}.

encode_stanza_id({stanza_id, By, Id}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sid:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_stanza_id_attr_by(By,
				      encode_stanza_id_attr_id(Id,
							       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
											  __TopXMLNS))),
    {xmlel, <<"stanza-id">>, _attrs, _els}.

decode_stanza_id_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"id">>, <<"stanza-id">>, __TopXMLNS}});
decode_stanza_id_attr_id(__TopXMLNS, _val) -> _val.

encode_stanza_id_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_stanza_id_attr_by(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"by">>, <<"stanza-id">>, __TopXMLNS}});
decode_stanza_id_attr_by(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"by">>, <<"stanza-id">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_stanza_id_attr_by(_val, _acc) ->
    [{<<"by">>, jid:encode(_val)} | _acc].
