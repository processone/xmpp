%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0249).

-compile(export_all).

do_decode(<<"x">>, <<"jabber:x:conference">>, El,
	  Opts) ->
    decode_x_conference(<<"jabber:x:conference">>, Opts,
			El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"x">>, <<"jabber:x:conference">>}].

do_encode({x_conference, _, _, _, _, _} = X,
	  TopXMLNS) ->
    encode_x_conference(X, TopXMLNS).

do_get_name({x_conference, _, _, _, _, _}) -> <<"x">>.

do_get_ns({x_conference, _, _, _, _, _}) ->
    <<"jabber:x:conference">>.

pp(x_conference, 5) ->
    [jid, password, reason, continue, thread];
pp(_, _) -> no.

records() -> [{x_conference, 5}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

decode_x_conference(__TopXMLNS, __Opts,
		    {xmlel, <<"x">>, _attrs, _els}) ->
    {Jid, Password, Reason, Thread, Continue} =
	decode_x_conference_attrs(__TopXMLNS, _attrs, undefined,
				  undefined, undefined, undefined, undefined),
    {x_conference, Jid, Password, Reason, Continue, Thread}.

decode_x_conference_attrs(__TopXMLNS,
			  [{<<"jid">>, _val} | _attrs], _Jid, Password, Reason,
			  Thread, Continue) ->
    decode_x_conference_attrs(__TopXMLNS, _attrs, _val,
			      Password, Reason, Thread, Continue);
decode_x_conference_attrs(__TopXMLNS,
			  [{<<"password">>, _val} | _attrs], Jid, _Password,
			  Reason, Thread, Continue) ->
    decode_x_conference_attrs(__TopXMLNS, _attrs, Jid, _val,
			      Reason, Thread, Continue);
decode_x_conference_attrs(__TopXMLNS,
			  [{<<"reason">>, _val} | _attrs], Jid, Password,
			  _Reason, Thread, Continue) ->
    decode_x_conference_attrs(__TopXMLNS, _attrs, Jid,
			      Password, _val, Thread, Continue);
decode_x_conference_attrs(__TopXMLNS,
			  [{<<"thread">>, _val} | _attrs], Jid, Password,
			  Reason, _Thread, Continue) ->
    decode_x_conference_attrs(__TopXMLNS, _attrs, Jid,
			      Password, Reason, _val, Continue);
decode_x_conference_attrs(__TopXMLNS,
			  [{<<"continue">>, _val} | _attrs], Jid, Password,
			  Reason, Thread, _Continue) ->
    decode_x_conference_attrs(__TopXMLNS, _attrs, Jid,
			      Password, Reason, Thread, _val);
decode_x_conference_attrs(__TopXMLNS, [_ | _attrs], Jid,
			  Password, Reason, Thread, Continue) ->
    decode_x_conference_attrs(__TopXMLNS, _attrs, Jid,
			      Password, Reason, Thread, Continue);
decode_x_conference_attrs(__TopXMLNS, [], Jid, Password,
			  Reason, Thread, Continue) ->
    {decode_x_conference_attr_jid(__TopXMLNS, Jid),
     decode_x_conference_attr_password(__TopXMLNS, Password),
     decode_x_conference_attr_reason(__TopXMLNS, Reason),
     decode_x_conference_attr_thread(__TopXMLNS, Thread),
     decode_x_conference_attr_continue(__TopXMLNS,
				       Continue)}.

encode_x_conference({x_conference, Jid, Password,
		     Reason, Continue, Thread},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:conference">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_x_conference_attr_continue(Continue,
					       encode_x_conference_attr_thread(Thread,
									       encode_x_conference_attr_reason(Reason,
													       encode_x_conference_attr_password(Password,
																		 encode_x_conference_attr_jid(Jid,
																					      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																									 __TopXMLNS)))))),
    {xmlel, <<"x">>, _attrs, _els}.

decode_x_conference_attr_jid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"x">>, __TopXMLNS}});
decode_x_conference_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"x">>, __TopXMLNS}});
      _res -> _res
    end.

encode_x_conference_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_x_conference_attr_password(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_x_conference_attr_password(__TopXMLNS, _val) ->
    _val.

encode_x_conference_attr_password(<<>>, _acc) -> _acc;
encode_x_conference_attr_password(_val, _acc) ->
    [{<<"password">>, _val} | _acc].

decode_x_conference_attr_reason(__TopXMLNS,
				undefined) ->
    <<>>;
decode_x_conference_attr_reason(__TopXMLNS, _val) ->
    _val.

encode_x_conference_attr_reason(<<>>, _acc) -> _acc;
encode_x_conference_attr_reason(_val, _acc) ->
    [{<<"reason">>, _val} | _acc].

decode_x_conference_attr_thread(__TopXMLNS,
				undefined) ->
    <<>>;
decode_x_conference_attr_thread(__TopXMLNS, _val) ->
    _val.

encode_x_conference_attr_thread(<<>>, _acc) -> _acc;
encode_x_conference_attr_thread(_val, _acc) ->
    [{<<"thread">>, _val} | _acc].

decode_x_conference_attr_continue(__TopXMLNS,
				  undefined) ->
    undefined;
decode_x_conference_attr_continue(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"continue">>, <<"x">>, __TopXMLNS}});
      _res -> _res
    end.

encode_x_conference_attr_continue(undefined, _acc) ->
    _acc;
encode_x_conference_attr_continue(_val, _acc) ->
    [{<<"continue">>, enc_bool(_val)} | _acc].
