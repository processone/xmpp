%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(phone_number_normalization).

-compile(export_all).

do_decode(<<"contact_list">>,
	  <<"ns:phonenumber:normalization">>, El, Opts) ->
    decode_contact_list(<<"ns:phonenumber:normalization">>,
			Opts, El);
do_decode(<<"contact">>,
	  <<"ns:phonenumber:normalization">>, El, Opts) ->
    decode_contact(<<"ns:phonenumber:normalization">>, Opts,
		   El);
do_decode(<<"normalized">>,
	  <<"ns:phonenumber:normalization">>, El, Opts) ->
    decode_normalized(<<"ns:phonenumber:normalization">>,
		      Opts, El);
do_decode(<<"raw">>, <<"ns:phonenumber:normalization">>,
	  El, Opts) ->
    decode_raw(<<"ns:phonenumber:normalization">>, Opts,
	       El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"contact_list">>,
      <<"ns:phonenumber:normalization">>},
     {<<"contact">>, <<"ns:phonenumber:normalization">>},
     {<<"normalized">>, <<"ns:phonenumber:normalization">>},
     {<<"raw">>, <<"ns:phonenumber:normalization">>}].

do_encode({contact_list, _,
	   <<"ns:phonenumber:normalization">>, _} =
	      Contact_list,
	  TopXMLNS) ->
    encode_contact_list(Contact_list, TopXMLNS);
do_encode({contact_list, _, <<>>, _} = Contact_list,
	  TopXMLNS = <<"ns:phonenumber:normalization">>) ->
    encode_contact_list(Contact_list, TopXMLNS).

do_get_name({contact_list, _, _, _}) ->
    <<"contact_list">>.

do_get_ns({contact_list, _, Xmlns, _}) -> Xmlns.

pp(contact_list, 3) -> [id, xmlns, contacts];
pp(_, _) -> no.

records() -> [{contact_list, 3}].

decode_contact_list(__TopXMLNS, __Opts,
		    {xmlel, <<"contact_list">>, _attrs, _els}) ->
    Contacts = decode_contact_list_els(__TopXMLNS, __Opts,
				       _els, []),
    {Id, Xmlns} = decode_contact_list_attrs(__TopXMLNS,
					    _attrs, undefined, undefined),
    {contact_list, Id, Xmlns, Contacts}.

decode_contact_list_els(__TopXMLNS, __Opts, [],
			Contacts) ->
    lists:reverse(Contacts);
decode_contact_list_els(__TopXMLNS, __Opts,
			[{xmlel, <<"contact">>, _attrs, _} = _el | _els],
			Contacts) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"ns:phonenumber:normalization">> ->
	  decode_contact_list_els(__TopXMLNS, __Opts, _els,
				  [decode_contact(<<"ns:phonenumber:normalization">>,
						  __Opts, _el)
				   | Contacts]);
      _ ->
	  decode_contact_list_els(__TopXMLNS, __Opts, _els,
				  Contacts)
    end;
decode_contact_list_els(__TopXMLNS, __Opts, [_ | _els],
			Contacts) ->
    decode_contact_list_els(__TopXMLNS, __Opts, _els,
			    Contacts).

decode_contact_list_attrs(__TopXMLNS,
			  [{<<"id">>, _val} | _attrs], _Id, Xmlns) ->
    decode_contact_list_attrs(__TopXMLNS, _attrs, _val,
			      Xmlns);
decode_contact_list_attrs(__TopXMLNS,
			  [{<<"xmlns">>, _val} | _attrs], Id, _Xmlns) ->
    decode_contact_list_attrs(__TopXMLNS, _attrs, Id, _val);
decode_contact_list_attrs(__TopXMLNS, [_ | _attrs], Id,
			  Xmlns) ->
    decode_contact_list_attrs(__TopXMLNS, _attrs, Id,
			      Xmlns);
decode_contact_list_attrs(__TopXMLNS, [], Id, Xmlns) ->
    {decode_contact_list_attr_id(__TopXMLNS, Id),
     decode_contact_list_attr_xmlns(__TopXMLNS, Xmlns)}.

encode_contact_list({contact_list, Id, Xmlns, Contacts},
		    __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"ns:phonenumber:normalization">>],
						__TopXMLNS),
    _els =
	lists:reverse('encode_contact_list_$contacts'(Contacts,
						      __NewTopXMLNS, [])),
    _attrs = encode_contact_list_attr_id(Id,
					 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								    __TopXMLNS)),
    {xmlel, <<"contact_list">>, _attrs, _els}.

'encode_contact_list_$contacts'([], __TopXMLNS, _acc) ->
    _acc;
'encode_contact_list_$contacts'([Contacts | _els],
				__TopXMLNS, _acc) ->
    'encode_contact_list_$contacts'(_els, __TopXMLNS,
				    [encode_contact(Contacts, __TopXMLNS)
				     | _acc]).

decode_contact_list_attr_id(__TopXMLNS, undefined) ->
    <<>>;
