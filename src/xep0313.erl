%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0313).

-compile(export_all).

do_decode(<<"fin">>, <<"urn:xmpp:mam:0">>, El, Opts) ->
    decode_mam_fin(<<"urn:xmpp:mam:0">>, Opts, El);
do_decode(<<"fin">>, <<"urn:xmpp:mam:1">>, El, Opts) ->
    decode_mam_fin(<<"urn:xmpp:mam:1">>, Opts, El);
do_decode(<<"prefs">>, <<"urn:xmpp:mam:0">>, El,
	  Opts) ->
    decode_mam_prefs(<<"urn:xmpp:mam:0">>, Opts, El);
do_decode(<<"prefs">>, <<"urn:xmpp:mam:1">>, El,
	  Opts) ->
    decode_mam_prefs(<<"urn:xmpp:mam:1">>, Opts, El);
do_decode(<<"prefs">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_prefs(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"always">>, <<"urn:xmpp:mam:0">>, El,
	  Opts) ->
    decode_mam_always(<<"urn:xmpp:mam:0">>, Opts, El);
do_decode(<<"always">>, <<"urn:xmpp:mam:1">>, El,
	  Opts) ->
    decode_mam_always(<<"urn:xmpp:mam:1">>, Opts, El);
do_decode(<<"always">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_always(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"never">>, <<"urn:xmpp:mam:0">>, El,
	  Opts) ->
    decode_mam_never(<<"urn:xmpp:mam:0">>, Opts, El);
do_decode(<<"never">>, <<"urn:xmpp:mam:1">>, El,
	  Opts) ->
    decode_mam_never(<<"urn:xmpp:mam:1">>, Opts, El);
do_decode(<<"never">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_never(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"jid">>, <<"urn:xmpp:mam:0">>, El, Opts) ->
    decode_mam_jid(<<"urn:xmpp:mam:0">>, Opts, El);
do_decode(<<"jid">>, <<"urn:xmpp:mam:1">>, El, Opts) ->
    decode_mam_jid(<<"urn:xmpp:mam:1">>, Opts, El);
do_decode(<<"jid">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_jid(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"result">>, <<"urn:xmpp:mam:0">>, El,
	  Opts) ->
    decode_mam_result(<<"urn:xmpp:mam:0">>, Opts, El);
do_decode(<<"result">>, <<"urn:xmpp:mam:1">>, El,
	  Opts) ->
    decode_mam_result(<<"urn:xmpp:mam:1">>, Opts, El);
do_decode(<<"result">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_result(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"archived">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_archived(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"query">>, <<"urn:xmpp:mam:0">>, El,
	  Opts) ->
    decode_mam_query(<<"urn:xmpp:mam:0">>, Opts, El);
do_decode(<<"query">>, <<"urn:xmpp:mam:1">>, El,
	  Opts) ->
    decode_mam_query(<<"urn:xmpp:mam:1">>, Opts, El);
do_decode(<<"query">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_query(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"withtext">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_withtext(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"with">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_with(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"end">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_end(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(<<"start">>, <<"urn:xmpp:mam:tmp">>, El,
	  Opts) ->
    decode_mam_start(<<"urn:xmpp:mam:tmp">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"fin">>, <<"urn:xmpp:mam:0">>},
     {<<"fin">>, <<"urn:xmpp:mam:1">>},
     {<<"prefs">>, <<"urn:xmpp:mam:0">>},
     {<<"prefs">>, <<"urn:xmpp:mam:1">>},
     {<<"prefs">>, <<"urn:xmpp:mam:tmp">>},
     {<<"always">>, <<"urn:xmpp:mam:0">>},
     {<<"always">>, <<"urn:xmpp:mam:1">>},
     {<<"always">>, <<"urn:xmpp:mam:tmp">>},
     {<<"never">>, <<"urn:xmpp:mam:0">>},
     {<<"never">>, <<"urn:xmpp:mam:1">>},
     {<<"never">>, <<"urn:xmpp:mam:tmp">>},
     {<<"jid">>, <<"urn:xmpp:mam:0">>},
     {<<"jid">>, <<"urn:xmpp:mam:1">>},
     {<<"jid">>, <<"urn:xmpp:mam:tmp">>},
     {<<"result">>, <<"urn:xmpp:mam:0">>},
     {<<"result">>, <<"urn:xmpp:mam:1">>},
     {<<"result">>, <<"urn:xmpp:mam:tmp">>},
     {<<"archived">>, <<"urn:xmpp:mam:tmp">>},
     {<<"query">>, <<"urn:xmpp:mam:0">>},
     {<<"query">>, <<"urn:xmpp:mam:1">>},
     {<<"query">>, <<"urn:xmpp:mam:tmp">>},
     {<<"withtext">>, <<"urn:xmpp:mam:tmp">>},
     {<<"with">>, <<"urn:xmpp:mam:tmp">>},
     {<<"end">>, <<"urn:xmpp:mam:tmp">>},
     {<<"start">>, <<"urn:xmpp:mam:tmp">>}].

do_encode({mam_query, _, _, _, _, _, _, _, _} = Query,
	  TopXMLNS) ->
    encode_mam_query(Query, TopXMLNS);
do_encode({mam_archived, _, _} = Archived, TopXMLNS) ->
    encode_mam_archived(Archived, TopXMLNS);
do_encode({mam_result, _, _, _, _} = Result,
	  TopXMLNS) ->
    encode_mam_result(Result, TopXMLNS);
do_encode({mam_prefs, _, _, _, _} = Prefs, TopXMLNS) ->
    encode_mam_prefs(Prefs, TopXMLNS);
do_encode({mam_fin, _, _, _, _, _} = Fin, TopXMLNS) ->
    encode_mam_fin(Fin, TopXMLNS).

do_get_name({mam_archived, _, _}) -> <<"archived">>;
do_get_name({mam_fin, _, _, _, _, _}) -> <<"fin">>;
do_get_name({mam_prefs, _, _, _, _}) -> <<"prefs">>;
do_get_name({mam_query, _, _, _, _, _, _, _, _}) ->
    <<"query">>;
do_get_name({mam_result, _, _, _, _}) -> <<"result">>.

do_get_ns({mam_archived, _, _}) ->
    <<"urn:xmpp:mam:tmp">>;
do_get_ns({mam_fin, Xmlns, _, _, _, _}) -> Xmlns;
do_get_ns({mam_prefs, Xmlns, _, _, _}) -> Xmlns;
do_get_ns({mam_query, Xmlns, _, _, _, _, _, _, _}) ->
    Xmlns;
do_get_ns({mam_result, Xmlns, _, _, _}) -> Xmlns.

pp(mam_query, 8) ->
    [xmlns, id, start, 'end', with, withtext, rsm, xdata];
pp(mam_archived, 2) -> [by, id];
pp(mam_result, 4) -> [xmlns, queryid, id, sub_els];
pp(mam_prefs, 4) -> [xmlns, default, always, never];
pp(mam_fin, 5) -> [xmlns, id, rsm, stable, complete];
pp(_, _) -> no.

records() ->
    [{mam_query, 8}, {mam_archived, 2}, {mam_result, 4},
     {mam_prefs, 4}, {mam_fin, 5}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_mam_fin(__TopXMLNS, __Opts,
	       {xmlel, <<"fin">>, _attrs, _els}) ->
    Rsm = decode_mam_fin_els(__TopXMLNS, __Opts, _els,
			     undefined),
    {Id, Xmlns, Stable, Complete} =
	decode_mam_fin_attrs(__TopXMLNS, _attrs, undefined,
			     undefined, undefined, undefined),
    {mam_fin, Xmlns, Id, Rsm, Stable, Complete}.

decode_mam_fin_els(__TopXMLNS, __Opts, [], Rsm) -> Rsm;
decode_mam_fin_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"set">>, _attrs, _} = _el | _els], Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_mam_fin_els(__TopXMLNS, __Opts, _els,
			     xep0059:decode_rsm_set(<<"http://jabber.org/protocol/rsm">>,
						    __Opts, _el));
      _ -> decode_mam_fin_els(__TopXMLNS, __Opts, _els, Rsm)
    end;
decode_mam_fin_els(__TopXMLNS, __Opts, [_ | _els],
		   Rsm) ->
    decode_mam_fin_els(__TopXMLNS, __Opts, _els, Rsm).

decode_mam_fin_attrs(__TopXMLNS,
		     [{<<"queryid">>, _val} | _attrs], _Id, Xmlns, Stable,
		     Complete) ->
    decode_mam_fin_attrs(__TopXMLNS, _attrs, _val, Xmlns,
			 Stable, Complete);
decode_mam_fin_attrs(__TopXMLNS,
		     [{<<"xmlns">>, _val} | _attrs], Id, _Xmlns, Stable,
		     Complete) ->
    decode_mam_fin_attrs(__TopXMLNS, _attrs, Id, _val,
			 Stable, Complete);
decode_mam_fin_attrs(__TopXMLNS,
		     [{<<"stable">>, _val} | _attrs], Id, Xmlns, _Stable,
		     Complete) ->
    decode_mam_fin_attrs(__TopXMLNS, _attrs, Id, Xmlns,
			 _val, Complete);
decode_mam_fin_attrs(__TopXMLNS,
		     [{<<"complete">>, _val} | _attrs], Id, Xmlns, Stable,
		     _Complete) ->
    decode_mam_fin_attrs(__TopXMLNS, _attrs, Id, Xmlns,
			 Stable, _val);
decode_mam_fin_attrs(__TopXMLNS, [_ | _attrs], Id,
		     Xmlns, Stable, Complete) ->
    decode_mam_fin_attrs(__TopXMLNS, _attrs, Id, Xmlns,
			 Stable, Complete);
decode_mam_fin_attrs(__TopXMLNS, [], Id, Xmlns, Stable,
		     Complete) ->
    {decode_mam_fin_attr_queryid(__TopXMLNS, Id),
     decode_mam_fin_attr_xmlns(__TopXMLNS, Xmlns),
     decode_mam_fin_attr_stable(__TopXMLNS, Stable),
     decode_mam_fin_attr_complete(__TopXMLNS, Complete)}.

encode_mam_fin({mam_fin, Xmlns, Id, Rsm, Stable,
		Complete},
	       __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:mam:0">>,
						 <<"urn:xmpp:mam:1">>],
						__TopXMLNS),
    _els = lists:reverse('encode_mam_fin_$rsm'(Rsm,
					       __NewTopXMLNS, [])),
    _attrs = encode_mam_fin_attr_complete(Complete,
					  encode_mam_fin_attr_stable(Stable,
								     encode_mam_fin_attr_queryid(Id,
												 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
															    __TopXMLNS)))),
    {xmlel, <<"fin">>, _attrs, _els}.

'encode_mam_fin_$rsm'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_mam_fin_$rsm'(Rsm, __TopXMLNS, _acc) ->
    [xep0059:encode_rsm_set(Rsm, __TopXMLNS) | _acc].

decode_mam_fin_attr_queryid(__TopXMLNS, undefined) ->
    <<>>;
decode_mam_fin_attr_queryid(__TopXMLNS, _val) -> _val.

encode_mam_fin_attr_queryid(<<>>, _acc) -> _acc;
encode_mam_fin_attr_queryid(_val, _acc) ->
    [{<<"queryid">>, _val} | _acc].

decode_mam_fin_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mam_fin_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mam_fin_attr_stable(__TopXMLNS, undefined) ->
    undefined;
decode_mam_fin_attr_stable(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"stable">>, <<"fin">>, __TopXMLNS}});
      _res -> _res
    end.

encode_mam_fin_attr_stable(undefined, _acc) -> _acc;
encode_mam_fin_attr_stable(_val, _acc) ->
    [{<<"stable">>, enc_bool(_val)} | _acc].

decode_mam_fin_attr_complete(__TopXMLNS, undefined) ->
    undefined;
decode_mam_fin_attr_complete(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"complete">>, <<"fin">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_mam_fin_attr_complete(undefined, _acc) -> _acc;
encode_mam_fin_attr_complete(_val, _acc) ->
    [{<<"complete">>, enc_bool(_val)} | _acc].

decode_mam_prefs(__TopXMLNS, __Opts,
		 {xmlel, <<"prefs">>, _attrs, _els}) ->
    {Never, Always} = decode_mam_prefs_els(__TopXMLNS,
					   __Opts, _els, undefined, undefined),
    {Default, Xmlns} = decode_mam_prefs_attrs(__TopXMLNS,
					      _attrs, undefined, undefined),
    {mam_prefs, Xmlns, Default, Always, Never}.

decode_mam_prefs_els(__TopXMLNS, __Opts, [], Never,
		     Always) ->
    {Never, Always};
decode_mam_prefs_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"always">>, _attrs, _} = _el | _els], Never,
		     Always) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mam:0">> ->
	  decode_mam_prefs_els(__TopXMLNS, __Opts, _els, Never,
			       decode_mam_always(<<"urn:xmpp:mam:0">>, __Opts,
						 _el));
      <<"urn:xmpp:mam:1">> ->
	  decode_mam_prefs_els(__TopXMLNS, __Opts, _els, Never,
			       decode_mam_always(<<"urn:xmpp:mam:1">>, __Opts,
						 _el));
      <<"urn:xmpp:mam:tmp">> ->
	  decode_mam_prefs_els(__TopXMLNS, __Opts, _els, Never,
			       decode_mam_always(<<"urn:xmpp:mam:tmp">>, __Opts,
						 _el));
      _ ->
	  decode_mam_prefs_els(__TopXMLNS, __Opts, _els, Never,
			       Always)
    end;
decode_mam_prefs_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"never">>, _attrs, _} = _el | _els], Never,
		     Always) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mam:0">> ->
	  decode_mam_prefs_els(__TopXMLNS, __Opts, _els,
			       decode_mam_never(<<"urn:xmpp:mam:0">>, __Opts,
						_el),
			       Always);
      <<"urn:xmpp:mam:1">> ->
	  decode_mam_prefs_els(__TopXMLNS, __Opts, _els,
			       decode_mam_never(<<"urn:xmpp:mam:1">>, __Opts,
						_el),
			       Always);
      <<"urn:xmpp:mam:tmp">> ->
	  decode_mam_prefs_els(__TopXMLNS, __Opts, _els,
			       decode_mam_never(<<"urn:xmpp:mam:tmp">>, __Opts,
						_el),
			       Always);
      _ ->
	  decode_mam_prefs_els(__TopXMLNS, __Opts, _els, Never,
			       Always)
    end;
