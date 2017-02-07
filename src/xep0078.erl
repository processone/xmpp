%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0078).

-compile(export_all).

do_decode(<<"auth">>,
	  <<"http://jabber.org/features/iq-auth">>, El, Opts) ->
    decode_legacy_auth_feature(<<"http://jabber.org/features/iq-auth">>,
			       Opts, El);
do_decode(<<"query">>, <<"jabber:iq:auth">>, El,
	  Opts) ->
    decode_legacy_auth(<<"jabber:iq:auth">>, Opts, El);
do_decode(<<"resource">>, <<"jabber:iq:auth">>, El,
	  Opts) ->
    decode_legacy_auth_resource(<<"jabber:iq:auth">>, Opts,
				El);
do_decode(<<"digest">>, <<"jabber:iq:auth">>, El,
	  Opts) ->
    decode_legacy_auth_digest(<<"jabber:iq:auth">>, Opts,
			      El);
do_decode(<<"password">>, <<"jabber:iq:auth">>, El,
	  Opts) ->
    decode_legacy_auth_password(<<"jabber:iq:auth">>, Opts,
				El);
do_decode(<<"username">>, <<"jabber:iq:auth">>, El,
	  Opts) ->
    decode_legacy_auth_username(<<"jabber:iq:auth">>, Opts,
				El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"auth">>, <<"http://jabber.org/features/iq-auth">>},
     {<<"query">>, <<"jabber:iq:auth">>},
     {<<"resource">>, <<"jabber:iq:auth">>},
     {<<"digest">>, <<"jabber:iq:auth">>},
     {<<"password">>, <<"jabber:iq:auth">>},
     {<<"username">>, <<"jabber:iq:auth">>}].

do_encode({legacy_auth, _, _, _, _} = Query,
	  TopXMLNS) ->
    encode_legacy_auth(Query, TopXMLNS);
do_encode({legacy_auth_feature} = Auth, TopXMLNS) ->
    encode_legacy_auth_feature(Auth, TopXMLNS).

do_get_name({legacy_auth, _, _, _, _}) -> <<"query">>;
do_get_name({legacy_auth_feature}) -> <<"auth">>.

do_get_ns({legacy_auth, _, _, _, _}) ->
    <<"jabber:iq:auth">>;
do_get_ns({legacy_auth_feature}) ->
    <<"http://jabber.org/features/iq-auth">>.

pp(legacy_auth, 4) ->
    [username, password, digest, resource];
pp(legacy_auth_feature, 0) -> [];
pp(_, _) -> no.

records() ->
    [{legacy_auth, 4}, {legacy_auth_feature, 0}].

decode_legacy_auth_feature(__TopXMLNS, __Opts,
			   {xmlel, <<"auth">>, _attrs, _els}) ->
    {legacy_auth_feature}.

encode_legacy_auth_feature({legacy_auth_feature},
			   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/features/iq-auth">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"auth">>, _attrs, _els}.

decode_legacy_auth(__TopXMLNS, __Opts,
		   {xmlel, <<"query">>, _attrs, _els}) ->
    {Digest, Password, Resource, Username} =
	decode_legacy_auth_els(__TopXMLNS, __Opts, _els,
			       undefined, undefined, undefined, undefined),
    {legacy_auth, Username, Password, Digest, Resource}.

decode_legacy_auth_els(__TopXMLNS, __Opts, [], Digest,
		       Password, Resource, Username) ->
    {Digest, Password, Resource, Username};
decode_legacy_auth_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"username">>, _attrs, _} = _el | _els],
		       Digest, Password, Resource, Username) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:auth">> ->
	  decode_legacy_auth_els(__TopXMLNS, __Opts, _els, Digest,
				 Password, Resource,
				 decode_legacy_auth_username(<<"jabber:iq:auth">>,
							     __Opts, _el));
      _ ->
	  decode_legacy_auth_els(__TopXMLNS, __Opts, _els, Digest,
				 Password, Resource, Username)
    end;
