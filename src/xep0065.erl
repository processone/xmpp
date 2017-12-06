%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0065).

-compile(export_all).

do_decode(<<"query">>,
	  <<"http://jabber.org/protocol/bytestreams">>, El,
	  Opts) ->
    decode_bytestreams(<<"http://jabber.org/protocol/bytestreams">>,
		       Opts, El);
do_decode(<<"activate">>,
	  <<"http://jabber.org/protocol/bytestreams">>, El,
	  Opts) ->
    decode_bytestreams_activate(<<"http://jabber.org/protocol/bytestreams">>,
				Opts, El);
do_decode(<<"streamhost-used">>,
	  <<"http://jabber.org/protocol/bytestreams">>, El,
	  Opts) ->
    decode_bytestreams_streamhost_used(<<"http://jabber.org/protocol/bytestreams">>,
				       Opts, El);
do_decode(<<"streamhost">>,
	  <<"http://jabber.org/protocol/bytestreams">>, El,
	  Opts) ->
    decode_bytestreams_streamhost(<<"http://jabber.org/protocol/bytestreams">>,
				  Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>,
      <<"http://jabber.org/protocol/bytestreams">>},
     {<<"activate">>,
      <<"http://jabber.org/protocol/bytestreams">>},
     {<<"streamhost-used">>,
      <<"http://jabber.org/protocol/bytestreams">>},
     {<<"streamhost">>,
      <<"http://jabber.org/protocol/bytestreams">>}].

do_encode({streamhost, _, _, _} = Streamhost,
	  TopXMLNS) ->
    encode_bytestreams_streamhost(Streamhost, TopXMLNS);
do_encode({bytestreams, _, _, _, _, _, _} = Query,
	  TopXMLNS) ->
    encode_bytestreams(Query, TopXMLNS).

do_get_name({bytestreams, _, _, _, _, _, _}) ->
    <<"query">>;
do_get_name({streamhost, _, _, _}) -> <<"streamhost">>.

do_get_ns({bytestreams, _, _, _, _, _, _}) ->
    <<"http://jabber.org/protocol/bytestreams">>;
do_get_ns({streamhost, _, _, _}) ->
    <<"http://jabber.org/protocol/bytestreams">>.

pp(streamhost, 3) -> [jid, host, port];
pp(bytestreams, 6) ->
    [hosts, used, activate, dstaddr, mode, sid];
pp(_, _) -> no.

records() -> [{streamhost, 3}, {bytestreams, 6}].

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

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_bytestreams(__TopXMLNS, __Opts,
		   {xmlel, <<"query">>, _attrs, _els}) ->
    {Hosts, Used, Activate} =
	decode_bytestreams_els(__TopXMLNS, __Opts, _els, [],
			       undefined, undefined),
    {Dstaddr, Sid, Mode} =
	decode_bytestreams_attrs(__TopXMLNS, _attrs, undefined,
				 undefined, undefined),
    {bytestreams, Hosts, Used, Activate, Dstaddr, Mode,
     Sid}.

decode_bytestreams_els(__TopXMLNS, __Opts, [], Hosts,
		       Used, Activate) ->
    {lists:reverse(Hosts), Used, Activate};
decode_bytestreams_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"streamhost">>, _attrs, _} = _el | _els],
		       Hosts, Used, Activate) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/bytestreams">> ->
	  decode_bytestreams_els(__TopXMLNS, __Opts, _els,
				 [decode_bytestreams_streamhost(<<"http://jabber.org/protocol/bytestreams">>,
								__Opts, _el)
				  | Hosts],
				 Used, Activate);
      _ ->
	  decode_bytestreams_els(__TopXMLNS, __Opts, _els, Hosts,
				 Used, Activate)
    end;
