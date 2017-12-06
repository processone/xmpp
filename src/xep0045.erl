%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0045).

-compile(export_all).

do_decode(<<"unique">>,
	  <<"http://jabber.org/protocol/muc#unique">>, El,
	  Opts) ->
    decode_muc_unique(<<"http://jabber.org/protocol/muc#unique">>,
		      Opts, El);
do_decode(<<"x">>, <<"http://jabber.org/protocol/muc">>,
	  El, Opts) ->
    decode_muc(<<"http://jabber.org/protocol/muc">>, Opts,
	       El);
do_decode(<<"query">>,
	  <<"http://jabber.org/protocol/muc#admin">>, El, Opts) ->
    decode_muc_admin(<<"http://jabber.org/protocol/muc#admin">>,
		     Opts, El);
do_decode(<<"continue">>,
	  <<"http://jabber.org/protocol/muc#admin">>, El, Opts) ->
    decode_muc_admin_continue(<<"http://jabber.org/protocol/muc#admin">>,
			      Opts, El);
do_decode(<<"actor">>,
	  <<"http://jabber.org/protocol/muc#admin">>, El, Opts) ->
    decode_muc_admin_actor(<<"http://jabber.org/protocol/muc#admin">>,
			   Opts, El);
do_decode(<<"item">>,
	  <<"http://jabber.org/protocol/muc#admin">>, El, Opts) ->
    decode_muc_admin_item(<<"http://jabber.org/protocol/muc#admin">>,
			  Opts, El);
do_decode(<<"item">>,
	  <<"http://jabber.org/protocol/muc#owner">>, El, Opts) ->
    decode_muc_owner_item(<<"http://jabber.org/protocol/muc#owner">>,
			  Opts, El);
do_decode(<<"query">>,
	  <<"http://jabber.org/protocol/muc#owner">>, El, Opts) ->
    decode_muc_owner(<<"http://jabber.org/protocol/muc#owner">>,
		     Opts, El);
do_decode(<<"password">>,
	  <<"http://jabber.org/protocol/muc#owner">>, El, Opts) ->
    decode_muc_password(<<"http://jabber.org/protocol/muc#owner">>,
			Opts, El);
