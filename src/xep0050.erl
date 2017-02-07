%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0050).

-compile(export_all).

do_decode(<<"command">>,
	  <<"http://jabber.org/protocol/commands">>, El, Opts) ->
    decode_adhoc_command(<<"http://jabber.org/protocol/commands">>,
			 Opts, El);
do_decode(<<"note">>,
	  <<"http://jabber.org/protocol/commands">>, El, Opts) ->
    decode_adhoc_command_notes(<<"http://jabber.org/protocol/commands">>,
			       Opts, El);
do_decode(<<"actions">>,
	  <<"http://jabber.org/protocol/commands">>, El, Opts) ->
    decode_adhoc_command_actions(<<"http://jabber.org/protocol/commands">>,
				 Opts, El);
do_decode(<<"complete">>,
	  <<"http://jabber.org/protocol/commands">>, El, Opts) ->
    decode_adhoc_command_complete(<<"http://jabber.org/protocol/commands">>,
				  Opts, El);
do_decode(<<"next">>,
	  <<"http://jabber.org/protocol/commands">>, El, Opts) ->
    decode_adhoc_command_next(<<"http://jabber.org/protocol/commands">>,
			      Opts, El);
do_decode(<<"prev">>,
	  <<"http://jabber.org/protocol/commands">>, El, Opts) ->
    decode_adhoc_command_prev(<<"http://jabber.org/protocol/commands">>,
			      Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"command">>,
      <<"http://jabber.org/protocol/commands">>},
     {<<"note">>, <<"http://jabber.org/protocol/commands">>},
     {<<"actions">>,
      <<"http://jabber.org/protocol/commands">>},
     {<<"complete">>,
      <<"http://jabber.org/protocol/commands">>},
     {<<"next">>, <<"http://jabber.org/protocol/commands">>},
     {<<"prev">>,
      <<"http://jabber.org/protocol/commands">>}].

do_encode({adhoc_actions, _, _, _, _} = Actions,
	  TopXMLNS) ->
    encode_adhoc_command_actions(Actions, TopXMLNS);
do_encode({adhoc_note, _, _} = Note, TopXMLNS) ->
    encode_adhoc_command_notes(Note, TopXMLNS);
do_encode({adhoc_command, _, _, _, _, _, _, _, _} =
	      Command,
	  TopXMLNS) ->
    encode_adhoc_command(Command, TopXMLNS).

do_get_name({adhoc_actions, _, _, _, _}) ->
    <<"actions">>;
do_get_name({adhoc_command, _, _, _, _, _, _, _, _}) ->
    <<"command">>;
do_get_name({adhoc_note, _, _}) -> <<"note">>.

do_get_ns({adhoc_actions, _, _, _, _}) ->
    <<"http://jabber.org/protocol/commands">>;
do_get_ns({adhoc_command, _, _, _, _, _, _, _, _}) ->
    <<"http://jabber.org/protocol/commands">>;
do_get_ns({adhoc_note, _, _}) ->
    <<"http://jabber.org/protocol/commands">>.

pp(adhoc_actions, 4) -> [execute, prev, next, complete];
pp(adhoc_note, 2) -> [type, data];
pp(adhoc_command, 8) ->
    [node, action, sid, status, lang, actions, notes,
     xdata];
pp(_, _) -> no.

