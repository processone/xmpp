%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0199).

-compile(export_all).

do_decode(<<"ping">>, <<"urn:xmpp:ping">>, El, Opts) ->
    decode_ping(<<"urn:xmpp:ping">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"ping">>, <<"urn:xmpp:ping">>}].

do_encode({ping} = Ping, TopXMLNS) ->
    encode_ping(Ping, TopXMLNS).

do_get_name({ping}) -> <<"ping">>.

do_get_ns({ping}) -> <<"urn:xmpp:ping">>.

pp(ping, 0) -> [];
pp(_, _) -> no.

records() -> [{ping, 0}].

decode_ping(__TopXMLNS, __Opts,
	    {xmlel, <<"ping">>, _attrs, _els}) ->
    {ping}.

encode_ping({ping}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:ping">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ping">>, _attrs, _els}.
