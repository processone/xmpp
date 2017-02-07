%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0077).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register(<<"jabber:iq:register">>, Opts, El);
do_decode(<<"key">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_key(<<"jabber:iq:register">>, Opts, El);
do_decode(<<"text">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_text(<<"jabber:iq:register">>, Opts,
			 El);
do_decode(<<"misc">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_misc(<<"jabber:iq:register">>, Opts,
			 El);
do_decode(<<"date">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_date(<<"jabber:iq:register">>, Opts,
			 El);
do_decode(<<"url">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_url(<<"jabber:iq:register">>, Opts, El);
do_decode(<<"phone">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_phone(<<"jabber:iq:register">>, Opts,
			  El);
do_decode(<<"zip">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_zip(<<"jabber:iq:register">>, Opts, El);
do_decode(<<"state">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_state(<<"jabber:iq:register">>, Opts,
			  El);
do_decode(<<"city">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_city(<<"jabber:iq:register">>, Opts,
			 El);
do_decode(<<"address">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_address(<<"jabber:iq:register">>, Opts,
			    El);
do_decode(<<"email">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_email(<<"jabber:iq:register">>, Opts,
			  El);
do_decode(<<"last">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_last(<<"jabber:iq:register">>, Opts,
			 El);
do_decode(<<"first">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_first(<<"jabber:iq:register">>, Opts,
			  El);
do_decode(<<"name">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_name(<<"jabber:iq:register">>, Opts,
			 El);
do_decode(<<"password">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_password(<<"jabber:iq:register">>, Opts,
			     El);
do_decode(<<"nick">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_nick(<<"jabber:iq:register">>, Opts,
			 El);
do_decode(<<"username">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_username(<<"jabber:iq:register">>, Opts,
			     El);
do_decode(<<"instructions">>, <<"jabber:iq:register">>,
	  El, Opts) ->
    decode_register_instructions(<<"jabber:iq:register">>,
				 Opts, El);
do_decode(<<"remove">>, <<"jabber:iq:register">>, El,
	  Opts) ->
    decode_register_remove(<<"jabber:iq:register">>, Opts,
			   El);
do_decode(<<"registered">>, <<"jabber:iq:register">>,
	  El, Opts) ->
    decode_register_registered(<<"jabber:iq:register">>,
			       Opts, El);
do_decode(<<"register">>,
	  <<"http://jabber.org/features/iq-register">>, El,
	  Opts) ->
    decode_feature_register(<<"http://jabber.org/features/iq-register">>,
			    Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:iq:register">>},
     {<<"key">>, <<"jabber:iq:register">>},
     {<<"text">>, <<"jabber:iq:register">>},
     {<<"misc">>, <<"jabber:iq:register">>},
     {<<"date">>, <<"jabber:iq:register">>},
     {<<"url">>, <<"jabber:iq:register">>},
     {<<"phone">>, <<"jabber:iq:register">>},
     {<<"zip">>, <<"jabber:iq:register">>},
     {<<"state">>, <<"jabber:iq:register">>},
     {<<"city">>, <<"jabber:iq:register">>},
     {<<"address">>, <<"jabber:iq:register">>},
     {<<"email">>, <<"jabber:iq:register">>},
     {<<"last">>, <<"jabber:iq:register">>},
     {<<"first">>, <<"jabber:iq:register">>},
     {<<"name">>, <<"jabber:iq:register">>},
     {<<"password">>, <<"jabber:iq:register">>},
     {<<"nick">>, <<"jabber:iq:register">>},
     {<<"username">>, <<"jabber:iq:register">>},
     {<<"instructions">>, <<"jabber:iq:register">>},
     {<<"remove">>, <<"jabber:iq:register">>},
     {<<"registered">>, <<"jabber:iq:register">>},
     {<<"register">>,
      <<"http://jabber.org/features/iq-register">>}].

do_encode({feature_register} = Register, TopXMLNS) ->
    encode_feature_register(Register, TopXMLNS);
do_encode({register, _, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _, _, _, _, _, _, _, _} =
	      Query,
	  TopXMLNS) ->
    encode_register(Query, TopXMLNS).

do_get_name({feature_register}) -> <<"register">>;
do_get_name({register, _, _, _, _, _, _, _, _, _, _, _,
	     _, _, _, _, _, _, _, _, _, _, _}) ->
    <<"query">>.

do_get_ns({feature_register}) ->
    <<"http://jabber.org/features/iq-register">>;
do_get_ns({register, _, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _, _, _, _, _, _, _, _}) ->
    <<"jabber:iq:register">>.

pp(feature_register, 0) -> [];
pp(register, 22) ->
    [registered, remove, instructions, username, nick,
     password, name, first, last, email, address, city,
     state, zip, phone, url, date, misc, text, key, xdata,
     sub_els];
pp(_, _) -> no.

records() -> [{feature_register, 0}, {register, 22}].

decode_register(__TopXMLNS, __Opts,
		{xmlel, <<"query">>, _attrs, _els}) ->
    {Zip, Xdata, Misc, Address, Instructions, Text, Last,
     First, Password, Registered, Date, Phone, State, Name,
     Username, Remove, Key, City, Nick, Url, Email, __Els} =
	decode_register_els(__TopXMLNS, __Opts, _els, undefined,
			    undefined, undefined, undefined, undefined,
			    undefined, undefined, undefined, undefined, false,
			    undefined, undefined, undefined, undefined,
			    undefined, false, undefined, undefined, undefined,
			    undefined, undefined, []),
    {register, Registered, Remove, Instructions, Username,
     Nick, Password, Name, First, Last, Email, Address, City,
     State, Zip, Phone, Url, Date, Misc, Text, Key, Xdata,
     __Els}.

decode_register_els(__TopXMLNS, __Opts, [], Zip, Xdata,
		    Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    {Zip, Xdata, Misc, Address, Instructions, Text, Last,
     First, Password, Registered, Date, Phone, State, Name,
     Username, Remove, Key, City, Nick, Url, Email,
     lists:reverse(__Els)};
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"x">>, _attrs, _} = _el | _els], Zip, Xdata,
		    Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      xep0004:decode_xdata(<<"jabber:x:data">>, __Opts,
						   _el),
			      Misc, Address, Instructions, Text, Last, First,
			      Password, Registered, Date, Phone, State, Name,
			      Username, Remove, Key, City, Nick, Url, Email,
			      __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"registered">>, _attrs, _} = _el | _els],
		    Zip, Xdata, Misc, Address, Instructions, Text, Last,
		    First, Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password,
			      decode_register_registered(<<"jabber:iq:register">>,
							 __Opts, _el),
			      Date, Phone, State, Name, Username, Remove, Key,
			      City, Nick, Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"remove">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username,
			      decode_register_remove(<<"jabber:iq:register">>,
						     __Opts, _el),
			      Key, City, Nick, Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"instructions">>, _attrs, _} = _el | _els],
		    Zip, Xdata, Misc, Address, Instructions, Text, Last,
		    First, Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address,
			      decode_register_instructions(<<"jabber:iq:register">>,
							   __Opts, _el),
			      Text, Last, First, Password, Registered, Date,
			      Phone, State, Name, Username, Remove, Key, City,
			      Nick, Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"username">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name,
			      decode_register_username(<<"jabber:iq:register">>,
						       __Opts, _el),
			      Remove, Key, City, Nick, Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"nick">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City,
			      decode_register_nick(<<"jabber:iq:register">>,
						   __Opts, _el),
			      Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"password">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First,
			      decode_register_password(<<"jabber:iq:register">>,
						       __Opts, _el),
			      Registered, Date, Phone, State, Name, Username,
			      Remove, Key, City, Nick, Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"name">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      decode_register_name(<<"jabber:iq:register">>,
						   __Opts, _el),
			      Username, Remove, Key, City, Nick, Url, Email,
			      __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"first">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      decode_register_first(<<"jabber:iq:register">>,
						    __Opts, _el),
			      Password, Registered, Date, Phone, State, Name,
			      Username, Remove, Key, City, Nick, Url, Email,
			      __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"last">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text,
			      decode_register_last(<<"jabber:iq:register">>,
						   __Opts, _el),
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"email">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      decode_register_email(<<"jabber:iq:register">>,
						    __Opts, _el),
			      __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"address">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc,
			      decode_register_address(<<"jabber:iq:register">>,
						      __Opts, _el),
			      Instructions, Text, Last, First, Password,
			      Registered, Date, Phone, State, Name, Username,
			      Remove, Key, City, Nick, Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"city">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key,
			      decode_register_city(<<"jabber:iq:register">>,
						   __Opts, _el),
			      Nick, Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"state">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone,
			      decode_register_state(<<"jabber:iq:register">>,
						    __Opts, _el),
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"zip">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els,
			      decode_register_zip(<<"jabber:iq:register">>,
						  __Opts, _el),
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"phone">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date,
			      decode_register_phone(<<"jabber:iq:register">>,
						    __Opts, _el),
			      State, Name, Username, Remove, Key, City, Nick,
			      Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"url">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick,
			      decode_register_url(<<"jabber:iq:register">>,
						  __Opts, _el),
			      Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"date">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered,
			      decode_register_date(<<"jabber:iq:register">>,
						   __Opts, _el),
			      Phone, State, Name, Username, Remove, Key, City,
			      Nick, Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"misc">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata,
			      decode_register_misc(<<"jabber:iq:register">>,
						   __Opts, _el),
			      Address, Instructions, Text, Last, First,
			      Password, Registered, Date, Phone, State, Name,
			      Username, Remove, Key, City, Nick, Url, Email,
			      __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"text">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions,
			      decode_register_text(<<"jabber:iq:register">>,
						   __Opts, _el),
			      Last, First, Password, Registered, Date, Phone,
			      State, Name, Username, Remove, Key, City, Nick,
			      Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"key">>, _attrs, _} = _el | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:register">> ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove,
			      decode_register_key(<<"jabber:iq:register">>,
						  __Opts, _el),
			      City, Nick, Url, Email, __Els);
      _ ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, __Els)
    end;
decode_register_els(__TopXMLNS, __Opts,
		    [{xmlel, _name, _attrs, _} = _el | _els], Zip, Xdata,
		    Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			      Xdata, Misc, Address, Instructions, Text, Last,
			      First, Password, Registered, Date, Phone, State,
			      Name, Username, Remove, Key, City, Nick, Url,
			      Email, [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_register_els(__TopXMLNS, __Opts, _els, Zip,
				    Xdata, Misc, Address, Instructions, Text,
				    Last, First, Password, Registered, Date,
				    Phone, State, Name, Username, Remove, Key,
				    City, Nick, Url, Email, __Els);
	    Mod ->
		decode_register_els(__TopXMLNS, __Opts, _els, Zip,
				    Xdata, Misc, Address, Instructions, Text,
				    Last, First, Password, Registered, Date,
				    Phone, State, Name, Username, Remove, Key,
				    City, Nick, Url, Email,
				    [Mod:do_decode(_name, __XMLNS, _el, __Opts)
				     | __Els])
	  end
    end;
decode_register_els(__TopXMLNS, __Opts, [_ | _els], Zip,
		    Xdata, Misc, Address, Instructions, Text, Last, First,
		    Password, Registered, Date, Phone, State, Name,
		    Username, Remove, Key, City, Nick, Url, Email, __Els) ->
    decode_register_els(__TopXMLNS, __Opts, _els, Zip,
			Xdata, Misc, Address, Instructions, Text, Last, First,
			Password, Registered, Date, Phone, State, Name,
			Username, Remove, Key, City, Nick, Url, Email, __Els).

encode_register({register, Registered, Remove,
		 Instructions, Username, Nick, Password, Name, First,
		 Last, Email, Address, City, State, Zip, Phone, Url,
		 Date, Misc, Text, Key, Xdata, __Els},
		__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els]
	     ++
	     lists:reverse('encode_register_$zip'(Zip, __NewTopXMLNS,
						  'encode_register_$xdata'(Xdata,
									   __NewTopXMLNS,
									   'encode_register_$misc'(Misc,
												   __NewTopXMLNS,
												   'encode_register_$address'(Address,
															      __NewTopXMLNS,
															      'encode_register_$instructions'(Instructions,
																			      __NewTopXMLNS,
																			      'encode_register_$text'(Text,
																						      __NewTopXMLNS,
																						      'encode_register_$last'(Last,
																									      __NewTopXMLNS,
																									      'encode_register_$first'(First,
																												       __NewTopXMLNS,
																												       'encode_register_$password'(Password,
																																   __NewTopXMLNS,
																																   'encode_register_$registered'(Registered,
																																				 __NewTopXMLNS,
																																				 'encode_register_$date'(Date,
																																							 __NewTopXMLNS,
																																							 'encode_register_$phone'(Phone,
																																										  __NewTopXMLNS,
																																										  'encode_register_$state'(State,
																																													   __NewTopXMLNS,
																																													   'encode_register_$name'(Name,
																																																   __NewTopXMLNS,
																																																   'encode_register_$username'(Username,
																																																			       __NewTopXMLNS,
																																																			       'encode_register_$remove'(Remove,
																																																							 __NewTopXMLNS,
																																																							 'encode_register_$key'(Key,
																																																										__NewTopXMLNS,
																																																										'encode_register_$city'(City,
																																																													__NewTopXMLNS,
																																																													'encode_register_$nick'(Nick,
																																																																__NewTopXMLNS,
																																																																'encode_register_$url'(Url,
																																																																		       __NewTopXMLNS,
																																																																		       'encode_register_$email'(Email,
																																																																						__NewTopXMLNS,
																																																																						[])))))))))))))))))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_register_$zip'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$zip'(Zip, __TopXMLNS, _acc) ->
    [encode_register_zip(Zip, __TopXMLNS) | _acc].

'encode_register_$xdata'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$xdata'(Xdata, __TopXMLNS, _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

'encode_register_$misc'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$misc'(Misc, __TopXMLNS, _acc) ->
    [encode_register_misc(Misc, __TopXMLNS) | _acc].

'encode_register_$address'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_register_$address'(Address, __TopXMLNS, _acc) ->
    [encode_register_address(Address, __TopXMLNS) | _acc].

'encode_register_$instructions'(undefined, __TopXMLNS,
				_acc) ->
    _acc;
'encode_register_$instructions'(Instructions,
				__TopXMLNS, _acc) ->
    [encode_register_instructions(Instructions, __TopXMLNS)
     | _acc].

'encode_register_$text'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$text'(Text, __TopXMLNS, _acc) ->
    [encode_register_text(Text, __TopXMLNS) | _acc].

'encode_register_$last'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$last'(Last, __TopXMLNS, _acc) ->
    [encode_register_last(Last, __TopXMLNS) | _acc].

'encode_register_$first'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$first'(First, __TopXMLNS, _acc) ->
    [encode_register_first(First, __TopXMLNS) | _acc].

'encode_register_$password'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_register_$password'(Password, __TopXMLNS,
			    _acc) ->
    [encode_register_password(Password, __TopXMLNS) | _acc].

'encode_register_$registered'(false, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_register_$registered'(Registered, __TopXMLNS,
			      _acc) ->
    [encode_register_registered(Registered, __TopXMLNS)
     | _acc].

'encode_register_$date'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$date'(Date, __TopXMLNS, _acc) ->
    [encode_register_date(Date, __TopXMLNS) | _acc].

'encode_register_$phone'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$phone'(Phone, __TopXMLNS, _acc) ->
    [encode_register_phone(Phone, __TopXMLNS) | _acc].

'encode_register_$state'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$state'(State, __TopXMLNS, _acc) ->
    [encode_register_state(State, __TopXMLNS) | _acc].

'encode_register_$name'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$name'(Name, __TopXMLNS, _acc) ->
    [encode_register_name(Name, __TopXMLNS) | _acc].

'encode_register_$username'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_register_$username'(Username, __TopXMLNS,
			    _acc) ->
    [encode_register_username(Username, __TopXMLNS) | _acc].

'encode_register_$remove'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$remove'(Remove, __TopXMLNS, _acc) ->
    [encode_register_remove(Remove, __TopXMLNS) | _acc].

'encode_register_$key'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$key'(Key, __TopXMLNS, _acc) ->
    [encode_register_key(Key, __TopXMLNS) | _acc].

'encode_register_$city'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$city'(City, __TopXMLNS, _acc) ->
    [encode_register_city(City, __TopXMLNS) | _acc].

'encode_register_$nick'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$nick'(Nick, __TopXMLNS, _acc) ->
    [encode_register_nick(Nick, __TopXMLNS) | _acc].

'encode_register_$url'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$url'(Url, __TopXMLNS, _acc) ->
    [encode_register_url(Url, __TopXMLNS) | _acc].

'encode_register_$email'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_register_$email'(Email, __TopXMLNS, _acc) ->
    [encode_register_email(Email, __TopXMLNS) | _acc].

decode_register_key(__TopXMLNS, __Opts,
		    {xmlel, <<"key">>, _attrs, _els}) ->
    Cdata = decode_register_key_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_register_key_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_register_key_cdata(__TopXMLNS, Cdata);
decode_register_key_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_register_key_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_register_key_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_register_key_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_register_key(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_key_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"key">>, _attrs, _els}.

decode_register_key_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_key_cdata(__TopXMLNS, _val) -> _val.

encode_register_key_cdata(<<>>, _acc) -> _acc;
encode_register_key_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_text(__TopXMLNS, __Opts,
		     {xmlel, <<"text">>, _attrs, _els}) ->
    Cdata = decode_register_text_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_register_text_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_register_text_cdata(__TopXMLNS, Cdata);
decode_register_text_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_text_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_register_text_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_register_text_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_register_text(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_text_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"text">>, _attrs, _els}.

decode_register_text_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_text_cdata(__TopXMLNS, _val) -> _val.

encode_register_text_cdata(<<>>, _acc) -> _acc;
encode_register_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_misc(__TopXMLNS, __Opts,
		     {xmlel, <<"misc">>, _attrs, _els}) ->
    Cdata = decode_register_misc_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_register_misc_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_register_misc_cdata(__TopXMLNS, Cdata);
decode_register_misc_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_misc_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_register_misc_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_register_misc_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_register_misc(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_misc_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"misc">>, _attrs, _els}.

decode_register_misc_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_misc_cdata(__TopXMLNS, _val) -> _val.

encode_register_misc_cdata(<<>>, _acc) -> _acc;
encode_register_misc_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_date(__TopXMLNS, __Opts,
		     {xmlel, <<"date">>, _attrs, _els}) ->
    Cdata = decode_register_date_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_register_date_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_register_date_cdata(__TopXMLNS, Cdata);
decode_register_date_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_date_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_register_date_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_register_date_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_register_date(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_date_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"date">>, _attrs, _els}.

decode_register_date_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_date_cdata(__TopXMLNS, _val) -> _val.

encode_register_date_cdata(<<>>, _acc) -> _acc;
encode_register_date_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_url(__TopXMLNS, __Opts,
		    {xmlel, <<"url">>, _attrs, _els}) ->
    Cdata = decode_register_url_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_register_url_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_register_url_cdata(__TopXMLNS, Cdata);
decode_register_url_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_register_url_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_register_url_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_register_url_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_register_url(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_url_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"url">>, _attrs, _els}.

decode_register_url_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_url_cdata(__TopXMLNS, _val) -> _val.

encode_register_url_cdata(<<>>, _acc) -> _acc;
encode_register_url_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_phone(__TopXMLNS, __Opts,
		      {xmlel, <<"phone">>, _attrs, _els}) ->
    Cdata = decode_register_phone_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_register_phone_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_register_phone_cdata(__TopXMLNS, Cdata);
decode_register_phone_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_phone_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_register_phone_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_register_phone_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_register_phone(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_phone_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"phone">>, _attrs, _els}.

decode_register_phone_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_phone_cdata(__TopXMLNS, _val) -> _val.

encode_register_phone_cdata(<<>>, _acc) -> _acc;
encode_register_phone_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_zip(__TopXMLNS, __Opts,
		    {xmlel, <<"zip">>, _attrs, _els}) ->
    Cdata = decode_register_zip_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_register_zip_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_register_zip_cdata(__TopXMLNS, Cdata);
decode_register_zip_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_register_zip_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_register_zip_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_register_zip_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_register_zip(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_zip_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"zip">>, _attrs, _els}.

decode_register_zip_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_zip_cdata(__TopXMLNS, _val) -> _val.

encode_register_zip_cdata(<<>>, _acc) -> _acc;
encode_register_zip_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_state(__TopXMLNS, __Opts,
		      {xmlel, <<"state">>, _attrs, _els}) ->
    Cdata = decode_register_state_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_register_state_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_register_state_cdata(__TopXMLNS, Cdata);
decode_register_state_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_state_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_register_state_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_register_state_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_register_state(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_state_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"state">>, _attrs, _els}.

decode_register_state_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_state_cdata(__TopXMLNS, _val) -> _val.

encode_register_state_cdata(<<>>, _acc) -> _acc;
encode_register_state_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_city(__TopXMLNS, __Opts,
		     {xmlel, <<"city">>, _attrs, _els}) ->
    Cdata = decode_register_city_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_register_city_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_register_city_cdata(__TopXMLNS, Cdata);
decode_register_city_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_city_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_register_city_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_register_city_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_register_city(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_city_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"city">>, _attrs, _els}.

decode_register_city_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_city_cdata(__TopXMLNS, _val) -> _val.

encode_register_city_cdata(<<>>, _acc) -> _acc;
encode_register_city_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_address(__TopXMLNS, __Opts,
			{xmlel, <<"address">>, _attrs, _els}) ->
    Cdata = decode_register_address_els(__TopXMLNS, __Opts,
					_els, <<>>),
    Cdata.

decode_register_address_els(__TopXMLNS, __Opts, [],
			    Cdata) ->
    decode_register_address_cdata(__TopXMLNS, Cdata);
decode_register_address_els(__TopXMLNS, __Opts,
			    [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_address_els(__TopXMLNS, __Opts, _els,
				<<Cdata/binary, _data/binary>>);
decode_register_address_els(__TopXMLNS, __Opts,
			    [_ | _els], Cdata) ->
    decode_register_address_els(__TopXMLNS, __Opts, _els,
				Cdata).

encode_register_address(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_address_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"address">>, _attrs, _els}.

decode_register_address_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_address_cdata(__TopXMLNS, _val) -> _val.

encode_register_address_cdata(<<>>, _acc) -> _acc;
encode_register_address_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_email(__TopXMLNS, __Opts,
		      {xmlel, <<"email">>, _attrs, _els}) ->
    Cdata = decode_register_email_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_register_email_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_register_email_cdata(__TopXMLNS, Cdata);
decode_register_email_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_email_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_register_email_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_register_email_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_register_email(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_email_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"email">>, _attrs, _els}.

decode_register_email_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_email_cdata(__TopXMLNS, _val) -> _val.

encode_register_email_cdata(<<>>, _acc) -> _acc;
encode_register_email_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_last(__TopXMLNS, __Opts,
		     {xmlel, <<"last">>, _attrs, _els}) ->
    Cdata = decode_register_last_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_register_last_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_register_last_cdata(__TopXMLNS, Cdata);
decode_register_last_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_last_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_register_last_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_register_last_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_register_last(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_last_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"last">>, _attrs, _els}.

decode_register_last_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_last_cdata(__TopXMLNS, _val) -> _val.

encode_register_last_cdata(<<>>, _acc) -> _acc;
encode_register_last_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_first(__TopXMLNS, __Opts,
		      {xmlel, <<"first">>, _attrs, _els}) ->
    Cdata = decode_register_first_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_register_first_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_register_first_cdata(__TopXMLNS, Cdata);
decode_register_first_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_first_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_register_first_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_register_first_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_register_first(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_first_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"first">>, _attrs, _els}.

decode_register_first_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_first_cdata(__TopXMLNS, _val) -> _val.

encode_register_first_cdata(<<>>, _acc) -> _acc;
encode_register_first_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_name(__TopXMLNS, __Opts,
		     {xmlel, <<"name">>, _attrs, _els}) ->
    Cdata = decode_register_name_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_register_name_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_register_name_cdata(__TopXMLNS, Cdata);
decode_register_name_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_name_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_register_name_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_register_name_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_register_name(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_name_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"name">>, _attrs, _els}.

decode_register_name_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_name_cdata(__TopXMLNS, _val) -> _val.

encode_register_name_cdata(<<>>, _acc) -> _acc;
encode_register_name_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_password(__TopXMLNS, __Opts,
			 {xmlel, <<"password">>, _attrs, _els}) ->
    Cdata = decode_register_password_els(__TopXMLNS, __Opts,
					 _els, <<>>),
    Cdata.

decode_register_password_els(__TopXMLNS, __Opts, [],
			     Cdata) ->
    decode_register_password_cdata(__TopXMLNS, Cdata);
decode_register_password_els(__TopXMLNS, __Opts,
			     [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_password_els(__TopXMLNS, __Opts, _els,
				 <<Cdata/binary, _data/binary>>);
decode_register_password_els(__TopXMLNS, __Opts,
			     [_ | _els], Cdata) ->
    decode_register_password_els(__TopXMLNS, __Opts, _els,
				 Cdata).

encode_register_password(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_password_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"password">>, _attrs, _els}.

decode_register_password_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_register_password_cdata(__TopXMLNS, _val) ->
    _val.

encode_register_password_cdata(<<>>, _acc) -> _acc;
encode_register_password_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_nick(__TopXMLNS, __Opts,
		     {xmlel, <<"nick">>, _attrs, _els}) ->
    Cdata = decode_register_nick_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_register_nick_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_register_nick_cdata(__TopXMLNS, Cdata);
decode_register_nick_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_nick_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_register_nick_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_register_nick_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_register_nick(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_nick_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"nick">>, _attrs, _els}.

decode_register_nick_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_register_nick_cdata(__TopXMLNS, _val) -> _val.

encode_register_nick_cdata(<<>>, _acc) -> _acc;
encode_register_nick_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_username(__TopXMLNS, __Opts,
			 {xmlel, <<"username">>, _attrs, _els}) ->
    Cdata = decode_register_username_els(__TopXMLNS, __Opts,
					 _els, <<>>),
    Cdata.

decode_register_username_els(__TopXMLNS, __Opts, [],
			     Cdata) ->
    decode_register_username_cdata(__TopXMLNS, Cdata);
decode_register_username_els(__TopXMLNS, __Opts,
			     [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_username_els(__TopXMLNS, __Opts, _els,
				 <<Cdata/binary, _data/binary>>);
decode_register_username_els(__TopXMLNS, __Opts,
			     [_ | _els], Cdata) ->
    decode_register_username_els(__TopXMLNS, __Opts, _els,
				 Cdata).

encode_register_username(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_username_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"username">>, _attrs, _els}.

decode_register_username_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_register_username_cdata(__TopXMLNS, _val) ->
    _val.

encode_register_username_cdata(<<>>, _acc) -> _acc;
encode_register_username_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_instructions(__TopXMLNS, __Opts,
			     {xmlel, <<"instructions">>, _attrs, _els}) ->
    Cdata = decode_register_instructions_els(__TopXMLNS,
					     __Opts, _els, <<>>),
    Cdata.

decode_register_instructions_els(__TopXMLNS, __Opts, [],
				 Cdata) ->
    decode_register_instructions_cdata(__TopXMLNS, Cdata);
decode_register_instructions_els(__TopXMLNS, __Opts,
				 [{xmlcdata, _data} | _els], Cdata) ->
    decode_register_instructions_els(__TopXMLNS, __Opts,
				     _els, <<Cdata/binary, _data/binary>>);
decode_register_instructions_els(__TopXMLNS, __Opts,
				 [_ | _els], Cdata) ->
    decode_register_instructions_els(__TopXMLNS, __Opts,
				     _els, Cdata).

encode_register_instructions(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = encode_register_instructions_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"instructions">>, _attrs, _els}.

decode_register_instructions_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_register_instructions_cdata(__TopXMLNS, _val) ->
    _val.

encode_register_instructions_cdata(<<>>, _acc) -> _acc;
encode_register_instructions_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_register_remove(__TopXMLNS, __Opts,
		       {xmlel, <<"remove">>, _attrs, _els}) ->
    true.

encode_register_remove(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"remove">>, _attrs, _els}.

decode_register_registered(__TopXMLNS, __Opts,
			   {xmlel, <<"registered">>, _attrs, _els}) ->
    true.

encode_register_registered(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:register">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"registered">>, _attrs, _els}.

decode_feature_register(__TopXMLNS, __Opts,
			{xmlel, <<"register">>, _attrs, _els}) ->
    {feature_register}.

encode_feature_register({feature_register},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/features/iq-register">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"register">>, _attrs, _els}.