decode_bytestreams_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"streamhost-used">>, _attrs, _} = _el
			| _els],
		       Hosts, Used, Activate) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/bytestreams">> ->
	  decode_bytestreams_els(__TopXMLNS, __Opts, _els, Hosts,
				 decode_bytestreams_streamhost_used(<<"http://jabber.org/protocol/bytestreams">>,
								    __Opts,
								    _el),
				 Activate);
      _ ->
	  decode_bytestreams_els(__TopXMLNS, __Opts, _els, Hosts,
				 Used, Activate)
    end;
decode_bytestreams_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"activate">>, _attrs, _} = _el | _els],
		       Hosts, Used, Activate) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/bytestreams">> ->
	  decode_bytestreams_els(__TopXMLNS, __Opts, _els, Hosts,
				 Used,
				 decode_bytestreams_activate(<<"http://jabber.org/protocol/bytestreams">>,
							     __Opts, _el));
      _ ->
	  decode_bytestreams_els(__TopXMLNS, __Opts, _els, Hosts,
				 Used, Activate)
    end;
decode_bytestreams_els(__TopXMLNS, __Opts, [_ | _els],
		       Hosts, Used, Activate) ->
    decode_bytestreams_els(__TopXMLNS, __Opts, _els, Hosts,
			   Used, Activate).

decode_bytestreams_attrs(__TopXMLNS,
			 [{<<"dstaddr">>, _val} | _attrs], _Dstaddr, Sid,
			 Mode) ->
    decode_bytestreams_attrs(__TopXMLNS, _attrs, _val, Sid,
			     Mode);
decode_bytestreams_attrs(__TopXMLNS,
			 [{<<"sid">>, _val} | _attrs], Dstaddr, _Sid, Mode) ->
    decode_bytestreams_attrs(__TopXMLNS, _attrs, Dstaddr,
			     _val, Mode);
decode_bytestreams_attrs(__TopXMLNS,
			 [{<<"mode">>, _val} | _attrs], Dstaddr, Sid, _Mode) ->
    decode_bytestreams_attrs(__TopXMLNS, _attrs, Dstaddr,
			     Sid, _val);
decode_bytestreams_attrs(__TopXMLNS, [_ | _attrs],
			 Dstaddr, Sid, Mode) ->
    decode_bytestreams_attrs(__TopXMLNS, _attrs, Dstaddr,
			     Sid, Mode);
decode_bytestreams_attrs(__TopXMLNS, [], Dstaddr, Sid,
			 Mode) ->
    {decode_bytestreams_attr_dstaddr(__TopXMLNS, Dstaddr),
     decode_bytestreams_attr_sid(__TopXMLNS, Sid),
     decode_bytestreams_attr_mode(__TopXMLNS, Mode)}.

encode_bytestreams({bytestreams, Hosts, Used, Activate,
		    Dstaddr, Mode, Sid},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/bytestreams">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_bytestreams_$hosts'(Hosts,
						     __NewTopXMLNS,
						     'encode_bytestreams_$used'(Used,
										__NewTopXMLNS,
										'encode_bytestreams_$activate'(Activate,
													       __NewTopXMLNS,
													       [])))),
    _attrs = encode_bytestreams_attr_mode(Mode,
					  encode_bytestreams_attr_sid(Sid,
								      encode_bytestreams_attr_dstaddr(Dstaddr,
												      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																 __TopXMLNS)))),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_bytestreams_$hosts'([], __TopXMLNS, _acc) ->
    _acc;
'encode_bytestreams_$hosts'([Hosts | _els], __TopXMLNS,
			    _acc) ->
    'encode_bytestreams_$hosts'(_els, __TopXMLNS,
				[encode_bytestreams_streamhost(Hosts,
							       __TopXMLNS)
				 | _acc]).

'encode_bytestreams_$used'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_bytestreams_$used'(Used, __TopXMLNS, _acc) ->
    [encode_bytestreams_streamhost_used(Used, __TopXMLNS)
     | _acc].

