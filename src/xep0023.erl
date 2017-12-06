%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0023).

-compile(export_all).

do_decode(<<"x">>, <<"jabber:x:expire">>, El, Opts) ->
    decode_expire(<<"jabber:x:expire">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"x">>, <<"jabber:x:expire">>}].

do_encode({expire, _, _} = X, TopXMLNS) ->
    encode_expire(X, TopXMLNS).

do_get_name({expire, _, _}) -> <<"x">>.

do_get_ns({expire, _, _}) -> <<"jabber:x:expire">>.

pp(expire, 2) -> [seconds, stored];
pp(_, _) -> no.

records() -> [{expire, 2}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_expire(__TopXMLNS, __Opts,
	      {xmlel, <<"x">>, _attrs, _els}) ->
    {Seconds, Stored} = decode_expire_attrs(__TopXMLNS,
					    _attrs, undefined, undefined),
    {expire, Seconds, Stored}.

decode_expire_attrs(__TopXMLNS,
		    [{<<"seconds">>, _val} | _attrs], _Seconds, Stored) ->
    decode_expire_attrs(__TopXMLNS, _attrs, _val, Stored);
decode_expire_attrs(__TopXMLNS,
		    [{<<"stored">>, _val} | _attrs], Seconds, _Stored) ->
    decode_expire_attrs(__TopXMLNS, _attrs, Seconds, _val);
decode_expire_attrs(__TopXMLNS, [_ | _attrs], Seconds,
		    Stored) ->
    decode_expire_attrs(__TopXMLNS, _attrs, Seconds,
			Stored);
decode_expire_attrs(__TopXMLNS, [], Seconds, Stored) ->
    {decode_expire_attr_seconds(__TopXMLNS, Seconds),
     decode_expire_attr_stored(__TopXMLNS, Stored)}.

encode_expire({expire, Seconds, Stored}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:x:expire">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_expire_attr_stored(Stored,
				       encode_expire_attr_seconds(Seconds,
								  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
											     __TopXMLNS))),
    {xmlel, <<"x">>, _attrs, _els}.

decode_expire_attr_seconds(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"seconds">>, <<"x">>, __TopXMLNS}});
decode_expire_attr_seconds(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"seconds">>, <<"x">>, __TopXMLNS}});
      _res -> _res
    end.

encode_expire_attr_seconds(_val, _acc) ->
    [{<<"seconds">>, enc_int(_val)} | _acc].

decode_expire_attr_stored(__TopXMLNS, undefined) ->
    undefined;
decode_expire_attr_stored(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"stored">>, <<"x">>, __TopXMLNS}});
      _res -> _res
    end.

encode_expire_attr_stored(undefined, _acc) -> _acc;
encode_expire_attr_stored(_val, _acc) ->
    [{<<"stored">>, enc_int(_val)} | _acc].