decode_mam_prefs_els(__TopXMLNS, __Opts, [_ | _els],
		     Never, Always) ->
    decode_mam_prefs_els(__TopXMLNS, __Opts, _els, Never,
			 Always).

decode_mam_prefs_attrs(__TopXMLNS,
		       [{<<"default">>, _val} | _attrs], _Default, Xmlns) ->
    decode_mam_prefs_attrs(__TopXMLNS, _attrs, _val, Xmlns);
decode_mam_prefs_attrs(__TopXMLNS,
		       [{<<"xmlns">>, _val} | _attrs], Default, _Xmlns) ->
    decode_mam_prefs_attrs(__TopXMLNS, _attrs, Default,
			   _val);
decode_mam_prefs_attrs(__TopXMLNS, [_ | _attrs],
		       Default, Xmlns) ->
    decode_mam_prefs_attrs(__TopXMLNS, _attrs, Default,
			   Xmlns);
decode_mam_prefs_attrs(__TopXMLNS, [], Default,
		       Xmlns) ->
    {decode_mam_prefs_attr_default(__TopXMLNS, Default),
     decode_mam_prefs_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_mam_prefs({mam_prefs, Xmlns, Default, Always,
		  Never},
		 __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:mam:0">>,
						 <<"urn:xmpp:mam:1">>,
						 <<"urn:xmpp:mam:tmp">>],
						__TopXMLNS),
    _els = lists:reverse('encode_mam_prefs_$never'(Never,
						   __NewTopXMLNS,
						   'encode_mam_prefs_$always'(Always,
									      __NewTopXMLNS,
									      []))),
    _attrs = encode_mam_prefs_attr_default(Default,
					   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								      __TopXMLNS)),
    {xmlel, <<"prefs">>, _attrs, _els}.

