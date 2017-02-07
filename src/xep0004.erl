%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0004).

-compile(export_all).

do_decode(<<"x">>, <<"jabber:x:data">>, El, Opts) ->
    decode_xdata(<<"jabber:x:data">>, Opts, El);
do_decode(<<"item">>, <<"jabber:x:data">>, El, Opts) ->
    decode_xdata_item(<<"jabber:x:data">>, Opts, El);
do_decode(<<"reported">>, <<"jabber:x:data">>, El,
	  Opts) ->
    decode_xdata_reported(<<"jabber:x:data">>, Opts, El);
do_decode(<<"title">>, <<"jabber:x:data">>, El, Opts) ->
    decode_xdata_title(<<"jabber:x:data">>, Opts, El);
do_decode(<<"instructions">>, <<"jabber:x:data">>, El,
	  Opts) ->
    decode_xdata_instructions(<<"jabber:x:data">>, Opts,
			      El);
do_decode(<<"field">>, <<"jabber:x:data">>, El, Opts) ->
    decode_xdata_field(<<"jabber:x:data">>, Opts, El);
do_decode(<<"option">>, <<"jabber:x:data">>, El,
	  Opts) ->
    decode_xdata_field_option(<<"jabber:x:data">>, Opts,
			      El);
do_decode(<<"value">>, <<"jabber:x:data">>, El, Opts) ->
    decode_xdata_field_value(<<"jabber:x:data">>, Opts, El);
do_decode(<<"desc">>, <<"jabber:x:data">>, El, Opts) ->
    decode_xdata_field_desc(<<"jabber:x:data">>, Opts, El);
do_decode(<<"required">>, <<"jabber:x:data">>, El,
	  Opts) ->
    decode_xdata_field_required(<<"jabber:x:data">>, Opts,
				El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"x">>, <<"jabber:x:data">>},
     {<<"item">>, <<"jabber:x:data">>},
     {<<"reported">>, <<"jabber:x:data">>},
     {<<"title">>, <<"jabber:x:data">>},
     {<<"instructions">>, <<"jabber:x:data">>},
     {<<"field">>, <<"jabber:x:data">>},
     {<<"option">>, <<"jabber:x:data">>},
     {<<"value">>, <<"jabber:x:data">>},
     {<<"desc">>, <<"jabber:x:data">>},
     {<<"required">>, <<"jabber:x:data">>}].

do_encode({xdata_option, _, _} = Option, TopXMLNS) ->
    encode_xdata_field_option(Option, TopXMLNS);
do_encode({xdata_field, _, _, _, _, _, _, _, _} = Field,
	  TopXMLNS) ->
    encode_xdata_field(Field, TopXMLNS);
do_encode({xdata, _, _, _, _, _, _} = X, TopXMLNS) ->
    encode_xdata(X, TopXMLNS).

do_get_name({xdata, _, _, _, _, _, _}) -> <<"x">>;
do_get_name({xdata_field, _, _, _, _, _, _, _, _}) ->
    <<"field">>;
do_get_name({xdata_option, _, _}) -> <<"option">>.

do_get_ns({xdata, _, _, _, _, _, _}) ->
    <<"jabber:x:data">>;
do_get_ns({xdata_field, _, _, _, _, _, _, _, _}) ->
    <<"jabber:x:data">>;
do_get_ns({xdata_option, _, _}) -> <<"jabber:x:data">>.

pp(xdata_option, 2) -> [label, value];
pp(xdata_field, 8) ->
    [label, type, var, required, desc, values, options,
     sub_els];
pp(xdata, 6) ->
    [type, instructions, title, reported, items, fields];
pp(_, _) -> no.

records() ->
    [{xdata_option, 2}, {xdata_field, 8}, {xdata, 6}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_xdata(__TopXMLNS, __Opts,
	     {xmlel, <<"x">>, _attrs, _els}) ->
    {Fields, Items, Instructions, Reported, Title} =
	decode_xdata_els(__TopXMLNS, __Opts, _els, [], [], [],
			 undefined, undefined),
    Type = decode_xdata_attrs(__TopXMLNS, _attrs,
			      undefined),
    {xdata, Type, Instructions, Title, Reported, Items,
     Fields}.

decode_xdata_els(__TopXMLNS, __Opts, [], Fields, Items,
		 Instructions, Reported, Title) ->
    {lists:reverse(Fields), lists:reverse(Items),
     lists:reverse(Instructions), Reported, Title};
decode_xdata_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"instructions">>, _attrs, _} = _el | _els],
		 Fields, Items, Instructions, Reported, Title) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
			   Items,
			   [decode_xdata_instructions(<<"jabber:x:data">>,
						      __Opts, _el)
			    | Instructions],
			   Reported, Title);
      _ ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
			   Items, Instructions, Reported, Title)
    end;