do_decode(<<"password">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_password(<<"http://jabber.org/protocol/muc#user">>,
			Opts, El);
do_decode(<<"password">>,
	  <<"http://jabber.org/protocol/muc">>, El, Opts) ->
    decode_muc_password(<<"http://jabber.org/protocol/muc">>,
			Opts, El);
do_decode(<<"x">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_user(<<"http://jabber.org/protocol/muc#user">>,
		    Opts, El);
do_decode(<<"item">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_user_item(<<"http://jabber.org/protocol/muc#user">>,
			 Opts, El);
do_decode(<<"status">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_user_status(<<"http://jabber.org/protocol/muc#user">>,
			   Opts, El);
do_decode(<<"continue">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_user_continue(<<"http://jabber.org/protocol/muc#user">>,
			     Opts, El);
do_decode(<<"actor">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_user_actor(<<"http://jabber.org/protocol/muc#user">>,
			  Opts, El);
do_decode(<<"invite">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_user_invite(<<"http://jabber.org/protocol/muc#user">>,
			   Opts, El);
do_decode(<<"destroy">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_destroy(<<"http://jabber.org/protocol/muc#user">>,
		       Opts, El);
do_decode(<<"destroy">>,
	  <<"http://jabber.org/protocol/muc#owner">>, El, Opts) ->
    decode_muc_destroy(<<"http://jabber.org/protocol/muc#owner">>,
		       Opts, El);
do_decode(<<"decline">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_user_decline(<<"http://jabber.org/protocol/muc#user">>,
			    Opts, El);
do_decode(<<"reason">>,
	  <<"http://jabber.org/protocol/muc#user">>, El, Opts) ->
    decode_muc_reason(<<"http://jabber.org/protocol/muc#user">>,
		      Opts, El);
do_decode(<<"reason">>,
	  <<"http://jabber.org/protocol/muc#admin">>, El, Opts) ->
    decode_muc_reason(<<"http://jabber.org/protocol/muc#admin">>,
		      Opts, El);
do_decode(<<"reason">>,
	  <<"http://jabber.org/protocol/muc#owner">>, El, Opts) ->
    decode_muc_reason(<<"http://jabber.org/protocol/muc#owner">>,
		      Opts, El);
do_decode(<<"history">>,
	  <<"http://jabber.org/protocol/muc">>, El, Opts) ->
    decode_muc_history(<<"http://jabber.org/protocol/muc">>,
		       Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"unique">>,
      <<"http://jabber.org/protocol/muc#unique">>},
     {<<"x">>, <<"http://jabber.org/protocol/muc">>},
     {<<"query">>,
      <<"http://jabber.org/protocol/muc#admin">>},
     {<<"continue">>,
      <<"http://jabber.org/protocol/muc#admin">>},
     {<<"actor">>,
      <<"http://jabber.org/protocol/muc#admin">>},
     {<<"item">>,
      <<"http://jabber.org/protocol/muc#admin">>},
     {<<"item">>,
      <<"http://jabber.org/protocol/muc#owner">>},
     {<<"query">>,
      <<"http://jabber.org/protocol/muc#owner">>},
     {<<"password">>,
      <<"http://jabber.org/protocol/muc#owner">>},
     {<<"password">>,
      <<"http://jabber.org/protocol/muc#user">>},
     {<<"password">>, <<"http://jabber.org/protocol/muc">>},
     {<<"x">>, <<"http://jabber.org/protocol/muc#user">>},
     {<<"item">>, <<"http://jabber.org/protocol/muc#user">>},
     {<<"status">>,
      <<"http://jabber.org/protocol/muc#user">>},
     {<<"continue">>,
      <<"http://jabber.org/protocol/muc#user">>},
     {<<"actor">>,
      <<"http://jabber.org/protocol/muc#user">>},
     {<<"invite">>,
      <<"http://jabber.org/protocol/muc#user">>},
     {<<"destroy">>,
      <<"http://jabber.org/protocol/muc#user">>},
     {<<"destroy">>,
      <<"http://jabber.org/protocol/muc#owner">>},
     {<<"decline">>,
      <<"http://jabber.org/protocol/muc#user">>},
     {<<"reason">>,
      <<"http://jabber.org/protocol/muc#user">>},
     {<<"reason">>,
      <<"http://jabber.org/protocol/muc#admin">>},
     {<<"reason">>,
      <<"http://jabber.org/protocol/muc#owner">>},
     {<<"history">>, <<"http://jabber.org/protocol/muc">>}].

do_encode({muc_history, _, _, _, _} = History,
	  TopXMLNS) ->
    encode_muc_history(History, TopXMLNS);
do_encode({muc_decline, _, _, _} = Decline, TopXMLNS) ->
    encode_muc_user_decline(Decline, TopXMLNS);
do_encode({muc_destroy, _, _, _, _} = Destroy,
	  TopXMLNS) ->
    encode_muc_destroy(Destroy, TopXMLNS);
do_encode({muc_invite, _, _, _, _} = Invite,
	  TopXMLNS) ->
    encode_muc_user_invite(Invite, TopXMLNS);
do_encode({muc_user, _, _, _, _, _, _} = X, TopXMLNS) ->
    encode_muc_user(X, TopXMLNS);
do_encode({muc_owner, _, _, _} = Query, TopXMLNS) ->
    encode_muc_owner(Query, TopXMLNS);
do_encode({muc_item, _, _, _, _, _, _, _} = Item,
	  TopXMLNS) ->
    encode_muc_admin_item(Item, TopXMLNS);
do_encode({muc_actor, _, _} = Actor, TopXMLNS) ->
    encode_muc_admin_actor(Actor, TopXMLNS);
do_encode({muc_admin, _} = Query, TopXMLNS) ->
    encode_muc_admin(Query, TopXMLNS);
do_encode({muc, _, _} = X, TopXMLNS) ->
    encode_muc(X, TopXMLNS);
do_encode({muc_unique, _} = Unique, TopXMLNS) ->
    encode_muc_unique(Unique, TopXMLNS).

do_get_name({muc, _, _}) -> <<"x">>;
do_get_name({muc_actor, _, _}) -> <<"actor">>;
do_get_name({muc_admin, _}) -> <<"query">>;
do_get_name({muc_decline, _, _, _}) -> <<"decline">>;
do_get_name({muc_destroy, _, _, _, _}) -> <<"destroy">>;
do_get_name({muc_history, _, _, _, _}) -> <<"history">>;
do_get_name({muc_invite, _, _, _, _}) -> <<"invite">>;
do_get_name({muc_item, _, _, _, _, _, _, _}) ->
    <<"item">>;
do_get_name({muc_owner, _, _, _}) -> <<"query">>;
do_get_name({muc_unique, _}) -> <<"unique">>;
do_get_name({muc_user, _, _, _, _, _, _}) -> <<"x">>.

do_get_ns({muc, _, _}) ->
    <<"http://jabber.org/protocol/muc">>;
do_get_ns({muc_admin, _}) ->
    <<"http://jabber.org/protocol/muc#admin">>;
do_get_ns({muc_decline, _, _, _}) ->
    <<"http://jabber.org/protocol/muc#user">>;
do_get_ns({muc_destroy, Xmlns, _, _, _}) -> Xmlns;
do_get_ns({muc_history, _, _, _, _}) ->
    <<"http://jabber.org/protocol/muc">>;
do_get_ns({muc_invite, _, _, _, _}) ->
    <<"http://jabber.org/protocol/muc#user">>;
do_get_ns({muc_owner, _, _, _}) ->
    <<"http://jabber.org/protocol/muc#owner">>;
do_get_ns({muc_unique, _}) ->
    <<"http://jabber.org/protocol/muc#unique">>;
do_get_ns({muc_user, _, _, _, _, _, _}) ->
    <<"http://jabber.org/protocol/muc#user">>.

pp(muc_history, 4) ->
    [maxchars, maxstanzas, seconds, since];
pp(muc_decline, 3) -> [reason, from, to];
pp(muc_destroy, 4) -> [xmlns, jid, reason, password];
pp(muc_invite, 4) -> [reason, from, to, continue];
pp(muc_user, 6) ->
    [decline, destroy, invites, items, status_codes,
     password];
pp(muc_owner, 3) -> [destroy, config, items];
pp(muc_item, 7) ->
    [actor, continue, reason, affiliation, role, jid, nick];
pp(muc_actor, 2) -> [jid, nick];
pp(muc_admin, 1) -> [items];
pp(muc, 2) -> [history, password];
pp(muc_unique, 1) -> [name];
pp(_, _) -> no.

records() ->
    [{muc_history, 4}, {muc_decline, 3}, {muc_destroy, 4},
     {muc_invite, 4}, {muc_user, 6}, {muc_owner, 3},
     {muc_item, 7}, {muc_actor, 2}, {muc_admin, 1}, {muc, 2},
     {muc_unique, 1}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_muc_unique(__TopXMLNS, __Opts,
		  {xmlel, <<"unique">>, _attrs, _els}) ->
    Name = decode_muc_unique_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    {muc_unique, Name}.

decode_muc_unique_els(__TopXMLNS, __Opts, [], Name) ->
    decode_muc_unique_cdata(__TopXMLNS, Name);
decode_muc_unique_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Name) ->
    decode_muc_unique_els(__TopXMLNS, __Opts, _els,
			  <<Name/binary, _data/binary>>);
decode_muc_unique_els(__TopXMLNS, __Opts, [_ | _els],
		      Name) ->
    decode_muc_unique_els(__TopXMLNS, __Opts, _els, Name).

encode_muc_unique({muc_unique, Name}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#unique">>,
				    [], __TopXMLNS),
    _els = encode_muc_unique_cdata(Name, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unique">>, _attrs, _els}.

decode_muc_unique_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_muc_unique_cdata(__TopXMLNS, _val) -> _val.

encode_muc_unique_cdata(<<>>, _acc) -> _acc;
encode_muc_unique_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_muc(__TopXMLNS, __Opts,
	   {xmlel, <<"x">>, _attrs, _els}) ->
    {Password, History} = decode_muc_els(__TopXMLNS, __Opts,
					 _els, undefined, undefined),
    {muc, History, Password}.

decode_muc_els(__TopXMLNS, __Opts, [], Password,
	       History) ->
    {Password, History};
decode_muc_els(__TopXMLNS, __Opts,
	       [{xmlel, <<"history">>, _attrs, _} = _el | _els],
	       Password, History) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc">> ->
	  decode_muc_els(__TopXMLNS, __Opts, _els, Password,
			 decode_muc_history(<<"http://jabber.org/protocol/muc">>,
					    __Opts, _el));
      _ ->
	  decode_muc_els(__TopXMLNS, __Opts, _els, Password,
			 History)
    end;
decode_muc_els(__TopXMLNS, __Opts,
	       [{xmlel, <<"password">>, _attrs, _} = _el | _els],
	       Password, History) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_els(__TopXMLNS, __Opts, _els,
			 decode_muc_password(<<"http://jabber.org/protocol/muc#owner">>,
					     __Opts, _el),
			 History);
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_els(__TopXMLNS, __Opts, _els,
			 decode_muc_password(<<"http://jabber.org/protocol/muc#user">>,
					     __Opts, _el),
			 History);
      <<"http://jabber.org/protocol/muc">> ->
	  decode_muc_els(__TopXMLNS, __Opts, _els,
			 decode_muc_password(<<"http://jabber.org/protocol/muc">>,
					     __Opts, _el),
			 History);
      _ ->
	  decode_muc_els(__TopXMLNS, __Opts, _els, Password,
			 History)
    end;
decode_muc_els(__TopXMLNS, __Opts, [_ | _els], Password,
	       History) ->
    decode_muc_els(__TopXMLNS, __Opts, _els, Password,
		   History).

encode_muc({muc, History, Password}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_muc_$password'(Password,
						__NewTopXMLNS,
						'encode_muc_$history'(History,
								      __NewTopXMLNS,
								      []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"x">>, _attrs, _els}.

'encode_muc_$password'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_muc_$password'(Password, __TopXMLNS, _acc) ->
    [encode_muc_password(Password, __TopXMLNS) | _acc].

'encode_muc_$history'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_muc_$history'(History, __TopXMLNS, _acc) ->
    [encode_muc_history(History, __TopXMLNS) | _acc].

decode_muc_admin(__TopXMLNS, __Opts,
		 {xmlel, <<"query">>, _attrs, _els}) ->
    Items = decode_muc_admin_els(__TopXMLNS, __Opts, _els,
				 []),
    {muc_admin, Items}.

decode_muc_admin_els(__TopXMLNS, __Opts, [], Items) ->
    lists:reverse(Items);
decode_muc_admin_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"item">>, _attrs, _} = _el | _els], Items) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_admin_els(__TopXMLNS, __Opts, _els,
			       [decode_muc_admin_item(<<"http://jabber.org/protocol/muc#admin">>,
						      __Opts, _el)
				| Items]);
      _ ->
	  decode_muc_admin_els(__TopXMLNS, __Opts, _els, Items)
    end;
decode_muc_admin_els(__TopXMLNS, __Opts, [_ | _els],
		     Items) ->
    decode_muc_admin_els(__TopXMLNS, __Opts, _els, Items).

encode_muc_admin({muc_admin, Items}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#admin">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_muc_admin_$items'(Items,
						   __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_muc_admin_$items'([], __TopXMLNS, _acc) -> _acc;
'encode_muc_admin_$items'([Items | _els], __TopXMLNS,
			  _acc) ->
    'encode_muc_admin_$items'(_els, __TopXMLNS,
			      [encode_muc_admin_item(Items, __TopXMLNS)
			       | _acc]).

decode_muc_admin_continue(__TopXMLNS, __Opts,
			  {xmlel, <<"continue">>, _attrs, _els}) ->
    Thread = decode_muc_admin_continue_attrs(__TopXMLNS,
					     _attrs, undefined),
    Thread.

decode_muc_admin_continue_attrs(__TopXMLNS,
				[{<<"thread">>, _val} | _attrs], _Thread) ->
    decode_muc_admin_continue_attrs(__TopXMLNS, _attrs,
				    _val);
decode_muc_admin_continue_attrs(__TopXMLNS,
				[_ | _attrs], Thread) ->
    decode_muc_admin_continue_attrs(__TopXMLNS, _attrs,
				    Thread);
decode_muc_admin_continue_attrs(__TopXMLNS, [],
				Thread) ->
    decode_muc_admin_continue_attr_thread(__TopXMLNS,
					  Thread).

encode_muc_admin_continue(Thread, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#admin">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_muc_admin_continue_attr_thread(Thread,
						   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									      __TopXMLNS)),
    {xmlel, <<"continue">>, _attrs, _els}.

decode_muc_admin_continue_attr_thread(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_muc_admin_continue_attr_thread(__TopXMLNS,
				      _val) ->
    _val.

encode_muc_admin_continue_attr_thread(<<>>, _acc) ->
    _acc;
encode_muc_admin_continue_attr_thread(_val, _acc) ->
    [{<<"thread">>, _val} | _acc].

decode_muc_admin_actor(__TopXMLNS, __Opts,
		       {xmlel, <<"actor">>, _attrs, _els}) ->
    {Jid, Nick} = decode_muc_admin_actor_attrs(__TopXMLNS,
					       _attrs, undefined, undefined),
    {muc_actor, Jid, Nick}.

decode_muc_admin_actor_attrs(__TopXMLNS,
			     [{<<"jid">>, _val} | _attrs], _Jid, Nick) ->
    decode_muc_admin_actor_attrs(__TopXMLNS, _attrs, _val,
				 Nick);
decode_muc_admin_actor_attrs(__TopXMLNS,
			     [{<<"nick">>, _val} | _attrs], Jid, _Nick) ->
    decode_muc_admin_actor_attrs(__TopXMLNS, _attrs, Jid,
				 _val);
decode_muc_admin_actor_attrs(__TopXMLNS, [_ | _attrs],
			     Jid, Nick) ->
    decode_muc_admin_actor_attrs(__TopXMLNS, _attrs, Jid,
				 Nick);
decode_muc_admin_actor_attrs(__TopXMLNS, [], Jid,
			     Nick) ->
    {decode_muc_admin_actor_attr_jid(__TopXMLNS, Jid),
     decode_muc_admin_actor_attr_nick(__TopXMLNS, Nick)}.

encode_muc_admin_actor({muc_actor, Jid, Nick},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#admin">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_muc_admin_actor_attr_nick(Nick,
					      encode_muc_admin_actor_attr_jid(Jid,
									      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													 __TopXMLNS))),
    {xmlel, <<"actor">>, _attrs, _els}.

decode_muc_admin_actor_attr_jid(__TopXMLNS,
				undefined) ->
    undefined;
decode_muc_admin_actor_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"actor">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_admin_actor_attr_jid(undefined, _acc) ->
    _acc;
encode_muc_admin_actor_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_muc_admin_actor_attr_nick(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_muc_admin_actor_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_muc_admin_actor_attr_nick(<<>>, _acc) -> _acc;
encode_muc_admin_actor_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_muc_admin_item(__TopXMLNS, __Opts,
		      {xmlel, <<"item">>, _attrs, _els}) ->
    {Actor, Continue, Reason} =
	decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
				  undefined, undefined, <<>>),
    {Affiliation, Role, Jid, Nick} =
	decode_muc_admin_item_attrs(__TopXMLNS, _attrs,
				    undefined, undefined, undefined, undefined),
    {muc_item, Actor, Continue, Reason, Affiliation, Role,
     Jid, Nick}.

decode_muc_admin_item_els(__TopXMLNS, __Opts, [], Actor,
			  Continue, Reason) ->
    {Actor, Continue, Reason};
decode_muc_admin_item_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"actor">>, _attrs, _} = _el | _els], Actor,
			  Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
				    decode_muc_admin_actor(<<"http://jabber.org/protocol/muc#admin">>,
							   __Opts, _el),
				    Continue, Reason);
      _ ->
	  decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue, Reason)
    end;
decode_muc_admin_item_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"continue">>, _attrs, _} = _el | _els],
			  Actor, Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
				    Actor,
				    decode_muc_admin_continue(<<"http://jabber.org/protocol/muc#admin">>,
							      __Opts, _el),
				    Reason);
      _ ->
	  decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue, Reason)
    end;
