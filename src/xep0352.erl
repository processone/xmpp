%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0352).

-compile(export_all).

do_decode(<<"inactive">>, <<"urn:xmpp:csi:0">>, El,
	  Opts) ->
    decode_csi_inactive(<<"urn:xmpp:csi:0">>, Opts, El);
do_decode(<<"active">>, <<"urn:xmpp:csi:0">>, El,
	  Opts) ->
    decode_csi_active(<<"urn:xmpp:csi:0">>, Opts, El);
do_decode(<<"csi">>, <<"urn:xmpp:csi:0">>, El, Opts) ->
    decode_feature_csi(<<"urn:xmpp:csi:0">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"inactive">>, <<"urn:xmpp:csi:0">>},
     {<<"active">>, <<"urn:xmpp:csi:0">>},
     {<<"csi">>, <<"urn:xmpp:csi:0">>}].

do_encode({feature_csi, <<"urn:xmpp:csi:0">>} = Csi,
	  TopXMLNS) ->
    encode_feature_csi(Csi, TopXMLNS);
do_encode({feature_csi, <<>>} = Csi,
	  TopXMLNS = <<"urn:xmpp:csi:0">>) ->
    encode_feature_csi(Csi, TopXMLNS);
do_encode({csi, active} = Active, TopXMLNS) ->
    encode_csi_active(Active, TopXMLNS);
do_encode({csi, inactive} = Inactive, TopXMLNS) ->
    encode_csi_inactive(Inactive, TopXMLNS).

do_get_name({csi, active}) -> <<"active">>;
do_get_name({csi, inactive}) -> <<"inactive">>;
do_get_name({feature_csi, _}) -> <<"csi">>.

do_get_ns({csi, active}) -> <<"urn:xmpp:csi:0">>;
do_get_ns({csi, inactive}) -> <<"urn:xmpp:csi:0">>;
do_get_ns({feature_csi, Xmlns}) -> Xmlns.

pp(feature_csi, 1) -> [xmlns];
pp(csi, 1) -> [type];
pp(_, _) -> no.

records() -> [{feature_csi, 1}, {csi, 1}].

decode_csi_inactive(__TopXMLNS, __Opts,
		    {xmlel, <<"inactive">>, _attrs, _els}) ->
    {csi, inactive}.

encode_csi_inactive({csi, inactive}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:csi:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"inactive">>, _attrs, _els}.

decode_csi_active(__TopXMLNS, __Opts,
		  {xmlel, <<"active">>, _attrs, _els}) ->
    {csi, active}.

encode_csi_active({csi, active}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:csi:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"active">>, _attrs, _els}.

decode_feature_csi(__TopXMLNS, __Opts,
		   {xmlel, <<"csi">>, _attrs, _els}) ->
    Xmlns = decode_feature_csi_attrs(__TopXMLNS, _attrs,
				     undefined),
    {feature_csi, Xmlns}.

decode_feature_csi_attrs(__TopXMLNS,
			 [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_feature_csi_attrs(__TopXMLNS, _attrs, _val);
decode_feature_csi_attrs(__TopXMLNS, [_ | _attrs],
			 Xmlns) ->
    decode_feature_csi_attrs(__TopXMLNS, _attrs, Xmlns);
decode_feature_csi_attrs(__TopXMLNS, [], Xmlns) ->
    decode_feature_csi_attr_xmlns(__TopXMLNS, Xmlns).

encode_feature_csi({feature_csi, Xmlns}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:csi:0">>],
						__TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"csi">>, _attrs, _els}.

decode_feature_csi_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_feature_csi_attr_xmlns(__TopXMLNS, _val) -> _val.