decode_xdata_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"title">>, _attrs, _} = _el | _els], Fields,
		 Items, Instructions, Reported, Title) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
			   Items, Instructions, Reported,
			   decode_xdata_title(<<"jabber:x:data">>, __Opts,
					      _el));
      _ ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
			   Items, Instructions, Reported, Title)
    end;
decode_xdata_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"reported">>, _attrs, _} = _el | _els],
		 Fields, Items, Instructions, Reported, Title) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
			   Items, Instructions,
			   decode_xdata_reported(<<"jabber:x:data">>, __Opts,
						 _el),
			   Title);
      _ ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
			   Items, Instructions, Reported, Title)
    end;
decode_xdata_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"item">>, _attrs, _} = _el | _els], Fields,
		 Items, Instructions, Reported, Title) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
			   [decode_xdata_item(<<"jabber:x:data">>, __Opts, _el)
			    | Items],
			   Instructions, Reported, Title);
      _ ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
			   Items, Instructions, Reported, Title)
    end;
decode_xdata_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"field">>, _attrs, _} = _el | _els], Fields,
		 Items, Instructions, Reported, Title) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els,
			   [decode_xdata_field(<<"jabber:x:data">>, __Opts, _el)
			    | Fields],
			   Items, Instructions, Reported, Title);
      _ ->
	  decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
			   Items, Instructions, Reported, Title)
    end;
decode_xdata_els(__TopXMLNS, __Opts, [_ | _els], Fields,
		 Items, Instructions, Reported, Title) ->
    decode_xdata_els(__TopXMLNS, __Opts, _els, Fields,
		     Items, Instructions, Reported, Title).

decode_xdata_attrs(__TopXMLNS,
		   [{<<"type">>, _val} | _attrs], _Type) ->
    decode_xdata_attrs(__TopXMLNS, _attrs, _val);
decode_xdata_attrs(__TopXMLNS, [_ | _attrs], Type) ->
    decode_xdata_attrs(__TopXMLNS, _attrs, Type);
decode_xdata_attrs(__TopXMLNS, [], Type) ->
    decode_xdata_attr_type(__TopXMLNS, Type).

encode_xdata({xdata, Type, Instructions, Title,
	      Reported, Items, Fields},
	     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_xdata_$fields'(Fields,
						__NewTopXMLNS,
						'encode_xdata_$items'(Items,
								      __NewTopXMLNS,
								      'encode_xdata_$instructions'(Instructions,
												   __NewTopXMLNS,
												   'encode_xdata_$reported'(Reported,
															    __NewTopXMLNS,
															    'encode_xdata_$title'(Title,
																		  __NewTopXMLNS,
																		  [])))))),
    _attrs = encode_xdata_attr_type(Type,
				    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
							       __TopXMLNS)),
    {xmlel, <<"x">>, _attrs, _els}.

'encode_xdata_$fields'([], __TopXMLNS, _acc) -> _acc;
'encode_xdata_$fields'([Fields | _els], __TopXMLNS,
		       _acc) ->
    'encode_xdata_$fields'(_els, __TopXMLNS,
			   [encode_xdata_field(Fields, __TopXMLNS) | _acc]).

'encode_xdata_$items'([], __TopXMLNS, _acc) -> _acc;
'encode_xdata_$items'([Items | _els], __TopXMLNS,
		      _acc) ->
    'encode_xdata_$items'(_els, __TopXMLNS,
			  [encode_xdata_item(Items, __TopXMLNS) | _acc]).

'encode_xdata_$instructions'([], __TopXMLNS, _acc) ->
    _acc;
'encode_xdata_$instructions'([Instructions | _els],
			     __TopXMLNS, _acc) ->
    'encode_xdata_$instructions'(_els, __TopXMLNS,
				 [encode_xdata_instructions(Instructions,
							    __TopXMLNS)
				  | _acc]).

'encode_xdata_$reported'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_xdata_$reported'(Reported, __TopXMLNS, _acc) ->
    [encode_xdata_reported(Reported, __TopXMLNS) | _acc].

'encode_xdata_$title'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_xdata_$title'(Title, __TopXMLNS, _acc) ->
    [encode_xdata_title(Title, __TopXMLNS) | _acc].

