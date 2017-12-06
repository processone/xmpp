%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0059).

-compile(export_all).

do_decode(<<"set">>,
	  <<"http://jabber.org/protocol/rsm">>, El, Opts) ->
    decode_rsm_set(<<"http://jabber.org/protocol/rsm">>,
		   Opts, El);
do_decode(<<"first">>,
	  <<"http://jabber.org/protocol/rsm">>, El, Opts) ->
    decode_rsm_first(<<"http://jabber.org/protocol/rsm">>,
		     Opts, El);
do_decode(<<"max">>,
	  <<"http://jabber.org/protocol/rsm">>, El, Opts) ->
    decode_rsm_max(<<"http://jabber.org/protocol/rsm">>,
		   Opts, El);
do_decode(<<"index">>,
	  <<"http://jabber.org/protocol/rsm">>, El, Opts) ->
    decode_rsm_index(<<"http://jabber.org/protocol/rsm">>,
		     Opts, El);
do_decode(<<"count">>,
	  <<"http://jabber.org/protocol/rsm">>, El, Opts) ->
    decode_rsm_count(<<"http://jabber.org/protocol/rsm">>,
		     Opts, El);
do_decode(<<"last">>,
	  <<"http://jabber.org/protocol/rsm">>, El, Opts) ->
    decode_rsm_last(<<"http://jabber.org/protocol/rsm">>,
		    Opts, El);
do_decode(<<"before">>,
	  <<"http://jabber.org/protocol/rsm">>, El, Opts) ->
    decode_rsm_before(<<"http://jabber.org/protocol/rsm">>,
		      Opts, El);
do_decode(<<"after">>,
	  <<"http://jabber.org/protocol/rsm">>, El, Opts) ->
    decode_rsm_after(<<"http://jabber.org/protocol/rsm">>,
		     Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"set">>, <<"http://jabber.org/protocol/rsm">>},
     {<<"first">>, <<"http://jabber.org/protocol/rsm">>},
     {<<"max">>, <<"http://jabber.org/protocol/rsm">>},
     {<<"index">>, <<"http://jabber.org/protocol/rsm">>},
     {<<"count">>, <<"http://jabber.org/protocol/rsm">>},
     {<<"last">>, <<"http://jabber.org/protocol/rsm">>},
     {<<"before">>, <<"http://jabber.org/protocol/rsm">>},
     {<<"after">>, <<"http://jabber.org/protocol/rsm">>}].

do_encode({rsm_first, _, _} = First, TopXMLNS) ->
    encode_rsm_first(First, TopXMLNS);
do_encode({rsm_set, _, _, _, _, _, _, _} = Set,
	  TopXMLNS) ->
    encode_rsm_set(Set, TopXMLNS).

do_get_name({rsm_first, _, _}) -> <<"first">>;
do_get_name({rsm_set, _, _, _, _, _, _, _}) ->
    <<"set">>.

do_get_ns({rsm_first, _, _}) ->
    <<"http://jabber.org/protocol/rsm">>;
do_get_ns({rsm_set, _, _, _, _, _, _, _}) ->
    <<"http://jabber.org/protocol/rsm">>.

pp(rsm_first, 2) -> [index, data];
pp(rsm_set, 7) ->
    ['after', before, count, first, index, last, max];
pp(_, _) -> no.

records() -> [{rsm_first, 2}, {rsm_set, 7}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_rsm_set(__TopXMLNS, __Opts,
	       {xmlel, <<"set">>, _attrs, _els}) ->
    {After, Last, First, Count, Before, Max, Index} =
	decode_rsm_set_els(__TopXMLNS, __Opts, _els, undefined,
			   undefined, undefined, undefined, undefined,
			   undefined, undefined),
    {rsm_set, After, Before, Count, First, Index, Last,
     Max}.

decode_rsm_set_els(__TopXMLNS, __Opts, [], After, Last,
		   First, Count, Before, Max, Index) ->
    {After, Last, First, Count, Before, Max, Index};
decode_rsm_set_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"after">>, _attrs, _} = _el | _els], After,
		   Last, First, Count, Before, Max, Index) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els,
			     decode_rsm_after(<<"http://jabber.org/protocol/rsm">>,
					      __Opts, _el),
			     Last, First, Count, Before, Max, Index);
      _ ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count, Before, Max, Index)
    end;
