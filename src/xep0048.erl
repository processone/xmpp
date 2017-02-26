%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0048).

-compile(export_all).

do_decode(<<"storage">>, <<"storage:bookmarks">>, El,
	  Opts) ->
    decode_bookmarks_storage(<<"storage:bookmarks">>, Opts,
			     El);
do_decode(<<"url">>, <<"storage:bookmarks">>, El,
	  Opts) ->
    decode_bookmark_url(<<"storage:bookmarks">>, Opts, El);
do_decode(<<"conference">>, <<"storage:bookmarks">>, El,
	  Opts) ->
    decode_bookmark_conference(<<"storage:bookmarks">>,
			       Opts, El);
do_decode(<<"password">>, <<"storage:bookmarks">>, El,
	  Opts) ->
    decode_conference_password(<<"storage:bookmarks">>,
			       Opts, El);
do_decode(<<"nick">>, <<"storage:bookmarks">>, El,
	  Opts) ->
    decode_conference_nick(<<"storage:bookmarks">>, Opts,
			   El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"storage">>, <<"storage:bookmarks">>},
     {<<"url">>, <<"storage:bookmarks">>},
     {<<"conference">>, <<"storage:bookmarks">>},
     {<<"password">>, <<"storage:bookmarks">>},
     {<<"nick">>, <<"storage:bookmarks">>}].

do_encode({bookmark_conference, _, _, _, _, _} =
	      Conference,
	  TopXMLNS) ->
    encode_bookmark_conference(Conference, TopXMLNS);
do_encode({bookmark_url, _, _} = Url, TopXMLNS) ->
    encode_bookmark_url(Url, TopXMLNS);
do_encode({bookmark_storage, _, _} = Storage,
	  TopXMLNS) ->
    encode_bookmarks_storage(Storage, TopXMLNS).

do_get_name({bookmark_conference, _, _, _, _, _}) ->
    <<"conference">>;
do_get_name({bookmark_storage, _, _}) -> <<"storage">>;
do_get_name({bookmark_url, _, _}) -> <<"url">>.

do_get_ns({bookmark_conference, _, _, _, _, _}) ->
    <<"storage:bookmarks">>;
do_get_ns({bookmark_storage, _, _}) ->
    <<"storage:bookmarks">>;
do_get_ns({bookmark_url, _, _}) ->
    <<"storage:bookmarks">>.

pp(bookmark_conference, 5) ->
    [name, jid, autojoin, nick, password];
pp(bookmark_url, 2) -> [name, url];
pp(bookmark_storage, 2) -> [conference, url];
pp(_, _) -> no.