decode_xdata_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"x">>, __TopXMLNS}});
decode_xdata_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[cancel, form, result, submit])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"x">>, __TopXMLNS}});
      _res -> _res
    end.

encode_xdata_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_xdata_item(__TopXMLNS, __Opts,
		  {xmlel, <<"item">>, _attrs, _els}) ->
    Fields = decode_xdata_item_els(__TopXMLNS, __Opts, _els,
				   []),
    Fields.

decode_xdata_item_els(__TopXMLNS, __Opts, [], Fields) ->
    lists:reverse(Fields);
decode_xdata_item_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"field">>, _attrs, _} = _el | _els],
		      Fields) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_item_els(__TopXMLNS, __Opts, _els,
				[decode_xdata_field(<<"jabber:x:data">>, __Opts,
						    _el)
				 | Fields]);
      _ ->
	  decode_xdata_item_els(__TopXMLNS, __Opts, _els, Fields)
    end;
decode_xdata_item_els(__TopXMLNS, __Opts, [_ | _els],
		      Fields) ->
    decode_xdata_item_els(__TopXMLNS, __Opts, _els, Fields).

encode_xdata_item(Fields, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_xdata_item_$fields'(Fields,
						     __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"item">>, _attrs, _els}.

'encode_xdata_item_$fields'([], __TopXMLNS, _acc) ->
    _acc;
'encode_xdata_item_$fields'([Fields | _els], __TopXMLNS,
			    _acc) ->
    'encode_xdata_item_$fields'(_els, __TopXMLNS,
				[encode_xdata_field(Fields, __TopXMLNS)
				 | _acc]).

decode_xdata_reported(__TopXMLNS, __Opts,
		      {xmlel, <<"reported">>, _attrs, _els}) ->
    Fields = decode_xdata_reported_els(__TopXMLNS, __Opts,
				       _els, []),
    Fields.

decode_xdata_reported_els(__TopXMLNS, __Opts, [],
			  Fields) ->
    lists:reverse(Fields);
decode_xdata_reported_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"field">>, _attrs, _} = _el | _els],
			  Fields) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_reported_els(__TopXMLNS, __Opts, _els,
				    [decode_xdata_field(<<"jabber:x:data">>,
							__Opts, _el)
				     | Fields]);
      _ ->
	  decode_xdata_reported_els(__TopXMLNS, __Opts, _els,
				    Fields)
    end;
decode_xdata_reported_els(__TopXMLNS, __Opts,
			  [_ | _els], Fields) ->
    decode_xdata_reported_els(__TopXMLNS, __Opts, _els,
			      Fields).

encode_xdata_reported(Fields, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_xdata_reported_$fields'(Fields,
						      __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"reported">>, _attrs, _els}.

'encode_xdata_reported_$fields'([], __TopXMLNS, _acc) ->
    _acc;
'encode_xdata_reported_$fields'([Fields | _els],
				__TopXMLNS, _acc) ->
    'encode_xdata_reported_$fields'(_els, __TopXMLNS,
				    [encode_xdata_field(Fields, __TopXMLNS)
				     | _acc]).

decode_xdata_title(__TopXMLNS, __Opts,
		   {xmlel, <<"title">>, _attrs, _els}) ->
    Cdata = decode_xdata_title_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Cdata.

decode_xdata_title_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_xdata_title_cdata(__TopXMLNS, Cdata);
decode_xdata_title_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_xdata_title_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_xdata_title_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_xdata_title_els(__TopXMLNS, __Opts, _els, Cdata).

encode_xdata_title(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els = encode_xdata_title_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"title">>, _attrs, _els}.

decode_xdata_title_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_xdata_title_cdata(__TopXMLNS, _val) -> _val.

encode_xdata_title_cdata(<<>>, _acc) -> _acc;
encode_xdata_title_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_xdata_instructions(__TopXMLNS, __Opts,
			  {xmlel, <<"instructions">>, _attrs, _els}) ->
    Cdata = decode_xdata_instructions_els(__TopXMLNS,
					  __Opts, _els, <<>>),
    Cdata.

decode_xdata_instructions_els(__TopXMLNS, __Opts, [],
			      Cdata) ->
    decode_xdata_instructions_cdata(__TopXMLNS, Cdata);
decode_xdata_instructions_els(__TopXMLNS, __Opts,
			      [{xmlcdata, _data} | _els], Cdata) ->
    decode_xdata_instructions_els(__TopXMLNS, __Opts, _els,
				  <<Cdata/binary, _data/binary>>);