records() ->
    [{adhoc_actions, 4}, {adhoc_note, 2},
     {adhoc_command, 8}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_adhoc_command(__TopXMLNS, __Opts,
		     {xmlel, <<"command">>, _attrs, _els}) ->
    {Xdata, Notes, Actions} =
	decode_adhoc_command_els(__TopXMLNS, __Opts, _els,
				 undefined, [], undefined),
    {Node, Lang, Sid, Status, Action} =
	decode_adhoc_command_attrs(__TopXMLNS, _attrs,
				   undefined, undefined, undefined, undefined,
				   undefined),
    {adhoc_command, Node, Action, Sid, Status, Lang,
     Actions, Notes, Xdata}.

decode_adhoc_command_els(__TopXMLNS, __Opts, [], Xdata,
			 Notes, Actions) ->
    {Xdata, lists:reverse(Notes), Actions};
decode_adhoc_command_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"actions">>, _attrs, _} = _el | _els],
			 Xdata, Notes, Actions) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/commands">> ->
	  decode_adhoc_command_els(__TopXMLNS, __Opts, _els,
				   Xdata, Notes,
				   decode_adhoc_command_actions(<<"http://jabber.org/protocol/commands">>,
								__Opts, _el));
      _ ->
	  decode_adhoc_command_els(__TopXMLNS, __Opts, _els,
				   Xdata, Notes, Actions)
    end;
decode_adhoc_command_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"x">>, _attrs, _} = _el | _els], Xdata,
			 Notes, Actions) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_adhoc_command_els(__TopXMLNS, __Opts, _els,
				   xep0004:decode_xdata(<<"jabber:x:data">>,
							__Opts, _el),
				   Notes, Actions);
      _ ->
	  decode_adhoc_command_els(__TopXMLNS, __Opts, _els,
				   Xdata, Notes, Actions)
    end;
decode_adhoc_command_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"note">>, _attrs, _} = _el | _els], Xdata,
			 Notes, Actions) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/commands">> ->
	  decode_adhoc_command_els(__TopXMLNS, __Opts, _els,
				   Xdata,
				   [decode_adhoc_command_notes(<<"http://jabber.org/protocol/commands">>,
							       __Opts, _el)
				    | Notes],
				   Actions);
      _ ->
	  decode_adhoc_command_els(__TopXMLNS, __Opts, _els,
				   Xdata, Notes, Actions)
    end;
decode_adhoc_command_els(__TopXMLNS, __Opts, [_ | _els],
			 Xdata, Notes, Actions) ->
    decode_adhoc_command_els(__TopXMLNS, __Opts, _els,
			     Xdata, Notes, Actions).

decode_adhoc_command_attrs(__TopXMLNS,
			   [{<<"node">>, _val} | _attrs], _Node, Lang, Sid,
			   Status, Action) ->
    decode_adhoc_command_attrs(__TopXMLNS, _attrs, _val,
			       Lang, Sid, Status, Action);
decode_adhoc_command_attrs(__TopXMLNS,
			   [{<<"xml:lang">>, _val} | _attrs], Node, _Lang, Sid,
			   Status, Action) ->
    decode_adhoc_command_attrs(__TopXMLNS, _attrs, Node,
			       _val, Sid, Status, Action);
decode_adhoc_command_attrs(__TopXMLNS,
			   [{<<"sessionid">>, _val} | _attrs], Node, Lang, _Sid,
			   Status, Action) ->
    decode_adhoc_command_attrs(__TopXMLNS, _attrs, Node,
			       Lang, _val, Status, Action);
decode_adhoc_command_attrs(__TopXMLNS,
			   [{<<"status">>, _val} | _attrs], Node, Lang, Sid,
			   _Status, Action) ->
    decode_adhoc_command_attrs(__TopXMLNS, _attrs, Node,
			       Lang, Sid, _val, Action);
decode_adhoc_command_attrs(__TopXMLNS,
			   [{<<"action">>, _val} | _attrs], Node, Lang, Sid,
			   Status, _Action) ->
    decode_adhoc_command_attrs(__TopXMLNS, _attrs, Node,
			       Lang, Sid, Status, _val);
decode_adhoc_command_attrs(__TopXMLNS, [_ | _attrs],
			   Node, Lang, Sid, Status, Action) ->
    decode_adhoc_command_attrs(__TopXMLNS, _attrs, Node,
			       Lang, Sid, Status, Action);