records() ->
    [{bookmark_conference, 5}, {bookmark_url, 2},
     {bookmark_storage, 2}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

decode_bookmarks_storage(__TopXMLNS, __Opts,
			 {xmlel, <<"storage">>, _attrs, _els}) ->
    {Conference, Url} =
	decode_bookmarks_storage_els(__TopXMLNS, __Opts, _els,
				     [], []),
    {bookmark_storage, Conference, Url}.

decode_bookmarks_storage_els(__TopXMLNS, __Opts, [],
			     Conference, Url) ->
    {lists:reverse(Conference), lists:reverse(Url)};
decode_bookmarks_storage_els(__TopXMLNS, __Opts,
			     [{xmlel, <<"conference">>, _attrs, _} = _el
			      | _els],
			     Conference, Url) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"storage:bookmarks">> ->
	  decode_bookmarks_storage_els(__TopXMLNS, __Opts, _els,
				       [decode_bookmark_conference(<<"storage:bookmarks">>,
								   __Opts, _el)
					| Conference],
				       Url);
      _ ->
	  decode_bookmarks_storage_els(__TopXMLNS, __Opts, _els,
				       Conference, Url)
    end;
decode_bookmarks_storage_els(__TopXMLNS, __Opts,
			     [{xmlel, <<"url">>, _attrs, _} = _el | _els],
			     Conference, Url) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"storage:bookmarks">> ->
	  decode_bookmarks_storage_els(__TopXMLNS, __Opts, _els,
				       Conference,
				       [decode_bookmark_url(<<"storage:bookmarks">>,
							    __Opts, _el)
					| Url]);
      _ ->
	  decode_bookmarks_storage_els(__TopXMLNS, __Opts, _els,
				       Conference, Url)
    end;
decode_bookmarks_storage_els(__TopXMLNS, __Opts,
			     [_ | _els], Conference, Url) ->
    decode_bookmarks_storage_els(__TopXMLNS, __Opts, _els,
				 Conference, Url).

encode_bookmarks_storage({bookmark_storage, Conference,
			  Url},
			 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"storage:bookmarks">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_bookmarks_storage_$conference'(Conference,
							     __NewTopXMLNS,
							     'encode_bookmarks_storage_$url'(Url,
											     __NewTopXMLNS,
											     []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"storage">>, _attrs, _els}.

'encode_bookmarks_storage_$conference'([], __TopXMLNS,
				       _acc) ->
    _acc;
'encode_bookmarks_storage_$conference'([Conference
					| _els],
				       __TopXMLNS, _acc) ->
    'encode_bookmarks_storage_$conference'(_els, __TopXMLNS,
					   [encode_bookmark_conference(Conference,
								       __TopXMLNS)
					    | _acc]).

'encode_bookmarks_storage_$url'([], __TopXMLNS, _acc) ->
    _acc;
'encode_bookmarks_storage_$url'([Url | _els],
				__TopXMLNS, _acc) ->
    'encode_bookmarks_storage_$url'(_els, __TopXMLNS,
				    [encode_bookmark_url(Url, __TopXMLNS)
				     | _acc]).

decode_bookmark_url(__TopXMLNS, __Opts,
		    {xmlel, <<"url">>, _attrs, _els}) ->
    {Name, Url} = decode_bookmark_url_attrs(__TopXMLNS,
					    _attrs, undefined, undefined),
    {bookmark_url, Name, Url}.

decode_bookmark_url_attrs(__TopXMLNS,
			  [{<<"name">>, _val} | _attrs], _Name, Url) ->
    decode_bookmark_url_attrs(__TopXMLNS, _attrs, _val,
			      Url);
decode_bookmark_url_attrs(__TopXMLNS,
			  [{<<"url">>, _val} | _attrs], Name, _Url) ->
    decode_bookmark_url_attrs(__TopXMLNS, _attrs, Name,
			      _val);
decode_bookmark_url_attrs(__TopXMLNS, [_ | _attrs],
			  Name, Url) ->
    decode_bookmark_url_attrs(__TopXMLNS, _attrs, Name,
			      Url);
decode_bookmark_url_attrs(__TopXMLNS, [], Name, Url) ->
    {decode_bookmark_url_attr_name(__TopXMLNS, Name),
     decode_bookmark_url_attr_url(__TopXMLNS, Url)}.

encode_bookmark_url({bookmark_url, Name, Url},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"storage:bookmarks">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_bookmark_url_attr_url(Url,
					  encode_bookmark_url_attr_name(Name,
									xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
												   __TopXMLNS))),
    {xmlel, <<"url">>, _attrs, _els}.

decode_bookmark_url_attr_name(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"name">>, <<"url">>, __TopXMLNS}});
decode_bookmark_url_attr_name(__TopXMLNS, _val) -> _val.

encode_bookmark_url_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_bookmark_url_attr_url(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"url">>, <<"url">>, __TopXMLNS}});
decode_bookmark_url_attr_url(__TopXMLNS, _val) -> _val.

encode_bookmark_url_attr_url(_val, _acc) ->
    [{<<"url">>, _val} | _acc].

