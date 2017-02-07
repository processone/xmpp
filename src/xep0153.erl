%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0153).

-compile(export_all).

do_decode(<<"x">>, <<"vcard-temp:x:update">>, El,
	  Opts) ->
    decode_vcard_xupdate(<<"vcard-temp:x:update">>, Opts,
			 El);
do_decode(<<"photo">>, <<"vcard-temp:x:update">>, El,
	  Opts) ->
    decode_vcard_xupdate_photo(<<"vcard-temp:x:update">>,
			       Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"x">>, <<"vcard-temp:x:update">>},
     {<<"photo">>, <<"vcard-temp:x:update">>}].

do_encode({vcard_xupdate, _, _} = X, TopXMLNS) ->
    encode_vcard_xupdate(X, TopXMLNS).

do_get_name({vcard_xupdate, _, _}) -> <<"x">>.

do_get_ns({vcard_xupdate, _, _}) ->
    <<"vcard-temp:x:update">>.

pp(vcard_xupdate, 2) -> [us, hash];
pp(_, _) -> no.

records() -> [{vcard_xupdate, 2}].

decode_vcard_xupdate(__TopXMLNS, __Opts,
		     {xmlel, <<"x">>, _attrs, _els}) ->
    Hash = decode_vcard_xupdate_els(__TopXMLNS, __Opts,
				    _els, undefined),
    {vcard_xupdate, {<<>>, <<>>}, Hash}.

decode_vcard_xupdate_els(__TopXMLNS, __Opts, [],
			 Hash) ->
    Hash;
decode_vcard_xupdate_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"photo">>, _attrs, _} = _el | _els],
			 Hash) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp:x:update">> ->
	  decode_vcard_xupdate_els(__TopXMLNS, __Opts, _els,
				   decode_vcard_xupdate_photo(<<"vcard-temp:x:update">>,
							      __Opts, _el));
      _ ->
	  decode_vcard_xupdate_els(__TopXMLNS, __Opts, _els, Hash)
    end;
decode_vcard_xupdate_els(__TopXMLNS, __Opts, [_ | _els],
			 Hash) ->
    decode_vcard_xupdate_els(__TopXMLNS, __Opts, _els,
			     Hash).

encode_vcard_xupdate({vcard_xupdate, _, Hash},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp:x:update">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_vcard_xupdate_$hash'(Hash,
						      __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"x">>, _attrs, _els}.

'encode_vcard_xupdate_$hash'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_vcard_xupdate_$hash'(Hash, __TopXMLNS, _acc) ->
    [encode_vcard_xupdate_photo(Hash, __TopXMLNS) | _acc].

decode_vcard_xupdate_photo(__TopXMLNS, __Opts,
			   {xmlel, <<"photo">>, _attrs, _els}) ->
    Cdata = decode_vcard_xupdate_photo_els(__TopXMLNS,
					   __Opts, _els, <<>>),
    Cdata.

decode_vcard_xupdate_photo_els(__TopXMLNS, __Opts, [],
			       Cdata) ->
    decode_vcard_xupdate_photo_cdata(__TopXMLNS, Cdata);
decode_vcard_xupdate_photo_els(__TopXMLNS, __Opts,
			       [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_xupdate_photo_els(__TopXMLNS, __Opts, _els,
				   <<Cdata/binary, _data/binary>>);
decode_vcard_xupdate_photo_els(__TopXMLNS, __Opts,
			       [_ | _els], Cdata) ->
    decode_vcard_xupdate_photo_els(__TopXMLNS, __Opts, _els,
				   Cdata).

encode_vcard_xupdate_photo(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp:x:update">>,
				    [], __TopXMLNS),
    _els = encode_vcard_xupdate_photo_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"photo">>, _attrs, _els}.

decode_vcard_xupdate_photo_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_vcard_xupdate_photo_cdata(__TopXMLNS, _val) ->
    _val.

encode_vcard_xupdate_photo_cdata(<<>>, _acc) -> _acc;
encode_vcard_xupdate_photo_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