decode_rsm_set_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"before">>, _attrs, _} = _el | _els], After,
		   Last, First, Count, Before, Max, Index) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count,
			     decode_rsm_before(<<"http://jabber.org/protocol/rsm">>,
					       __Opts, _el),
			     Max, Index);
      _ ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count, Before, Max, Index)
    end;
decode_rsm_set_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"count">>, _attrs, _} = _el | _els], After,
		   Last, First, Count, Before, Max, Index) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First,
			     decode_rsm_count(<<"http://jabber.org/protocol/rsm">>,
					      __Opts, _el),
			     Before, Max, Index);
      _ ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count, Before, Max, Index)
    end;
decode_rsm_set_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"first">>, _attrs, _} = _el | _els], After,
		   Last, First, Count, Before, Max, Index) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last,
			     decode_rsm_first(<<"http://jabber.org/protocol/rsm">>,
					      __Opts, _el),
			     Count, Before, Max, Index);
      _ ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count, Before, Max, Index)
    end;
decode_rsm_set_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"index">>, _attrs, _} = _el | _els], After,
		   Last, First, Count, Before, Max, Index) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count, Before, Max,
			     decode_rsm_index(<<"http://jabber.org/protocol/rsm">>,
					      __Opts, _el));
      _ ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count, Before, Max, Index)
    end;
decode_rsm_set_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"last">>, _attrs, _} = _el | _els], After,
		   Last, First, Count, Before, Max, Index) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     decode_rsm_last(<<"http://jabber.org/protocol/rsm">>,
					     __Opts, _el),
			     First, Count, Before, Max, Index);
      _ ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count, Before, Max, Index)
    end;
decode_rsm_set_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"max">>, _attrs, _} = _el | _els], After,
		   Last, First, Count, Before, Max, Index) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count, Before,
			     decode_rsm_max(<<"http://jabber.org/protocol/rsm">>,
					    __Opts, _el),
			     Index);
      _ ->
	  decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
			     Last, First, Count, Before, Max, Index)
    end;
decode_rsm_set_els(__TopXMLNS, __Opts, [_ | _els],
		   After, Last, First, Count, Before, Max, Index) ->
    decode_rsm_set_els(__TopXMLNS, __Opts, _els, After,
		       Last, First, Count, Before, Max, Index).