decode_xdata_instructions_els(__TopXMLNS, __Opts,
			      [_ | _els], Cdata) ->
    decode_xdata_instructions_els(__TopXMLNS, __Opts, _els,
				  Cdata).

encode_xdata_instructions(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els = encode_xdata_instructions_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"instructions">>, _attrs, _els}.

decode_xdata_instructions_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_xdata_instructions_cdata(__TopXMLNS, _val) ->
    _val.

encode_xdata_instructions_cdata(<<>>, _acc) -> _acc;
encode_xdata_instructions_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_xdata_field(__TopXMLNS, __Opts,
		   {xmlel, <<"field">>, _attrs, _els}) ->
    {Options, Values, Desc, Required, __Els} =
	decode_xdata_field_els(__TopXMLNS, __Opts, _els, [], [],
			       <<>>, false, []),
    {Label, Type, Var} =
	decode_xdata_field_attrs(__TopXMLNS, _attrs, undefined,
				 undefined, undefined),
    {xdata_field, Label, Type, Var, Required, Desc, Values,
     Options, __Els}.

decode_xdata_field_els(__TopXMLNS, __Opts, [], Options,
		       Values, Desc, Required, __Els) ->
    {lists:reverse(Options), lists:reverse(Values), Desc,
     Required, lists:reverse(__Els)};
decode_xdata_field_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"required">>, _attrs, _} = _el | _els],
		       Options, Values, Desc, Required, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				 Options, Values, Desc,
				 decode_xdata_field_required(<<"jabber:x:data">>,
							     __Opts, _el),
				 __Els);
      _ ->
	  decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				 Options, Values, Desc, Required, __Els)
    end;
decode_xdata_field_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"desc">>, _attrs, _} = _el | _els], Options,
		       Values, Desc, Required, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				 Options, Values,
				 decode_xdata_field_desc(<<"jabber:x:data">>,
							 __Opts, _el),
				 Required, __Els);
      _ ->
	  decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				 Options, Values, Desc, Required, __Els)
    end;
decode_xdata_field_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"value">>, _attrs, _} = _el | _els], Options,
		       Values, Desc, Required, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				 Options,
				 [decode_xdata_field_value(<<"jabber:x:data">>,
							   __Opts, _el)
				  | Values],
				 Desc, Required, __Els);
      _ ->
	  decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				 Options, Values, Desc, Required, __Els)
    end;
decode_xdata_field_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"option">>, _attrs, _} = _el | _els],
		       Options, Values, Desc, Required, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				 [decode_xdata_field_option(<<"jabber:x:data">>,
							    __Opts, _el)
				  | Options],
				 Values, Desc, Required, __Els);
      _ ->
	  decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				 Options, Values, Desc, Required, __Els)
    end;
decode_xdata_field_els(__TopXMLNS, __Opts,
		       [{xmlel, _name, _attrs, _} = _el | _els], Options,
		       Values, Desc, Required, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				 Options, Values, Desc, Required,
				 [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				       Options, Values, Desc, Required, __Els);
	    Mod ->
		decode_xdata_field_els(__TopXMLNS, __Opts, _els,
				       Options, Values, Desc, Required,
				       [Mod:do_decode(_name, __XMLNS, _el,
						      __Opts)
					| __Els])
	  end
    end;
decode_xdata_field_els(__TopXMLNS, __Opts, [_ | _els],
		       Options, Values, Desc, Required, __Els) ->
    decode_xdata_field_els(__TopXMLNS, __Opts, _els,
			   Options, Values, Desc, Required, __Els).

decode_xdata_field_attrs(__TopXMLNS,
			 [{<<"label">>, _val} | _attrs], _Label, Type, Var) ->
    decode_xdata_field_attrs(__TopXMLNS, _attrs, _val, Type,
			     Var);
decode_xdata_field_attrs(__TopXMLNS,
			 [{<<"type">>, _val} | _attrs], Label, _Type, Var) ->
    decode_xdata_field_attrs(__TopXMLNS, _attrs, Label,
			     _val, Var);
decode_xdata_field_attrs(__TopXMLNS,
			 [{<<"var">>, _val} | _attrs], Label, Type, _Var) ->
    decode_xdata_field_attrs(__TopXMLNS, _attrs, Label,
			     Type, _val);
decode_xdata_field_attrs(__TopXMLNS, [_ | _attrs],
			 Label, Type, Var) ->
    decode_xdata_field_attrs(__TopXMLNS, _attrs, Label,
			     Type, Var);
decode_xdata_field_attrs(__TopXMLNS, [], Label, Type,
			 Var) ->
    {decode_xdata_field_attr_label(__TopXMLNS, Label),
     decode_xdata_field_attr_type(__TopXMLNS, Type),
     decode_xdata_field_attr_var(__TopXMLNS, Var)}.

encode_xdata_field({xdata_field, Label, Type, Var,
		    Required, Desc, Values, Options, __Els},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els]
	     ++
	     lists:reverse('encode_xdata_field_$options'(Options,
							 __NewTopXMLNS,
							 'encode_xdata_field_$values'(Values,
										      __NewTopXMLNS,
										      'encode_xdata_field_$desc'(Desc,
														 __NewTopXMLNS,
														 'encode_xdata_field_$required'(Required,
																		__NewTopXMLNS,
																		[]))))),
    _attrs = encode_xdata_field_attr_var(Var,
					 encode_xdata_field_attr_type(Type,
								      encode_xdata_field_attr_label(Label,
												    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
															       __TopXMLNS)))),
    {xmlel, <<"field">>, _attrs, _els}.