decode_contact_list_attr_id(__TopXMLNS, _val) -> _val.

encode_contact_list_attr_id(<<>>, _acc) -> _acc;
encode_contact_list_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_contact_list_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_contact_list_attr_xmlns(__TopXMLNS, _val) ->
    _val.

decode_contact(__TopXMLNS, __Opts,
	       {xmlel, <<"contact">>, _attrs, _els}) ->
    {Normalized_numbers, Raw_numbers} =
	decode_contact_els(__TopXMLNS, __Opts, _els, [], []),
    {Raw_numbers, Normalized_numbers}.

decode_contact_els(__TopXMLNS, __Opts, [],
		   Normalized_numbers, Raw_numbers) ->
    {lists:reverse(Normalized_numbers),
     lists:reverse(Raw_numbers)};
decode_contact_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"raw">>, _attrs, _} = _el | _els],
		   Normalized_numbers, Raw_numbers) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"ns:phonenumber:normalization">> ->
	  decode_contact_els(__TopXMLNS, __Opts, _els,
			     Normalized_numbers,
			     [decode_raw(<<"ns:phonenumber:normalization">>,
					 __Opts, _el)
			      | Raw_numbers]);
      _ ->
	  decode_contact_els(__TopXMLNS, __Opts, _els,
			     Normalized_numbers, Raw_numbers)
    end;
decode_contact_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"normalized">>, _attrs, _} = _el | _els],
		   Normalized_numbers, Raw_numbers) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"ns:phonenumber:normalization">> ->
	  decode_contact_els(__TopXMLNS, __Opts, _els,
			     [decode_normalized(<<"ns:phonenumber:normalization">>,
						__Opts, _el)
			      | Normalized_numbers],
			     Raw_numbers);
      _ ->
	  decode_contact_els(__TopXMLNS, __Opts, _els,
			     Normalized_numbers, Raw_numbers)
    end;
decode_contact_els(__TopXMLNS, __Opts, [_ | _els],
		   Normalized_numbers, Raw_numbers) ->
    decode_contact_els(__TopXMLNS, __Opts, _els,
		       Normalized_numbers, Raw_numbers).

encode_contact({Raw_numbers, Normalized_numbers},
	       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"ns:phonenumber:normalization">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_contact_$normalized_numbers'(Normalized_numbers,
							   __NewTopXMLNS,
							   'encode_contact_$raw_numbers'(Raw_numbers,
											 __NewTopXMLNS,
											 []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"contact">>, _attrs, _els}.

'encode_contact_$normalized_numbers'([], __TopXMLNS,
				     _acc) ->
    _acc;
'encode_contact_$normalized_numbers'([Normalized_numbers
				      | _els],
				     __TopXMLNS, _acc) ->
    'encode_contact_$normalized_numbers'(_els, __TopXMLNS,
					 [encode_normalized(Normalized_numbers,
							    __TopXMLNS)
					  | _acc]).

'encode_contact_$raw_numbers'([], __TopXMLNS, _acc) ->
    _acc;
'encode_contact_$raw_numbers'([Raw_numbers | _els],
			      __TopXMLNS, _acc) ->
    'encode_contact_$raw_numbers'(_els, __TopXMLNS,
				  [encode_raw(Raw_numbers, __TopXMLNS) | _acc]).

decode_normalized(__TopXMLNS, __Opts,
		  {xmlel, <<"normalized">>, _attrs, _els}) ->
    Cdata = decode_normalized_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_normalized_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_normalized_cdata(__TopXMLNS, Cdata);
decode_normalized_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_normalized_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_normalized_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_normalized_els(__TopXMLNS, __Opts, _els, Cdata).

encode_normalized(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"ns:phonenumber:normalization">>,
				    [], __TopXMLNS),
    _els = encode_normalized_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"normalized">>, _attrs, _els}.

decode_normalized_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"normalized">>, __TopXMLNS}});
decode_normalized_cdata(__TopXMLNS, _val) -> _val.

encode_normalized_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_raw(__TopXMLNS, __Opts,
	   {xmlel, <<"raw">>, _attrs, _els}) ->
    Cdata = decode_raw_els(__TopXMLNS, __Opts, _els, <<>>),
    Cdata.

decode_raw_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_raw_cdata(__TopXMLNS, Cdata);
decode_raw_els(__TopXMLNS, __Opts,
	       [{xmlcdata, _data} | _els], Cdata) ->
    decode_raw_els(__TopXMLNS, __Opts, _els,
		   <<Cdata/binary, _data/binary>>);
decode_raw_els(__TopXMLNS, __Opts, [_ | _els], Cdata) ->
    decode_raw_els(__TopXMLNS, __Opts, _els, Cdata).

encode_raw(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"ns:phonenumber:normalization">>,
				    [], __TopXMLNS),
    _els = encode_raw_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"raw">>, _attrs, _els}.

decode_raw_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"raw">>, __TopXMLNS}});
decode_raw_cdata(__TopXMLNS, _val) -> _val.

encode_raw_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
