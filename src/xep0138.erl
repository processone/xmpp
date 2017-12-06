%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0138).

-compile(export_all).

do_decode(<<"compression">>,
	  <<"http://jabber.org/features/compress">>, El, Opts) ->
    decode_compression(<<"http://jabber.org/features/compress">>,
		       Opts, El);
do_decode(<<"method">>,
	  <<"http://jabber.org/features/compress">>, El, Opts) ->
    decode_compression_method(<<"http://jabber.org/features/compress">>,
			      Opts, El);
do_decode(<<"compressed">>,
	  <<"http://jabber.org/protocol/compress">>, El, Opts) ->
    decode_compressed(<<"http://jabber.org/protocol/compress">>,
		      Opts, El);
do_decode(<<"compress">>,
	  <<"http://jabber.org/protocol/compress">>, El, Opts) ->
    decode_compress(<<"http://jabber.org/protocol/compress">>,
		    Opts, El);
do_decode(<<"method">>,
	  <<"http://jabber.org/protocol/compress">>, El, Opts) ->
    decode_compress_method(<<"http://jabber.org/protocol/compress">>,
			   Opts, El);
do_decode(<<"failure">>,
	  <<"http://jabber.org/protocol/compress">>, El, Opts) ->
    decode_compress_failure(<<"http://jabber.org/protocol/compress">>,
			    Opts, El);
do_decode(<<"unsupported-method">>,
	  <<"http://jabber.org/protocol/compress">>, El, Opts) ->
    decode_compress_failure_unsupported_method(<<"http://jabber.org/protocol/compress">>,
					       Opts, El);
do_decode(<<"processing-failed">>,
	  <<"http://jabber.org/protocol/compress">>, El, Opts) ->
    decode_compress_failure_processing_failed(<<"http://jabber.org/protocol/compress">>,
					      Opts, El);
do_decode(<<"setup-failed">>,
	  <<"http://jabber.org/protocol/compress">>, El, Opts) ->
    decode_compress_failure_setup_failed(<<"http://jabber.org/protocol/compress">>,
					 Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"compression">>,
      <<"http://jabber.org/features/compress">>},
     {<<"method">>,
      <<"http://jabber.org/features/compress">>},
     {<<"compressed">>,
      <<"http://jabber.org/protocol/compress">>},
     {<<"compress">>,
      <<"http://jabber.org/protocol/compress">>},
     {<<"method">>,
      <<"http://jabber.org/protocol/compress">>},
     {<<"failure">>,
      <<"http://jabber.org/protocol/compress">>},
     {<<"unsupported-method">>,
      <<"http://jabber.org/protocol/compress">>},
     {<<"processing-failed">>,
      <<"http://jabber.org/protocol/compress">>},
     {<<"setup-failed">>,
      <<"http://jabber.org/protocol/compress">>}].

do_encode({compress_failure, _} = Failure, TopXMLNS) ->
    encode_compress_failure(Failure, TopXMLNS);
do_encode({compress, _} = Compress, TopXMLNS) ->
    encode_compress(Compress, TopXMLNS);
do_encode({compressed} = Compressed, TopXMLNS) ->
    encode_compressed(Compressed, TopXMLNS);
do_encode({compression, _} = Compression, TopXMLNS) ->
    encode_compression(Compression, TopXMLNS).

do_get_name({compress, _}) -> <<"compress">>;
do_get_name({compress_failure, _}) -> <<"failure">>;
do_get_name({compressed}) -> <<"compressed">>;
do_get_name({compression, _}) -> <<"compression">>.

do_get_ns({compress, _}) ->
    <<"http://jabber.org/protocol/compress">>;
do_get_ns({compress_failure, _}) ->
    <<"http://jabber.org/protocol/compress">>;
do_get_ns({compressed}) ->
    <<"http://jabber.org/protocol/compress">>;
do_get_ns({compression, _}) ->
    <<"http://jabber.org/features/compress">>.

pp(compress_failure, 1) -> [reason];
pp(compress, 1) -> [methods];
pp(compressed, 0) -> [];
pp(compression, 1) -> [methods];
pp(_, _) -> no.

records() ->
    [{compress_failure, 1}, {compress, 1}, {compressed, 0},
     {compression, 1}].

decode_compression(__TopXMLNS, __Opts,
		   {xmlel, <<"compression">>, _attrs, _els}) ->
    Methods = decode_compression_els(__TopXMLNS, __Opts,
				     _els, []),
    {compression, Methods}.