decode_adhoc_command_attrs(__TopXMLNS, [], Node, Lang,
			   Sid, Status, Action) ->
    {decode_adhoc_command_attr_node(__TopXMLNS, Node),
     'decode_adhoc_command_attr_xml:lang'(__TopXMLNS, Lang),
     decode_adhoc_command_attr_sessionid(__TopXMLNS, Sid),
     decode_adhoc_command_attr_status(__TopXMLNS, Status),
     decode_adhoc_command_attr_action(__TopXMLNS, Action)}.

encode_adhoc_command({adhoc_command, Node, Action, Sid,
		      Status, Lang, Actions, Notes, Xdata},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/commands">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_adhoc_command_$xdata'(Xdata,
						    __NewTopXMLNS,
						    'encode_adhoc_command_$notes'(Notes,
										  __NewTopXMLNS,
										  'encode_adhoc_command_$actions'(Actions,
														  __NewTopXMLNS,
														  [])))),
    _attrs = encode_adhoc_command_attr_action(Action,
					      encode_adhoc_command_attr_status(Status,
									       encode_adhoc_command_attr_sessionid(Sid,
														   'encode_adhoc_command_attr_xml:lang'(Lang,
																			encode_adhoc_command_attr_node(Node,
																						       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																										  __TopXMLNS)))))),
    {xmlel, <<"command">>, _attrs, _els}.

'encode_adhoc_command_$xdata'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_adhoc_command_$xdata'(Xdata, __TopXMLNS,
			      _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

'encode_adhoc_command_$notes'([], __TopXMLNS, _acc) ->
    _acc;
'encode_adhoc_command_$notes'([Notes | _els],
			      __TopXMLNS, _acc) ->
    'encode_adhoc_command_$notes'(_els, __TopXMLNS,
				  [encode_adhoc_command_notes(Notes, __TopXMLNS)
				   | _acc]).

'encode_adhoc_command_$actions'(undefined, __TopXMLNS,
				_acc) ->
    _acc;
'encode_adhoc_command_$actions'(Actions, __TopXMLNS,
				_acc) ->
    [encode_adhoc_command_actions(Actions, __TopXMLNS)
     | _acc].

decode_adhoc_command_attr_node(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"command">>, __TopXMLNS}});
decode_adhoc_command_attr_node(__TopXMLNS, _val) ->
    _val.

encode_adhoc_command_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

'decode_adhoc_command_attr_xml:lang'(__TopXMLNS,
				     undefined) ->
    <<>>;
'decode_adhoc_command_attr_xml:lang'(__TopXMLNS,
				     _val) ->
    _val.

'encode_adhoc_command_attr_xml:lang'(<<>>, _acc) ->
    _acc;
'encode_adhoc_command_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_adhoc_command_attr_sessionid(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_adhoc_command_attr_sessionid(__TopXMLNS, _val) ->
    _val.

encode_adhoc_command_attr_sessionid(<<>>, _acc) -> _acc;
encode_adhoc_command_attr_sessionid(_val, _acc) ->
    [{<<"sessionid">>, _val} | _acc].

decode_adhoc_command_attr_status(__TopXMLNS,
				 undefined) ->
    undefined;
decode_adhoc_command_attr_status(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[canceled, completed, executing])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"status">>, <<"command">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_adhoc_command_attr_status(undefined, _acc) ->
    _acc;
encode_adhoc_command_attr_status(_val, _acc) ->
    [{<<"status">>, enc_enum(_val)} | _acc].

decode_adhoc_command_attr_action(__TopXMLNS,
				 undefined) ->
    execute;
decode_adhoc_command_attr_action(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[cancel, complete, execute, next, prev])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"action">>, <<"command">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_adhoc_command_attr_action(execute, _acc) -> _acc;
encode_adhoc_command_attr_action(_val, _acc) ->
    [{<<"action">>, enc_enum(_val)} | _acc].

decode_adhoc_command_notes(__TopXMLNS, __Opts,
			   {xmlel, <<"note">>, _attrs, _els}) ->
    Data = decode_adhoc_command_notes_els(__TopXMLNS,
					  __Opts, _els, <<>>),
    Type = decode_adhoc_command_notes_attrs(__TopXMLNS,
					    _attrs, undefined),
    {adhoc_note, Type, Data}.

