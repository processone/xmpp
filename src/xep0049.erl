%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0049).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:private">>, El,
	  Opts) ->
    decode_private(<<"jabber:iq:private">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"jabber:iq:private">>}].

do_encode({private, _} = Query, TopXMLNS) ->
    encode_private(Query, TopXMLNS).

do_get_name({private, _}) -> <<"query">>.

do_get_ns({private, _}) -> <<"jabber:iq:private">>.

pp(private, 1) -> [xml_els];
pp(_, _) -> no.

records() -> [{private, 1}].

decode_private(__TopXMLNS, __Opts,
	       {xmlel, <<"query">>, _attrs, _els}) ->
    __Xmls = decode_private_els(__TopXMLNS, __Opts, _els,
				[]),
    {private, __Xmls}.

decode_private_els(__TopXMLNS, __Opts, [], __Xmls) ->
    lists:reverse(__Xmls);
decode_private_els(__TopXMLNS, __Opts,
		   [{xmlel, _name, _attrs, _} = _el | _els], __Xmls) ->
    decode_private_els(__TopXMLNS, __Opts, _els,
		       [_el | __Xmls]);
decode_private_els(__TopXMLNS, __Opts, [_ | _els],
		   __Xmls) ->
    decode_private_els(__TopXMLNS, __Opts, _els, __Xmls).

encode_private({private, __Xmls}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:private">>, [],
				    __TopXMLNS),
    _els = __Xmls,
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.
