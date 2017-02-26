%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0203).

-compile(export_all).

do_decode(<<"delay">>, <<"urn:xmpp:delay">>, El,
	  Opts) ->
    decode_delay(<<"urn:xmpp:delay">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"delay">>, <<"urn:xmpp:delay">>}].

do_encode({delay, _, _, _} = Delay, TopXMLNS) ->
    encode_delay(Delay, TopXMLNS).

do_get_name({delay, _, _, _}) -> <<"delay">>.

do_get_ns({delay, _, _, _}) -> <<"urn:xmpp:delay">>.

pp(delay, 3) -> [stamp, from, desc];
pp(_, _) -> no.

records() -> [{delay, 3}].

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_delay(__TopXMLNS, __Opts,
	     {xmlel, <<"delay">>, _attrs, _els}) ->
    Desc = decode_delay_els(__TopXMLNS, __Opts, _els, <<>>),
    {Stamp, From} = decode_delay_attrs(__TopXMLNS, _attrs,
				       undefined, undefined),
    {delay, Stamp, From, Desc}.

decode_delay_els(__TopXMLNS, __Opts, [], Desc) ->
    decode_delay_cdata(__TopXMLNS, Desc);
decode_delay_els(__TopXMLNS, __Opts,
		 [{xmlcdata, _data} | _els], Desc) ->
    decode_delay_els(__TopXMLNS, __Opts, _els,
		     <<Desc/binary, _data/binary>>);
decode_delay_els(__TopXMLNS, __Opts, [_ | _els],
		 Desc) ->
    decode_delay_els(__TopXMLNS, __Opts, _els, Desc).

decode_delay_attrs(__TopXMLNS,
		   [{<<"stamp">>, _val} | _attrs], _Stamp, From) ->
    decode_delay_attrs(__TopXMLNS, _attrs, _val, From);
decode_delay_attrs(__TopXMLNS,
		   [{<<"from">>, _val} | _attrs], Stamp, _From) ->
    decode_delay_attrs(__TopXMLNS, _attrs, Stamp, _val);
decode_delay_attrs(__TopXMLNS, [_ | _attrs], Stamp,
		   From) ->
    decode_delay_attrs(__TopXMLNS, _attrs, Stamp, From);
decode_delay_attrs(__TopXMLNS, [], Stamp, From) ->
    {decode_delay_attr_stamp(__TopXMLNS, Stamp),
     decode_delay_attr_from(__TopXMLNS, From)}.

encode_delay({delay, Stamp, From, Desc}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:delay">>, [],
				    __TopXMLNS),
    _els = encode_delay_cdata(Desc, []),
    _attrs = encode_delay_attr_from(From,
				    encode_delay_attr_stamp(Stamp,
							    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
										       __TopXMLNS))),
    {xmlel, <<"delay">>, _attrs, _els}.

decode_delay_attr_stamp(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"stamp">>, <<"delay">>, __TopXMLNS}});
decode_delay_attr_stamp(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"stamp">>, <<"delay">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_delay_attr_stamp(_val, _acc) ->
    [{<<"stamp">>, enc_utc(_val)} | _acc].

decode_delay_attr_from(__TopXMLNS, undefined) ->
    undefined;
decode_delay_attr_from(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"delay">>, __TopXMLNS}});
      _res -> _res
    end.

encode_delay_attr_from(undefined, _acc) -> _acc;
encode_delay_attr_from(_val, _acc) ->
    [{<<"from">>, jid:encode(_val)} | _acc].

decode_delay_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_delay_cdata(__TopXMLNS, _val) -> _val.

encode_delay_cdata(<<>>, _acc) -> _acc;
encode_delay_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