decode_muc_admin_item_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"reason">>, _attrs, _} = _el | _els],
			  Actor, Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue,
				    decode_muc_reason(<<"http://jabber.org/protocol/muc#user">>,
						      __Opts, _el));
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue,
				    decode_muc_reason(<<"http://jabber.org/protocol/muc#admin">>,
						      __Opts, _el));
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue,
				    decode_muc_reason(<<"http://jabber.org/protocol/muc#owner">>,
						      __Opts, _el));
      _ ->
	  decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue, Reason)
    end;
decode_muc_admin_item_els(__TopXMLNS, __Opts,
			  [_ | _els], Actor, Continue, Reason) ->
    decode_muc_admin_item_els(__TopXMLNS, __Opts, _els,
			      Actor, Continue, Reason).

decode_muc_admin_item_attrs(__TopXMLNS,
			    [{<<"affiliation">>, _val} | _attrs], _Affiliation,
			    Role, Jid, Nick) ->
    decode_muc_admin_item_attrs(__TopXMLNS, _attrs, _val,
				Role, Jid, Nick);
decode_muc_admin_item_attrs(__TopXMLNS,
			    [{<<"role">>, _val} | _attrs], Affiliation, _Role,
			    Jid, Nick) ->
    decode_muc_admin_item_attrs(__TopXMLNS, _attrs,
				Affiliation, _val, Jid, Nick);
decode_muc_admin_item_attrs(__TopXMLNS,
			    [{<<"jid">>, _val} | _attrs], Affiliation, Role,
			    _Jid, Nick) ->
    decode_muc_admin_item_attrs(__TopXMLNS, _attrs,
				Affiliation, Role, _val, Nick);
decode_muc_admin_item_attrs(__TopXMLNS,
			    [{<<"nick">>, _val} | _attrs], Affiliation, Role,
			    Jid, _Nick) ->
    decode_muc_admin_item_attrs(__TopXMLNS, _attrs,
				Affiliation, Role, Jid, _val);
decode_muc_admin_item_attrs(__TopXMLNS, [_ | _attrs],
			    Affiliation, Role, Jid, Nick) ->
    decode_muc_admin_item_attrs(__TopXMLNS, _attrs,
				Affiliation, Role, Jid, Nick);
decode_muc_admin_item_attrs(__TopXMLNS, [], Affiliation,
			    Role, Jid, Nick) ->
    {decode_muc_admin_item_attr_affiliation(__TopXMLNS,
					    Affiliation),
     decode_muc_admin_item_attr_role(__TopXMLNS, Role),
     decode_muc_admin_item_attr_jid(__TopXMLNS, Jid),
     decode_muc_admin_item_attr_nick(__TopXMLNS, Nick)}.

encode_muc_admin_item({muc_item, Actor, Continue,
		       Reason, Affiliation, Role, Jid, Nick},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#admin">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_muc_admin_item_$actor'(Actor,
						     __NewTopXMLNS,
						     'encode_muc_admin_item_$continue'(Continue,
										       __NewTopXMLNS,
										       'encode_muc_admin_item_$reason'(Reason,
														       __NewTopXMLNS,
														       [])))),
    _attrs = encode_muc_admin_item_attr_nick(Nick,
					     encode_muc_admin_item_attr_jid(Jid,
									    encode_muc_admin_item_attr_role(Role,
													    encode_muc_admin_item_attr_affiliation(Affiliation,
																		   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																					      __TopXMLNS))))),
    {xmlel, <<"item">>, _attrs, _els}.

'encode_muc_admin_item_$actor'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_muc_admin_item_$actor'(Actor, __TopXMLNS,
			       _acc) ->
    [encode_muc_admin_actor(Actor, __TopXMLNS) | _acc].

'encode_muc_admin_item_$continue'(undefined, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_muc_admin_item_$continue'(Continue, __TopXMLNS,
				  _acc) ->
    [encode_muc_admin_continue(Continue, __TopXMLNS)
     | _acc].

'encode_muc_admin_item_$reason'(<<>>, __TopXMLNS,
				_acc) ->
    _acc;
'encode_muc_admin_item_$reason'(Reason, __TopXMLNS,
				_acc) ->
    [encode_muc_reason(Reason, __TopXMLNS) | _acc].

decode_muc_admin_item_attr_affiliation(__TopXMLNS,
				       undefined) ->
    undefined;
decode_muc_admin_item_attr_affiliation(__TopXMLNS,
				       _val) ->
    case catch dec_enum(_val,
			[admin, member, none, outcast, owner])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"affiliation">>, <<"item">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_admin_item_attr_affiliation(undefined,
				       _acc) ->
    _acc;
encode_muc_admin_item_attr_affiliation(_val, _acc) ->
    [{<<"affiliation">>, enc_enum(_val)} | _acc].

decode_muc_admin_item_attr_role(__TopXMLNS,
				undefined) ->
    undefined;
decode_muc_admin_item_attr_role(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[moderator, none, participant, visitor])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"role">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_admin_item_attr_role(undefined, _acc) ->
    _acc;
encode_muc_admin_item_attr_role(_val, _acc) ->
    [{<<"role">>, enc_enum(_val)} | _acc].

decode_muc_admin_item_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_muc_admin_item_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_admin_item_attr_jid(undefined, _acc) -> _acc;
encode_muc_admin_item_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_muc_admin_item_attr_nick(__TopXMLNS,
				undefined) ->
    <<>>;
decode_muc_admin_item_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_muc_admin_item_attr_nick(<<>>, _acc) -> _acc;
encode_muc_admin_item_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_muc_owner_item(__TopXMLNS, __Opts,
		      {xmlel, <<"item">>, _attrs, _els}) ->
    {Actor, Continue, Reason} =
	decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
				  undefined, undefined, <<>>),
    {Affiliation, Role, Jid, Nick} =
	decode_muc_owner_item_attrs(__TopXMLNS, _attrs,
				    undefined, undefined, undefined, undefined),
    {muc_item, Actor, Continue, Reason, Affiliation, Role,
     Jid, Nick}.

decode_muc_owner_item_els(__TopXMLNS, __Opts, [], Actor,
			  Continue, Reason) ->
    {Actor, Continue, Reason};
decode_muc_owner_item_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"actor">>, _attrs, _} = _el | _els], Actor,
			  Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
				    decode_muc_admin_actor(<<"http://jabber.org/protocol/muc#admin">>,
							   __Opts, _el),
				    Continue, Reason);
      _ ->
	  decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue, Reason)
    end;
decode_muc_owner_item_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"continue">>, _attrs, _} = _el | _els],
			  Actor, Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
				    Actor,
				    decode_muc_admin_continue(<<"http://jabber.org/protocol/muc#admin">>,
							      __Opts, _el),
				    Reason);
      _ ->
	  decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue, Reason)
    end;
