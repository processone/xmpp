%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0114).

-compile(export_all).

do_decode(<<"handshake">>,
	  <<"jabber:component:accept">>, El, Opts) ->
    decode_handshake(<<"jabber:component:accept">>, Opts,
		     El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"handshake">>, <<"jabber:component:accept">>}].

do_encode({handshake, _} = Handshake, TopXMLNS) ->
    encode_handshake(Handshake, TopXMLNS).

do_get_name({handshake, _}) -> <<"handshake">>.

do_get_ns({handshake, _}) ->
    <<"jabber:component:accept">>.

pp(handshake, 1) -> [data];
pp(_, _) -> no.

records() -> [{handshake, 1}].

decode_handshake(__TopXMLNS, __Opts,
		 {xmlel, <<"handshake">>, _attrs, _els}) ->
    Data = decode_handshake_els(__TopXMLNS, __Opts, _els,
				<<>>),
    {handshake, Data}.

decode_handshake_els(__TopXMLNS, __Opts, [], Data) ->
    decode_handshake_cdata(__TopXMLNS, Data);
decode_handshake_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Data) ->
    decode_handshake_els(__TopXMLNS, __Opts, _els,
			 <<Data/binary, _data/binary>>);
decode_handshake_els(__TopXMLNS, __Opts, [_ | _els],
		     Data) ->
    decode_handshake_els(__TopXMLNS, __Opts, _els, Data).

encode_handshake({handshake, Data}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:component:accept">>,
				    [], __TopXMLNS),
    _els = encode_handshake_cdata(Data, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"handshake">>, _attrs, _els}.

decode_handshake_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_handshake_cdata(__TopXMLNS, _val) -> _val.

encode_handshake_cdata(<<>>, _acc) -> _acc;
encode_handshake_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