decode_legacy_auth_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"password">>, _attrs, _} = _el | _els],
		       Digest, Password, Resource, Username) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:auth">> ->
	  decode_legacy_auth_els(__TopXMLNS, __Opts, _els, Digest,
				 decode_legacy_auth_password(<<"jabber:iq:auth">>,
							     __Opts, _el),
				 Resource, Username);
      _ ->
	  decode_legacy_auth_els(__TopXMLNS, __Opts, _els, Digest,
				 Password, Resource, Username)
    end;
decode_legacy_auth_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"digest">>, _attrs, _} = _el | _els], Digest,
		       Password, Resource, Username) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:auth">> ->
	  decode_legacy_auth_els(__TopXMLNS, __Opts, _els,
				 decode_legacy_auth_digest(<<"jabber:iq:auth">>,
							   __Opts, _el),
				 Password, Resource, Username);
      _ ->
	  decode_legacy_auth_els(__TopXMLNS, __Opts, _els, Digest,
				 Password, Resource, Username)
    end;
decode_legacy_auth_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"resource">>, _attrs, _} = _el | _els],
		       Digest, Password, Resource, Username) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:auth">> ->
	  decode_legacy_auth_els(__TopXMLNS, __Opts, _els, Digest,
				 Password,
				 decode_legacy_auth_resource(<<"jabber:iq:auth">>,
							     __Opts, _el),
				 Username);
      _ ->
	  decode_legacy_auth_els(__TopXMLNS, __Opts, _els, Digest,
				 Password, Resource, Username)
    end;
decode_legacy_auth_els(__TopXMLNS, __Opts, [_ | _els],
		       Digest, Password, Resource, Username) ->
    decode_legacy_auth_els(__TopXMLNS, __Opts, _els, Digest,
			   Password, Resource, Username).

encode_legacy_auth({legacy_auth, Username, Password,
		    Digest, Resource},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:auth">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_legacy_auth_$digest'(Digest,
						   __NewTopXMLNS,
						   'encode_legacy_auth_$password'(Password,
										  __NewTopXMLNS,
										  'encode_legacy_auth_$resource'(Resource,
														 __NewTopXMLNS,
														 'encode_legacy_auth_$username'(Username,
																		__NewTopXMLNS,
																		[]))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_legacy_auth_$digest'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_legacy_auth_$digest'(Digest, __TopXMLNS,
			     _acc) ->
    [encode_legacy_auth_digest(Digest, __TopXMLNS) | _acc].

'encode_legacy_auth_$password'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_legacy_auth_$password'(Password, __TopXMLNS,
			       _acc) ->
    [encode_legacy_auth_password(Password, __TopXMLNS)
     | _acc].

'encode_legacy_auth_$resource'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_legacy_auth_$resource'(Resource, __TopXMLNS,
			       _acc) ->
    [encode_legacy_auth_resource(Resource, __TopXMLNS)
     | _acc].

'encode_legacy_auth_$username'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_legacy_auth_$username'(Username, __TopXMLNS,
			       _acc) ->
    [encode_legacy_auth_username(Username, __TopXMLNS)
     | _acc].

decode_legacy_auth_resource(__TopXMLNS, __Opts,
			    {xmlel, <<"resource">>, _attrs, _els}) ->
    Cdata = decode_legacy_auth_resource_els(__TopXMLNS,
					    __Opts, _els, <<>>),
    Cdata.

decode_legacy_auth_resource_els(__TopXMLNS, __Opts, [],
				Cdata) ->
    decode_legacy_auth_resource_cdata(__TopXMLNS, Cdata);
decode_legacy_auth_resource_els(__TopXMLNS, __Opts,
				[{xmlcdata, _data} | _els], Cdata) ->
    decode_legacy_auth_resource_els(__TopXMLNS, __Opts,
				    _els, <<Cdata/binary, _data/binary>>);
decode_legacy_auth_resource_els(__TopXMLNS, __Opts,
				[_ | _els], Cdata) ->
    decode_legacy_auth_resource_els(__TopXMLNS, __Opts,
				    _els, Cdata).

encode_legacy_auth_resource(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:auth">>, [],
				    __TopXMLNS),
    _els = encode_legacy_auth_resource_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"resource">>, _attrs, _els}.

decode_legacy_auth_resource_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_legacy_auth_resource_cdata(__TopXMLNS, _val) ->
    _val.