encode_rsm_set({rsm_set, After, Before, Count, First,
		Index, Last, Max},
	       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/rsm">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_rsm_set_$after'(After,
						 __NewTopXMLNS,
						 'encode_rsm_set_$last'(Last,
									__NewTopXMLNS,
									'encode_rsm_set_$first'(First,
												__NewTopXMLNS,
												'encode_rsm_set_$count'(Count,
															__NewTopXMLNS,
															'encode_rsm_set_$before'(Before,
																		 __NewTopXMLNS,
																		 'encode_rsm_set_$max'(Max,
																				       __NewTopXMLNS,
																				       'encode_rsm_set_$index'(Index,
																							       __NewTopXMLNS,
																							       [])))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"set">>, _attrs, _els}.

'encode_rsm_set_$after'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_rsm_set_$after'(After, __TopXMLNS, _acc) ->
    [encode_rsm_after(After, __TopXMLNS) | _acc].

'encode_rsm_set_$last'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_rsm_set_$last'(Last, __TopXMLNS, _acc) ->
    [encode_rsm_last(Last, __TopXMLNS) | _acc].

'encode_rsm_set_$first'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_rsm_set_$first'(First, __TopXMLNS, _acc) ->
    [encode_rsm_first(First, __TopXMLNS) | _acc].

'encode_rsm_set_$count'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_rsm_set_$count'(Count, __TopXMLNS, _acc) ->
    [encode_rsm_count(Count, __TopXMLNS) | _acc].

'encode_rsm_set_$before'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_rsm_set_$before'(Before, __TopXMLNS, _acc) ->
    [encode_rsm_before(Before, __TopXMLNS) | _acc].

'encode_rsm_set_$max'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_rsm_set_$max'(Max, __TopXMLNS, _acc) ->
    [encode_rsm_max(Max, __TopXMLNS) | _acc].

'encode_rsm_set_$index'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_rsm_set_$index'(Index, __TopXMLNS, _acc) ->
    [encode_rsm_index(Index, __TopXMLNS) | _acc].

decode_rsm_first(__TopXMLNS, __Opts,
		 {xmlel, <<"first">>, _attrs, _els}) ->
    Data = decode_rsm_first_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Index = decode_rsm_first_attrs(__TopXMLNS, _attrs,
				   undefined),
    {rsm_first, Index, Data}.

decode_rsm_first_els(__TopXMLNS, __Opts, [], Data) ->
    decode_rsm_first_cdata(__TopXMLNS, Data);
decode_rsm_first_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Data) ->
    decode_rsm_first_els(__TopXMLNS, __Opts, _els,
			 <<Data/binary, _data/binary>>);
decode_rsm_first_els(__TopXMLNS, __Opts, [_ | _els],
		     Data) ->
    decode_rsm_first_els(__TopXMLNS, __Opts, _els, Data).

decode_rsm_first_attrs(__TopXMLNS,
		       [{<<"index">>, _val} | _attrs], _Index) ->
    decode_rsm_first_attrs(__TopXMLNS, _attrs, _val);
decode_rsm_first_attrs(__TopXMLNS, [_ | _attrs],
		       Index) ->
    decode_rsm_first_attrs(__TopXMLNS, _attrs, Index);
decode_rsm_first_attrs(__TopXMLNS, [], Index) ->
    decode_rsm_first_attr_index(__TopXMLNS, Index).

encode_rsm_first({rsm_first, Index, Data},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/rsm">>,
				    [], __TopXMLNS),
    _els = encode_rsm_first_cdata(Data, []),
    _attrs = encode_rsm_first_attr_index(Index,
					 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								    __TopXMLNS)),
    {xmlel, <<"first">>, _attrs, _els}.

decode_rsm_first_attr_index(__TopXMLNS, undefined) ->
    undefined;
decode_rsm_first_attr_index(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"index">>, <<"first">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_rsm_first_attr_index(undefined, _acc) -> _acc;
encode_rsm_first_attr_index(_val, _acc) ->
    [{<<"index">>, enc_int(_val)} | _acc].

decode_rsm_first_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_rsm_first_cdata(__TopXMLNS, _val) -> _val.

encode_rsm_first_cdata(<<>>, _acc) -> _acc;
encode_rsm_first_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_rsm_max(__TopXMLNS, __Opts,
	       {xmlel, <<"max">>, _attrs, _els}) ->
    Cdata = decode_rsm_max_els(__TopXMLNS, __Opts, _els,
			       <<>>),
    Cdata.

decode_rsm_max_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_rsm_max_cdata(__TopXMLNS, Cdata);
decode_rsm_max_els(__TopXMLNS, __Opts,
		   [{xmlcdata, _data} | _els], Cdata) ->
    decode_rsm_max_els(__TopXMLNS, __Opts, _els,
		       <<Cdata/binary, _data/binary>>);
decode_rsm_max_els(__TopXMLNS, __Opts, [_ | _els],
		   Cdata) ->
    decode_rsm_max_els(__TopXMLNS, __Opts, _els, Cdata).

encode_rsm_max(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/rsm">>,
				    [], __TopXMLNS),
    _els = encode_rsm_max_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"max">>, _attrs, _els}.

decode_rsm_max_cdata(__TopXMLNS, <<>>) -> undefined;
decode_rsm_max_cdata(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"max">>, __TopXMLNS}});
      _res -> _res
    end.

encode_rsm_max_cdata(undefined, _acc) -> _acc;
encode_rsm_max_cdata(_val, _acc) ->
    [{xmlcdata, enc_int(_val)} | _acc].

decode_rsm_index(__TopXMLNS, __Opts,
		 {xmlel, <<"index">>, _attrs, _els}) ->
    Cdata = decode_rsm_index_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_rsm_index_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_rsm_index_cdata(__TopXMLNS, Cdata);
