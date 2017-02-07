%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(p1_stream).

-compile(export_all).

do_decode(<<"ack">>, <<"p1:ack">>, El, Opts) ->
    decode_p1_ack(<<"p1:ack">>, Opts, El);
do_decode(<<"rebind">>, <<"p1:rebind">>, El, Opts) ->
    decode_p1_rebind(<<"p1:rebind">>, Opts, El);
do_decode(<<"push">>, <<"p1:push">>, El, Opts) ->
    decode_p1_push(<<"p1:push">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"ack">>, <<"p1:ack">>},
     {<<"rebind">>, <<"p1:rebind">>},
     {<<"push">>, <<"p1:push">>}].

do_encode({p1_push} = Push, TopXMLNS) ->
    encode_p1_push(Push, TopXMLNS);
do_encode({p1_rebind} = Rebind, TopXMLNS) ->
    encode_p1_rebind(Rebind, TopXMLNS);
do_encode({p1_ack} = Ack, TopXMLNS) ->
    encode_p1_ack(Ack, TopXMLNS).

do_get_name({p1_ack}) -> <<"ack">>;
do_get_name({p1_push}) -> <<"push">>;
do_get_name({p1_rebind}) -> <<"rebind">>.

do_get_ns({p1_ack}) -> <<"p1:ack">>;
do_get_ns({p1_push}) -> <<"p1:push">>;
do_get_ns({p1_rebind}) -> <<"p1:rebind">>.

pp(p1_push, 0) -> [];
pp(p1_rebind, 0) -> [];
pp(p1_ack, 0) -> [];
pp(_, _) -> no.

records() ->
    [{p1_push, 0}, {p1_rebind, 0}, {p1_ack, 0}].

decode_p1_ack(__TopXMLNS, __Opts,
	      {xmlel, <<"ack">>, _attrs, _els}) ->
    {p1_ack}.

encode_p1_ack({p1_ack}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"p1:ack">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ack">>, _attrs, _els}.

decode_p1_rebind(__TopXMLNS, __Opts,
		 {xmlel, <<"rebind">>, _attrs, _els}) ->
    {p1_rebind}.

encode_p1_rebind({p1_rebind}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"p1:rebind">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"rebind">>, _attrs, _els}.

decode_p1_push(__TopXMLNS, __Opts,
	       {xmlel, <<"push">>, _attrs, _els}) ->
    {p1_push}.

encode_p1_push({p1_push}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"p1:push">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"push">>, _attrs, _els}.