'encode_bytestreams_$activate'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_bytestreams_$activate'(Activate, __TopXMLNS,
			       _acc) ->
    [encode_bytestreams_activate(Activate, __TopXMLNS)
     | _acc].

decode_bytestreams_attr_dstaddr(__TopXMLNS,
				undefined) ->
    <<>>;
decode_bytestreams_attr_dstaddr(__TopXMLNS, _val) ->
    _val.

encode_bytestreams_attr_dstaddr(<<>>, _acc) -> _acc;
encode_bytestreams_attr_dstaddr(_val, _acc) ->
    [{<<"dstaddr">>, _val} | _acc].

decode_bytestreams_attr_sid(__TopXMLNS, undefined) ->
    <<>>;
decode_bytestreams_attr_sid(__TopXMLNS, _val) -> _val.

encode_bytestreams_attr_sid(<<>>, _acc) -> _acc;
encode_bytestreams_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

decode_bytestreams_attr_mode(__TopXMLNS, undefined) ->
    tcp;
decode_bytestreams_attr_mode(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [tcp, udp]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"mode">>, <<"query">>, __TopXMLNS}});
      _res -> _res
    end.

encode_bytestreams_attr_mode(tcp, _acc) -> _acc;
encode_bytestreams_attr_mode(_val, _acc) ->
    [{<<"mode">>, enc_enum(_val)} | _acc].

decode_bytestreams_activate(__TopXMLNS, __Opts,
			    {xmlel, <<"activate">>, _attrs, _els}) ->
    Cdata = decode_bytestreams_activate_els(__TopXMLNS,
					    __Opts, _els, <<>>),
    Cdata.

decode_bytestreams_activate_els(__TopXMLNS, __Opts, [],
				Cdata) ->
    decode_bytestreams_activate_cdata(__TopXMLNS, Cdata);
decode_bytestreams_activate_els(__TopXMLNS, __Opts,
				[{xmlcdata, _data} | _els], Cdata) ->
    decode_bytestreams_activate_els(__TopXMLNS, __Opts,
				    _els, <<Cdata/binary, _data/binary>>);
decode_bytestreams_activate_els(__TopXMLNS, __Opts,
				[_ | _els], Cdata) ->
    decode_bytestreams_activate_els(__TopXMLNS, __Opts,
				    _els, Cdata).

encode_bytestreams_activate(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/bytestreams">>,
				    [], __TopXMLNS),
    _els = encode_bytestreams_activate_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"activate">>, _attrs, _els}.

decode_bytestreams_activate_cdata(__TopXMLNS, <<>>) ->
    undefined;
decode_bytestreams_activate_cdata(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"activate">>, __TopXMLNS}});
      _res -> _res
    end.

encode_bytestreams_activate_cdata(undefined, _acc) ->
    _acc;
encode_bytestreams_activate_cdata(_val, _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].

decode_bytestreams_streamhost_used(__TopXMLNS, __Opts,
				   {xmlel, <<"streamhost-used">>, _attrs,
				    _els}) ->
    Jid =
	decode_bytestreams_streamhost_used_attrs(__TopXMLNS,
						 _attrs, undefined),
    Jid.

decode_bytestreams_streamhost_used_attrs(__TopXMLNS,
					 [{<<"jid">>, _val} | _attrs], _Jid) ->
    decode_bytestreams_streamhost_used_attrs(__TopXMLNS,
					     _attrs, _val);
decode_bytestreams_streamhost_used_attrs(__TopXMLNS,
					 [_ | _attrs], Jid) ->
    decode_bytestreams_streamhost_used_attrs(__TopXMLNS,
					     _attrs, Jid);
decode_bytestreams_streamhost_used_attrs(__TopXMLNS, [],
					 Jid) ->
    decode_bytestreams_streamhost_used_attr_jid(__TopXMLNS,
						Jid).

