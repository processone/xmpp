%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0039).

-compile(export_all).

do_decode(<<"query">>,
	  <<"http://jabber.org/protocol/stats">>, El, Opts) ->
    decode_stats(<<"http://jabber.org/protocol/stats">>,
		 Opts, El);
do_decode(<<"stat">>,
	  <<"http://jabber.org/protocol/stats">>, El, Opts) ->
    decode_stat(<<"http://jabber.org/protocol/stats">>,
		Opts, El);
do_decode(<<"error">>,
	  <<"http://jabber.org/protocol/stats">>, El, Opts) ->
    decode_stat_error(<<"http://jabber.org/protocol/stats">>,
		      Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"http://jabber.org/protocol/stats">>},
     {<<"stat">>, <<"http://jabber.org/protocol/stats">>},
     {<<"error">>, <<"http://jabber.org/protocol/stats">>}].

do_encode({stat_error, _, _} = Error, TopXMLNS) ->
    encode_stat_error(Error, TopXMLNS);
do_encode({stat, _, _, _, _} = Stat, TopXMLNS) ->
    encode_stat(Stat, TopXMLNS);
do_encode({stats, _, _} = Query, TopXMLNS) ->
    encode_stats(Query, TopXMLNS).

do_get_name({stat, _, _, _, _}) -> <<"stat">>;
do_get_name({stat_error, _, _}) -> <<"error">>;
do_get_name({stats, _, _}) -> <<"query">>.

do_get_ns({stat, _, _, _, _}) ->
    <<"http://jabber.org/protocol/stats">>;
do_get_ns({stat_error, _, _}) ->
    <<"http://jabber.org/protocol/stats">>;
do_get_ns({stats, _, _}) ->
    <<"http://jabber.org/protocol/stats">>.

pp(stat_error, 2) -> [code, reason];
pp(stat, 4) -> [name, units, value, error];
pp(stats, 2) -> [list, node];
pp(_, _) -> no.

records() -> [{stat_error, 2}, {stat, 4}, {stats, 2}].

dec_int(Val) -> dec_int(Val, infinity, infinity).

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_stats(__TopXMLNS, __Opts,
	     {xmlel, <<"query">>, _attrs, _els}) ->
    List = decode_stats_els(__TopXMLNS, __Opts, _els, []),
    Node = decode_stats_attrs(__TopXMLNS, _attrs,
			      undefined),
    {stats, List, Node}.

decode_stats_els(__TopXMLNS, __Opts, [], List) ->
    lists:reverse(List);
decode_stats_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"stat">>, _attrs, _} = _el | _els], List) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/stats">> ->
	  decode_stats_els(__TopXMLNS, __Opts, _els,
			   [decode_stat(<<"http://jabber.org/protocol/stats">>,
					__Opts, _el)
			    | List]);
      _ -> decode_stats_els(__TopXMLNS, __Opts, _els, List)
    end;
decode_stats_els(__TopXMLNS, __Opts, [_ | _els],
		 List) ->
    decode_stats_els(__TopXMLNS, __Opts, _els, List).

decode_stats_attrs(__TopXMLNS,
		   [{<<"node">>, _val} | _attrs], _Node) ->
    decode_stats_attrs(__TopXMLNS, _attrs, _val);
decode_stats_attrs(__TopXMLNS, [_ | _attrs], Node) ->
    decode_stats_attrs(__TopXMLNS, _attrs, Node);
decode_stats_attrs(__TopXMLNS, [], Node) ->
    decode_stats_attr_node(__TopXMLNS, Node).

encode_stats({stats, List, Node}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/stats">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_stats_$list'(List,
					      __NewTopXMLNS, [])),
    _attrs = encode_stats_attr_node(Node,
				    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
							       __TopXMLNS)),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_stats_$list'([], __TopXMLNS, _acc) -> _acc;
'encode_stats_$list'([List | _els], __TopXMLNS, _acc) ->
    'encode_stats_$list'(_els, __TopXMLNS,
			 [encode_stat(List, __TopXMLNS) | _acc]).

decode_stats_attr_node(__TopXMLNS, undefined) -> <<>>;
decode_stats_attr_node(__TopXMLNS, _val) -> _val.

encode_stats_attr_node(<<>>, _acc) -> _acc;
encode_stats_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_stat(__TopXMLNS, __Opts,
	    {xmlel, <<"stat">>, _attrs, _els}) ->
    Error = decode_stat_els(__TopXMLNS, __Opts, _els,
			    undefined),
    {Name, Units, Value} = decode_stat_attrs(__TopXMLNS,
					     _attrs, undefined, undefined,
					     undefined),
    {stat, Name, Units, Value, Error}.

decode_stat_els(__TopXMLNS, __Opts, [], Error) -> Error;
decode_stat_els(__TopXMLNS, __Opts,
		[{xmlel, <<"error">>, _attrs, _} = _el | _els],
		Error) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/stats">> ->
	  decode_stat_els(__TopXMLNS, __Opts, _els,
			  decode_stat_error(<<"http://jabber.org/protocol/stats">>,
					    __Opts, _el));
      _ -> decode_stat_els(__TopXMLNS, __Opts, _els, Error)
    end;