decode_compression_els(__TopXMLNS, __Opts, [],
		       Methods) ->
    lists:reverse(Methods);
decode_compression_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"method">>, _attrs, _} = _el | _els],
		       Methods) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/features/compress">> ->
	  decode_compression_els(__TopXMLNS, __Opts, _els,
				 [decode_compression_method(<<"http://jabber.org/features/compress">>,
							    __Opts, _el)
				  | Methods]);
      _ ->
	  decode_compression_els(__TopXMLNS, __Opts, _els,
				 Methods)
    end;
decode_compression_els(__TopXMLNS, __Opts, [_ | _els],
		       Methods) ->
    decode_compression_els(__TopXMLNS, __Opts, _els,
			   Methods).

encode_compression({compression, Methods},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/features/compress">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_compression_$methods'(Methods,
						    __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"compression">>, _attrs, _els}.

'encode_compression_$methods'([], __TopXMLNS, _acc) ->
    _acc;
'encode_compression_$methods'([Methods | _els],
			      __TopXMLNS, _acc) ->
    'encode_compression_$methods'(_els, __TopXMLNS,
				  [encode_compression_method(Methods,
							     __TopXMLNS)
				   | _acc]).

decode_compression_method(__TopXMLNS, __Opts,
			  {xmlel, <<"method">>, _attrs, _els}) ->
    Cdata = decode_compression_method_els(__TopXMLNS,
					  __Opts, _els, <<>>),
    Cdata.

decode_compression_method_els(__TopXMLNS, __Opts, [],
			      Cdata) ->
    decode_compression_method_cdata(__TopXMLNS, Cdata);
decode_compression_method_els(__TopXMLNS, __Opts,
			      [{xmlcdata, _data} | _els], Cdata) ->
    decode_compression_method_els(__TopXMLNS, __Opts, _els,
				  <<Cdata/binary, _data/binary>>);
decode_compression_method_els(__TopXMLNS, __Opts,
			      [_ | _els], Cdata) ->
    decode_compression_method_els(__TopXMLNS, __Opts, _els,
				  Cdata).

encode_compression_method(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/features/compress">>,
				    [], __TopXMLNS),
    _els = encode_compression_method_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"method">>, _attrs, _els}.

decode_compression_method_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_compression_method_cdata(__TopXMLNS, _val) ->
    _val.

encode_compression_method_cdata(<<>>, _acc) -> _acc;
encode_compression_method_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_compressed(__TopXMLNS, __Opts,
		  {xmlel, <<"compressed">>, _attrs, _els}) ->
    {compressed}.

encode_compressed({compressed}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/compress">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"compressed">>, _attrs, _els}.

decode_compress(__TopXMLNS, __Opts,
		{xmlel, <<"compress">>, _attrs, _els}) ->
    Methods = decode_compress_els(__TopXMLNS, __Opts, _els,
				  []),
    {compress, Methods}.

decode_compress_els(__TopXMLNS, __Opts, [], Methods) ->
    lists:reverse(Methods);
decode_compress_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"method">>, _attrs, _} = _el | _els],
		    Methods) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/compress">> ->
	  decode_compress_els(__TopXMLNS, __Opts, _els,
			      [decode_compress_method(<<"http://jabber.org/protocol/compress">>,
						      __Opts, _el)
			       | Methods]);
      _ ->
	  decode_compress_els(__TopXMLNS, __Opts, _els, Methods)
    end;
decode_compress_els(__TopXMLNS, __Opts, [_ | _els],
		    Methods) ->
    decode_compress_els(__TopXMLNS, __Opts, _els, Methods).

encode_compress({compress, Methods}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/compress">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_compress_$methods'(Methods,
						    __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"compress">>, _attrs, _els}.

'encode_compress_$methods'([], __TopXMLNS, _acc) ->
    _acc;
'encode_compress_$methods'([Methods | _els], __TopXMLNS,
			   _acc) ->
    'encode_compress_$methods'(_els, __TopXMLNS,
			       [encode_compress_method(Methods, __TopXMLNS)
				| _acc]).

decode_compress_method(__TopXMLNS, __Opts,
		       {xmlel, <<"method">>, _attrs, _els}) ->
    Cdata = decode_compress_method_els(__TopXMLNS, __Opts,
				       _els, <<>>),
    Cdata.

decode_compress_method_els(__TopXMLNS, __Opts, [],
			   Cdata) ->
    decode_compress_method_cdata(__TopXMLNS, Cdata);
