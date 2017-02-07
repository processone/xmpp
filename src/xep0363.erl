%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0363).

-compile(export_all).

do_decode(<<"slot">>, <<"urn:xmpp:http:upload">>, El,
	  Opts) ->
    decode_upload_slot(<<"urn:xmpp:http:upload">>, Opts,
		       El);
do_decode(<<"slot">>,
	  <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_slot(<<"eu:siacs:conversations:http:upload">>,
		       Opts, El);
do_decode(<<"put">>, <<"urn:xmpp:http:upload">>, El,
	  Opts) ->
    decode_upload_put(<<"urn:xmpp:http:upload">>, Opts, El);
do_decode(<<"put">>,
	  <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_put(<<"eu:siacs:conversations:http:upload">>,
		      Opts, El);
do_decode(<<"get">>, <<"urn:xmpp:http:upload">>, El,
	  Opts) ->
    decode_upload_get(<<"urn:xmpp:http:upload">>, Opts, El);
do_decode(<<"get">>,
	  <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_get(<<"eu:siacs:conversations:http:upload">>,
		      Opts, El);
do_decode(<<"request">>, <<"urn:xmpp:http:upload">>, El,
	  Opts) ->
    decode_upload_request(<<"urn:xmpp:http:upload">>, Opts,
			  El);
do_decode(<<"request">>,
	  <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_request(<<"eu:siacs:conversations:http:upload">>,
			  Opts, El);
do_decode(<<"content-type">>,
	  <<"urn:xmpp:http:upload">>, El, Opts) ->
    decode_upload_content_type(<<"urn:xmpp:http:upload">>,
			       Opts, El);
do_decode(<<"content-type">>,
	  <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_content_type(<<"eu:siacs:conversations:http:upload">>,
			       Opts, El);
do_decode(<<"size">>, <<"urn:xmpp:http:upload">>, El,
	  Opts) ->
    decode_upload_size(<<"urn:xmpp:http:upload">>, Opts,
		       El);
do_decode(<<"size">>,
	  <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_size(<<"eu:siacs:conversations:http:upload">>,
		       Opts, El);
do_decode(<<"filename">>, <<"urn:xmpp:http:upload">>,
	  El, Opts) ->
    decode_upload_filename(<<"urn:xmpp:http:upload">>, Opts,
			   El);
do_decode(<<"filename">>,
	  <<"eu:siacs:conversations:http:upload">>, El, Opts) ->
    decode_upload_filename(<<"eu:siacs:conversations:http:upload">>,
			   Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"slot">>, <<"urn:xmpp:http:upload">>},
     {<<"slot">>, <<"eu:siacs:conversations:http:upload">>},
     {<<"put">>, <<"urn:xmpp:http:upload">>},
     {<<"put">>, <<"eu:siacs:conversations:http:upload">>},
     {<<"get">>, <<"urn:xmpp:http:upload">>},
     {<<"get">>, <<"eu:siacs:conversations:http:upload">>},
     {<<"request">>, <<"urn:xmpp:http:upload">>},
     {<<"request">>,
      <<"eu:siacs:conversations:http:upload">>},
     {<<"content-type">>, <<"urn:xmpp:http:upload">>},
     {<<"content-type">>,
      <<"eu:siacs:conversations:http:upload">>},
     {<<"size">>, <<"urn:xmpp:http:upload">>},
     {<<"size">>, <<"eu:siacs:conversations:http:upload">>},
     {<<"filename">>, <<"urn:xmpp:http:upload">>},
     {<<"filename">>,
      <<"eu:siacs:conversations:http:upload">>}].

do_encode({upload_request, _, _, _, _} = Request,
	  TopXMLNS) ->
    encode_upload_request(Request, TopXMLNS);
do_encode({upload_slot, _, _, _} = Slot, TopXMLNS) ->
    encode_upload_slot(Slot, TopXMLNS).

do_get_name({upload_request, _, _, _, _}) ->
    <<"request">>;
do_get_name({upload_slot, _, _, _}) -> <<"slot">>.

do_get_ns({upload_request, _, _, _, Xmlns}) -> Xmlns;
do_get_ns({upload_slot, _, _, Xmlns}) -> Xmlns.

pp(upload_request, 4) ->
    [filename, size, 'content-type', xmlns];
pp(upload_slot, 3) -> [get, put, xmlns];
pp(_, _) -> no.

records() -> [{upload_request, 4}, {upload_slot, 3}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_upload_slot(__TopXMLNS, __Opts,
		   {xmlel, <<"slot">>, _attrs, _els}) ->
    {Put, Get} = decode_upload_slot_els(__TopXMLNS, __Opts,
					_els, undefined, undefined),
    Xmlns = decode_upload_slot_attrs(__TopXMLNS, _attrs,
				     undefined),
    {upload_slot, Get, Put, Xmlns}.

decode_upload_slot_els(__TopXMLNS, __Opts, [], Put,
		       Get) ->
    {Put, Get};
decode_upload_slot_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"get">>, _attrs, _} = _el | _els], Put,
		       Get) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:http:upload">> ->
	  decode_upload_slot_els(__TopXMLNS, __Opts, _els, Put,
				 decode_upload_get(<<"urn:xmpp:http:upload">>,
						   __Opts, _el));
      <<"eu:siacs:conversations:http:upload">> ->
	  decode_upload_slot_els(__TopXMLNS, __Opts, _els, Put,
				 decode_upload_get(<<"eu:siacs:conversations:http:upload">>,
						   __Opts, _el));
      _ ->
	  decode_upload_slot_els(__TopXMLNS, __Opts, _els, Put,
				 Get)
    end;
decode_upload_slot_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"put">>, _attrs, _} = _el | _els], Put,
		       Get) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:http:upload">> ->
	  decode_upload_slot_els(__TopXMLNS, __Opts, _els,
				 decode_upload_put(<<"urn:xmpp:http:upload">>,
						   __Opts, _el),
				 Get);
      <<"eu:siacs:conversations:http:upload">> ->
	  decode_upload_slot_els(__TopXMLNS, __Opts, _els,
				 decode_upload_put(<<"eu:siacs:conversations:http:upload">>,
						   __Opts, _el),
				 Get);
      _ ->
	  decode_upload_slot_els(__TopXMLNS, __Opts, _els, Put,
				 Get)
    end;