'encode_xdata_field_$options'([], __TopXMLNS, _acc) ->
    _acc;
'encode_xdata_field_$options'([Options | _els],
			      __TopXMLNS, _acc) ->
    'encode_xdata_field_$options'(_els, __TopXMLNS,
				  [encode_xdata_field_option(Options,
							     __TopXMLNS)
				   | _acc]).

'encode_xdata_field_$values'([], __TopXMLNS, _acc) ->
    _acc;
'encode_xdata_field_$values'([Values | _els],
			     __TopXMLNS, _acc) ->
    'encode_xdata_field_$values'(_els, __TopXMLNS,
				 [encode_xdata_field_value(Values, __TopXMLNS)
				  | _acc]).

'encode_xdata_field_$desc'(<<>>, __TopXMLNS, _acc) ->
    _acc;
'encode_xdata_field_$desc'(Desc, __TopXMLNS, _acc) ->
    [encode_xdata_field_desc(Desc, __TopXMLNS) | _acc].

'encode_xdata_field_$required'(false, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_xdata_field_$required'(Required, __TopXMLNS,
			       _acc) ->
    [encode_xdata_field_required(Required, __TopXMLNS)
     | _acc].

decode_xdata_field_attr_label(__TopXMLNS, undefined) ->
    <<>>;
decode_xdata_field_attr_label(__TopXMLNS, _val) -> _val.

encode_xdata_field_attr_label(<<>>, _acc) -> _acc;
encode_xdata_field_attr_label(_val, _acc) ->
    [{<<"label">>, _val} | _acc].

decode_xdata_field_attr_type(__TopXMLNS, undefined) ->
    undefined;
decode_xdata_field_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[boolean, fixed, hidden, 'jid-multi', 'jid-single',
			 'list-multi', 'list-single', 'text-multi',
			 'text-private', 'text-single'])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"field">>, __TopXMLNS}});
      _res -> _res
    end.

encode_xdata_field_attr_type(undefined, _acc) -> _acc;
encode_xdata_field_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_xdata_field_attr_var(__TopXMLNS, undefined) ->
    <<>>;
decode_xdata_field_attr_var(__TopXMLNS, _val) -> _val.

encode_xdata_field_attr_var(<<>>, _acc) -> _acc;
encode_xdata_field_attr_var(_val, _acc) ->
    [{<<"var">>, _val} | _acc].

decode_xdata_field_option(__TopXMLNS, __Opts,
			  {xmlel, <<"option">>, _attrs, _els}) ->
    Value = decode_xdata_field_option_els(__TopXMLNS,
					  __Opts, _els, error),
    Label = decode_xdata_field_option_attrs(__TopXMLNS,
					    _attrs, undefined),
    {xdata_option, Label, Value}.

decode_xdata_field_option_els(__TopXMLNS, __Opts, [],
			      Value) ->
    case Value of
      error ->
	  erlang:error({xmpp_codec,
			{missing_tag, <<"value">>, __TopXMLNS}});
      {value, Value1} -> Value1
    end;
decode_xdata_field_option_els(__TopXMLNS, __Opts,
			      [{xmlel, <<"value">>, _attrs, _} = _el | _els],
			      Value) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_xdata_field_option_els(__TopXMLNS, __Opts, _els,
					{value,
					 decode_xdata_field_value(<<"jabber:x:data">>,
								  __Opts,
								  _el)});
      _ ->
	  decode_xdata_field_option_els(__TopXMLNS, __Opts, _els,
					Value)
    end;