decode_compress_method_els(__TopXMLNS, __Opts,
			   [{xmlcdata, _data} | _els], Cdata) ->
    decode_compress_method_els(__TopXMLNS, __Opts, _els,
			       <<Cdata/binary, _data/binary>>);
decode_compress_method_els(__TopXMLNS, __Opts,
			   [_ | _els], Cdata) ->
    decode_compress_method_els(__TopXMLNS, __Opts, _els,
			       Cdata).

encode_compress_method(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/compress">>,
				    [], __TopXMLNS),
    _els = encode_compress_method_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"method">>, _attrs, _els}.

decode_compress_method_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_compress_method_cdata(__TopXMLNS, _val) -> _val.

encode_compress_method_cdata(<<>>, _acc) -> _acc;
encode_compress_method_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_compress_failure(__TopXMLNS, __Opts,
			{xmlel, <<"failure">>, _attrs, _els}) ->
    Reason = decode_compress_failure_els(__TopXMLNS, __Opts,
					 _els, undefined),
    {compress_failure, Reason}.

decode_compress_failure_els(__TopXMLNS, __Opts, [],
			    Reason) ->
    Reason;
decode_compress_failure_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"setup-failed">>, _attrs, _} = _el
			     | _els],
			    Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/compress">> ->
	  decode_compress_failure_els(__TopXMLNS, __Opts, _els,
				      decode_compress_failure_setup_failed(<<"http://jabber.org/protocol/compress">>,
									   __Opts,
									   _el));
      _ ->
	  decode_compress_failure_els(__TopXMLNS, __Opts, _els,
				      Reason)
    end;
decode_compress_failure_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"processing-failed">>, _attrs, _} = _el
			     | _els],
			    Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/compress">> ->
	  decode_compress_failure_els(__TopXMLNS, __Opts, _els,
				      decode_compress_failure_processing_failed(<<"http://jabber.org/protocol/compress">>,
										__Opts,
										_el));
      _ ->
	  decode_compress_failure_els(__TopXMLNS, __Opts, _els,
				      Reason)
    end;
decode_compress_failure_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"unsupported-method">>, _attrs, _} = _el
			     | _els],
			    Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/compress">> ->
	  decode_compress_failure_els(__TopXMLNS, __Opts, _els,
				      decode_compress_failure_unsupported_method(<<"http://jabber.org/protocol/compress">>,
										 __Opts,
										 _el));
      _ ->
	  decode_compress_failure_els(__TopXMLNS, __Opts, _els,
				      Reason)
    end;
decode_compress_failure_els(__TopXMLNS, __Opts,
			    [_ | _els], Reason) ->
    decode_compress_failure_els(__TopXMLNS, __Opts, _els,
				Reason).

encode_compress_failure({compress_failure, Reason},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/compress">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_compress_failure_$reason'(Reason,
							__NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"failure">>, _attrs, _els}.

'encode_compress_failure_$reason'(undefined, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_compress_failure_$reason'('setup-failed' =
				      Reason,
				  __TopXMLNS, _acc) ->
    [encode_compress_failure_setup_failed(Reason,
					  __TopXMLNS)
     | _acc];
'encode_compress_failure_$reason'('processing-failed' =
				      Reason,
				  __TopXMLNS, _acc) ->
    [encode_compress_failure_processing_failed(Reason,
					       __TopXMLNS)
     | _acc];
'encode_compress_failure_$reason'('unsupported-method' =
				      Reason,
				  __TopXMLNS, _acc) ->
    [encode_compress_failure_unsupported_method(Reason,
						__TopXMLNS)
     | _acc].

decode_compress_failure_unsupported_method(__TopXMLNS,
					   __Opts,
					   {xmlel, <<"unsupported-method">>,
					    _attrs, _els}) ->
    'unsupported-method'.

encode_compress_failure_unsupported_method('unsupported-method',
					   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/compress">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-method">>, _attrs, _els}.

decode_compress_failure_processing_failed(__TopXMLNS,
					  __Opts,
					  {xmlel, <<"processing-failed">>,
					   _attrs, _els}) ->
    'processing-failed'.

encode_compress_failure_processing_failed('processing-failed',
					  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/compress">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"processing-failed">>, _attrs, _els}.

decode_compress_failure_setup_failed(__TopXMLNS, __Opts,
				     {xmlel, <<"setup-failed">>, _attrs,
				      _els}) ->
    'setup-failed'.

encode_compress_failure_setup_failed('setup-failed',
				     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/compress">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"setup-failed">>, _attrs, _els}.