decode_upload_slot_els(__TopXMLNS, __Opts, [_ | _els],
		       Put, Get) ->
    decode_upload_slot_els(__TopXMLNS, __Opts, _els, Put,
			   Get).

decode_upload_slot_attrs(__TopXMLNS,
			 [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_upload_slot_attrs(__TopXMLNS, _attrs, _val);
decode_upload_slot_attrs(__TopXMLNS, [_ | _attrs],
			 Xmlns) ->
    decode_upload_slot_attrs(__TopXMLNS, _attrs, Xmlns);
decode_upload_slot_attrs(__TopXMLNS, [], Xmlns) ->
    decode_upload_slot_attr_xmlns(__TopXMLNS, Xmlns).

encode_upload_slot({upload_slot, Get, Put, Xmlns},
		   __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:http:upload">>,
						 <<"eu:siacs:conversations:http:upload">>],
						__TopXMLNS),
    _els = lists:reverse('encode_upload_slot_$put'(Put,
						   __NewTopXMLNS,
						   'encode_upload_slot_$get'(Get,
									     __NewTopXMLNS,
									     []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"slot">>, _attrs, _els}.

'encode_upload_slot_$put'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_upload_slot_$put'(Put, __TopXMLNS, _acc) ->
    [encode_upload_put(Put, __TopXMLNS) | _acc].

'encode_upload_slot_$get'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_upload_slot_$get'(Get, __TopXMLNS, _acc) ->
    [encode_upload_get(Get, __TopXMLNS) | _acc].

decode_upload_slot_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_upload_slot_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_upload_put(__TopXMLNS, __Opts,
		  {xmlel, <<"put">>, _attrs, _els}) ->
    Cdata = decode_upload_put_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_upload_put_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_upload_put_cdata(__TopXMLNS, Cdata);
decode_upload_put_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_put_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_upload_put_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_upload_put_els(__TopXMLNS, __Opts, _els, Cdata).

encode_upload_put(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:xmpp:http:upload">>,
						 <<"eu:siacs:conversations:http:upload">>],
						__TopXMLNS),
    _els = encode_upload_put_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"put">>, _attrs, _els}.

decode_upload_put_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"put">>, __TopXMLNS}});
decode_upload_put_cdata(__TopXMLNS, _val) -> _val.

encode_upload_put_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_upload_get(__TopXMLNS, __Opts,
		  {xmlel, <<"get">>, _attrs, _els}) ->
    Cdata = decode_upload_get_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_upload_get_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_upload_get_cdata(__TopXMLNS, Cdata);
decode_upload_get_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_get_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_upload_get_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_upload_get_els(__TopXMLNS, __Opts, _els, Cdata).

encode_upload_get(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:xmpp:http:upload">>,
						 <<"eu:siacs:conversations:http:upload">>],
						__TopXMLNS),
    _els = encode_upload_get_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"get">>, _attrs, _els}.