decode_muc_owner_item_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"reason">>, _attrs, _} = _el | _els],
			  Actor, Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue,
				    decode_muc_reason(<<"http://jabber.org/protocol/muc#user">>,
						      __Opts, _el));
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue,
				    decode_muc_reason(<<"http://jabber.org/protocol/muc#admin">>,
						      __Opts, _el));
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue,
				    decode_muc_reason(<<"http://jabber.org/protocol/muc#owner">>,
						      __Opts, _el));
      _ ->
	  decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
				    Actor, Continue, Reason)
    end;
decode_muc_owner_item_els(__TopXMLNS, __Opts,
			  [_ | _els], Actor, Continue, Reason) ->
    decode_muc_owner_item_els(__TopXMLNS, __Opts, _els,
			      Actor, Continue, Reason).

decode_muc_owner_item_attrs(__TopXMLNS,
			    [{<<"affiliation">>, _val} | _attrs], _Affiliation,
			    Role, Jid, Nick) ->
    decode_muc_owner_item_attrs(__TopXMLNS, _attrs, _val,
				Role, Jid, Nick);
decode_muc_owner_item_attrs(__TopXMLNS,
			    [{<<"role">>, _val} | _attrs], Affiliation, _Role,
			    Jid, Nick) ->
    decode_muc_owner_item_attrs(__TopXMLNS, _attrs,
				Affiliation, _val, Jid, Nick);
decode_muc_owner_item_attrs(__TopXMLNS,
			    [{<<"jid">>, _val} | _attrs], Affiliation, Role,
			    _Jid, Nick) ->
    decode_muc_owner_item_attrs(__TopXMLNS, _attrs,
				Affiliation, Role, _val, Nick);
decode_muc_owner_item_attrs(__TopXMLNS,
			    [{<<"nick">>, _val} | _attrs], Affiliation, Role,
			    Jid, _Nick) ->
    decode_muc_owner_item_attrs(__TopXMLNS, _attrs,
				Affiliation, Role, Jid, _val);
decode_muc_owner_item_attrs(__TopXMLNS, [_ | _attrs],
			    Affiliation, Role, Jid, Nick) ->
    decode_muc_owner_item_attrs(__TopXMLNS, _attrs,
				Affiliation, Role, Jid, Nick);
decode_muc_owner_item_attrs(__TopXMLNS, [], Affiliation,
			    Role, Jid, Nick) ->
    {decode_muc_owner_item_attr_affiliation(__TopXMLNS,
					    Affiliation),
     decode_muc_owner_item_attr_role(__TopXMLNS, Role),
     decode_muc_owner_item_attr_jid(__TopXMLNS, Jid),
     decode_muc_owner_item_attr_nick(__TopXMLNS, Nick)}.

encode_muc_owner_item({muc_item, Actor, Continue,
		       Reason, Affiliation, Role, Jid, Nick},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#owner">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_muc_owner_item_$actor'(Actor,
						     __NewTopXMLNS,
						     'encode_muc_owner_item_$continue'(Continue,
										       __NewTopXMLNS,
										       'encode_muc_owner_item_$reason'(Reason,
														       __NewTopXMLNS,
														       [])))),
    _attrs = encode_muc_owner_item_attr_nick(Nick,
					     encode_muc_owner_item_attr_jid(Jid,
									    encode_muc_owner_item_attr_role(Role,
													    encode_muc_owner_item_attr_affiliation(Affiliation,
																		   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																					      __TopXMLNS))))),
    {xmlel, <<"item">>, _attrs, _els}.

'encode_muc_owner_item_$actor'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_muc_owner_item_$actor'(Actor, __TopXMLNS,
			       _acc) ->
    [encode_muc_admin_actor(Actor, __TopXMLNS) | _acc].

'encode_muc_owner_item_$continue'(undefined, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_muc_owner_item_$continue'(Continue, __TopXMLNS,
				  _acc) ->
    [encode_muc_admin_continue(Continue, __TopXMLNS)
     | _acc].

'encode_muc_owner_item_$reason'(<<>>, __TopXMLNS,
				_acc) ->
    _acc;
'encode_muc_owner_item_$reason'(Reason, __TopXMLNS,
				_acc) ->
    [encode_muc_reason(Reason, __TopXMLNS) | _acc].

decode_muc_owner_item_attr_affiliation(__TopXMLNS,
				       undefined) ->
    undefined;
decode_muc_owner_item_attr_affiliation(__TopXMLNS,
				       _val) ->
    case catch dec_enum(_val,
			[admin, member, none, outcast, owner])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"affiliation">>, <<"item">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_owner_item_attr_affiliation(undefined,
				       _acc) ->
    _acc;
encode_muc_owner_item_attr_affiliation(_val, _acc) ->
    [{<<"affiliation">>, enc_enum(_val)} | _acc].

decode_muc_owner_item_attr_role(__TopXMLNS,
				undefined) ->
    undefined;
decode_muc_owner_item_attr_role(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[moderator, none, participant, visitor])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"role">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_owner_item_attr_role(undefined, _acc) ->
    _acc;
encode_muc_owner_item_attr_role(_val, _acc) ->
    [{<<"role">>, enc_enum(_val)} | _acc].

decode_muc_owner_item_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_muc_owner_item_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_owner_item_attr_jid(undefined, _acc) -> _acc;
encode_muc_owner_item_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_muc_owner_item_attr_nick(__TopXMLNS,
				undefined) ->
    <<>>;
decode_muc_owner_item_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_muc_owner_item_attr_nick(<<>>, _acc) -> _acc;
encode_muc_owner_item_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_muc_owner(__TopXMLNS, __Opts,
		 {xmlel, <<"query">>, _attrs, _els}) ->
    {Items, Config, Destroy} =
	decode_muc_owner_els(__TopXMLNS, __Opts, _els, [],
			     undefined, undefined),
    {muc_owner, Destroy, Config, Items}.

decode_muc_owner_els(__TopXMLNS, __Opts, [], Items,
		     Config, Destroy) ->
    {lists:reverse(Items), Config, Destroy};
decode_muc_owner_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"destroy">>, _attrs, _} = _el | _els], Items,
		     Config, Destroy) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_owner_els(__TopXMLNS, __Opts, _els, Items,
			       Config,
			       decode_muc_destroy(<<"http://jabber.org/protocol/muc#user">>,
						  __Opts, _el));
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_owner_els(__TopXMLNS, __Opts, _els, Items,
			       Config,
			       decode_muc_destroy(<<"http://jabber.org/protocol/muc#owner">>,
						  __Opts, _el));
      _ ->
	  decode_muc_owner_els(__TopXMLNS, __Opts, _els, Items,
			       Config, Destroy)
    end;
decode_muc_owner_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"x">>, _attrs, _} = _el | _els], Items,
		     Config, Destroy) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_muc_owner_els(__TopXMLNS, __Opts, _els, Items,
			       xep0004:decode_xdata(<<"jabber:x:data">>, __Opts,
						    _el),
			       Destroy);
      _ ->
	  decode_muc_owner_els(__TopXMLNS, __Opts, _els, Items,
			       Config, Destroy)
    end;
decode_muc_owner_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"item">>, _attrs, _} = _el | _els], Items,
		     Config, Destroy) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_owner_els(__TopXMLNS, __Opts, _els,
			       [decode_muc_owner_item(<<"http://jabber.org/protocol/muc#owner">>,
						      __Opts, _el)
				| Items],
			       Config, Destroy);
      _ ->
	  decode_muc_owner_els(__TopXMLNS, __Opts, _els, Items,
			       Config, Destroy)
    end;
decode_muc_owner_els(__TopXMLNS, __Opts, [_ | _els],
		     Items, Config, Destroy) ->
    decode_muc_owner_els(__TopXMLNS, __Opts, _els, Items,
			 Config, Destroy).

encode_muc_owner({muc_owner, Destroy, Config, Items},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#owner">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_muc_owner_$items'(Items,
						   __NewTopXMLNS,
						   'encode_muc_owner_$config'(Config,
									      __NewTopXMLNS,
									      'encode_muc_owner_$destroy'(Destroy,
													  __NewTopXMLNS,
													  [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_muc_owner_$items'([], __TopXMLNS, _acc) -> _acc;
'encode_muc_owner_$items'([Items | _els], __TopXMLNS,
			  _acc) ->
    'encode_muc_owner_$items'(_els, __TopXMLNS,
			      [encode_muc_owner_item(Items, __TopXMLNS)
			       | _acc]).

'encode_muc_owner_$config'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_muc_owner_$config'(Config, __TopXMLNS, _acc) ->
    [xep0004:encode_xdata(Config, __TopXMLNS) | _acc].

'encode_muc_owner_$destroy'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_muc_owner_$destroy'(Destroy, __TopXMLNS,
			    _acc) ->
    [encode_muc_destroy(Destroy, __TopXMLNS) | _acc].

decode_muc_password(__TopXMLNS, __Opts,
		    {xmlel, <<"password">>, _attrs, _els}) ->
    Cdata = decode_muc_password_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_muc_password_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_muc_password_cdata(__TopXMLNS, Cdata);
decode_muc_password_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_muc_password_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_muc_password_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_muc_password_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_muc_password(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"http://jabber.org/protocol/muc#owner">>,
						 <<"http://jabber.org/protocol/muc#user">>,
						 <<"http://jabber.org/protocol/muc">>],
						__TopXMLNS),
    _els = encode_muc_password_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"password">>, _attrs, _els}.

decode_muc_password_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_muc_password_cdata(__TopXMLNS, _val) -> _val.

encode_muc_password_cdata(<<>>, _acc) -> _acc;
encode_muc_password_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_muc_user(__TopXMLNS, __Opts,
		{xmlel, <<"x">>, _attrs, _els}) ->
    {Status_codes, Items, Invites, Password, Decline,
     Destroy} =
	decode_muc_user_els(__TopXMLNS, __Opts, _els, [], [],
			    [], undefined, undefined, undefined),
    {muc_user, Decline, Destroy, Invites, Items,
     Status_codes, Password}.

decode_muc_user_els(__TopXMLNS, __Opts, [],
		    Status_codes, Items, Invites, Password, Decline,
		    Destroy) ->
    {lists:reverse(Status_codes), lists:reverse(Items),
     lists:reverse(Invites), Password, Decline, Destroy};
decode_muc_user_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"decline">>, _attrs, _} = _el | _els],
		    Status_codes, Items, Invites, Password, Decline,
		    Destroy) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites, Password,
			      decode_muc_user_decline(<<"http://jabber.org/protocol/muc#user">>,
						      __Opts, _el),
			      Destroy);
      _ ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites, Password, Decline,
			      Destroy)
    end;
