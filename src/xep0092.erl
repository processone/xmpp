%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0092).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:version">>, El,
	  Opts) ->
    decode_version(<<"jabber:iq:version">>, Opts, El);
do_decode(<<"os">>, <<"jabber:iq:version">>, El,
	  Opts) ->
    decode_version_os(<<"jabber:iq:version">>, Opts, El);
do_decode(<<"version">>, <<"jabber:iq:version">>, El,
	  Opts) ->
    decode_version_ver(<<"jabber:iq:version">>, Opts, El);
do_decode(<<"name">>, <<"jabber:iq:version">>, El,
	  Opts) ->
    decode_version_name(<<"jabber:iq:version">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:iq:version">>},
     {<<"os">>, <<"jabber:iq:version">>},
     {<<"version">>, <<"jabber:iq:version">>},
     {<<"name">>, <<"jabber:iq:version">>}].

do_encode({version, _, _, _} = Query, TopXMLNS) ->
    encode_version(Query, TopXMLNS).

do_get_name({version, _, _, _}) -> <<"query">>.

do_get_ns({version, _, _, _}) ->
    <<"jabber:iq:version">>.

pp(version, 3) -> [name, ver, os];
pp(_, _) -> no.

records() -> [{version, 3}].

decode_version(__TopXMLNS, __Opts,
	       {xmlel, <<"query">>, _attrs, _els}) ->
    {Ver, Os, Name} = decode_version_els(__TopXMLNS, __Opts,
					 _els, undefined, undefined, undefined),
    {version, Name, Ver, Os}.

decode_version_els(__TopXMLNS, __Opts, [], Ver, Os,
		   Name) ->
    {Ver, Os, Name};
decode_version_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"name">>, _attrs, _} = _el | _els], Ver, Os,
		   Name) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:version">> ->
	  decode_version_els(__TopXMLNS, __Opts, _els, Ver, Os,
			     decode_version_name(<<"jabber:iq:version">>,
						 __Opts, _el));
      _ ->
	  decode_version_els(__TopXMLNS, __Opts, _els, Ver, Os,
			     Name)
    end;
decode_version_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"version">>, _attrs, _} = _el | _els], Ver,
		   Os, Name) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:version">> ->
	  decode_version_els(__TopXMLNS, __Opts, _els,
			     decode_version_ver(<<"jabber:iq:version">>, __Opts,
						_el),
			     Os, Name);
      _ ->
	  decode_version_els(__TopXMLNS, __Opts, _els, Ver, Os,
			     Name)
    end;
decode_version_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"os">>, _attrs, _} = _el | _els], Ver, Os,
		   Name) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:version">> ->
	  decode_version_els(__TopXMLNS, __Opts, _els, Ver,
			     decode_version_os(<<"jabber:iq:version">>, __Opts,
					       _el),
			     Name);
      _ ->
	  decode_version_els(__TopXMLNS, __Opts, _els, Ver, Os,
			     Name)
    end;
decode_version_els(__TopXMLNS, __Opts, [_ | _els], Ver,
		   Os, Name) ->
    decode_version_els(__TopXMLNS, __Opts, _els, Ver, Os,
		       Name).

encode_version({version, Name, Ver, Os}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:version">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_version_$ver'(Ver,
					       __NewTopXMLNS,
					       'encode_version_$os'(Os,
								    __NewTopXMLNS,
								    'encode_version_$name'(Name,
											   __NewTopXMLNS,
											   [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_version_$ver'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_version_$ver'(Ver, __TopXMLNS, _acc) ->
    [encode_version_ver(Ver, __TopXMLNS) | _acc].

'encode_version_$os'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_version_$os'(Os, __TopXMLNS, _acc) ->
    [encode_version_os(Os, __TopXMLNS) | _acc].

'encode_version_$name'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_version_$name'(Name, __TopXMLNS, _acc) ->
    [encode_version_name(Name, __TopXMLNS) | _acc].

decode_version_os(__TopXMLNS, __Opts,
		  {xmlel, <<"os">>, _attrs, _els}) ->
    Cdata = decode_version_os_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_version_os_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_version_os_cdata(__TopXMLNS, Cdata);
decode_version_os_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_version_os_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_version_os_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_version_os_els(__TopXMLNS, __Opts, _els, Cdata).

encode_version_os(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:version">>, [],
				    __TopXMLNS),
    _els = encode_version_os_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"os">>, _attrs, _els}.

decode_version_os_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"os">>, __TopXMLNS}});
decode_version_os_cdata(__TopXMLNS, _val) -> _val.

encode_version_os_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_version_ver(__TopXMLNS, __Opts,
		   {xmlel, <<"version">>, _attrs, _els}) ->
    Cdata = decode_version_ver_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Cdata.

decode_version_ver_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_version_ver_cdata(__TopXMLNS, Cdata);
decode_version_ver_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_version_ver_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_version_ver_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_version_ver_els(__TopXMLNS, __Opts, _els, Cdata).

encode_version_ver(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:version">>, [],
				    __TopXMLNS),
    _els = encode_version_ver_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"version">>, _attrs, _els}.

decode_version_ver_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"version">>, __TopXMLNS}});
decode_version_ver_cdata(__TopXMLNS, _val) -> _val.

encode_version_ver_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_version_name(__TopXMLNS, __Opts,
		    {xmlel, <<"name">>, _attrs, _els}) ->
    Cdata = decode_version_name_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_version_name_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_version_name_cdata(__TopXMLNS, Cdata);
decode_version_name_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_version_name_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_version_name_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_version_name_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_version_name(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:version">>, [],
				    __TopXMLNS),
    _els = encode_version_name_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"name">>, _attrs, _els}.

decode_version_name_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"name">>, __TopXMLNS}});
decode_version_name_cdata(__TopXMLNS, _val) -> _val.

encode_version_name_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