decode_stat_els(__TopXMLNS, __Opts, [_ | _els],
		Error) ->
    decode_stat_els(__TopXMLNS, __Opts, _els, Error).

decode_stat_attrs(__TopXMLNS,
		  [{<<"name">>, _val} | _attrs], _Name, Units, Value) ->
    decode_stat_attrs(__TopXMLNS, _attrs, _val, Units,
		      Value);
decode_stat_attrs(__TopXMLNS,
		  [{<<"units">>, _val} | _attrs], Name, _Units, Value) ->
    decode_stat_attrs(__TopXMLNS, _attrs, Name, _val,
		      Value);
decode_stat_attrs(__TopXMLNS,
		  [{<<"value">>, _val} | _attrs], Name, Units, _Value) ->
    decode_stat_attrs(__TopXMLNS, _attrs, Name, Units,
		      _val);
decode_stat_attrs(__TopXMLNS, [_ | _attrs], Name, Units,
		  Value) ->
    decode_stat_attrs(__TopXMLNS, _attrs, Name, Units,
		      Value);
decode_stat_attrs(__TopXMLNS, [], Name, Units, Value) ->
    {decode_stat_attr_name(__TopXMLNS, Name),
     decode_stat_attr_units(__TopXMLNS, Units),
     decode_stat_attr_value(__TopXMLNS, Value)}.

encode_stat({stat, Name, Units, Value, Error},
	    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/stats">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_stat_$error'(Error,
					      __NewTopXMLNS, [])),
    _attrs = encode_stat_attr_value(Value,
				    encode_stat_attr_units(Units,
							   encode_stat_attr_name(Name,
										 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													    __TopXMLNS)))),
    {xmlel, <<"stat">>, _attrs, _els}.

'encode_stat_$error'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_stat_$error'(Error, __TopXMLNS, _acc) ->
    [encode_stat_error(Error, __TopXMLNS) | _acc].

decode_stat_attr_name(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"name">>, <<"stat">>, __TopXMLNS}});
decode_stat_attr_name(__TopXMLNS, _val) -> _val.

encode_stat_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_stat_attr_units(__TopXMLNS, undefined) -> <<>>;
decode_stat_attr_units(__TopXMLNS, _val) -> _val.

encode_stat_attr_units(<<>>, _acc) -> _acc;
encode_stat_attr_units(_val, _acc) ->
    [{<<"units">>, _val} | _acc].

decode_stat_attr_value(__TopXMLNS, undefined) -> <<>>;
decode_stat_attr_value(__TopXMLNS, _val) -> _val.

encode_stat_attr_value(<<>>, _acc) -> _acc;
encode_stat_attr_value(_val, _acc) ->
    [{<<"value">>, _val} | _acc].

decode_stat_error(__TopXMLNS, __Opts,
		  {xmlel, <<"error">>, _attrs, _els}) ->
    Reason = decode_stat_error_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Code = decode_stat_error_attrs(__TopXMLNS, _attrs,
				   undefined),
    {stat_error, Code, Reason}.

decode_stat_error_els(__TopXMLNS, __Opts, [], Reason) ->
    decode_stat_error_cdata(__TopXMLNS, Reason);
decode_stat_error_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Reason) ->
    decode_stat_error_els(__TopXMLNS, __Opts, _els,
			  <<Reason/binary, _data/binary>>);
decode_stat_error_els(__TopXMLNS, __Opts, [_ | _els],
		      Reason) ->
    decode_stat_error_els(__TopXMLNS, __Opts, _els, Reason).

decode_stat_error_attrs(__TopXMLNS,
			[{<<"code">>, _val} | _attrs], _Code) ->
    decode_stat_error_attrs(__TopXMLNS, _attrs, _val);
decode_stat_error_attrs(__TopXMLNS, [_ | _attrs],
			Code) ->
    decode_stat_error_attrs(__TopXMLNS, _attrs, Code);
decode_stat_error_attrs(__TopXMLNS, [], Code) ->
    decode_stat_error_attr_code(__TopXMLNS, Code).

encode_stat_error({stat_error, Code, Reason},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/stats">>,
				    [], __TopXMLNS),
    _els = encode_stat_error_cdata(Reason, []),
    _attrs = encode_stat_error_attr_code(Code,
					 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								    __TopXMLNS)),
    {xmlel, <<"error">>, _attrs, _els}.

decode_stat_error_attr_code(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"code">>, <<"error">>, __TopXMLNS}});
decode_stat_error_attr_code(__TopXMLNS, _val) ->
    case catch dec_int(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"code">>, <<"error">>, __TopXMLNS}});
      _res -> _res
    end.

encode_stat_error_attr_code(_val, _acc) ->
    [{<<"code">>, enc_int(_val)} | _acc].

decode_stat_error_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_stat_error_cdata(__TopXMLNS, _val) -> _val.

encode_stat_error_cdata(<<>>, _acc) -> _acc;
encode_stat_error_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