decode_muc_user_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"destroy">>, _attrs, _} = _el | _els],
		    Status_codes, Items, Invites, Password, Decline,
		    Destroy) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites, Password, Decline,
			      decode_muc_destroy(<<"http://jabber.org/protocol/muc#user">>,
						 __Opts, _el));
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites, Password, Decline,
			      decode_muc_destroy(<<"http://jabber.org/protocol/muc#owner">>,
						 __Opts, _el));
      _ ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites, Password, Decline,
			      Destroy)
    end;
decode_muc_user_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"password">>, _attrs, _} = _el | _els],
		    Status_codes, Items, Invites, Password, Decline,
		    Destroy) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites,
			      decode_muc_password(<<"http://jabber.org/protocol/muc#owner">>,
						  __Opts, _el),
			      Decline, Destroy);
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites,
			      decode_muc_password(<<"http://jabber.org/protocol/muc#user">>,
						  __Opts, _el),
			      Decline, Destroy);
      <<"http://jabber.org/protocol/muc">> ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites,
			      decode_muc_password(<<"http://jabber.org/protocol/muc">>,
						  __Opts, _el),
			      Decline, Destroy);
      _ ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites, Password, Decline,
			      Destroy)
    end;
decode_muc_user_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"invite">>, _attrs, _} = _el | _els],
		    Status_codes, Items, Invites, Password, Decline,
		    Destroy) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items,
			      [decode_muc_user_invite(<<"http://jabber.org/protocol/muc#user">>,
						      __Opts, _el)
			       | Invites],
			      Password, Decline, Destroy);
      _ ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites, Password, Decline,
			      Destroy)
    end;
decode_muc_user_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"item">>, _attrs, _} = _el | _els],
		    Status_codes, Items, Invites, Password, Decline,
		    Destroy) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes,
			      [decode_muc_user_item(<<"http://jabber.org/protocol/muc#user">>,
						    __Opts, _el)
			       | Items],
			      Invites, Password, Decline, Destroy);
      _ ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites, Password, Decline,
			      Destroy)
    end;
decode_muc_user_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"status">>, _attrs, _} = _el | _els],
		    Status_codes, Items, Invites, Password, Decline,
		    Destroy) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      case
				decode_muc_user_status(<<"http://jabber.org/protocol/muc#user">>,
						       __Opts, _el)
				  of
				undefined -> Status_codes;
				_new_el -> [_new_el | Status_codes]
			      end,
			      Items, Invites, Password, Decline, Destroy);
      _ ->
	  decode_muc_user_els(__TopXMLNS, __Opts, _els,
			      Status_codes, Items, Invites, Password, Decline,
			      Destroy)
    end;
decode_muc_user_els(__TopXMLNS, __Opts, [_ | _els],
		    Status_codes, Items, Invites, Password, Decline,
		    Destroy) ->
    decode_muc_user_els(__TopXMLNS, __Opts, _els,
			Status_codes, Items, Invites, Password, Decline,
			Destroy).

encode_muc_user({muc_user, Decline, Destroy, Invites,
		 Items, Status_codes, Password},
		__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#user">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_muc_user_$status_codes'(Status_codes,
						      __NewTopXMLNS,
						      'encode_muc_user_$items'(Items,
									       __NewTopXMLNS,
									       'encode_muc_user_$invites'(Invites,
													  __NewTopXMLNS,
													  'encode_muc_user_$password'(Password,
																      __NewTopXMLNS,
																      'encode_muc_user_$decline'(Decline,
																				 __NewTopXMLNS,
																				 'encode_muc_user_$destroy'(Destroy,
																							    __NewTopXMLNS,
																							    []))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"x">>, _attrs, _els}.

'encode_muc_user_$status_codes'([], __TopXMLNS, _acc) ->
    _acc;
'encode_muc_user_$status_codes'([Status_codes | _els],
				__TopXMLNS, _acc) ->
    'encode_muc_user_$status_codes'(_els, __TopXMLNS,
				    [encode_muc_user_status(Status_codes,
							    __TopXMLNS)
				     | _acc]).

'encode_muc_user_$items'([], __TopXMLNS, _acc) -> _acc;
'encode_muc_user_$items'([Items | _els], __TopXMLNS,
			 _acc) ->
    'encode_muc_user_$items'(_els, __TopXMLNS,
			     [encode_muc_user_item(Items, __TopXMLNS) | _acc]).

'encode_muc_user_$invites'([], __TopXMLNS, _acc) ->
    _acc;
'encode_muc_user_$invites'([Invites | _els], __TopXMLNS,
			   _acc) ->
    'encode_muc_user_$invites'(_els, __TopXMLNS,
			       [encode_muc_user_invite(Invites, __TopXMLNS)
				| _acc]).

'encode_muc_user_$password'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_muc_user_$password'(Password, __TopXMLNS,
			    _acc) ->
    [encode_muc_password(Password, __TopXMLNS) | _acc].

'encode_muc_user_$decline'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_muc_user_$decline'(Decline, __TopXMLNS, _acc) ->
    [encode_muc_user_decline(Decline, __TopXMLNS) | _acc].

'encode_muc_user_$destroy'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_muc_user_$destroy'(Destroy, __TopXMLNS, _acc) ->
    [encode_muc_destroy(Destroy, __TopXMLNS) | _acc].

decode_muc_user_item(__TopXMLNS, __Opts,
		     {xmlel, <<"item">>, _attrs, _els}) ->
    {Actor, Continue, Reason} =
	decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
				 undefined, undefined, <<>>),
    {Affiliation, Role, Jid, Nick} =
	decode_muc_user_item_attrs(__TopXMLNS, _attrs,
				   undefined, undefined, undefined, undefined),
    {muc_item, Actor, Continue, Reason, Affiliation, Role,
     Jid, Nick}.

decode_muc_user_item_els(__TopXMLNS, __Opts, [], Actor,
			 Continue, Reason) ->
    {Actor, Continue, Reason};
decode_muc_user_item_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"actor">>, _attrs, _} = _el | _els], Actor,
			 Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
				   decode_muc_user_actor(<<"http://jabber.org/protocol/muc#user">>,
							 __Opts, _el),
				   Continue, Reason);
      _ ->
	  decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
				   Actor, Continue, Reason)
    end;
decode_muc_user_item_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"continue">>, _attrs, _} = _el | _els],
			 Actor, Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
				   Actor,
				   decode_muc_user_continue(<<"http://jabber.org/protocol/muc#user">>,
							    __Opts, _el),
				   Reason);
      _ ->
	  decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
				   Actor, Continue, Reason)
    end;
decode_muc_user_item_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"reason">>, _attrs, _} = _el | _els], Actor,
			 Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
				   Actor, Continue,
				   decode_muc_reason(<<"http://jabber.org/protocol/muc#user">>,
						     __Opts, _el));
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
				   Actor, Continue,
				   decode_muc_reason(<<"http://jabber.org/protocol/muc#admin">>,
						     __Opts, _el));
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
				   Actor, Continue,
				   decode_muc_reason(<<"http://jabber.org/protocol/muc#owner">>,
						     __Opts, _el));
      _ ->
	  decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
				   Actor, Continue, Reason)
    end;
decode_muc_user_item_els(__TopXMLNS, __Opts, [_ | _els],
			 Actor, Continue, Reason) ->
    decode_muc_user_item_els(__TopXMLNS, __Opts, _els,
			     Actor, Continue, Reason).

decode_muc_user_item_attrs(__TopXMLNS,
			   [{<<"affiliation">>, _val} | _attrs], _Affiliation,
			   Role, Jid, Nick) ->
    decode_muc_user_item_attrs(__TopXMLNS, _attrs, _val,
			       Role, Jid, Nick);
