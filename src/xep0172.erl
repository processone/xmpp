%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0172).

-compile(export_all).

do_decode(<<"nick">>,
	  <<"http://jabber.org/protocol/nick">>, El, Opts) ->
    decode_nick(<<"http://jabber.org/protocol/nick">>, Opts,
		El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"nick">>, <<"http://jabber.org/protocol/nick">>}].

do_encode({nick, _} = Nick, TopXMLNS) ->
    encode_nick(Nick, TopXMLNS).

do_get_name({nick, _}) -> <<"nick">>.

do_get_ns({nick, _}) ->
    <<"http://jabber.org/protocol/nick">>.

pp(nick, 1) -> [name];
pp(_, _) -> no.

records() -> [{nick, 1}].

decode_nick(__TopXMLNS, __Opts,
	    {xmlel, <<"nick">>, _attrs, _els}) ->
    Name = decode_nick_els(__TopXMLNS, __Opts, _els, <<>>),
    {nick, Name}.

decode_nick_els(__TopXMLNS, __Opts, [], Name) ->
    decode_nick_cdata(__TopXMLNS, Name);
decode_nick_els(__TopXMLNS, __Opts,
		[{xmlcdata, _data} | _els], Name) ->
    decode_nick_els(__TopXMLNS, __Opts, _els,
		    <<Name/binary, _data/binary>>);
decode_nick_els(__TopXMLNS, __Opts, [_ | _els], Name) ->
    decode_nick_els(__TopXMLNS, __Opts, _els, Name).

encode_nick({nick, Name}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/nick">>,
				    [], __TopXMLNS),
    _els = encode_nick_cdata(Name, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"nick">>, _attrs, _els}.

decode_nick_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"nick">>, __TopXMLNS}});
decode_nick_cdata(__TopXMLNS, _val) -> _val.

encode_nick_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