'encode_mam_prefs_$never'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_mam_prefs_$never'(Never, __TopXMLNS, _acc) ->
    [encode_mam_never(Never, __TopXMLNS) | _acc].

'encode_mam_prefs_$always'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_mam_prefs_$always'(Always, __TopXMLNS, _acc) ->
    [encode_mam_always(Always, __TopXMLNS) | _acc].

decode_mam_prefs_attr_default(__TopXMLNS, undefined) ->
    undefined;
decode_mam_prefs_attr_default(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [always, never, roster]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"default">>, <<"prefs">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_mam_prefs_attr_default(undefined, _acc) -> _acc;
encode_mam_prefs_attr_default(_val, _acc) ->
    [{<<"default">>, enc_enum(_val)} | _acc].

decode_mam_prefs_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mam_prefs_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mam_always(__TopXMLNS, __Opts,
		  {xmlel, <<"always">>, _attrs, _els}) ->
    Jids = decode_mam_always_els(__TopXMLNS, __Opts, _els,
				 []),
    Jids.

decode_mam_always_els(__TopXMLNS, __Opts, [], Jids) ->
    lists:reverse(Jids);
decode_mam_always_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"jid">>, _attrs, _} = _el | _els], Jids) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mam:0">> ->
	  decode_mam_always_els(__TopXMLNS, __Opts, _els,
				[decode_mam_jid(<<"urn:xmpp:mam:0">>, __Opts,
						_el)
				 | Jids]);
      <<"urn:xmpp:mam:1">> ->
	  decode_mam_always_els(__TopXMLNS, __Opts, _els,
				[decode_mam_jid(<<"urn:xmpp:mam:1">>, __Opts,
						_el)
				 | Jids]);
      <<"urn:xmpp:mam:tmp">> ->
	  decode_mam_always_els(__TopXMLNS, __Opts, _els,
				[decode_mam_jid(<<"urn:xmpp:mam:tmp">>, __Opts,
						_el)
				 | Jids]);
      _ ->
	  decode_mam_always_els(__TopXMLNS, __Opts, _els, Jids)
    end;