decode_muc_user_item_attrs(__TopXMLNS,
			   [{<<"role">>, _val} | _attrs], Affiliation, _Role,
			   Jid, Nick) ->
    decode_muc_user_item_attrs(__TopXMLNS, _attrs,
			       Affiliation, _val, Jid, Nick);
decode_muc_user_item_attrs(__TopXMLNS,
			   [{<<"jid">>, _val} | _attrs], Affiliation, Role,
			   _Jid, Nick) ->
    decode_muc_user_item_attrs(__TopXMLNS, _attrs,
			       Affiliation, Role, _val, Nick);
decode_muc_user_item_attrs(__TopXMLNS,
			   [{<<"nick">>, _val} | _attrs], Affiliation, Role,
			   Jid, _Nick) ->
    decode_muc_user_item_attrs(__TopXMLNS, _attrs,
			       Affiliation, Role, Jid, _val);
decode_muc_user_item_attrs(__TopXMLNS, [_ | _attrs],
			   Affiliation, Role, Jid, Nick) ->
    decode_muc_user_item_attrs(__TopXMLNS, _attrs,
			       Affiliation, Role, Jid, Nick);
decode_muc_user_item_attrs(__TopXMLNS, [], Affiliation,
			   Role, Jid, Nick) ->
    {decode_muc_user_item_attr_affiliation(__TopXMLNS,
					   Affiliation),
     decode_muc_user_item_attr_role(__TopXMLNS, Role),
     decode_muc_user_item_attr_jid(__TopXMLNS, Jid),
     decode_muc_user_item_attr_nick(__TopXMLNS, Nick)}.

encode_muc_user_item({muc_item, Actor, Continue, Reason,
		      Affiliation, Role, Jid, Nick},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#user">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_muc_user_item_$actor'(Actor,
						    __NewTopXMLNS,
						    'encode_muc_user_item_$continue'(Continue,
										     __NewTopXMLNS,
										     'encode_muc_user_item_$reason'(Reason,
														    __NewTopXMLNS,
														    [])))),
    _attrs = encode_muc_user_item_attr_nick(Nick,
					    encode_muc_user_item_attr_jid(Jid,
									  encode_muc_user_item_attr_role(Role,
													 encode_muc_user_item_attr_affiliation(Affiliation,
																	       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																					  __TopXMLNS))))),
    {xmlel, <<"item">>, _attrs, _els}.

'encode_muc_user_item_$actor'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_muc_user_item_$actor'(Actor, __TopXMLNS,
			      _acc) ->
    [encode_muc_user_actor(Actor, __TopXMLNS) | _acc].

'encode_muc_user_item_$continue'(undefined, __TopXMLNS,
				 _acc) ->
    _acc;
'encode_muc_user_item_$continue'(Continue, __TopXMLNS,
				 _acc) ->
    [encode_muc_user_continue(Continue, __TopXMLNS) | _acc].

'encode_muc_user_item_$reason'(<<>>, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_muc_user_item_$reason'(Reason, __TopXMLNS,
			       _acc) ->
    [encode_muc_reason(Reason, __TopXMLNS) | _acc].

decode_muc_user_item_attr_affiliation(__TopXMLNS,
				      undefined) ->
    undefined;
decode_muc_user_item_attr_affiliation(__TopXMLNS,
				      _val) ->
    case catch dec_enum(_val,
			[admin, member, none, outcast, owner])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"affiliation">>, <<"item">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_user_item_attr_affiliation(undefined,
				      _acc) ->
    _acc;
encode_muc_user_item_attr_affiliation(_val, _acc) ->
    [{<<"affiliation">>, enc_enum(_val)} | _acc].

decode_muc_user_item_attr_role(__TopXMLNS, undefined) ->
    undefined;
decode_muc_user_item_attr_role(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[moderator, none, participant, visitor])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"role">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_user_item_attr_role(undefined, _acc) -> _acc;
encode_muc_user_item_attr_role(_val, _acc) ->
    [{<<"role">>, enc_enum(_val)} | _acc].

decode_muc_user_item_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_muc_user_item_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"item">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_user_item_attr_jid(undefined, _acc) -> _acc;
encode_muc_user_item_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_muc_user_item_attr_nick(__TopXMLNS, undefined) ->
    <<>>;
decode_muc_user_item_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_muc_user_item_attr_nick(<<>>, _acc) -> _acc;
encode_muc_user_item_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_muc_user_status(__TopXMLNS, __Opts,
		       {xmlel, <<"status">>, _attrs, _els}) ->
    Code = decode_muc_user_status_attrs(__TopXMLNS, _attrs,
					undefined),
    Code.

decode_muc_user_status_attrs(__TopXMLNS,
			     [{<<"code">>, _val} | _attrs], _Code) ->
    decode_muc_user_status_attrs(__TopXMLNS, _attrs, _val);
decode_muc_user_status_attrs(__TopXMLNS, [_ | _attrs],
			     Code) ->
    decode_muc_user_status_attrs(__TopXMLNS, _attrs, Code);
decode_muc_user_status_attrs(__TopXMLNS, [], Code) ->
    decode_muc_user_status_attr_code(__TopXMLNS, Code).

encode_muc_user_status(Code, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#user">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_muc_user_status_attr_code(Code,
					      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									 __TopXMLNS)),
    {xmlel, <<"status">>, _attrs, _els}.

decode_muc_user_status_attr_code(__TopXMLNS,
				 undefined) ->
    undefined;
decode_muc_user_status_attr_code(__TopXMLNS, _val) ->
    case catch dec_int(_val, 100, 999) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"code">>, <<"status">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_user_status_attr_code(undefined, _acc) ->
    _acc;
encode_muc_user_status_attr_code(_val, _acc) ->
    [{<<"code">>, enc_int(_val)} | _acc].

decode_muc_user_continue(__TopXMLNS, __Opts,
			 {xmlel, <<"continue">>, _attrs, _els}) ->
    Thread = decode_muc_user_continue_attrs(__TopXMLNS,
					    _attrs, undefined),
    Thread.

decode_muc_user_continue_attrs(__TopXMLNS,
			       [{<<"thread">>, _val} | _attrs], _Thread) ->
    decode_muc_user_continue_attrs(__TopXMLNS, _attrs,
				   _val);
decode_muc_user_continue_attrs(__TopXMLNS, [_ | _attrs],
			       Thread) ->
    decode_muc_user_continue_attrs(__TopXMLNS, _attrs,
				   Thread);
decode_muc_user_continue_attrs(__TopXMLNS, [],
			       Thread) ->
    decode_muc_user_continue_attr_thread(__TopXMLNS,
					 Thread).

encode_muc_user_continue(Thread, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#user">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_muc_user_continue_attr_thread(Thread,
						  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									     __TopXMLNS)),
    {xmlel, <<"continue">>, _attrs, _els}.

decode_muc_user_continue_attr_thread(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_muc_user_continue_attr_thread(__TopXMLNS,
				     _val) ->
    _val.

encode_muc_user_continue_attr_thread(<<>>, _acc) ->
    _acc;
encode_muc_user_continue_attr_thread(_val, _acc) ->
    [{<<"thread">>, _val} | _acc].

decode_muc_user_actor(__TopXMLNS, __Opts,
		      {xmlel, <<"actor">>, _attrs, _els}) ->
    {Jid, Nick} = decode_muc_user_actor_attrs(__TopXMLNS,
					      _attrs, undefined, undefined),
    {muc_actor, Jid, Nick}.

decode_muc_user_actor_attrs(__TopXMLNS,
			    [{<<"jid">>, _val} | _attrs], _Jid, Nick) ->
    decode_muc_user_actor_attrs(__TopXMLNS, _attrs, _val,
				Nick);
decode_muc_user_actor_attrs(__TopXMLNS,
			    [{<<"nick">>, _val} | _attrs], Jid, _Nick) ->
    decode_muc_user_actor_attrs(__TopXMLNS, _attrs, Jid,
				_val);
decode_muc_user_actor_attrs(__TopXMLNS, [_ | _attrs],
			    Jid, Nick) ->
    decode_muc_user_actor_attrs(__TopXMLNS, _attrs, Jid,
				Nick);
decode_muc_user_actor_attrs(__TopXMLNS, [], Jid,
			    Nick) ->
    {decode_muc_user_actor_attr_jid(__TopXMLNS, Jid),
     decode_muc_user_actor_attr_nick(__TopXMLNS, Nick)}.

encode_muc_user_actor({muc_actor, Jid, Nick},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#user">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_muc_user_actor_attr_nick(Nick,
					     encode_muc_user_actor_attr_jid(Jid,
									    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
												       __TopXMLNS))),
    {xmlel, <<"actor">>, _attrs, _els}.

decode_muc_user_actor_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_muc_user_actor_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"actor">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_user_actor_attr_jid(undefined, _acc) -> _acc;
encode_muc_user_actor_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_muc_user_actor_attr_nick(__TopXMLNS,
				undefined) ->
    <<>>;
decode_muc_user_actor_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_muc_user_actor_attr_nick(<<>>, _acc) -> _acc;
encode_muc_user_actor_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_muc_user_invite(__TopXMLNS, __Opts,
		       {xmlel, <<"invite">>, _attrs, _els}) ->
    {Continue, Reason} =
	decode_muc_user_invite_els(__TopXMLNS, __Opts, _els,
				   undefined, <<>>),
    {To, From} = decode_muc_user_invite_attrs(__TopXMLNS,
					      _attrs, undefined, undefined),
    {muc_invite, Reason, From, To, Continue}.

