%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0085).

-compile(export_all).

do_decode(<<"paused">>,
	  <<"http://jabber.org/protocol/chatstates">>, El,
	  Opts) ->
    decode_chatstate_paused(<<"http://jabber.org/protocol/chatstates">>,
			    Opts, El);
do_decode(<<"inactive">>,
	  <<"http://jabber.org/protocol/chatstates">>, El,
	  Opts) ->
    decode_chatstate_inactive(<<"http://jabber.org/protocol/chatstates">>,
			      Opts, El);
do_decode(<<"gone">>,
	  <<"http://jabber.org/protocol/chatstates">>, El,
	  Opts) ->
    decode_chatstate_gone(<<"http://jabber.org/protocol/chatstates">>,
			  Opts, El);
do_decode(<<"composing">>,
	  <<"http://jabber.org/protocol/chatstates">>, El,
	  Opts) ->
    decode_chatstate_composing(<<"http://jabber.org/protocol/chatstates">>,
			       Opts, El);
do_decode(<<"active">>,
	  <<"http://jabber.org/protocol/chatstates">>, El,
	  Opts) ->
    decode_chatstate_active(<<"http://jabber.org/protocol/chatstates">>,
			    Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"paused">>,
      <<"http://jabber.org/protocol/chatstates">>},
     {<<"inactive">>,
      <<"http://jabber.org/protocol/chatstates">>},
     {<<"gone">>,
      <<"http://jabber.org/protocol/chatstates">>},
     {<<"composing">>,
      <<"http://jabber.org/protocol/chatstates">>},
     {<<"active">>,
      <<"http://jabber.org/protocol/chatstates">>}].

do_encode({chatstate, active} = Active, TopXMLNS) ->
    encode_chatstate_active(Active, TopXMLNS);
do_encode({chatstate, composing} = Composing,
	  TopXMLNS) ->
    encode_chatstate_composing(Composing, TopXMLNS);
do_encode({chatstate, gone} = Gone, TopXMLNS) ->
    encode_chatstate_gone(Gone, TopXMLNS);
do_encode({chatstate, inactive} = Inactive, TopXMLNS) ->
    encode_chatstate_inactive(Inactive, TopXMLNS);
do_encode({chatstate, paused} = Paused, TopXMLNS) ->
    encode_chatstate_paused(Paused, TopXMLNS).

do_get_name({chatstate, active}) -> <<"active">>;
do_get_name({chatstate, composing}) -> <<"composing">>;
do_get_name({chatstate, gone}) -> <<"gone">>;
do_get_name({chatstate, inactive}) -> <<"inactive">>;
do_get_name({chatstate, paused}) -> <<"paused">>.

do_get_ns({chatstate, active}) ->
    <<"http://jabber.org/protocol/chatstates">>;
do_get_ns({chatstate, composing}) ->
    <<"http://jabber.org/protocol/chatstates">>;
do_get_ns({chatstate, gone}) ->
    <<"http://jabber.org/protocol/chatstates">>;
do_get_ns({chatstate, inactive}) ->
    <<"http://jabber.org/protocol/chatstates">>;
do_get_ns({chatstate, paused}) ->
    <<"http://jabber.org/protocol/chatstates">>.

pp(chatstate, 1) -> [type];
pp(_, _) -> no.

records() -> [{chatstate, 1}].

decode_chatstate_paused(__TopXMLNS, __Opts,
			{xmlel, <<"paused">>, _attrs, _els}) ->
    {chatstate, paused}.

encode_chatstate_paused({chatstate, paused},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/chatstates">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"paused">>, _attrs, _els}.

decode_chatstate_inactive(__TopXMLNS, __Opts,
			  {xmlel, <<"inactive">>, _attrs, _els}) ->
    {chatstate, inactive}.

encode_chatstate_inactive({chatstate, inactive},
			  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/chatstates">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"inactive">>, _attrs, _els}.

decode_chatstate_gone(__TopXMLNS, __Opts,
		      {xmlel, <<"gone">>, _attrs, _els}) ->
    {chatstate, gone}.

encode_chatstate_gone({chatstate, gone}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/chatstates">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"gone">>, _attrs, _els}.

decode_chatstate_composing(__TopXMLNS, __Opts,
			   {xmlel, <<"composing">>, _attrs, _els}) ->
    {chatstate, composing}.

encode_chatstate_composing({chatstate, composing},
			   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/chatstates">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"composing">>, _attrs, _els}.

decode_chatstate_active(__TopXMLNS, __Opts,
			{xmlel, <<"active">>, _attrs, _els}) ->
    {chatstate, active}.

encode_chatstate_active({chatstate, active},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/chatstates">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"active">>, _attrs, _els}.