decode_mam_always_els(__TopXMLNS, __Opts, [_ | _els],
		      Jids) ->
    decode_mam_always_els(__TopXMLNS, __Opts, _els, Jids).

encode_mam_always(Jids, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:xmpp:mam:0">>,
						 <<"urn:xmpp:mam:1">>,
						 <<"urn:xmpp:mam:tmp">>],
						__TopXMLNS),
    _els = lists:reverse('encode_mam_always_$jids'(Jids,
						   __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"always">>, _attrs, _els}.

'encode_mam_always_$jids'([], __TopXMLNS, _acc) -> _acc;
'encode_mam_always_$jids'([Jids | _els], __TopXMLNS,
			  _acc) ->
    'encode_mam_always_$jids'(_els, __TopXMLNS,
			      [encode_mam_jid(Jids, __TopXMLNS) | _acc]).

decode_mam_never(__TopXMLNS, __Opts,
		 {xmlel, <<"never">>, _attrs, _els}) ->
    Jids = decode_mam_never_els(__TopXMLNS, __Opts, _els,
				[]),
    Jids.

decode_mam_never_els(__TopXMLNS, __Opts, [], Jids) ->
    lists:reverse(Jids);
decode_mam_never_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"jid">>, _attrs, _} = _el | _els], Jids) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mam:0">> ->
	  decode_mam_never_els(__TopXMLNS, __Opts, _els,
			       [decode_mam_jid(<<"urn:xmpp:mam:0">>, __Opts,
					       _el)
				| Jids]);
      <<"urn:xmpp:mam:1">> ->
	  decode_mam_never_els(__TopXMLNS, __Opts, _els,
			       [decode_mam_jid(<<"urn:xmpp:mam:1">>, __Opts,
					       _el)
				| Jids]);
      <<"urn:xmpp:mam:tmp">> ->
	  decode_mam_never_els(__TopXMLNS, __Opts, _els,
			       [decode_mam_jid(<<"urn:xmpp:mam:tmp">>, __Opts,
					       _el)
				| Jids]);
      _ ->
	  decode_mam_never_els(__TopXMLNS, __Opts, _els, Jids)
    end;