decode_muc_user_invite_els(__TopXMLNS, __Opts, [],
			   Continue, Reason) ->
    {Continue, Reason};
decode_muc_user_invite_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"reason">>, _attrs, _} = _el | _els],
			   Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_invite_els(__TopXMLNS, __Opts, _els,
				     Continue,
				     decode_muc_reason(<<"http://jabber.org/protocol/muc#user">>,
						       __Opts, _el));
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_user_invite_els(__TopXMLNS, __Opts, _els,
				     Continue,
				     decode_muc_reason(<<"http://jabber.org/protocol/muc#admin">>,
						       __Opts, _el));
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_user_invite_els(__TopXMLNS, __Opts, _els,
				     Continue,
				     decode_muc_reason(<<"http://jabber.org/protocol/muc#owner">>,
						       __Opts, _el));
      _ ->
	  decode_muc_user_invite_els(__TopXMLNS, __Opts, _els,
				     Continue, Reason)
    end;
decode_muc_user_invite_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"continue">>, _attrs, _} = _el | _els],
			   Continue, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_invite_els(__TopXMLNS, __Opts, _els,
				     decode_muc_user_continue(<<"http://jabber.org/protocol/muc#user">>,
							      __Opts, _el),
				     Reason);
      _ ->
	  decode_muc_user_invite_els(__TopXMLNS, __Opts, _els,
				     Continue, Reason)
    end;
decode_muc_user_invite_els(__TopXMLNS, __Opts,
			   [_ | _els], Continue, Reason) ->
    decode_muc_user_invite_els(__TopXMLNS, __Opts, _els,
			       Continue, Reason).

decode_muc_user_invite_attrs(__TopXMLNS,
			     [{<<"to">>, _val} | _attrs], _To, From) ->
    decode_muc_user_invite_attrs(__TopXMLNS, _attrs, _val,
				 From);
decode_muc_user_invite_attrs(__TopXMLNS,
			     [{<<"from">>, _val} | _attrs], To, _From) ->
    decode_muc_user_invite_attrs(__TopXMLNS, _attrs, To,
				 _val);
decode_muc_user_invite_attrs(__TopXMLNS, [_ | _attrs],
			     To, From) ->
    decode_muc_user_invite_attrs(__TopXMLNS, _attrs, To,
				 From);
decode_muc_user_invite_attrs(__TopXMLNS, [], To,
			     From) ->
    {decode_muc_user_invite_attr_to(__TopXMLNS, To),
     decode_muc_user_invite_attr_from(__TopXMLNS, From)}.

encode_muc_user_invite({muc_invite, Reason, From, To,
			Continue},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#user">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_muc_user_invite_$continue'(Continue,
							 __NewTopXMLNS,
							 'encode_muc_user_invite_$reason'(Reason,
											  __NewTopXMLNS,
											  []))),
    _attrs = encode_muc_user_invite_attr_from(From,
					      encode_muc_user_invite_attr_to(To,
									     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													__TopXMLNS))),
    {xmlel, <<"invite">>, _attrs, _els}.

'encode_muc_user_invite_$continue'(undefined,
				   __TopXMLNS, _acc) ->
    _acc;
'encode_muc_user_invite_$continue'(Continue, __TopXMLNS,
				   _acc) ->
    [encode_muc_user_continue(Continue, __TopXMLNS) | _acc].

'encode_muc_user_invite_$reason'(<<>>, __TopXMLNS,
				 _acc) ->
    _acc;
'encode_muc_user_invite_$reason'(Reason, __TopXMLNS,
				 _acc) ->
    [encode_muc_reason(Reason, __TopXMLNS) | _acc].

decode_muc_user_invite_attr_to(__TopXMLNS, undefined) ->
    undefined;
decode_muc_user_invite_attr_to(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"invite">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_user_invite_attr_to(undefined, _acc) -> _acc;
encode_muc_user_invite_attr_to(_val, _acc) ->
    [{<<"to">>, jid:encode(_val)} | _acc].

decode_muc_user_invite_attr_from(__TopXMLNS,
				 undefined) ->
    undefined;
decode_muc_user_invite_attr_from(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"invite">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_user_invite_attr_from(undefined, _acc) ->
    _acc;
encode_muc_user_invite_attr_from(_val, _acc) ->
    [{<<"from">>, jid:encode(_val)} | _acc].

decode_muc_destroy(__TopXMLNS, __Opts,
		   {xmlel, <<"destroy">>, _attrs, _els}) ->
    {Password, Reason} = decode_muc_destroy_els(__TopXMLNS,
						__Opts, _els, undefined, <<>>),
    {Jid, Xmlns} = decode_muc_destroy_attrs(__TopXMLNS,
					    _attrs, undefined, undefined),
    {muc_destroy, Xmlns, Jid, Reason, Password}.

decode_muc_destroy_els(__TopXMLNS, __Opts, [], Password,
		       Reason) ->
    {Password, Reason};
decode_muc_destroy_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"reason">>, _attrs, _} = _el | _els],
		       Password, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_destroy_els(__TopXMLNS, __Opts, _els,
				 Password,
				 decode_muc_reason(<<"http://jabber.org/protocol/muc#user">>,
						   __Opts, _el));
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_destroy_els(__TopXMLNS, __Opts, _els,
				 Password,
				 decode_muc_reason(<<"http://jabber.org/protocol/muc#admin">>,
						   __Opts, _el));
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_destroy_els(__TopXMLNS, __Opts, _els,
				 Password,
				 decode_muc_reason(<<"http://jabber.org/protocol/muc#owner">>,
						   __Opts, _el));
      _ ->
	  decode_muc_destroy_els(__TopXMLNS, __Opts, _els,
				 Password, Reason)
    end;
decode_muc_destroy_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"password">>, _attrs, _} = _el | _els],
		       Password, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_destroy_els(__TopXMLNS, __Opts, _els,
				 decode_muc_password(<<"http://jabber.org/protocol/muc#owner">>,
						     __Opts, _el),
				 Reason);
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_destroy_els(__TopXMLNS, __Opts, _els,
				 decode_muc_password(<<"http://jabber.org/protocol/muc#user">>,
						     __Opts, _el),
				 Reason);
      <<"http://jabber.org/protocol/muc">> ->
	  decode_muc_destroy_els(__TopXMLNS, __Opts, _els,
				 decode_muc_password(<<"http://jabber.org/protocol/muc">>,
						     __Opts, _el),
				 Reason);
      _ ->
	  decode_muc_destroy_els(__TopXMLNS, __Opts, _els,
				 Password, Reason)
    end;
decode_muc_destroy_els(__TopXMLNS, __Opts, [_ | _els],
		       Password, Reason) ->
    decode_muc_destroy_els(__TopXMLNS, __Opts, _els,
			   Password, Reason).

decode_muc_destroy_attrs(__TopXMLNS,
			 [{<<"jid">>, _val} | _attrs], _Jid, Xmlns) ->
    decode_muc_destroy_attrs(__TopXMLNS, _attrs, _val,
			     Xmlns);
decode_muc_destroy_attrs(__TopXMLNS,
			 [{<<"xmlns">>, _val} | _attrs], Jid, _Xmlns) ->
    decode_muc_destroy_attrs(__TopXMLNS, _attrs, Jid, _val);
decode_muc_destroy_attrs(__TopXMLNS, [_ | _attrs], Jid,
			 Xmlns) ->
    decode_muc_destroy_attrs(__TopXMLNS, _attrs, Jid,
			     Xmlns);
decode_muc_destroy_attrs(__TopXMLNS, [], Jid, Xmlns) ->
    {decode_muc_destroy_attr_jid(__TopXMLNS, Jid),
     decode_muc_destroy_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_muc_destroy({muc_destroy, Xmlns, Jid, Reason,
		    Password},
		   __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"http://jabber.org/protocol/muc#user">>,
						 <<"http://jabber.org/protocol/muc#owner">>],
						__TopXMLNS),
    _els =
	lists:reverse('encode_muc_destroy_$password'(Password,
						     __NewTopXMLNS,
						     'encode_muc_destroy_$reason'(Reason,
										  __NewTopXMLNS,
										  []))),
    _attrs = encode_muc_destroy_attr_jid(Jid,
					 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								    __TopXMLNS)),
    {xmlel, <<"destroy">>, _attrs, _els}.

'encode_muc_destroy_$password'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_muc_destroy_$password'(Password, __TopXMLNS,
			       _acc) ->
    [encode_muc_password(Password, __TopXMLNS) | _acc].

'encode_muc_destroy_$reason'(<<>>, __TopXMLNS, _acc) ->
    _acc;
'encode_muc_destroy_$reason'(Reason, __TopXMLNS,
			     _acc) ->
    [encode_muc_reason(Reason, __TopXMLNS) | _acc].