decode_bookmark_conference(__TopXMLNS, __Opts,
			   {xmlel, <<"conference">>, _attrs, _els}) ->
    {Password, Nick} =
	decode_bookmark_conference_els(__TopXMLNS, __Opts, _els,
				       undefined, undefined),
    {Name, Jid, Autojoin} =
	decode_bookmark_conference_attrs(__TopXMLNS, _attrs,
					 undefined, undefined, undefined),
    {bookmark_conference, Name, Jid, Autojoin, Nick,
     Password}.

decode_bookmark_conference_els(__TopXMLNS, __Opts, [],
			       Password, Nick) ->
    {Password, Nick};
decode_bookmark_conference_els(__TopXMLNS, __Opts,
			       [{xmlel, <<"nick">>, _attrs, _} = _el | _els],
			       Password, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"storage:bookmarks">> ->
	  decode_bookmark_conference_els(__TopXMLNS, __Opts, _els,
					 Password,
					 decode_conference_nick(<<"storage:bookmarks">>,
								__Opts, _el));
      _ ->
	  decode_bookmark_conference_els(__TopXMLNS, __Opts, _els,
					 Password, Nick)
    end;
decode_bookmark_conference_els(__TopXMLNS, __Opts,
			       [{xmlel, <<"password">>, _attrs, _} = _el
				| _els],
			       Password, Nick) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"storage:bookmarks">> ->
	  decode_bookmark_conference_els(__TopXMLNS, __Opts, _els,
					 decode_conference_password(<<"storage:bookmarks">>,
								    __Opts,
								    _el),
					 Nick);
      _ ->
	  decode_bookmark_conference_els(__TopXMLNS, __Opts, _els,
					 Password, Nick)
    end;
decode_bookmark_conference_els(__TopXMLNS, __Opts,
			       [_ | _els], Password, Nick) ->
    decode_bookmark_conference_els(__TopXMLNS, __Opts, _els,
				   Password, Nick).

decode_bookmark_conference_attrs(__TopXMLNS,
				 [{<<"name">>, _val} | _attrs], _Name, Jid,
				 Autojoin) ->
    decode_bookmark_conference_attrs(__TopXMLNS, _attrs,
				     _val, Jid, Autojoin);
decode_bookmark_conference_attrs(__TopXMLNS,
				 [{<<"jid">>, _val} | _attrs], Name, _Jid,
				 Autojoin) ->
    decode_bookmark_conference_attrs(__TopXMLNS, _attrs,
				     Name, _val, Autojoin);
decode_bookmark_conference_attrs(__TopXMLNS,
				 [{<<"autojoin">>, _val} | _attrs], Name, Jid,
				 _Autojoin) ->
    decode_bookmark_conference_attrs(__TopXMLNS, _attrs,
				     Name, Jid, _val);
decode_bookmark_conference_attrs(__TopXMLNS,
				 [_ | _attrs], Name, Jid, Autojoin) ->
    decode_bookmark_conference_attrs(__TopXMLNS, _attrs,
				     Name, Jid, Autojoin);
decode_bookmark_conference_attrs(__TopXMLNS, [], Name,
				 Jid, Autojoin) ->
    {decode_bookmark_conference_attr_name(__TopXMLNS, Name),
     decode_bookmark_conference_attr_jid(__TopXMLNS, Jid),
     decode_bookmark_conference_attr_autojoin(__TopXMLNS,
					      Autojoin)}.

encode_bookmark_conference({bookmark_conference, Name,
			    Jid, Autojoin, Nick, Password},
			   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"storage:bookmarks">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_bookmark_conference_$password'(Password,
							     __NewTopXMLNS,
							     'encode_bookmark_conference_$nick'(Nick,
												__NewTopXMLNS,
												[]))),
    _attrs =
	encode_bookmark_conference_attr_autojoin(Autojoin,
						 encode_bookmark_conference_attr_jid(Jid,
										     encode_bookmark_conference_attr_name(Name,
															  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																		     __TopXMLNS)))),
    {xmlel, <<"conference">>, _attrs, _els}.

'encode_bookmark_conference_$password'(undefined,
				       __TopXMLNS, _acc) ->
    _acc;
