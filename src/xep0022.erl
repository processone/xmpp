%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0022).

-compile(export_all).

do_decode(<<"x">>, <<"jabber:x:event">>, El, Opts) ->
    decode_xevent(<<"jabber:x:event">>, Opts, El);
do_decode(<<"id">>, <<"jabber:x:event">>, El, Opts) ->
    decode_xevent_id(<<"jabber:x:event">>, Opts, El);
do_decode(<<"composing">>, <<"jabber:x:event">>, El,
	  Opts) ->
    decode_xevent_composing(<<"jabber:x:event">>, Opts, El);
do_decode(<<"displayed">>, <<"jabber:x:event">>, El,
	  Opts) ->
    decode_xevent_displayed(<<"jabber:x:event">>, Opts, El);
do_decode(<<"delivered">>, <<"jabber:x:event">>, El,
	  Opts) ->
    decode_xevent_delivered(<<"jabber:x:event">>, Opts, El);
do_decode(<<"offline">>, <<"jabber:x:event">>, El,
	  Opts) ->
    decode_xevent_offline(<<"jabber:x:event">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"x">>, <<"jabber:x:event">>},
     {<<"id">>, <<"jabber:x:event">>},
     {<<"composing">>, <<"jabber:x:event">>},
     {<<"displayed">>, <<"jabber:x:event">>},
     {<<"delivered">>, <<"jabber:x:event">>},
     {<<"offline">>, <<"jabber:x:event">>}].

do_encode({xevent, _, _, _, _, _} = X, TopXMLNS) ->
    encode_xevent(X, TopXMLNS).

do_get_name({xevent, _, _, _, _, _}) -> <<"x">>.

do_get_ns({xevent, _, _, _, _, _}) ->
    <<"jabber:x:event">>.

pp(xevent, 5) ->
    [offline, delivered, displayed, composing, id];
pp(_, _) -> no.

records() -> [{xevent, 5}].

decode_xevent(__TopXMLNS, __Opts,
	      {xmlel, <<"x">>, _attrs, _els}) ->
    {Id, Displayed, Delivered, Offline, Composing} =
	decode_xevent_els(__TopXMLNS, __Opts, _els, undefined,
			  false, false, false, false),
    {xevent, Offline, Delivered, Displayed, Composing, Id}.

decode_xevent_els(__TopXMLNS, __Opts, [], Id, Displayed,
		  Delivered, Offline, Composing) ->
    {Id, Displayed, Delivered, Offline, Composing};
decode_xevent_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"offline">>, _attrs, _} = _el | _els], Id,
		  Displayed, Delivered, Offline, Composing) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:event">> ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
			    Displayed, Delivered,
			    decode_xevent_offline(<<"jabber:x:event">>, __Opts,
						  _el),
			    Composing);
      _ ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
			    Displayed, Delivered, Offline, Composing)
    end;
decode_xevent_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"delivered">>, _attrs, _} = _el | _els], Id,
		  Displayed, Delivered, Offline, Composing) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:event">> ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
			    Displayed,
			    decode_xevent_delivered(<<"jabber:x:event">>,
						    __Opts, _el),
			    Offline, Composing);
      _ ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
			    Displayed, Delivered, Offline, Composing)
    end;
decode_xevent_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"displayed">>, _attrs, _} = _el | _els], Id,
		  Displayed, Delivered, Offline, Composing) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:event">> ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
			    decode_xevent_displayed(<<"jabber:x:event">>,
						    __Opts, _el),
			    Delivered, Offline, Composing);
      _ ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
			    Displayed, Delivered, Offline, Composing)
    end;
decode_xevent_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"composing">>, _attrs, _} = _el | _els], Id,
		  Displayed, Delivered, Offline, Composing) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:event">> ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
			    Displayed, Delivered, Offline,
			    decode_xevent_composing(<<"jabber:x:event">>,
						    __Opts, _el));
      _ ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
			    Displayed, Delivered, Offline, Composing)
    end;