decode_xdata_field_option_els(__TopXMLNS, __Opts,
			      [_ | _els], Value) ->
    decode_xdata_field_option_els(__TopXMLNS, __Opts, _els,
				  Value).

decode_xdata_field_option_attrs(__TopXMLNS,
				[{<<"label">>, _val} | _attrs], _Label) ->
    decode_xdata_field_option_attrs(__TopXMLNS, _attrs,
				    _val);
decode_xdata_field_option_attrs(__TopXMLNS,
				[_ | _attrs], Label) ->
    decode_xdata_field_option_attrs(__TopXMLNS, _attrs,
				    Label);
decode_xdata_field_option_attrs(__TopXMLNS, [],
				Label) ->
    decode_xdata_field_option_attr_label(__TopXMLNS, Label).

encode_xdata_field_option({xdata_option, Label, Value},
			  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_xdata_field_option_$value'(Value,
							 __NewTopXMLNS, [])),
    _attrs = encode_xdata_field_option_attr_label(Label,
						  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									     __TopXMLNS)),
    {xmlel, <<"option">>, _attrs, _els}.

'encode_xdata_field_option_$value'(Value, __TopXMLNS,
				   _acc) ->
    [encode_xdata_field_value(Value, __TopXMLNS) | _acc].

decode_xdata_field_option_attr_label(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_xdata_field_option_attr_label(__TopXMLNS,
				     _val) ->
    _val.

encode_xdata_field_option_attr_label(<<>>, _acc) ->
    _acc;
encode_xdata_field_option_attr_label(_val, _acc) ->
    [{<<"label">>, _val} | _acc].

decode_xdata_field_value(__TopXMLNS, __Opts,
			 {xmlel, <<"value">>, _attrs, _els}) ->
    Cdata = decode_xdata_field_value_els(__TopXMLNS, __Opts,
					 _els, <<>>),
    Cdata.

decode_xdata_field_value_els(__TopXMLNS, __Opts, [],
			     Cdata) ->
    decode_xdata_field_value_cdata(__TopXMLNS, Cdata);
decode_xdata_field_value_els(__TopXMLNS, __Opts,
			     [{xmlcdata, _data} | _els], Cdata) ->
    decode_xdata_field_value_els(__TopXMLNS, __Opts, _els,
				 <<Cdata/binary, _data/binary>>);
decode_xdata_field_value_els(__TopXMLNS, __Opts,
			     [_ | _els], Cdata) ->
    decode_xdata_field_value_els(__TopXMLNS, __Opts, _els,
				 Cdata).

encode_xdata_field_value(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els = encode_xdata_field_value_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"value">>, _attrs, _els}.

decode_xdata_field_value_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_xdata_field_value_cdata(__TopXMLNS, _val) ->
    _val.

encode_xdata_field_value_cdata(<<>>, _acc) -> _acc;
encode_xdata_field_value_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_xdata_field_desc(__TopXMLNS, __Opts,
			{xmlel, <<"desc">>, _attrs, _els}) ->
    Cdata = decode_xdata_field_desc_els(__TopXMLNS, __Opts,
					_els, <<>>),
    Cdata.

decode_xdata_field_desc_els(__TopXMLNS, __Opts, [],
			    Cdata) ->
    decode_xdata_field_desc_cdata(__TopXMLNS, Cdata);
decode_xdata_field_desc_els(__TopXMLNS, __Opts,
			    [{xmlcdata, _data} | _els], Cdata) ->
    decode_xdata_field_desc_els(__TopXMLNS, __Opts, _els,
				<<Cdata/binary, _data/binary>>);
decode_xdata_field_desc_els(__TopXMLNS, __Opts,
			    [_ | _els], Cdata) ->
    decode_xdata_field_desc_els(__TopXMLNS, __Opts, _els,
				Cdata).

encode_xdata_field_desc(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els = encode_xdata_field_desc_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"desc">>, _attrs, _els}.

decode_xdata_field_desc_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_xdata_field_desc_cdata(__TopXMLNS, _val) -> _val.

encode_xdata_field_desc_cdata(<<>>, _acc) -> _acc;
encode_xdata_field_desc_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_xdata_field_required(__TopXMLNS, __Opts,
			    {xmlel, <<"required">>, _attrs, _els}) ->
    true.

encode_xdata_field_required(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:data">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"required">>, _attrs, _els}.