decode_mam_never_els(__TopXMLNS, __Opts, [_ | _els],
		     Jids) ->
    decode_mam_never_els(__TopXMLNS, __Opts, _els, Jids).

encode_mam_never(Jids, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:xmpp:mam:0">>,
						 <<"urn:xmpp:mam:1">>,
						 <<"urn:xmpp:mam:tmp">>],
						__TopXMLNS),
    _els = lists:reverse('encode_mam_never_$jids'(Jids,
						  __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"never">>, _attrs, _els}.

'encode_mam_never_$jids'([], __TopXMLNS, _acc) -> _acc;
'encode_mam_never_$jids'([Jids | _els], __TopXMLNS,
			 _acc) ->
    'encode_mam_never_$jids'(_els, __TopXMLNS,
			     [encode_mam_jid(Jids, __TopXMLNS) | _acc]).

decode_mam_jid(__TopXMLNS, __Opts,
	       {xmlel, <<"jid">>, _attrs, _els}) ->
    Cdata = decode_mam_jid_els(__TopXMLNS, __Opts, _els,
			       <<>>),
    Cdata.

decode_mam_jid_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_mam_jid_cdata(__TopXMLNS, Cdata);
decode_mam_jid_els(__TopXMLNS, __Opts,
		   [{xmlcdata, _data} | _els], Cdata) ->
    decode_mam_jid_els(__TopXMLNS, __Opts, _els,
		       <<Cdata/binary, _data/binary>>);
decode_mam_jid_els(__TopXMLNS, __Opts, [_ | _els],
		   Cdata) ->
    decode_mam_jid_els(__TopXMLNS, __Opts, _els, Cdata).

encode_mam_jid(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:xmpp:mam:0">>,
						 <<"urn:xmpp:mam:1">>,
						 <<"urn:xmpp:mam:tmp">>],
						__TopXMLNS),
    _els = encode_mam_jid_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"jid">>, _attrs, _els}.

decode_mam_jid_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"jid">>, __TopXMLNS}});
decode_mam_jid_cdata(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"jid">>, __TopXMLNS}});
      _res -> _res
    end.

encode_mam_jid_cdata(_val, _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].

decode_mam_result(__TopXMLNS, __Opts,
		  {xmlel, <<"result">>, _attrs, _els}) ->
    __Els = decode_mam_result_els(__TopXMLNS, __Opts, _els,
				  []),
    {Queryid, Xmlns, Id} =
	decode_mam_result_attrs(__TopXMLNS, _attrs, undefined,
				undefined, undefined),
    {mam_result, Xmlns, Queryid, Id, __Els}.

decode_mam_result_els(__TopXMLNS, __Opts, [], __Els) ->
    lists:reverse(__Els);
