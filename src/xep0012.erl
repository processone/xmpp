%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0012).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:last">>, El,
	  Opts) ->
    decode_last(<<"jabber:iq:last">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"jabber:iq:last">>}].

do_encode({last, _, _} = Query, TopXMLNS) ->
    encode_last(Query, TopXMLNS).

do_get_name({last, _, _}) -> <<"query">>.

do_get_ns({last, _, _}) -> <<"jabber:iq:last">>.

pp(last, 2) -> [seconds, status];
pp(_, _) -> no.

records() -> [{last, 2}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_last(__TopXMLNS, __Opts,
	    {xmlel, <<"query">>, _attrs, _els}) ->
    Status = decode_last_els(__TopXMLNS, __Opts, _els,
			     <<>>),
    Seconds = decode_last_attrs(__TopXMLNS, _attrs,
				undefined),
    {last, Seconds, Status}.

decode_last_els(__TopXMLNS, __Opts, [], Status) ->
    decode_last_cdata(__TopXMLNS, Status);
decode_last_els(__TopXMLNS, __Opts,
		[{xmlcdata, _data} | _els], Status) ->
    decode_last_els(__TopXMLNS, __Opts, _els,
		    <<Status/binary, _data/binary>>);
decode_last_els(__TopXMLNS, __Opts, [_ | _els],
		Status) ->
    decode_last_els(__TopXMLNS, __Opts, _els, Status).

decode_last_attrs(__TopXMLNS,
		  [{<<"seconds">>, _val} | _attrs], _Seconds) ->
    decode_last_attrs(__TopXMLNS, _attrs, _val);
decode_last_attrs(__TopXMLNS, [_ | _attrs], Seconds) ->
    decode_last_attrs(__TopXMLNS, _attrs, Seconds);
decode_last_attrs(__TopXMLNS, [], Seconds) ->
    decode_last_attr_seconds(__TopXMLNS, Seconds).

encode_last({last, Seconds, Status}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:last">>, [],
				    __TopXMLNS),
    _els = encode_last_cdata(Status, []),
    _attrs = encode_last_attr_seconds(Seconds,
				      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								 __TopXMLNS)),
    {xmlel, <<"query">>, _attrs, _els}.

decode_last_attr_seconds(__TopXMLNS, undefined) ->
    undefined;
decode_last_attr_seconds(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"seconds">>, <<"query">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_last_attr_seconds(undefined, _acc) -> _acc;
encode_last_attr_seconds(_val, _acc) ->
    [{<<"seconds">>, enc_int(_val)} | _acc].

decode_last_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_last_cdata(__TopXMLNS, _val) -> _val.

encode_last_cdata(<<>>, _acc) -> _acc;
encode_last_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