'encode_bookmark_conference_$password'(Password,
				       __TopXMLNS, _acc) ->
    [encode_conference_password(Password, __TopXMLNS)
     | _acc].

'encode_bookmark_conference_$nick'(undefined,
				   __TopXMLNS, _acc) ->
    _acc;
'encode_bookmark_conference_$nick'(Nick, __TopXMLNS,
				   _acc) ->
    [encode_conference_nick(Nick, __TopXMLNS) | _acc].

decode_bookmark_conference_attr_name(__TopXMLNS,
				     undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"name">>, <<"conference">>,
		   __TopXMLNS}});
decode_bookmark_conference_attr_name(__TopXMLNS,
				     _val) ->
    _val.

encode_bookmark_conference_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_bookmark_conference_attr_jid(__TopXMLNS,
				    undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"conference">>,
		   __TopXMLNS}});
decode_bookmark_conference_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"conference">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_bookmark_conference_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_bookmark_conference_attr_autojoin(__TopXMLNS,
					 undefined) ->
    false;
decode_bookmark_conference_attr_autojoin(__TopXMLNS,
					 _val) ->
    case catch dec_bool(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"autojoin">>, <<"conference">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_bookmark_conference_attr_autojoin(false, _acc) ->
    _acc;
encode_bookmark_conference_attr_autojoin(_val, _acc) ->
    [{<<"autojoin">>, enc_bool(_val)} | _acc].

decode_conference_password(__TopXMLNS, __Opts,
			   {xmlel, <<"password">>, _attrs, _els}) ->
    Cdata = decode_conference_password_els(__TopXMLNS,
					   __Opts, _els, <<>>),
    Cdata.

decode_conference_password_els(__TopXMLNS, __Opts, [],
			       Cdata) ->
    decode_conference_password_cdata(__TopXMLNS, Cdata);
decode_conference_password_els(__TopXMLNS, __Opts,
			       [{xmlcdata, _data} | _els], Cdata) ->
    decode_conference_password_els(__TopXMLNS, __Opts, _els,
				   <<Cdata/binary, _data/binary>>);
decode_conference_password_els(__TopXMLNS, __Opts,
			       [_ | _els], Cdata) ->
    decode_conference_password_els(__TopXMLNS, __Opts, _els,
				   Cdata).

encode_conference_password(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"storage:bookmarks">>, [],
				    __TopXMLNS),
    _els = encode_conference_password_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"password">>, _attrs, _els}.

decode_conference_password_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_conference_password_cdata(__TopXMLNS, _val) ->
    _val.

encode_conference_password_cdata(<<>>, _acc) -> _acc;
encode_conference_password_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_conference_nick(__TopXMLNS, __Opts,
		       {xmlel, <<"nick">>, _attrs, _els}) ->
    Cdata = decode_conference_nick_els(__TopXMLNS, __Opts,
				       _els, <<>>),
    Cdata.

decode_conference_nick_els(__TopXMLNS, __Opts, [],
			   Cdata) ->
    decode_conference_nick_cdata(__TopXMLNS, Cdata);
decode_conference_nick_els(__TopXMLNS, __Opts,
			   [{xmlcdata, _data} | _els], Cdata) ->
    decode_conference_nick_els(__TopXMLNS, __Opts, _els,
			       <<Cdata/binary, _data/binary>>);
decode_conference_nick_els(__TopXMLNS, __Opts,
			   [_ | _els], Cdata) ->
    decode_conference_nick_els(__TopXMLNS, __Opts, _els,
			       Cdata).

encode_conference_nick(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"storage:bookmarks">>, [],
				    __TopXMLNS),
    _els = encode_conference_nick_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"nick">>, _attrs, _els}.

decode_conference_nick_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_conference_nick_cdata(__TopXMLNS, _val) -> _val.

encode_conference_nick_cdata(<<>>, _acc) -> _acc;
encode_conference_nick_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