decode_mam_result_els(__TopXMLNS, __Opts,
		      [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_mam_result_els(__TopXMLNS, __Opts, _els,
				[_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_mam_result_els(__TopXMLNS, __Opts, _els, __Els);
	    Mod ->
		decode_mam_result_els(__TopXMLNS, __Opts, _els,
				      [Mod:do_decode(_name, __XMLNS, _el,
						     __Opts)
				       | __Els])
	  end
    end;
decode_mam_result_els(__TopXMLNS, __Opts, [_ | _els],
		      __Els) ->
    decode_mam_result_els(__TopXMLNS, __Opts, _els, __Els).

decode_mam_result_attrs(__TopXMLNS,
			[{<<"queryid">>, _val} | _attrs], _Queryid, Xmlns,
			Id) ->
    decode_mam_result_attrs(__TopXMLNS, _attrs, _val, Xmlns,
			    Id);
decode_mam_result_attrs(__TopXMLNS,
			[{<<"xmlns">>, _val} | _attrs], Queryid, _Xmlns, Id) ->
    decode_mam_result_attrs(__TopXMLNS, _attrs, Queryid,
			    _val, Id);
decode_mam_result_attrs(__TopXMLNS,
			[{<<"id">>, _val} | _attrs], Queryid, Xmlns, _Id) ->
    decode_mam_result_attrs(__TopXMLNS, _attrs, Queryid,
			    Xmlns, _val);
decode_mam_result_attrs(__TopXMLNS, [_ | _attrs],
			Queryid, Xmlns, Id) ->
    decode_mam_result_attrs(__TopXMLNS, _attrs, Queryid,
			    Xmlns, Id);
decode_mam_result_attrs(__TopXMLNS, [], Queryid, Xmlns,
			Id) ->
    {decode_mam_result_attr_queryid(__TopXMLNS, Queryid),
     decode_mam_result_attr_xmlns(__TopXMLNS, Xmlns),
     decode_mam_result_attr_id(__TopXMLNS, Id)}.

encode_mam_result({mam_result, Xmlns, Queryid, Id,
		   __Els},
		  __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:mam:0">>,
						 <<"urn:xmpp:mam:1">>,
						 <<"urn:xmpp:mam:tmp">>],
						__TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els],
    _attrs = encode_mam_result_attr_id(Id,
				       encode_mam_result_attr_queryid(Queryid,
								      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
												 __TopXMLNS))),
    {xmlel, <<"result">>, _attrs, _els}.

decode_mam_result_attr_queryid(__TopXMLNS, undefined) ->
    <<>>;
decode_mam_result_attr_queryid(__TopXMLNS, _val) ->
    _val.

encode_mam_result_attr_queryid(<<>>, _acc) -> _acc;
encode_mam_result_attr_queryid(_val, _acc) ->
    [{<<"queryid">>, _val} | _acc].

decode_mam_result_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mam_result_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mam_result_attr_id(__TopXMLNS, undefined) ->
    <<>>;
decode_mam_result_attr_id(__TopXMLNS, _val) -> _val.

encode_mam_result_attr_id(<<>>, _acc) -> _acc;
encode_mam_result_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_mam_archived(__TopXMLNS, __Opts,
		    {xmlel, <<"archived">>, _attrs, _els}) ->
    {Id, By} = decode_mam_archived_attrs(__TopXMLNS, _attrs,
					 undefined, undefined),
    {mam_archived, By, Id}.

decode_mam_archived_attrs(__TopXMLNS,
			  [{<<"id">>, _val} | _attrs], _Id, By) ->
    decode_mam_archived_attrs(__TopXMLNS, _attrs, _val, By);
decode_mam_archived_attrs(__TopXMLNS,
			  [{<<"by">>, _val} | _attrs], Id, _By) ->
    decode_mam_archived_attrs(__TopXMLNS, _attrs, Id, _val);
decode_mam_archived_attrs(__TopXMLNS, [_ | _attrs], Id,
			  By) ->
    decode_mam_archived_attrs(__TopXMLNS, _attrs, Id, By);
decode_mam_archived_attrs(__TopXMLNS, [], Id, By) ->
    {decode_mam_archived_attr_id(__TopXMLNS, Id),
     decode_mam_archived_attr_by(__TopXMLNS, By)}.

encode_mam_archived({mam_archived, By, Id},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mam:tmp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_mam_archived_attr_by(By,
					 encode_mam_archived_attr_id(Id,
								     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
												__TopXMLNS))),
    {xmlel, <<"archived">>, _attrs, _els}.

decode_mam_archived_attr_id(__TopXMLNS, undefined) ->
    <<>>;
decode_mam_archived_attr_id(__TopXMLNS, _val) -> _val.

encode_mam_archived_attr_id(<<>>, _acc) -> _acc;
encode_mam_archived_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_mam_archived_attr_by(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"by">>, <<"archived">>, __TopXMLNS}});
decode_mam_archived_attr_by(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"by">>, <<"archived">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_mam_archived_attr_by(_val, _acc) ->
    [{<<"by">>, jid:encode(_val)} | _acc].

decode_mam_query(__TopXMLNS, __Opts,
		 {xmlel, <<"query">>, _attrs, _els}) ->
    {Xdata, Withtext, End, Start, With, Rsm} =
	decode_mam_query_els(__TopXMLNS, __Opts, _els,
			     undefined, undefined, undefined, undefined,
			     undefined, undefined),
    {Id, Xmlns} = decode_mam_query_attrs(__TopXMLNS, _attrs,
					 undefined, undefined),
    {mam_query, Xmlns, Id, Start, End, With, Withtext, Rsm,
     Xdata}.

decode_mam_query_els(__TopXMLNS, __Opts, [], Xdata,
		     Withtext, End, Start, With, Rsm) ->
    {Xdata, Withtext, End, Start, With, Rsm};
decode_mam_query_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"start">>, _attrs, _} = _el | _els], Xdata,
		     Withtext, End, Start, With, Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mam:tmp">> ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext, End,
			       decode_mam_start(<<"urn:xmpp:mam:tmp">>, __Opts,
						_el),
			       With, Rsm);
      _ ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext, End, Start, With, Rsm)
    end;
