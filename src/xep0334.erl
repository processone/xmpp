%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0334).

-compile(export_all).

do_decode(<<"no-permanent-storage">>,
	  <<"urn:xmpp:hints">>, El, Opts) ->
    decode_hint_no_permanent_storage(<<"urn:xmpp:hints">>,
				     Opts, El);
do_decode(<<"no-permanent-store">>,
	  <<"urn:xmpp:hints">>, El, Opts) ->
    decode_hint_no_permanent_store(<<"urn:xmpp:hints">>,
				   Opts, El);
do_decode(<<"store">>, <<"urn:xmpp:hints">>, El,
	  Opts) ->
    decode_hint_store(<<"urn:xmpp:hints">>, Opts, El);
do_decode(<<"no-storage">>, <<"urn:xmpp:hints">>, El,
	  Opts) ->
    decode_hint_no_storage(<<"urn:xmpp:hints">>, Opts, El);
do_decode(<<"no-store">>, <<"urn:xmpp:hints">>, El,
	  Opts) ->
    decode_hint_no_store(<<"urn:xmpp:hints">>, Opts, El);
do_decode(<<"no-copy">>, <<"urn:xmpp:hints">>, El,
	  Opts) ->
    decode_hint_no_copy(<<"urn:xmpp:hints">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"no-permanent-storage">>, <<"urn:xmpp:hints">>},
     {<<"no-permanent-store">>, <<"urn:xmpp:hints">>},
     {<<"store">>, <<"urn:xmpp:hints">>},
     {<<"no-storage">>, <<"urn:xmpp:hints">>},
     {<<"no-store">>, <<"urn:xmpp:hints">>},
     {<<"no-copy">>, <<"urn:xmpp:hints">>}].

do_encode({hint, 'no-copy'} = No_copy, TopXMLNS) ->
    encode_hint_no_copy(No_copy, TopXMLNS);
do_encode({hint, 'no-store'} = No_store, TopXMLNS) ->
    encode_hint_no_store(No_store, TopXMLNS);
do_encode({hint, 'no-storage'} = No_storage,
	  TopXMLNS) ->
    encode_hint_no_storage(No_storage, TopXMLNS);
do_encode({hint, store} = Store, TopXMLNS) ->
    encode_hint_store(Store, TopXMLNS);
do_encode({hint, 'no-permanent-store'} =
	      No_permanent_store,
	  TopXMLNS) ->
    encode_hint_no_permanent_store(No_permanent_store,
				   TopXMLNS);
do_encode({hint, 'no-permanent-storage'} =
	      No_permanent_storage,
	  TopXMLNS) ->
    encode_hint_no_permanent_storage(No_permanent_storage,
				     TopXMLNS).

do_get_name({hint, 'no-copy'}) -> <<"no-copy">>;
do_get_name({hint, 'no-permanent-storage'}) ->
    <<"no-permanent-storage">>;
do_get_name({hint, 'no-permanent-store'}) ->
    <<"no-permanent-store">>;
do_get_name({hint, 'no-storage'}) -> <<"no-storage">>;
do_get_name({hint, 'no-store'}) -> <<"no-store">>;
do_get_name({hint, store}) -> <<"store">>.

do_get_ns({hint, 'no-copy'}) -> <<"urn:xmpp:hints">>;
do_get_ns({hint, 'no-permanent-storage'}) ->
    <<"urn:xmpp:hints">>;
do_get_ns({hint, 'no-permanent-store'}) ->
    <<"urn:xmpp:hints">>;
do_get_ns({hint, 'no-storage'}) -> <<"urn:xmpp:hints">>;
do_get_ns({hint, 'no-store'}) -> <<"urn:xmpp:hints">>;
do_get_ns({hint, store}) -> <<"urn:xmpp:hints">>.

pp(hint, 1) -> [type];
pp(_, _) -> no.

records() -> [{hint, 1}].

decode_hint_no_permanent_storage(__TopXMLNS, __Opts,
				 {xmlel, <<"no-permanent-storage">>, _attrs,
				  _els}) ->
    {hint, 'no-permanent-storage'}.

encode_hint_no_permanent_storage({hint,
				  'no-permanent-storage'},
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:hints">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"no-permanent-storage">>, _attrs, _els}.

decode_hint_no_permanent_store(__TopXMLNS, __Opts,
			       {xmlel, <<"no-permanent-store">>, _attrs,
				_els}) ->
    {hint, 'no-permanent-store'}.

encode_hint_no_permanent_store({hint,
				'no-permanent-store'},
			       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:hints">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"no-permanent-store">>, _attrs, _els}.

decode_hint_store(__TopXMLNS, __Opts,
		  {xmlel, <<"store">>, _attrs, _els}) ->
    {hint, store}.

encode_hint_store({hint, store}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:hints">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"store">>, _attrs, _els}.

decode_hint_no_storage(__TopXMLNS, __Opts,
		       {xmlel, <<"no-storage">>, _attrs, _els}) ->
    {hint, 'no-storage'}.

encode_hint_no_storage({hint, 'no-storage'},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:hints">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"no-storage">>, _attrs, _els}.

decode_hint_no_store(__TopXMLNS, __Opts,
		     {xmlel, <<"no-store">>, _attrs, _els}) ->
    {hint, 'no-store'}.

encode_hint_no_store({hint, 'no-store'}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:hints">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"no-store">>, _attrs, _els}.

decode_hint_no_copy(__TopXMLNS, __Opts,
		    {xmlel, <<"no-copy">>, _attrs, _els}) ->
    {hint, 'no-copy'}.

encode_hint_no_copy({hint, 'no-copy'}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:hints">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"no-copy">>, _attrs, _els}.