decode_rsm_index_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_rsm_index_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_rsm_index_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_rsm_index_els(__TopXMLNS, __Opts, _els, Cdata).

encode_rsm_index(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/rsm">>,
				    [], __TopXMLNS),
    _els = encode_rsm_index_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"index">>, _attrs, _els}.

decode_rsm_index_cdata(__TopXMLNS, <<>>) -> undefined;
decode_rsm_index_cdata(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"index">>, __TopXMLNS}});
      _res -> _res
    end.

encode_rsm_index_cdata(undefined, _acc) -> _acc;
encode_rsm_index_cdata(_val, _acc) ->
    [{xmlcdata, enc_int(_val)} | _acc].

decode_rsm_count(__TopXMLNS, __Opts,
		 {xmlel, <<"count">>, _attrs, _els}) ->
    Cdata = decode_rsm_count_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_rsm_count_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_rsm_count_cdata(__TopXMLNS, Cdata);
decode_rsm_count_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_rsm_count_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_rsm_count_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_rsm_count_els(__TopXMLNS, __Opts, _els, Cdata).

encode_rsm_count(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/rsm">>,
				    [], __TopXMLNS),
    _els = encode_rsm_count_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"count">>, _attrs, _els}.

decode_rsm_count_cdata(__TopXMLNS, <<>>) -> undefined;
decode_rsm_count_cdata(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"count">>, __TopXMLNS}});
      _res -> _res
    end.

encode_rsm_count_cdata(undefined, _acc) -> _acc;
encode_rsm_count_cdata(_val, _acc) ->
    [{xmlcdata, enc_int(_val)} | _acc].

decode_rsm_last(__TopXMLNS, __Opts,
		{xmlel, <<"last">>, _attrs, _els}) ->
    Cdata = decode_rsm_last_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Cdata.

decode_rsm_last_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_rsm_last_cdata(__TopXMLNS, Cdata);
decode_rsm_last_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Cdata) ->
    decode_rsm_last_els(__TopXMLNS, __Opts, _els,
			<<Cdata/binary, _data/binary>>);
decode_rsm_last_els(__TopXMLNS, __Opts, [_ | _els],
		    Cdata) ->
    decode_rsm_last_els(__TopXMLNS, __Opts, _els, Cdata).

encode_rsm_last(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/rsm">>,
				    [], __TopXMLNS),
    _els = encode_rsm_last_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"last">>, _attrs, _els}.

decode_rsm_last_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_rsm_last_cdata(__TopXMLNS, _val) -> _val.

encode_rsm_last_cdata(<<>>, _acc) -> _acc;
encode_rsm_last_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_rsm_before(__TopXMLNS, __Opts,
		  {xmlel, <<"before">>, _attrs, _els}) ->
    Cdata = decode_rsm_before_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_rsm_before_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_rsm_before_cdata(__TopXMLNS, Cdata);
decode_rsm_before_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_rsm_before_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_rsm_before_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_rsm_before_els(__TopXMLNS, __Opts, _els, Cdata).

encode_rsm_before(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/rsm">>,
				    [], __TopXMLNS),
    _els = encode_rsm_before_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"before">>, _attrs, _els}.

decode_rsm_before_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_rsm_before_cdata(__TopXMLNS, _val) -> _val.

encode_rsm_before_cdata(<<>>, _acc) -> _acc;
encode_rsm_before_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_rsm_after(__TopXMLNS, __Opts,
		 {xmlel, <<"after">>, _attrs, _els}) ->
    Cdata = decode_rsm_after_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_rsm_after_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_rsm_after_cdata(__TopXMLNS, Cdata);
decode_rsm_after_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_rsm_after_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_rsm_after_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_rsm_after_els(__TopXMLNS, __Opts, _els, Cdata).

encode_rsm_after(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/rsm">>,
				    [], __TopXMLNS),
    _els = encode_rsm_after_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"after">>, _attrs, _els}.

decode_rsm_after_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"after">>, __TopXMLNS}});
decode_rsm_after_cdata(__TopXMLNS, _val) -> _val.

encode_rsm_after_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
