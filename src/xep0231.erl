%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0231).

-compile(export_all).

do_decode(<<"data">>, <<"urn:xmpp:bob">>, El, Opts) ->
    decode_bob_data(<<"urn:xmpp:bob">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"data">>, <<"urn:xmpp:bob">>}].

do_encode({bob_data, _, _, _, _} = Data, TopXMLNS) ->
    encode_bob_data(Data, TopXMLNS).

do_get_name({bob_data, _, _, _, _}) -> <<"data">>.

do_get_ns({bob_data, _, _, _, _}) -> <<"urn:xmpp:bob">>.

pp(bob_data, 4) -> [cid, 'max-age', type, data];
pp(_, _) -> no.

records() -> [{bob_data, 4}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_bob_data(__TopXMLNS, __Opts,
		{xmlel, <<"data">>, _attrs, _els}) ->
    Data = decode_bob_data_els(__TopXMLNS, __Opts, _els,
			       <<>>),
    {Cid, Max_age, Type} = decode_bob_data_attrs(__TopXMLNS,
						 _attrs, undefined, undefined,
						 undefined),
    {bob_data, Cid, Max_age, Type, Data}.

decode_bob_data_els(__TopXMLNS, __Opts, [], Data) ->
    decode_bob_data_cdata(__TopXMLNS, Data);
decode_bob_data_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Data) ->
    decode_bob_data_els(__TopXMLNS, __Opts, _els,
			<<Data/binary, _data/binary>>);
decode_bob_data_els(__TopXMLNS, __Opts, [_ | _els],
		    Data) ->
    decode_bob_data_els(__TopXMLNS, __Opts, _els, Data).

decode_bob_data_attrs(__TopXMLNS,
		      [{<<"cid">>, _val} | _attrs], _Cid, Max_age, Type) ->
    decode_bob_data_attrs(__TopXMLNS, _attrs, _val, Max_age,
			  Type);
decode_bob_data_attrs(__TopXMLNS,
		      [{<<"max-age">>, _val} | _attrs], Cid, _Max_age,
		      Type) ->
    decode_bob_data_attrs(__TopXMLNS, _attrs, Cid, _val,
			  Type);
decode_bob_data_attrs(__TopXMLNS,
		      [{<<"type">>, _val} | _attrs], Cid, Max_age, _Type) ->
    decode_bob_data_attrs(__TopXMLNS, _attrs, Cid, Max_age,
			  _val);
decode_bob_data_attrs(__TopXMLNS, [_ | _attrs], Cid,
		      Max_age, Type) ->
    decode_bob_data_attrs(__TopXMLNS, _attrs, Cid, Max_age,
			  Type);
decode_bob_data_attrs(__TopXMLNS, [], Cid, Max_age,
		      Type) ->
    {decode_bob_data_attr_cid(__TopXMLNS, Cid),
     'decode_bob_data_attr_max-age'(__TopXMLNS, Max_age),
     decode_bob_data_attr_type(__TopXMLNS, Type)}.

encode_bob_data({bob_data, Cid, Max_age, Type, Data},
		__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:bob">>, [],
				    __TopXMLNS),
    _els = encode_bob_data_cdata(Data, []),
    _attrs = encode_bob_data_attr_type(Type,
				       'encode_bob_data_attr_max-age'(Max_age,
								      encode_bob_data_attr_cid(Cid,
											       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
															  __TopXMLNS)))),
    {xmlel, <<"data">>, _attrs, _els}.

decode_bob_data_attr_cid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"cid">>, <<"data">>, __TopXMLNS}});
decode_bob_data_attr_cid(__TopXMLNS, _val) -> _val.

encode_bob_data_attr_cid(_val, _acc) ->
    [{<<"cid">>, _val} | _acc].

'decode_bob_data_attr_max-age'(__TopXMLNS, undefined) ->
    undefined;
'decode_bob_data_attr_max-age'(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"max-age">>, <<"data">>,
			 __TopXMLNS}});
      _res -> _res
    end.

'encode_bob_data_attr_max-age'(undefined, _acc) -> _acc;
'encode_bob_data_attr_max-age'(_val, _acc) ->
    [{<<"max-age">>, enc_int(_val)} | _acc].

decode_bob_data_attr_type(__TopXMLNS, undefined) ->
    <<>>;
decode_bob_data_attr_type(__TopXMLNS, _val) -> _val.

encode_bob_data_attr_type(<<>>, _acc) -> _acc;
encode_bob_data_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].

decode_bob_data_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_bob_data_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"data">>, __TopXMLNS}});
      _res -> _res
    end.

encode_bob_data_cdata(<<>>, _acc) -> _acc;
encode_bob_data_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].