decode_mam_query_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"end">>, _attrs, _} = _el | _els], Xdata,
		     Withtext, End, Start, With, Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mam:tmp">> ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext,
			       decode_mam_end(<<"urn:xmpp:mam:tmp">>, __Opts,
					      _el),
			       Start, With, Rsm);
      _ ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext, End, Start, With, Rsm)
    end;
decode_mam_query_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"with">>, _attrs, _} = _el | _els], Xdata,
		     Withtext, End, Start, With, Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mam:tmp">> ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext, End, Start,
			       decode_mam_with(<<"urn:xmpp:mam:tmp">>, __Opts,
					       _el),
			       Rsm);
      _ ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext, End, Start, With, Rsm)
    end;
decode_mam_query_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"withtext">>, _attrs, _} = _el | _els],
		     Xdata, Withtext, End, Start, With, Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:mam:tmp">> ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       decode_mam_withtext(<<"urn:xmpp:mam:tmp">>,
						   __Opts, _el),
			       End, Start, With, Rsm);
      _ ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext, End, Start, With, Rsm)
    end;
decode_mam_query_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"set">>, _attrs, _} = _el | _els], Xdata,
		     Withtext, End, Start, With, Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext, End, Start, With,
			       xep0059:decode_rsm_set(<<"http://jabber.org/protocol/rsm">>,
						      __Opts, _el));
      _ ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext, End, Start, With, Rsm)
    end;
decode_mam_query_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"x">>, _attrs, _} = _el | _els], Xdata,
		     Withtext, End, Start, With, Rsm) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els,
			       xep0004:decode_xdata(<<"jabber:x:data">>, __Opts,
						    _el),
			       Withtext, End, Start, With, Rsm);
      _ ->
	  decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			       Withtext, End, Start, With, Rsm)
    end;
decode_mam_query_els(__TopXMLNS, __Opts, [_ | _els],
		     Xdata, Withtext, End, Start, With, Rsm) ->
    decode_mam_query_els(__TopXMLNS, __Opts, _els, Xdata,
			 Withtext, End, Start, With, Rsm).

decode_mam_query_attrs(__TopXMLNS,
		       [{<<"queryid">>, _val} | _attrs], _Id, Xmlns) ->
    decode_mam_query_attrs(__TopXMLNS, _attrs, _val, Xmlns);
decode_mam_query_attrs(__TopXMLNS,
		       [{<<"xmlns">>, _val} | _attrs], Id, _Xmlns) ->
    decode_mam_query_attrs(__TopXMLNS, _attrs, Id, _val);
decode_mam_query_attrs(__TopXMLNS, [_ | _attrs], Id,
		       Xmlns) ->
    decode_mam_query_attrs(__TopXMLNS, _attrs, Id, Xmlns);
decode_mam_query_attrs(__TopXMLNS, [], Id, Xmlns) ->
    {decode_mam_query_attr_queryid(__TopXMLNS, Id),
     decode_mam_query_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_mam_query({mam_query, Xmlns, Id, Start, End,
		  With, Withtext, Rsm, Xdata},
		 __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:mam:0">>,
						 <<"urn:xmpp:mam:1">>,
						 <<"urn:xmpp:mam:tmp">>],
						__TopXMLNS),
    _els = lists:reverse('encode_mam_query_$xdata'(Xdata,
						   __NewTopXMLNS,
						   'encode_mam_query_$withtext'(Withtext,
										__NewTopXMLNS,
										'encode_mam_query_$end'(End,
													__NewTopXMLNS,
													'encode_mam_query_$start'(Start,
																  __NewTopXMLNS,
																  'encode_mam_query_$with'(With,
																			   __NewTopXMLNS,
																			   'encode_mam_query_$rsm'(Rsm,
																						   __NewTopXMLNS,
																						   []))))))),
    _attrs = encode_mam_query_attr_queryid(Id,
					   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								      __TopXMLNS)),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_mam_query_$xdata'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_mam_query_$xdata'(Xdata, __TopXMLNS, _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

'encode_mam_query_$withtext'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_mam_query_$withtext'(Withtext, __TopXMLNS,
			     _acc) ->
    [encode_mam_withtext(Withtext, __TopXMLNS) | _acc].

