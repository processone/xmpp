%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0158).

-compile(export_all).

do_decode(<<"captcha">>, <<"urn:xmpp:captcha">>, El,
	  Opts) ->
    decode_captcha(<<"urn:xmpp:captcha">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"captcha">>, <<"urn:xmpp:captcha">>}].

do_encode({xcaptcha, _} = Captcha, TopXMLNS) ->
    encode_captcha(Captcha, TopXMLNS).

do_get_name({xcaptcha, _}) -> <<"captcha">>.

do_get_ns({xcaptcha, _}) -> <<"urn:xmpp:captcha">>.

pp(xcaptcha, 1) -> [xdata];
pp(_, _) -> no.

records() -> [{xcaptcha, 1}].

decode_captcha(__TopXMLNS, __Opts,
	       {xmlel, <<"captcha">>, _attrs, _els}) ->
    Xdata = decode_captcha_els(__TopXMLNS, __Opts, _els,
			       error),
    {xcaptcha, Xdata}.

decode_captcha_els(__TopXMLNS, __Opts, [], Xdata) ->
    case Xdata of
      error ->
	  erlang:error({xmpp_codec,
			{missing_tag, <<"x">>, __TopXMLNS}});
      {value, Xdata1} -> Xdata1
    end;
decode_captcha_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"x">>, _attrs, _} = _el | _els], Xdata) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_captcha_els(__TopXMLNS, __Opts, _els,
			     {value,
			      xep0004:decode_xdata(<<"jabber:x:data">>, __Opts,
						   _el)});
      _ -> decode_captcha_els(__TopXMLNS, __Opts, _els, Xdata)
    end;
decode_captcha_els(__TopXMLNS, __Opts, [_ | _els],
		   Xdata) ->
    decode_captcha_els(__TopXMLNS, __Opts, _els, Xdata).

encode_captcha({xcaptcha, Xdata}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:captcha">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_captcha_$xdata'(Xdata,
						 __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"captcha">>, _attrs, _els}.

'encode_captcha_$xdata'(Xdata, __TopXMLNS, _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].