decode_xevent_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"id">>, _attrs, _} = _el | _els], Id,
		  Displayed, Delivered, Offline, Composing) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:event">> ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els,
			    decode_xevent_id(<<"jabber:x:event">>, __Opts, _el),
			    Displayed, Delivered, Offline, Composing);
      _ ->
	  decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
			    Displayed, Delivered, Offline, Composing)
    end;
decode_xevent_els(__TopXMLNS, __Opts, [_ | _els], Id,
		  Displayed, Delivered, Offline, Composing) ->
    decode_xevent_els(__TopXMLNS, __Opts, _els, Id,
		      Displayed, Delivered, Offline, Composing).

encode_xevent({xevent, Offline, Delivered, Displayed,
	       Composing, Id},
	      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:event">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_xevent_$id'(Id,
					     __NewTopXMLNS,
					     'encode_xevent_$displayed'(Displayed,
									__NewTopXMLNS,
									'encode_xevent_$delivered'(Delivered,
												   __NewTopXMLNS,
												   'encode_xevent_$offline'(Offline,
															    __NewTopXMLNS,
															    'encode_xevent_$composing'(Composing,
																		       __NewTopXMLNS,
																		       [])))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"x">>, _attrs, _els}.

'encode_xevent_$id'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_xevent_$id'(Id, __TopXMLNS, _acc) ->
    [encode_xevent_id(Id, __TopXMLNS) | _acc].

'encode_xevent_$displayed'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_xevent_$displayed'(Displayed, __TopXMLNS,
			   _acc) ->
    [encode_xevent_displayed(Displayed, __TopXMLNS) | _acc].

'encode_xevent_$delivered'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_xevent_$delivered'(Delivered, __TopXMLNS,
			   _acc) ->
    [encode_xevent_delivered(Delivered, __TopXMLNS) | _acc].

'encode_xevent_$offline'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_xevent_$offline'(Offline, __TopXMLNS, _acc) ->
    [encode_xevent_offline(Offline, __TopXMLNS) | _acc].

'encode_xevent_$composing'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_xevent_$composing'(Composing, __TopXMLNS,
			   _acc) ->
    [encode_xevent_composing(Composing, __TopXMLNS) | _acc].

decode_xevent_id(__TopXMLNS, __Opts,
		 {xmlel, <<"id">>, _attrs, _els}) ->
    Cdata = decode_xevent_id_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_xevent_id_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_xevent_id_cdata(__TopXMLNS, Cdata);
decode_xevent_id_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_xevent_id_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_xevent_id_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_xevent_id_els(__TopXMLNS, __Opts, _els, Cdata).

encode_xevent_id(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:event">>, [],
				    __TopXMLNS),
    _els = encode_xevent_id_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"id">>, _attrs, _els}.

decode_xevent_id_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_xevent_id_cdata(__TopXMLNS, _val) -> _val.

encode_xevent_id_cdata(<<>>, _acc) -> _acc;
encode_xevent_id_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_xevent_composing(__TopXMLNS, __Opts,
			{xmlel, <<"composing">>, _attrs, _els}) ->
    true.

encode_xevent_composing(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:event">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"composing">>, _attrs, _els}.

decode_xevent_displayed(__TopXMLNS, __Opts,
			{xmlel, <<"displayed">>, _attrs, _els}) ->
    true.

encode_xevent_displayed(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:event">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"displayed">>, _attrs, _els}.

decode_xevent_delivered(__TopXMLNS, __Opts,
			{xmlel, <<"delivered">>, _attrs, _els}) ->
    true.

encode_xevent_delivered(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:event">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"delivered">>, _attrs, _els}.

decode_xevent_offline(__TopXMLNS, __Opts,
		      {xmlel, <<"offline">>, _attrs, _els}) ->
    true.

encode_xevent_offline(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:event">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"offline">>, _attrs, _els}.