decode_muc_destroy_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_muc_destroy_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"destroy">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_destroy_attr_jid(undefined, _acc) -> _acc;
encode_muc_destroy_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_muc_destroy_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_muc_destroy_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_muc_user_decline(__TopXMLNS, __Opts,
			{xmlel, <<"decline">>, _attrs, _els}) ->
    Reason = decode_muc_user_decline_els(__TopXMLNS, __Opts,
					 _els, <<>>),
    {To, From} = decode_muc_user_decline_attrs(__TopXMLNS,
					       _attrs, undefined, undefined),
    {muc_decline, Reason, From, To}.

decode_muc_user_decline_els(__TopXMLNS, __Opts, [],
			    Reason) ->
    Reason;
decode_muc_user_decline_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"reason">>, _attrs, _} = _el | _els],
			    Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/muc#user">> ->
	  decode_muc_user_decline_els(__TopXMLNS, __Opts, _els,
				      decode_muc_reason(<<"http://jabber.org/protocol/muc#user">>,
							__Opts, _el));
      <<"http://jabber.org/protocol/muc#admin">> ->
	  decode_muc_user_decline_els(__TopXMLNS, __Opts, _els,
				      decode_muc_reason(<<"http://jabber.org/protocol/muc#admin">>,
							__Opts, _el));
      <<"http://jabber.org/protocol/muc#owner">> ->
	  decode_muc_user_decline_els(__TopXMLNS, __Opts, _els,
				      decode_muc_reason(<<"http://jabber.org/protocol/muc#owner">>,
							__Opts, _el));
      _ ->
	  decode_muc_user_decline_els(__TopXMLNS, __Opts, _els,
				      Reason)
    end;
decode_muc_user_decline_els(__TopXMLNS, __Opts,
			    [_ | _els], Reason) ->
    decode_muc_user_decline_els(__TopXMLNS, __Opts, _els,
				Reason).

decode_muc_user_decline_attrs(__TopXMLNS,
			      [{<<"to">>, _val} | _attrs], _To, From) ->
    decode_muc_user_decline_attrs(__TopXMLNS, _attrs, _val,
				  From);
decode_muc_user_decline_attrs(__TopXMLNS,
			      [{<<"from">>, _val} | _attrs], To, _From) ->
    decode_muc_user_decline_attrs(__TopXMLNS, _attrs, To,
				  _val);
decode_muc_user_decline_attrs(__TopXMLNS, [_ | _attrs],
			      To, From) ->
    decode_muc_user_decline_attrs(__TopXMLNS, _attrs, To,
				  From);
decode_muc_user_decline_attrs(__TopXMLNS, [], To,
			      From) ->
    {decode_muc_user_decline_attr_to(__TopXMLNS, To),
     decode_muc_user_decline_attr_from(__TopXMLNS, From)}.

encode_muc_user_decline({muc_decline, Reason, From, To},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc#user">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_muc_user_decline_$reason'(Reason,
							__NewTopXMLNS, [])),
    _attrs = encode_muc_user_decline_attr_from(From,
					       encode_muc_user_decline_attr_to(To,
									       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													  __TopXMLNS))),
    {xmlel, <<"decline">>, _attrs, _els}.

'encode_muc_user_decline_$reason'(<<>>, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_muc_user_decline_$reason'(Reason, __TopXMLNS,
				  _acc) ->
    [encode_muc_reason(Reason, __TopXMLNS) | _acc].

decode_muc_user_decline_attr_to(__TopXMLNS,
				undefined) ->
    undefined;
decode_muc_user_decline_attr_to(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"decline">>, __TopXMLNS}});
      _res -> _res
    end.

encode_muc_user_decline_attr_to(undefined, _acc) ->
    _acc;
encode_muc_user_decline_attr_to(_val, _acc) ->
    [{<<"to">>, jid:encode(_val)} | _acc].

decode_muc_user_decline_attr_from(__TopXMLNS,
				  undefined) ->
    undefined;
decode_muc_user_decline_attr_from(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"decline">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_user_decline_attr_from(undefined, _acc) ->
    _acc;
encode_muc_user_decline_attr_from(_val, _acc) ->
    [{<<"from">>, jid:encode(_val)} | _acc].

decode_muc_reason(__TopXMLNS, __Opts,
		  {xmlel, <<"reason">>, _attrs, _els}) ->
    Cdata = decode_muc_reason_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_muc_reason_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_muc_reason_cdata(__TopXMLNS, Cdata);
decode_muc_reason_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_muc_reason_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_muc_reason_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_muc_reason_els(__TopXMLNS, __Opts, _els, Cdata).

encode_muc_reason(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"http://jabber.org/protocol/muc#user">>,
						 <<"http://jabber.org/protocol/muc#admin">>,
						 <<"http://jabber.org/protocol/muc#owner">>],
						__TopXMLNS),
    _els = encode_muc_reason_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"reason">>, _attrs, _els}.

decode_muc_reason_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_muc_reason_cdata(__TopXMLNS, _val) -> _val.

encode_muc_reason_cdata(<<>>, _acc) -> _acc;
encode_muc_reason_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_muc_history(__TopXMLNS, __Opts,
		   {xmlel, <<"history">>, _attrs, _els}) ->
    {Maxchars, Maxstanzas, Seconds, Since} =
	decode_muc_history_attrs(__TopXMLNS, _attrs, undefined,
				 undefined, undefined, undefined),
    {muc_history, Maxchars, Maxstanzas, Seconds, Since}.

decode_muc_history_attrs(__TopXMLNS,
			 [{<<"maxchars">>, _val} | _attrs], _Maxchars,
			 Maxstanzas, Seconds, Since) ->
    decode_muc_history_attrs(__TopXMLNS, _attrs, _val,
			     Maxstanzas, Seconds, Since);
decode_muc_history_attrs(__TopXMLNS,
			 [{<<"maxstanzas">>, _val} | _attrs], Maxchars,
			 _Maxstanzas, Seconds, Since) ->
    decode_muc_history_attrs(__TopXMLNS, _attrs, Maxchars,
			     _val, Seconds, Since);
decode_muc_history_attrs(__TopXMLNS,
			 [{<<"seconds">>, _val} | _attrs], Maxchars, Maxstanzas,
			 _Seconds, Since) ->
    decode_muc_history_attrs(__TopXMLNS, _attrs, Maxchars,
			     Maxstanzas, _val, Since);
decode_muc_history_attrs(__TopXMLNS,
			 [{<<"since">>, _val} | _attrs], Maxchars, Maxstanzas,
			 Seconds, _Since) ->
    decode_muc_history_attrs(__TopXMLNS, _attrs, Maxchars,
			     Maxstanzas, Seconds, _val);
decode_muc_history_attrs(__TopXMLNS, [_ | _attrs],
			 Maxchars, Maxstanzas, Seconds, Since) ->
    decode_muc_history_attrs(__TopXMLNS, _attrs, Maxchars,
			     Maxstanzas, Seconds, Since);
decode_muc_history_attrs(__TopXMLNS, [], Maxchars,
			 Maxstanzas, Seconds, Since) ->
    {decode_muc_history_attr_maxchars(__TopXMLNS, Maxchars),
     decode_muc_history_attr_maxstanzas(__TopXMLNS,
					Maxstanzas),
     decode_muc_history_attr_seconds(__TopXMLNS, Seconds),
     decode_muc_history_attr_since(__TopXMLNS, Since)}.

encode_muc_history({muc_history, Maxchars, Maxstanzas,
		    Seconds, Since},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/muc">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_muc_history_attr_since(Since,
					   encode_muc_history_attr_seconds(Seconds,
									   encode_muc_history_attr_maxstanzas(Maxstanzas,
													      encode_muc_history_attr_maxchars(Maxchars,
																	       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																					  __TopXMLNS))))),
    {xmlel, <<"history">>, _attrs, _els}.

decode_muc_history_attr_maxchars(__TopXMLNS,
				 undefined) ->
    undefined;
decode_muc_history_attr_maxchars(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"maxchars">>, <<"history">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_history_attr_maxchars(undefined, _acc) ->
    _acc;
encode_muc_history_attr_maxchars(_val, _acc) ->
    [{<<"maxchars">>, enc_int(_val)} | _acc].

decode_muc_history_attr_maxstanzas(__TopXMLNS,
				   undefined) ->
    undefined;
decode_muc_history_attr_maxstanzas(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"maxstanzas">>, <<"history">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_history_attr_maxstanzas(undefined, _acc) ->
    _acc;
encode_muc_history_attr_maxstanzas(_val, _acc) ->
    [{<<"maxstanzas">>, enc_int(_val)} | _acc].

decode_muc_history_attr_seconds(__TopXMLNS,
				undefined) ->
    undefined;
decode_muc_history_attr_seconds(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"seconds">>, <<"history">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_history_attr_seconds(undefined, _acc) ->
    _acc;
encode_muc_history_attr_seconds(_val, _acc) ->
    [{<<"seconds">>, enc_int(_val)} | _acc].

decode_muc_history_attr_since(__TopXMLNS, undefined) ->
    undefined;
decode_muc_history_attr_since(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"since">>, <<"history">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_muc_history_attr_since(undefined, _acc) -> _acc;
encode_muc_history_attr_since(_val, _acc) ->
    [{<<"since">>, enc_utc(_val)} | _acc].