encode_bytestreams_streamhost_used(Jid, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/bytestreams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs =
	encode_bytestreams_streamhost_used_attr_jid(Jid,
						    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									       __TopXMLNS)),
    {xmlel, <<"streamhost-used">>, _attrs, _els}.

decode_bytestreams_streamhost_used_attr_jid(__TopXMLNS,
					    undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"streamhost-used">>,
		   __TopXMLNS}});
decode_bytestreams_streamhost_used_attr_jid(__TopXMLNS,
					    _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"streamhost-used">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_bytestreams_streamhost_used_attr_jid(_val,
					    _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_bytestreams_streamhost(__TopXMLNS, __Opts,
			      {xmlel, <<"streamhost">>, _attrs, _els}) ->
    {Jid, Host, Port} =
	decode_bytestreams_streamhost_attrs(__TopXMLNS, _attrs,
					    undefined, undefined, undefined),
    {streamhost, Jid, Host, Port}.

decode_bytestreams_streamhost_attrs(__TopXMLNS,
				    [{<<"jid">>, _val} | _attrs], _Jid, Host,
				    Port) ->
    decode_bytestreams_streamhost_attrs(__TopXMLNS, _attrs,
					_val, Host, Port);
decode_bytestreams_streamhost_attrs(__TopXMLNS,
				    [{<<"host">>, _val} | _attrs], Jid, _Host,
				    Port) ->
    decode_bytestreams_streamhost_attrs(__TopXMLNS, _attrs,
					Jid, _val, Port);
decode_bytestreams_streamhost_attrs(__TopXMLNS,
				    [{<<"port">>, _val} | _attrs], Jid, Host,
				    _Port) ->
    decode_bytestreams_streamhost_attrs(__TopXMLNS, _attrs,
					Jid, Host, _val);
decode_bytestreams_streamhost_attrs(__TopXMLNS,
				    [_ | _attrs], Jid, Host, Port) ->
    decode_bytestreams_streamhost_attrs(__TopXMLNS, _attrs,
					Jid, Host, Port);
decode_bytestreams_streamhost_attrs(__TopXMLNS, [], Jid,
				    Host, Port) ->
    {decode_bytestreams_streamhost_attr_jid(__TopXMLNS,
					    Jid),
     decode_bytestreams_streamhost_attr_host(__TopXMLNS,
					     Host),
     decode_bytestreams_streamhost_attr_port(__TopXMLNS,
					     Port)}.

encode_bytestreams_streamhost({streamhost, Jid, Host,
			       Port},
			      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/bytestreams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_bytestreams_streamhost_attr_port(Port,
						     encode_bytestreams_streamhost_attr_host(Host,
											     encode_bytestreams_streamhost_attr_jid(Jid,
																    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																			       __TopXMLNS)))),
    {xmlel, <<"streamhost">>, _attrs, _els}.

decode_bytestreams_streamhost_attr_jid(__TopXMLNS,
				       undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"streamhost">>,
		   __TopXMLNS}});
decode_bytestreams_streamhost_attr_jid(__TopXMLNS,
				       _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"streamhost">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_bytestreams_streamhost_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_bytestreams_streamhost_attr_host(__TopXMLNS,
					undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"host">>, <<"streamhost">>,
		   __TopXMLNS}});
decode_bytestreams_streamhost_attr_host(__TopXMLNS,
					_val) ->
    _val.

encode_bytestreams_streamhost_attr_host(_val, _acc) ->
    [{<<"host">>, _val} | _acc].

decode_bytestreams_streamhost_attr_port(__TopXMLNS,
					undefined) ->
    1080;
decode_bytestreams_streamhost_attr_port(__TopXMLNS,
					_val) ->
    case catch dec_int(_val, 0, 65535) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"port">>, <<"streamhost">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_bytestreams_streamhost_attr_port(1080, _acc) ->
    _acc;
encode_bytestreams_streamhost_attr_port(_val, _acc) ->
    [{<<"port">>, enc_int(_val)} | _acc].