decode_adhoc_command_notes_els(__TopXMLNS, __Opts, [],
			       Data) ->
    decode_adhoc_command_notes_cdata(__TopXMLNS, Data);
decode_adhoc_command_notes_els(__TopXMLNS, __Opts,
			       [{xmlcdata, _data} | _els], Data) ->
    decode_adhoc_command_notes_els(__TopXMLNS, __Opts, _els,
				   <<Data/binary, _data/binary>>);
decode_adhoc_command_notes_els(__TopXMLNS, __Opts,
			       [_ | _els], Data) ->
    decode_adhoc_command_notes_els(__TopXMLNS, __Opts, _els,
				   Data).

decode_adhoc_command_notes_attrs(__TopXMLNS,
				 [{<<"type">>, _val} | _attrs], _Type) ->
    decode_adhoc_command_notes_attrs(__TopXMLNS, _attrs,
				     _val);
decode_adhoc_command_notes_attrs(__TopXMLNS,
				 [_ | _attrs], Type) ->
    decode_adhoc_command_notes_attrs(__TopXMLNS, _attrs,
				     Type);
decode_adhoc_command_notes_attrs(__TopXMLNS, [],
				 Type) ->
    decode_adhoc_command_notes_attr_type(__TopXMLNS, Type).

encode_adhoc_command_notes({adhoc_note, Type, Data},
			   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/commands">>,
				    [], __TopXMLNS),
    _els = encode_adhoc_command_notes_cdata(Data, []),
    _attrs = encode_adhoc_command_notes_attr_type(Type,
						  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									     __TopXMLNS)),
    {xmlel, <<"note">>, _attrs, _els}.

decode_adhoc_command_notes_attr_type(__TopXMLNS,
				     undefined) ->
    info;
decode_adhoc_command_notes_attr_type(__TopXMLNS,
				     _val) ->
    case catch dec_enum(_val, [info, warn, error]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"note">>, __TopXMLNS}});
      _res -> _res
    end.

encode_adhoc_command_notes_attr_type(info, _acc) ->
    _acc;
encode_adhoc_command_notes_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_adhoc_command_notes_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_adhoc_command_notes_cdata(__TopXMLNS, _val) ->
    _val.

encode_adhoc_command_notes_cdata(<<>>, _acc) -> _acc;
encode_adhoc_command_notes_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_adhoc_command_actions(__TopXMLNS, __Opts,
			     {xmlel, <<"actions">>, _attrs, _els}) ->
    {Next, Complete, Prev} =
	decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
					 _els, false, false, false),
    Execute = decode_adhoc_command_actions_attrs(__TopXMLNS,
						 _attrs, undefined),
    {adhoc_actions, Execute, Prev, Next, Complete}.

decode_adhoc_command_actions_els(__TopXMLNS, __Opts, [],
				 Next, Complete, Prev) ->
    {Next, Complete, Prev};
decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
				 [{xmlel, <<"prev">>, _attrs, _} = _el | _els],
				 Next, Complete, Prev) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/commands">> ->
	  decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
					   _els, Next, Complete,
					   decode_adhoc_command_prev(<<"http://jabber.org/protocol/commands">>,
								     __Opts,
								     _el));
      _ ->
	  decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
					   _els, Next, Complete, Prev)
    end;
decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
				 [{xmlel, <<"next">>, _attrs, _} = _el | _els],
				 Next, Complete, Prev) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/commands">> ->
	  decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
					   _els,
					   decode_adhoc_command_next(<<"http://jabber.org/protocol/commands">>,
								     __Opts,
								     _el),
					   Complete, Prev);
      _ ->
	  decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
					   _els, Next, Complete, Prev)
    end;
decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
				 [{xmlel, <<"complete">>, _attrs, _} = _el
				  | _els],
				 Next, Complete, Prev) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/commands">> ->
	  decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
					   _els, Next,
					   decode_adhoc_command_complete(<<"http://jabber.org/protocol/commands">>,
									 __Opts,
									 _el),
					   Prev);
      _ ->
	  decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
					   _els, Next, Complete, Prev)
    end;
decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
				 [_ | _els], Next, Complete, Prev) ->
    decode_adhoc_command_actions_els(__TopXMLNS, __Opts,
				     _els, Next, Complete, Prev).

decode_adhoc_command_actions_attrs(__TopXMLNS,
				   [{<<"execute">>, _val} | _attrs],
				   _Execute) ->
    decode_adhoc_command_actions_attrs(__TopXMLNS, _attrs,
				       _val);
decode_adhoc_command_actions_attrs(__TopXMLNS,
				   [_ | _attrs], Execute) ->
    decode_adhoc_command_actions_attrs(__TopXMLNS, _attrs,
				       Execute);
decode_adhoc_command_actions_attrs(__TopXMLNS, [],
				   Execute) ->
    decode_adhoc_command_actions_attr_execute(__TopXMLNS,
					      Execute).

encode_adhoc_command_actions({adhoc_actions, Execute,
			      Prev, Next, Complete},
			     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/commands">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_adhoc_command_actions_$next'(Next,
							   __NewTopXMLNS,
							   'encode_adhoc_command_actions_$complete'(Complete,
												    __NewTopXMLNS,
												    'encode_adhoc_command_actions_$prev'(Prev,
																	 __NewTopXMLNS,
																	 [])))),
    _attrs =
	encode_adhoc_command_actions_attr_execute(Execute,
						  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									     __TopXMLNS)),
    {xmlel, <<"actions">>, _attrs, _els}.

'encode_adhoc_command_actions_$next'(false, __TopXMLNS,
				     _acc) ->
    _acc;
'encode_adhoc_command_actions_$next'(Next, __TopXMLNS,
				     _acc) ->
    [encode_adhoc_command_next(Next, __TopXMLNS) | _acc].

'encode_adhoc_command_actions_$complete'(false,
					 __TopXMLNS, _acc) ->
    _acc;
'encode_adhoc_command_actions_$complete'(Complete,
					 __TopXMLNS, _acc) ->
    [encode_adhoc_command_complete(Complete, __TopXMLNS)
     | _acc].

'encode_adhoc_command_actions_$prev'(false, __TopXMLNS,
				     _acc) ->
    _acc;
'encode_adhoc_command_actions_$prev'(Prev, __TopXMLNS,
				     _acc) ->
    [encode_adhoc_command_prev(Prev, __TopXMLNS) | _acc].

decode_adhoc_command_actions_attr_execute(__TopXMLNS,
					  undefined) ->
    undefined;
decode_adhoc_command_actions_attr_execute(__TopXMLNS,
					  _val) ->
    case catch dec_enum(_val, [complete, next, prev]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"execute">>, <<"actions">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_adhoc_command_actions_attr_execute(undefined,
					  _acc) ->
    _acc;
encode_adhoc_command_actions_attr_execute(_val, _acc) ->
    [{<<"execute">>, enc_enum(_val)} | _acc].

decode_adhoc_command_complete(__TopXMLNS, __Opts,
			      {xmlel, <<"complete">>, _attrs, _els}) ->
    true.

encode_adhoc_command_complete(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/commands">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"complete">>, _attrs, _els}.

decode_adhoc_command_next(__TopXMLNS, __Opts,
			  {xmlel, <<"next">>, _attrs, _els}) ->
    true.

encode_adhoc_command_next(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/commands">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"next">>, _attrs, _els}.

decode_adhoc_command_prev(__TopXMLNS, __Opts,
			  {xmlel, <<"prev">>, _attrs, _els}) ->
    true.

encode_adhoc_command_prev(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/commands">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"prev">>, _attrs, _els}.