decode_upload_get_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"get">>, __TopXMLNS}});
decode_upload_get_cdata(__TopXMLNS, _val) -> _val.

encode_upload_get_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_upload_request(__TopXMLNS, __Opts,
		      {xmlel, <<"request">>, _attrs, _els}) ->
    {Content_type, Size, Filename} =
	decode_upload_request_els(__TopXMLNS, __Opts, _els,
				  <<>>, error, error),
    Xmlns = decode_upload_request_attrs(__TopXMLNS, _attrs,
					undefined),
    {upload_request, Filename, Size, Content_type, Xmlns}.

decode_upload_request_els(__TopXMLNS, __Opts, [],
			  Content_type, Size, Filename) ->
    {Content_type,
     case Size of
       error ->
	   erlang:error({xmpp_codec,
			 {missing_tag, <<"size">>, __TopXMLNS}});
       {value, Size1} -> Size1
     end,
     case Filename of
       error ->
	   erlang:error({xmpp_codec,
			 {missing_tag, <<"filename">>, __TopXMLNS}});
       {value, Filename1} -> Filename1
     end};
decode_upload_request_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"filename">>, _attrs, _} = _el | _els],
			  Content_type, Size, Filename) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:http:upload">> ->
	  decode_upload_request_els(__TopXMLNS, __Opts, _els,
				    Content_type, Size,
				    {value,
				     decode_upload_filename(<<"urn:xmpp:http:upload">>,
							    __Opts, _el)});
      <<"eu:siacs:conversations:http:upload">> ->
	  decode_upload_request_els(__TopXMLNS, __Opts, _els,
				    Content_type, Size,
				    {value,
				     decode_upload_filename(<<"eu:siacs:conversations:http:upload">>,
							    __Opts, _el)});
      _ ->
	  decode_upload_request_els(__TopXMLNS, __Opts, _els,
				    Content_type, Size, Filename)
    end;
decode_upload_request_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"size">>, _attrs, _} = _el | _els],
			  Content_type, Size, Filename) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:http:upload">> ->
	  decode_upload_request_els(__TopXMLNS, __Opts, _els,
				    Content_type,
				    {value,
				     decode_upload_size(<<"urn:xmpp:http:upload">>,
							__Opts, _el)},
				    Filename);
      <<"eu:siacs:conversations:http:upload">> ->
	  decode_upload_request_els(__TopXMLNS, __Opts, _els,
				    Content_type,
				    {value,
				     decode_upload_size(<<"eu:siacs:conversations:http:upload">>,
							__Opts, _el)},
				    Filename);
      _ ->
	  decode_upload_request_els(__TopXMLNS, __Opts, _els,
				    Content_type, Size, Filename)
    end;
decode_upload_request_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"content-type">>, _attrs, _} = _el | _els],
			  Content_type, Size, Filename) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:xmpp:http:upload">> ->
	  decode_upload_request_els(__TopXMLNS, __Opts, _els,
				    decode_upload_content_type(<<"urn:xmpp:http:upload">>,
							       __Opts, _el),
				    Size, Filename);
      <<"eu:siacs:conversations:http:upload">> ->
	  decode_upload_request_els(__TopXMLNS, __Opts, _els,
				    decode_upload_content_type(<<"eu:siacs:conversations:http:upload">>,
							       __Opts, _el),
				    Size, Filename);
      _ ->
	  decode_upload_request_els(__TopXMLNS, __Opts, _els,
				    Content_type, Size, Filename)
    end;
decode_upload_request_els(__TopXMLNS, __Opts,
			  [_ | _els], Content_type, Size, Filename) ->
    decode_upload_request_els(__TopXMLNS, __Opts, _els,
			      Content_type, Size, Filename).

decode_upload_request_attrs(__TopXMLNS,
			    [{<<"xmlns">>, _val} | _attrs], _Xmlns) ->
    decode_upload_request_attrs(__TopXMLNS, _attrs, _val);
decode_upload_request_attrs(__TopXMLNS, [_ | _attrs],
			    Xmlns) ->
    decode_upload_request_attrs(__TopXMLNS, _attrs, Xmlns);
decode_upload_request_attrs(__TopXMLNS, [], Xmlns) ->
    decode_upload_request_attr_xmlns(__TopXMLNS, Xmlns).