'encode_mam_query_$end'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_mam_query_$end'(End, __TopXMLNS, _acc) ->
    [encode_mam_end(End, __TopXMLNS) | _acc].

'encode_mam_query_$start'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_mam_query_$start'(Start, __TopXMLNS, _acc) ->
    [encode_mam_start(Start, __TopXMLNS) | _acc].

'encode_mam_query_$with'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_mam_query_$with'(With, __TopXMLNS, _acc) ->
    [encode_mam_with(With, __TopXMLNS) | _acc].

'encode_mam_query_$rsm'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_mam_query_$rsm'(Rsm, __TopXMLNS, _acc) ->
    [xep0059:encode_rsm_set(Rsm, __TopXMLNS) | _acc].

decode_mam_query_attr_queryid(__TopXMLNS, undefined) ->
    <<>>;
decode_mam_query_attr_queryid(__TopXMLNS, _val) -> _val.

encode_mam_query_attr_queryid(<<>>, _acc) -> _acc;
encode_mam_query_attr_queryid(_val, _acc) ->
    [{<<"queryid">>, _val} | _acc].

decode_mam_query_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_mam_query_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_mam_withtext(__TopXMLNS, __Opts,
		    {xmlel, <<"withtext">>, _attrs, _els}) ->
    Cdata = decode_mam_withtext_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_mam_withtext_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_mam_withtext_cdata(__TopXMLNS, Cdata);
decode_mam_withtext_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_mam_withtext_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_mam_withtext_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_mam_withtext_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_mam_withtext(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mam:tmp">>, [],
				    __TopXMLNS),
    _els = encode_mam_withtext_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"withtext">>, _attrs, _els}.

decode_mam_withtext_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"withtext">>, __TopXMLNS}});
decode_mam_withtext_cdata(__TopXMLNS, _val) -> _val.

encode_mam_withtext_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_mam_with(__TopXMLNS, __Opts,
		{xmlel, <<"with">>, _attrs, _els}) ->
    Cdata = decode_mam_with_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Cdata.

decode_mam_with_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_mam_with_cdata(__TopXMLNS, Cdata);
decode_mam_with_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Cdata) ->
    decode_mam_with_els(__TopXMLNS, __Opts, _els,
			<<Cdata/binary, _data/binary>>);
decode_mam_with_els(__TopXMLNS, __Opts, [_ | _els],
		    Cdata) ->
    decode_mam_with_els(__TopXMLNS, __Opts, _els, Cdata).

encode_mam_with(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mam:tmp">>, [],
				    __TopXMLNS),
    _els = encode_mam_with_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"with">>, _attrs, _els}.

decode_mam_with_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"with">>, __TopXMLNS}});
decode_mam_with_cdata(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"with">>, __TopXMLNS}});
      _res -> _res
    end.

encode_mam_with_cdata(_val, _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].

decode_mam_end(__TopXMLNS, __Opts,
	       {xmlel, <<"end">>, _attrs, _els}) ->
    Cdata = decode_mam_end_els(__TopXMLNS, __Opts, _els,
			       <<>>),
    Cdata.

decode_mam_end_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_mam_end_cdata(__TopXMLNS, Cdata);
decode_mam_end_els(__TopXMLNS, __Opts,
		   [{xmlcdata, _data} | _els], Cdata) ->
    decode_mam_end_els(__TopXMLNS, __Opts, _els,
		       <<Cdata/binary, _data/binary>>);
decode_mam_end_els(__TopXMLNS, __Opts, [_ | _els],
		   Cdata) ->
    decode_mam_end_els(__TopXMLNS, __Opts, _els, Cdata).

encode_mam_end(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mam:tmp">>, [],
				    __TopXMLNS),
    _els = encode_mam_end_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"end">>, _attrs, _els}.

decode_mam_end_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"end">>, __TopXMLNS}});
decode_mam_end_cdata(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"end">>, __TopXMLNS}});
      _res -> _res
    end.

encode_mam_end_cdata(_val, _acc) ->
    [{xmlcdata, enc_utc(_val)} | _acc].

decode_mam_start(__TopXMLNS, __Opts,
		 {xmlel, <<"start">>, _attrs, _els}) ->
    Cdata = decode_mam_start_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_mam_start_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_mam_start_cdata(__TopXMLNS, Cdata);
decode_mam_start_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_mam_start_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_mam_start_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_mam_start_els(__TopXMLNS, __Opts, _els, Cdata).

encode_mam_start(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:mam:tmp">>, [],
				    __TopXMLNS),
    _els = encode_mam_start_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"start">>, _attrs, _els}.

decode_mam_start_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"start">>, __TopXMLNS}});
decode_mam_start_cdata(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"start">>, __TopXMLNS}});
      _res -> _res
    end.

encode_mam_start_cdata(_val, _acc) ->
    [{xmlcdata, enc_utc(_val)} | _acc].