encode_legacy_auth_resource_cdata(<<>>, _acc) -> _acc;
encode_legacy_auth_resource_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_legacy_auth_digest(__TopXMLNS, __Opts,
			  {xmlel, <<"digest">>, _attrs, _els}) ->
    Cdata = decode_legacy_auth_digest_els(__TopXMLNS,
					  __Opts, _els, <<>>),
    Cdata.

decode_legacy_auth_digest_els(__TopXMLNS, __Opts, [],
			      Cdata) ->
    decode_legacy_auth_digest_cdata(__TopXMLNS, Cdata);
decode_legacy_auth_digest_els(__TopXMLNS, __Opts,
			      [{xmlcdata, _data} | _els], Cdata) ->
    decode_legacy_auth_digest_els(__TopXMLNS, __Opts, _els,
				  <<Cdata/binary, _data/binary>>);
decode_legacy_auth_digest_els(__TopXMLNS, __Opts,
			      [_ | _els], Cdata) ->
    decode_legacy_auth_digest_els(__TopXMLNS, __Opts, _els,
				  Cdata).

encode_legacy_auth_digest(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:auth">>, [],
				    __TopXMLNS),
    _els = encode_legacy_auth_digest_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"digest">>, _attrs, _els}.

decode_legacy_auth_digest_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_legacy_auth_digest_cdata(__TopXMLNS, _val) ->
    _val.

encode_legacy_auth_digest_cdata(<<>>, _acc) -> _acc;
encode_legacy_auth_digest_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_legacy_auth_password(__TopXMLNS, __Opts,
			    {xmlel, <<"password">>, _attrs, _els}) ->
    Cdata = decode_legacy_auth_password_els(__TopXMLNS,
					    __Opts, _els, <<>>),
    Cdata.

decode_legacy_auth_password_els(__TopXMLNS, __Opts, [],
				Cdata) ->
    decode_legacy_auth_password_cdata(__TopXMLNS, Cdata);
decode_legacy_auth_password_els(__TopXMLNS, __Opts,
				[{xmlcdata, _data} | _els], Cdata) ->
    decode_legacy_auth_password_els(__TopXMLNS, __Opts,
				    _els, <<Cdata/binary, _data/binary>>);
decode_legacy_auth_password_els(__TopXMLNS, __Opts,
				[_ | _els], Cdata) ->
    decode_legacy_auth_password_els(__TopXMLNS, __Opts,
				    _els, Cdata).

encode_legacy_auth_password(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:auth">>, [],
				    __TopXMLNS),
    _els = encode_legacy_auth_password_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"password">>, _attrs, _els}.

decode_legacy_auth_password_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_legacy_auth_password_cdata(__TopXMLNS, _val) ->
    _val.

encode_legacy_auth_password_cdata(<<>>, _acc) -> _acc;
encode_legacy_auth_password_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_legacy_auth_username(__TopXMLNS, __Opts,
			    {xmlel, <<"username">>, _attrs, _els}) ->
    Cdata = decode_legacy_auth_username_els(__TopXMLNS,
					    __Opts, _els, <<>>),
    Cdata.

decode_legacy_auth_username_els(__TopXMLNS, __Opts, [],
				Cdata) ->
    decode_legacy_auth_username_cdata(__TopXMLNS, Cdata);
decode_legacy_auth_username_els(__TopXMLNS, __Opts,
				[{xmlcdata, _data} | _els], Cdata) ->
    decode_legacy_auth_username_els(__TopXMLNS, __Opts,
				    _els, <<Cdata/binary, _data/binary>>);
decode_legacy_auth_username_els(__TopXMLNS, __Opts,
				[_ | _els], Cdata) ->
    decode_legacy_auth_username_els(__TopXMLNS, __Opts,
				    _els, Cdata).

encode_legacy_auth_username(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:auth">>, [],
				    __TopXMLNS),
    _els = encode_legacy_auth_username_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"username">>, _attrs, _els}.

decode_legacy_auth_username_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_legacy_auth_username_cdata(__TopXMLNS, _val) ->
    _val.

encode_legacy_auth_username_cdata(<<>>, _acc) -> _acc;
encode_legacy_auth_username_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