encode_upload_request({upload_request, Filename, Size,
		       Content_type, Xmlns},
		      __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"urn:xmpp:http:upload">>,
						 <<"eu:siacs:conversations:http:upload">>],
						__TopXMLNS),
    _els =
	lists:reverse('encode_upload_request_$content-type'(Content_type,
							    __NewTopXMLNS,
							    'encode_upload_request_$size'(Size,
											  __NewTopXMLNS,
											  'encode_upload_request_$filename'(Filename,
															    __NewTopXMLNS,
															    [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"request">>, _attrs, _els}.

'encode_upload_request_$content-type'(<<>>, __TopXMLNS,
				      _acc) ->
    _acc;
'encode_upload_request_$content-type'(Content_type,
				      __TopXMLNS, _acc) ->
    [encode_upload_content_type(Content_type, __TopXMLNS)
     | _acc].

'encode_upload_request_$size'(Size, __TopXMLNS, _acc) ->
    [encode_upload_size(Size, __TopXMLNS) | _acc].

'encode_upload_request_$filename'(Filename, __TopXMLNS,
				  _acc) ->
    [encode_upload_filename(Filename, __TopXMLNS) | _acc].

decode_upload_request_attr_xmlns(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_upload_request_attr_xmlns(__TopXMLNS, _val) ->
    _val.

decode_upload_content_type(__TopXMLNS, __Opts,
			   {xmlel, <<"content-type">>, _attrs, _els}) ->
    Cdata = decode_upload_content_type_els(__TopXMLNS,
					   __Opts, _els, <<>>),
    Cdata.

decode_upload_content_type_els(__TopXMLNS, __Opts, [],
			       Cdata) ->
    decode_upload_content_type_cdata(__TopXMLNS, Cdata);
decode_upload_content_type_els(__TopXMLNS, __Opts,
			       [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_content_type_els(__TopXMLNS, __Opts, _els,
				   <<Cdata/binary, _data/binary>>);
decode_upload_content_type_els(__TopXMLNS, __Opts,
			       [_ | _els], Cdata) ->
    decode_upload_content_type_els(__TopXMLNS, __Opts, _els,
				   Cdata).

encode_upload_content_type(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:xmpp:http:upload">>,
						 <<"eu:siacs:conversations:http:upload">>],
						__TopXMLNS),
    _els = encode_upload_content_type_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"content-type">>, _attrs, _els}.

decode_upload_content_type_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_upload_content_type_cdata(__TopXMLNS, _val) ->
    _val.

encode_upload_content_type_cdata(<<>>, _acc) -> _acc;
encode_upload_content_type_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_upload_size(__TopXMLNS, __Opts,
		   {xmlel, <<"size">>, _attrs, _els}) ->
    Cdata = decode_upload_size_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Cdata.

decode_upload_size_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_upload_size_cdata(__TopXMLNS, Cdata);
decode_upload_size_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_size_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_upload_size_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_upload_size_els(__TopXMLNS, __Opts, _els, Cdata).

encode_upload_size(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:xmpp:http:upload">>,
						 <<"eu:siacs:conversations:http:upload">>],
						__TopXMLNS),
    _els = encode_upload_size_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"size">>, _attrs, _els}.

decode_upload_size_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"size">>, __TopXMLNS}});
decode_upload_size_cdata(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"size">>, __TopXMLNS}});
      _res -> _res
    end.

encode_upload_size_cdata(_val, _acc) ->
    [{xmlcdata, enc_int(_val)} | _acc].

decode_upload_filename(__TopXMLNS, __Opts,
		       {xmlel, <<"filename">>, _attrs, _els}) ->
    Cdata = decode_upload_filename_els(__TopXMLNS, __Opts,
				       _els, <<>>),
    Cdata.

decode_upload_filename_els(__TopXMLNS, __Opts, [],
			   Cdata) ->
    decode_upload_filename_cdata(__TopXMLNS, Cdata);
decode_upload_filename_els(__TopXMLNS, __Opts,
			   [{xmlcdata, _data} | _els], Cdata) ->
    decode_upload_filename_els(__TopXMLNS, __Opts, _els,
			       <<Cdata/binary, _data/binary>>);
decode_upload_filename_els(__TopXMLNS, __Opts,
			   [_ | _els], Cdata) ->
    decode_upload_filename_els(__TopXMLNS, __Opts, _els,
			       Cdata).

encode_upload_filename(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"urn:xmpp:http:upload">>,
						 <<"eu:siacs:conversations:http:upload">>],
						__TopXMLNS),
    _els = encode_upload_filename_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"filename">>, _attrs, _els}.

decode_upload_filename_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"filename">>, __TopXMLNS}});
decode_upload_filename_cdata(__TopXMLNS, _val) -> _val.

encode_upload_filename_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
