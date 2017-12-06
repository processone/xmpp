%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0202).

-compile(export_all).

do_decode(<<"time">>, <<"urn:xmpp:time">>, El, Opts) ->
    decode_time(<<"urn:xmpp:time">>, Opts, El);
do_decode(<<"tzo">>, <<"urn:xmpp:time">>, El, Opts) ->
    decode_time_tzo(<<"urn:xmpp:time">>, Opts, El);
do_decode(<<"utc">>, <<"urn:xmpp:time">>, El, Opts) ->
    decode_time_utc(<<"urn:xmpp:time">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"time">>, <<"urn:xmpp:time">>},
     {<<"tzo">>, <<"urn:xmpp:time">>},
     {<<"utc">>, <<"urn:xmpp:time">>}].

do_encode({time, _, _} = Time, TopXMLNS) ->
    encode_time(Time, TopXMLNS).

do_get_name({time, _, _}) -> <<"time">>.

do_get_ns({time, _, _}) -> <<"urn:xmpp:time">>.

pp(time, 2) -> [tzo, utc];
pp(_, _) -> no.

records() -> [{time, 2}].

dec_tzo(Val) ->
    [H1, M1] = binary:split(Val, <<":">>),
    H = binary_to_integer(H1),
    M = binary_to_integer(M1),
    if H >= -12, H =< 12, M >= 0, M < 60 -> {H, M} end.

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_tzo({H, M}) ->
    Sign = if H >= 0 -> <<>>;
	      true -> <<"-">>
	   end,
    list_to_binary([Sign,
		    io_lib:format("~2..0w:~2..0w", [H, M])]).

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_time(__TopXMLNS, __Opts,
	    {xmlel, <<"time">>, _attrs, _els}) ->
    {Utc, Tzo} = decode_time_els(__TopXMLNS, __Opts, _els,
				 undefined, undefined),
    {time, Tzo, Utc}.

decode_time_els(__TopXMLNS, __Opts, [], Utc, Tzo) ->
    {Utc, Tzo};
decode_time_els(__TopXMLNS, __Opts,
		[{xmlel, <<"tzo">>, _attrs, _} = _el | _els], Utc,
		Tzo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:time">> ->
	  decode_time_els(__TopXMLNS, __Opts, _els, Utc,
			  decode_time_tzo(<<"urn:xmpp:time">>, __Opts, _el));
      _ -> decode_time_els(__TopXMLNS, __Opts, _els, Utc, Tzo)
    end;
decode_time_els(__TopXMLNS, __Opts,
		[{xmlel, <<"utc">>, _attrs, _} = _el | _els], Utc,
		Tzo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:time">> ->
	  decode_time_els(__TopXMLNS, __Opts, _els,
			  decode_time_utc(<<"urn:xmpp:time">>, __Opts, _el),
			  Tzo);
      _ -> decode_time_els(__TopXMLNS, __Opts, _els, Utc, Tzo)
    end;
decode_time_els(__TopXMLNS, __Opts, [_ | _els], Utc,
		Tzo) ->
    decode_time_els(__TopXMLNS, __Opts, _els, Utc, Tzo).

encode_time({time, Tzo, Utc}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:time">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_time_$utc'(Utc,
					    __NewTopXMLNS,
					    'encode_time_$tzo'(Tzo,
							       __NewTopXMLNS,
							       []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"time">>, _attrs, _els}.

'encode_time_$utc'(undefined, __TopXMLNS, _acc) -> _acc;
'encode_time_$utc'(Utc, __TopXMLNS, _acc) ->
    [encode_time_utc(Utc, __TopXMLNS) | _acc].

'encode_time_$tzo'(undefined, __TopXMLNS, _acc) -> _acc;
'encode_time_$tzo'(Tzo, __TopXMLNS, _acc) ->
    [encode_time_tzo(Tzo, __TopXMLNS) | _acc].

decode_time_tzo(__TopXMLNS, __Opts,
		{xmlel, <<"tzo">>, _attrs, _els}) ->
    Cdata = decode_time_tzo_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Cdata.

decode_time_tzo_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_time_tzo_cdata(__TopXMLNS, Cdata);
decode_time_tzo_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Cdata) ->
    decode_time_tzo_els(__TopXMLNS, __Opts, _els,
			<<Cdata/binary, _data/binary>>);
decode_time_tzo_els(__TopXMLNS, __Opts, [_ | _els],
		    Cdata) ->
    decode_time_tzo_els(__TopXMLNS, __Opts, _els, Cdata).

encode_time_tzo(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:time">>, [],
				    __TopXMLNS),
    _els = encode_time_tzo_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"tzo">>, _attrs, _els}.

decode_time_tzo_cdata(__TopXMLNS, <<>>) -> undefined;
decode_time_tzo_cdata(__TopXMLNS, _val) ->
    case catch dec_tzo(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"tzo">>, __TopXMLNS}});
      _res -> _res
    end.

encode_time_tzo_cdata(undefined, _acc) -> _acc;
encode_time_tzo_cdata(_val, _acc) ->
    [{xmlcdata, enc_tzo(_val)} | _acc].

decode_time_utc(__TopXMLNS, __Opts,
		{xmlel, <<"utc">>, _attrs, _els}) ->
    Cdata = decode_time_utc_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Cdata.

decode_time_utc_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_time_utc_cdata(__TopXMLNS, Cdata);
decode_time_utc_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Cdata) ->
    decode_time_utc_els(__TopXMLNS, __Opts, _els,
			<<Cdata/binary, _data/binary>>);
decode_time_utc_els(__TopXMLNS, __Opts, [_ | _els],
		    Cdata) ->
    decode_time_utc_els(__TopXMLNS, __Opts, _els, Cdata).

encode_time_utc(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:time">>, [],
				    __TopXMLNS),
    _els = encode_time_utc_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"utc">>, _attrs, _els}.

decode_time_utc_cdata(__TopXMLNS, <<>>) -> undefined;
decode_time_utc_cdata(__TopXMLNS, _val) ->
    case catch dec_utc(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"utc">>, __TopXMLNS}});
      _res -> _res
    end.

encode_time_utc_cdata(undefined, _acc) -> _acc;
encode_time_utc_cdata(_val, _acc) ->
    [{xmlcdata, enc_utc(_val)} | _acc].
