%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0054).

-compile(export_all).

do_decode(<<"vCard">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_temp(<<"vcard-temp">>, Opts, El);
do_decode(<<"CLASS">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_CLASS(<<"vcard-temp">>, Opts, El);
do_decode(<<"CATEGORIES">>, <<"vcard-temp">>, El,
	  Opts) ->
    decode_vcard_CATEGORIES(<<"vcard-temp">>, Opts, El);
do_decode(<<"KEY">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_KEY(<<"vcard-temp">>, Opts, El);
do_decode(<<"SOUND">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_SOUND(<<"vcard-temp">>, Opts, El);
do_decode(<<"ORG">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_ORG(<<"vcard-temp">>, Opts, El);
do_decode(<<"PHOTO">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PHOTO(<<"vcard-temp">>, Opts, El);
do_decode(<<"LOGO">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_LOGO(<<"vcard-temp">>, Opts, El);
do_decode(<<"BINVAL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_BINVAL(<<"vcard-temp">>, Opts, El);
do_decode(<<"GEO">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_GEO(<<"vcard-temp">>, Opts, El);
do_decode(<<"EMAIL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_EMAIL(<<"vcard-temp">>, Opts, El);
do_decode(<<"TEL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_TEL(<<"vcard-temp">>, Opts, El);
do_decode(<<"LABEL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_LABEL(<<"vcard-temp">>, Opts, El);
do_decode(<<"ADR">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_ADR(<<"vcard-temp">>, Opts, El);
do_decode(<<"N">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_N(<<"vcard-temp">>, Opts, El);
do_decode(<<"CONFIDENTIAL">>, <<"vcard-temp">>, El,
	  Opts) ->
    decode_vcard_CONFIDENTIAL(<<"vcard-temp">>, Opts, El);
do_decode(<<"PRIVATE">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PRIVATE(<<"vcard-temp">>, Opts, El);
do_decode(<<"PUBLIC">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PUBLIC(<<"vcard-temp">>, Opts, El);
do_decode(<<"EXTVAL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_EXTVAL(<<"vcard-temp">>, Opts, El);
do_decode(<<"TYPE">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_TYPE(<<"vcard-temp">>, Opts, El);
do_decode(<<"DESC">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_DESC(<<"vcard-temp">>, Opts, El);
do_decode(<<"URL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_URL(<<"vcard-temp">>, Opts, El);
do_decode(<<"UID">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_UID(<<"vcard-temp">>, Opts, El);
do_decode(<<"SORT-STRING">>, <<"vcard-temp">>, El,
	  Opts) ->
    decode_vcard_SORT_STRING(<<"vcard-temp">>, Opts, El);
do_decode(<<"REV">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_REV(<<"vcard-temp">>, Opts, El);
do_decode(<<"PRODID">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PRODID(<<"vcard-temp">>, Opts, El);
do_decode(<<"NOTE">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_NOTE(<<"vcard-temp">>, Opts, El);
do_decode(<<"KEYWORD">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_KEYWORD(<<"vcard-temp">>, Opts, El);
do_decode(<<"ROLE">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_ROLE(<<"vcard-temp">>, Opts, El);
do_decode(<<"TITLE">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_TITLE(<<"vcard-temp">>, Opts, El);
do_decode(<<"TZ">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_TZ(<<"vcard-temp">>, Opts, El);
do_decode(<<"MAILER">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_MAILER(<<"vcard-temp">>, Opts, El);
do_decode(<<"JABBERID">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_JABBERID(<<"vcard-temp">>, Opts, El);
do_decode(<<"BDAY">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_BDAY(<<"vcard-temp">>, Opts, El);
do_decode(<<"NICKNAME">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_NICKNAME(<<"vcard-temp">>, Opts, El);
do_decode(<<"FN">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_FN(<<"vcard-temp">>, Opts, El);
do_decode(<<"VERSION">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_VERSION(<<"vcard-temp">>, Opts, El);
do_decode(<<"CRED">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_CRED(<<"vcard-temp">>, Opts, El);
do_decode(<<"PHONETIC">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PHONETIC(<<"vcard-temp">>, Opts, El);
do_decode(<<"ORGUNIT">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_ORGUNIT(<<"vcard-temp">>, Opts, El);
do_decode(<<"ORGNAME">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_ORGNAME(<<"vcard-temp">>, Opts, El);
do_decode(<<"LON">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_LON(<<"vcard-temp">>, Opts, El);
do_decode(<<"LAT">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_LAT(<<"vcard-temp">>, Opts, El);
do_decode(<<"USERID">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_USERID(<<"vcard-temp">>, Opts, El);
do_decode(<<"NUMBER">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_NUMBER(<<"vcard-temp">>, Opts, El);
do_decode(<<"LINE">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_LINE(<<"vcard-temp">>, Opts, El);
do_decode(<<"CTRY">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_CTRY(<<"vcard-temp">>, Opts, El);
do_decode(<<"PCODE">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PCODE(<<"vcard-temp">>, Opts, El);
do_decode(<<"REGION">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_REGION(<<"vcard-temp">>, Opts, El);
do_decode(<<"LOCALITY">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_LOCALITY(<<"vcard-temp">>, Opts, El);
do_decode(<<"STREET">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_STREET(<<"vcard-temp">>, Opts, El);
do_decode(<<"EXTADD">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_EXTADD(<<"vcard-temp">>, Opts, El);
do_decode(<<"POBOX">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_POBOX(<<"vcard-temp">>, Opts, El);
do_decode(<<"SUFFIX">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_SUFFIX(<<"vcard-temp">>, Opts, El);
do_decode(<<"PREFIX">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PREFIX(<<"vcard-temp">>, Opts, El);
do_decode(<<"MIDDLE">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_MIDDLE(<<"vcard-temp">>, Opts, El);
do_decode(<<"GIVEN">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_GIVEN(<<"vcard-temp">>, Opts, El);
do_decode(<<"FAMILY">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_FAMILY(<<"vcard-temp">>, Opts, El);
do_decode(<<"X400">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_X400(<<"vcard-temp">>, Opts, El);
do_decode(<<"INTERNET">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_INTERNET(<<"vcard-temp">>, Opts, El);
do_decode(<<"PREF">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PREF(<<"vcard-temp">>, Opts, El);
do_decode(<<"INTL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_INTL(<<"vcard-temp">>, Opts, El);
do_decode(<<"DOM">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_DOM(<<"vcard-temp">>, Opts, El);
do_decode(<<"PARCEL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PARCEL(<<"vcard-temp">>, Opts, El);
do_decode(<<"POSTAL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_POSTAL(<<"vcard-temp">>, Opts, El);
do_decode(<<"PCS">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PCS(<<"vcard-temp">>, Opts, El);
do_decode(<<"ISDN">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_ISDN(<<"vcard-temp">>, Opts, El);
do_decode(<<"MODEM">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_MODEM(<<"vcard-temp">>, Opts, El);
do_decode(<<"BBS">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_BBS(<<"vcard-temp">>, Opts, El);
do_decode(<<"VIDEO">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_VIDEO(<<"vcard-temp">>, Opts, El);
do_decode(<<"CELL">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_CELL(<<"vcard-temp">>, Opts, El);
do_decode(<<"MSG">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_MSG(<<"vcard-temp">>, Opts, El);
do_decode(<<"PAGER">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_PAGER(<<"vcard-temp">>, Opts, El);
do_decode(<<"FAX">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_FAX(<<"vcard-temp">>, Opts, El);
do_decode(<<"VOICE">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_VOICE(<<"vcard-temp">>, Opts, El);
do_decode(<<"WORK">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_WORK(<<"vcard-temp">>, Opts, El);
do_decode(<<"HOME">>, <<"vcard-temp">>, El, Opts) ->
    decode_vcard_HOME(<<"vcard-temp">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"vCard">>, <<"vcard-temp">>},
     {<<"CLASS">>, <<"vcard-temp">>},
     {<<"CATEGORIES">>, <<"vcard-temp">>},
     {<<"KEY">>, <<"vcard-temp">>},
     {<<"SOUND">>, <<"vcard-temp">>},
     {<<"ORG">>, <<"vcard-temp">>},
     {<<"PHOTO">>, <<"vcard-temp">>},
     {<<"LOGO">>, <<"vcard-temp">>},
     {<<"BINVAL">>, <<"vcard-temp">>},
     {<<"GEO">>, <<"vcard-temp">>},
     {<<"EMAIL">>, <<"vcard-temp">>},
     {<<"TEL">>, <<"vcard-temp">>},
     {<<"LABEL">>, <<"vcard-temp">>},
     {<<"ADR">>, <<"vcard-temp">>},
     {<<"N">>, <<"vcard-temp">>},
     {<<"CONFIDENTIAL">>, <<"vcard-temp">>},
     {<<"PRIVATE">>, <<"vcard-temp">>},
     {<<"PUBLIC">>, <<"vcard-temp">>},
     {<<"EXTVAL">>, <<"vcard-temp">>},
     {<<"TYPE">>, <<"vcard-temp">>},
     {<<"DESC">>, <<"vcard-temp">>},
     {<<"URL">>, <<"vcard-temp">>},
     {<<"UID">>, <<"vcard-temp">>},
     {<<"SORT-STRING">>, <<"vcard-temp">>},
     {<<"REV">>, <<"vcard-temp">>},
     {<<"PRODID">>, <<"vcard-temp">>},
     {<<"NOTE">>, <<"vcard-temp">>},
     {<<"KEYWORD">>, <<"vcard-temp">>},
     {<<"ROLE">>, <<"vcard-temp">>},
     {<<"TITLE">>, <<"vcard-temp">>},
     {<<"TZ">>, <<"vcard-temp">>},
     {<<"MAILER">>, <<"vcard-temp">>},
     {<<"JABBERID">>, <<"vcard-temp">>},
     {<<"BDAY">>, <<"vcard-temp">>},
     {<<"NICKNAME">>, <<"vcard-temp">>},
     {<<"FN">>, <<"vcard-temp">>},
     {<<"VERSION">>, <<"vcard-temp">>},
     {<<"CRED">>, <<"vcard-temp">>},
     {<<"PHONETIC">>, <<"vcard-temp">>},
     {<<"ORGUNIT">>, <<"vcard-temp">>},
     {<<"ORGNAME">>, <<"vcard-temp">>},
     {<<"LON">>, <<"vcard-temp">>},
     {<<"LAT">>, <<"vcard-temp">>},
     {<<"USERID">>, <<"vcard-temp">>},
     {<<"NUMBER">>, <<"vcard-temp">>},
     {<<"LINE">>, <<"vcard-temp">>},
     {<<"CTRY">>, <<"vcard-temp">>},
     {<<"PCODE">>, <<"vcard-temp">>},
     {<<"REGION">>, <<"vcard-temp">>},
     {<<"LOCALITY">>, <<"vcard-temp">>},
     {<<"STREET">>, <<"vcard-temp">>},
     {<<"EXTADD">>, <<"vcard-temp">>},
     {<<"POBOX">>, <<"vcard-temp">>},
     {<<"SUFFIX">>, <<"vcard-temp">>},
     {<<"PREFIX">>, <<"vcard-temp">>},
     {<<"MIDDLE">>, <<"vcard-temp">>},
     {<<"GIVEN">>, <<"vcard-temp">>},
     {<<"FAMILY">>, <<"vcard-temp">>},
     {<<"X400">>, <<"vcard-temp">>},
     {<<"INTERNET">>, <<"vcard-temp">>},
     {<<"PREF">>, <<"vcard-temp">>},
     {<<"INTL">>, <<"vcard-temp">>},
     {<<"DOM">>, <<"vcard-temp">>},
     {<<"PARCEL">>, <<"vcard-temp">>},
     {<<"POSTAL">>, <<"vcard-temp">>},
     {<<"PCS">>, <<"vcard-temp">>},
     {<<"ISDN">>, <<"vcard-temp">>},
     {<<"MODEM">>, <<"vcard-temp">>},
     {<<"BBS">>, <<"vcard-temp">>},
     {<<"VIDEO">>, <<"vcard-temp">>},
     {<<"CELL">>, <<"vcard-temp">>},
     {<<"MSG">>, <<"vcard-temp">>},
     {<<"PAGER">>, <<"vcard-temp">>},
     {<<"FAX">>, <<"vcard-temp">>},
     {<<"VOICE">>, <<"vcard-temp">>},
     {<<"WORK">>, <<"vcard-temp">>},
     {<<"HOME">>, <<"vcard-temp">>}].

do_encode({vcard_name, _, _, _, _, _} = N, TopXMLNS) ->
    encode_vcard_N(N, TopXMLNS);
do_encode({vcard_adr, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _} =
	      Adr,
	  TopXMLNS) ->
    encode_vcard_ADR(Adr, TopXMLNS);
do_encode({vcard_label, _, _, _, _, _, _, _, _} = Label,
	  TopXMLNS) ->
    encode_vcard_LABEL(Label, TopXMLNS);
do_encode({vcard_tel, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _} =
	      Tel,
	  TopXMLNS) ->
    encode_vcard_TEL(Tel, TopXMLNS);
do_encode({vcard_email, _, _, _, _, _, _} = Email,
	  TopXMLNS) ->
    encode_vcard_EMAIL(Email, TopXMLNS);
do_encode({vcard_geo, _, _} = Geo, TopXMLNS) ->
    encode_vcard_GEO(Geo, TopXMLNS);
do_encode({vcard_logo, _, _, _} = Logo, TopXMLNS) ->
    encode_vcard_LOGO(Logo, TopXMLNS);
do_encode({vcard_photo, _, _, _} = Photo, TopXMLNS) ->
    encode_vcard_PHOTO(Photo, TopXMLNS);
do_encode({vcard_org, _, _} = Org, TopXMLNS) ->
    encode_vcard_ORG(Org, TopXMLNS);
do_encode({vcard_sound, _, _, _} = Sound, TopXMLNS) ->
    encode_vcard_SOUND(Sound, TopXMLNS);
do_encode({vcard_key, _, _} = Key, TopXMLNS) ->
    encode_vcard_KEY(Key, TopXMLNS);
do_encode({vcard_temp, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _} =
	      Vcard,
	  TopXMLNS) ->
    encode_vcard_temp(Vcard, TopXMLNS).

do_get_name({vcard_adr, _, _, _, _, _, _, _, _, _, _, _,
	     _, _, _}) ->
    <<"ADR">>;
do_get_name({vcard_email, _, _, _, _, _, _}) ->
    <<"EMAIL">>;
do_get_name({vcard_geo, _, _}) -> <<"GEO">>;
do_get_name({vcard_key, _, _}) -> <<"KEY">>;
do_get_name({vcard_label, _, _, _, _, _, _, _, _}) ->
    <<"LABEL">>;
do_get_name({vcard_logo, _, _, _}) -> <<"LOGO">>;
do_get_name({vcard_name, _, _, _, _, _}) -> <<"N">>;
do_get_name({vcard_org, _, _}) -> <<"ORG">>;
do_get_name({vcard_photo, _, _, _}) -> <<"PHOTO">>;
do_get_name({vcard_sound, _, _, _}) -> <<"SOUND">>;
do_get_name({vcard_tel, _, _, _, _, _, _, _, _, _, _, _,
	     _, _, _}) ->
    <<"TEL">>;
do_get_name({vcard_temp, _, _, _, _, _, _, _, _, _, _,
	     _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _,
	     _}) ->
    <<"vCard">>.

do_get_ns({vcard_adr, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _}) ->
    <<"vcard-temp">>;
do_get_ns({vcard_email, _, _, _, _, _, _}) ->
    <<"vcard-temp">>;
do_get_ns({vcard_geo, _, _}) -> <<"vcard-temp">>;
do_get_ns({vcard_key, _, _}) -> <<"vcard-temp">>;
do_get_ns({vcard_label, _, _, _, _, _, _, _, _}) ->
    <<"vcard-temp">>;
do_get_ns({vcard_logo, _, _, _}) -> <<"vcard-temp">>;
do_get_ns({vcard_name, _, _, _, _, _}) ->
    <<"vcard-temp">>;
do_get_ns({vcard_org, _, _}) -> <<"vcard-temp">>;
do_get_ns({vcard_photo, _, _, _}) -> <<"vcard-temp">>;
do_get_ns({vcard_sound, _, _, _}) -> <<"vcard-temp">>;
do_get_ns({vcard_tel, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _}) ->
    <<"vcard-temp">>;
do_get_ns({vcard_temp, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _,
	   _}) ->
    <<"vcard-temp">>.

pp(vcard_name, 5) ->
    [family, given, middle, prefix, suffix];
pp(vcard_adr, 14) ->
    [home, work, postal, parcel, dom, intl, pref, pobox,
     extadd, street, locality, region, pcode, ctry];
pp(vcard_label, 8) ->
    [home, work, postal, parcel, dom, intl, pref, line];
pp(vcard_tel, 14) ->
    [home, work, voice, fax, pager, msg, cell, video, bbs,
     modem, isdn, pcs, pref, number];
pp(vcard_email, 6) ->
    [home, work, internet, pref, x400, userid];
pp(vcard_geo, 2) -> [lat, lon];
pp(vcard_logo, 3) -> [type, binval, extval];
pp(vcard_photo, 3) -> [type, binval, extval];
pp(vcard_org, 2) -> [name, units];
pp(vcard_sound, 3) -> [phonetic, binval, extval];
pp(vcard_key, 2) -> [type, cred];
pp(vcard_temp, 29) ->
    [version, fn, n, nickname, photo, bday, adr, label, tel,
     email, jabberid, mailer, tz, geo, title, role, logo,
     org, categories, note, prodid, rev, sort_string, sound,
     uid, url, class, key, desc];
pp(_, _) -> no.

records() ->
    [{vcard_name, 5}, {vcard_adr, 14}, {vcard_label, 8},
     {vcard_tel, 14}, {vcard_email, 6}, {vcard_geo, 2},
     {vcard_logo, 3}, {vcard_photo, 3}, {vcard_org, 2},
     {vcard_sound, 3}, {vcard_key, 2}, {vcard_temp, 29}].

decode_vcard_temp(__TopXMLNS, __Opts,
		  {xmlel, <<"vCard">>, _attrs, _els}) ->
    {Mailer, Adr, Class, Categories, Desc, Uid, Prodid,
     Jabberid, Sound, Note, Role, Title, Nickname, Rev,
     Sort_string, Org, Bday, Key, Tz, Url, Email, Tel, Label,
     Fn, Version, N, Photo, Logo, Geo} =
	decode_vcard_temp_els(__TopXMLNS, __Opts, _els,
			      undefined, [], undefined, [], undefined,
			      undefined, undefined, undefined, undefined,
			      undefined, undefined, undefined, undefined,
			      undefined, undefined, undefined, undefined,
			      undefined, undefined, undefined, [], [], [],
			      undefined, undefined, undefined, undefined,
			      undefined, undefined),
    {vcard_temp, Version, Fn, N, Nickname, Photo, Bday, Adr,
     Label, Tel, Email, Jabberid, Mailer, Tz, Geo, Title,
     Role, Logo, Org, Categories, Note, Prodid, Rev,
     Sort_string, Sound, Uid, Url, Class, Key, Desc}.

decode_vcard_temp_els(__TopXMLNS, __Opts, [], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    {Mailer, lists:reverse(Adr), Class, Categories, Desc,
     Uid, Prodid, Jabberid, Sound, Note, Role, Title,
     Nickname, Rev, Sort_string, Org, Bday, Key, Tz, Url,
     lists:reverse(Email), lists:reverse(Tel),
     lists:reverse(Label), Fn, Version, N, Photo, Logo, Geo};
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"N">>, _attrs, _} = _el | _els], Mailer, Adr,
		      Class, Categories, Desc, Uid, Prodid, Jabberid, Sound,
		      Note, Role, Title, Nickname, Rev, Sort_string, Org,
		      Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version, N,
		      Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version,
				decode_vcard_N(<<"vcard-temp">>, __Opts, _el),
				Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"ADR">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				[decode_vcard_ADR(<<"vcard-temp">>, __Opts, _el)
				 | Adr],
				Class, Categories, Desc, Uid, Prodid, Jabberid,
				Sound, Note, Role, Title, Nickname, Rev,
				Sort_string, Org, Bday, Key, Tz, Url, Email,
				Tel, Label, Fn, Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"LABEL">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel,
				[decode_vcard_LABEL(<<"vcard-temp">>, __Opts,
						    _el)
				 | Label],
				Fn, Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"TEL">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email,
				[decode_vcard_TEL(<<"vcard-temp">>, __Opts, _el)
				 | Tel],
				Label, Fn, Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"EMAIL">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				[decode_vcard_EMAIL(<<"vcard-temp">>, __Opts,
						    _el)
				 | Email],
				Tel, Label, Fn, Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"GEO">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				decode_vcard_GEO(<<"vcard-temp">>, __Opts,
						 _el));
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"LOGO">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo,
				decode_vcard_LOGO(<<"vcard-temp">>, __Opts,
						  _el),
				Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"PHOTO">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N,
				decode_vcard_PHOTO(<<"vcard-temp">>, __Opts,
						   _el),
				Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"ORG">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string,
				decode_vcard_ORG(<<"vcard-temp">>, __Opts, _el),
				Bday, Key, Tz, Url, Email, Tel, Label, Fn,
				Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"SOUND">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid,
				decode_vcard_SOUND(<<"vcard-temp">>, __Opts,
						   _el),
				Note, Role, Title, Nickname, Rev, Sort_string,
				Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn,
				Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"KEY">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday,
				decode_vcard_KEY(<<"vcard-temp">>, __Opts, _el),
				Tz, Url, Email, Tel, Label, Fn, Version, N,
				Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"VERSION">>, _attrs, _} = _el | _els],
		      Mailer, Adr, Class, Categories, Desc, Uid, Prodid,
		      Jabberid, Sound, Note, Role, Title, Nickname, Rev,
		      Sort_string, Org, Bday, Key, Tz, Url, Email, Tel, Label,
		      Fn, Version, N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn,
				decode_vcard_VERSION(<<"vcard-temp">>, __Opts,
						     _el),
				N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"FN">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label,
				decode_vcard_FN(<<"vcard-temp">>, __Opts, _el),
				Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"NICKNAME">>, _attrs, _} = _el | _els],
		      Mailer, Adr, Class, Categories, Desc, Uid, Prodid,
		      Jabberid, Sound, Note, Role, Title, Nickname, Rev,
		      Sort_string, Org, Bday, Key, Tz, Url, Email, Tel, Label,
		      Fn, Version, N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title,
				decode_vcard_NICKNAME(<<"vcard-temp">>, __Opts,
						      _el),
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"BDAY">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org,
				decode_vcard_BDAY(<<"vcard-temp">>, __Opts,
						  _el),
				Key, Tz, Url, Email, Tel, Label, Fn, Version, N,
				Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"JABBERID">>, _attrs, _} = _el | _els],
		      Mailer, Adr, Class, Categories, Desc, Uid, Prodid,
		      Jabberid, Sound, Note, Role, Title, Nickname, Rev,
		      Sort_string, Org, Bday, Key, Tz, Url, Email, Tel, Label,
		      Fn, Version, N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				decode_vcard_JABBERID(<<"vcard-temp">>, __Opts,
						      _el),
				Sound, Note, Role, Title, Nickname, Rev,
				Sort_string, Org, Bday, Key, Tz, Url, Email,
				Tel, Label, Fn, Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"MAILER">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els,
				decode_vcard_MAILER(<<"vcard-temp">>, __Opts,
						    _el),
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"TZ">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key,
				decode_vcard_TZ(<<"vcard-temp">>, __Opts, _el),
				Url, Email, Tel, Label, Fn, Version, N, Photo,
				Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"TITLE">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role,
				decode_vcard_TITLE(<<"vcard-temp">>, __Opts,
						   _el),
				Nickname, Rev, Sort_string, Org, Bday, Key, Tz,
				Url, Email, Tel, Label, Fn, Version, N, Photo,
				Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"ROLE">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note,
				decode_vcard_ROLE(<<"vcard-temp">>, __Opts,
						  _el),
				Title, Nickname, Rev, Sort_string, Org, Bday,
				Key, Tz, Url, Email, Tel, Label, Fn, Version, N,
				Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"NOTE">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound,
				decode_vcard_NOTE(<<"vcard-temp">>, __Opts,
						  _el),
				Role, Title, Nickname, Rev, Sort_string, Org,
				Bday, Key, Tz, Url, Email, Tel, Label, Fn,
				Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"PRODID">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid,
				decode_vcard_PRODID(<<"vcard-temp">>, __Opts,
						    _el),
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"REV">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				decode_vcard_REV(<<"vcard-temp">>, __Opts, _el),
				Sort_string, Org, Bday, Key, Tz, Url, Email,
				Tel, Label, Fn, Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"SORT-STRING">>, _attrs, _} = _el | _els],
		      Mailer, Adr, Class, Categories, Desc, Uid, Prodid,
		      Jabberid, Sound, Note, Role, Title, Nickname, Rev,
		      Sort_string, Org, Bday, Key, Tz, Url, Email, Tel, Label,
		      Fn, Version, N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev,
				decode_vcard_SORT_STRING(<<"vcard-temp">>,
							 __Opts, _el),
				Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn,
				Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"UID">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc,
				decode_vcard_UID(<<"vcard-temp">>, __Opts, _el),
				Prodid, Jabberid, Sound, Note, Role, Title,
				Nickname, Rev, Sort_string, Org, Bday, Key, Tz,
				Url, Email, Tel, Label, Fn, Version, N, Photo,
				Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"URL">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz,
				decode_vcard_URL(<<"vcard-temp">>, __Opts, _el),
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"DESC">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories,
				decode_vcard_DESC(<<"vcard-temp">>, __Opts,
						  _el),
				Uid, Prodid, Jabberid, Sound, Note, Role, Title,
				Nickname, Rev, Sort_string, Org, Bday, Key, Tz,
				Url, Email, Tel, Label, Fn, Version, N, Photo,
				Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"CATEGORIES">>, _attrs, _} = _el | _els],
		      Mailer, Adr, Class, Categories, Desc, Uid, Prodid,
		      Jabberid, Sound, Note, Role, Title, Nickname, Rev,
		      Sort_string, Org, Bday, Key, Tz, Url, Email, Tel, Label,
		      Fn, Version, N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class,
				decode_vcard_CATEGORIES(<<"vcard-temp">>,
							__Opts, _el),
				Desc, Uid, Prodid, Jabberid, Sound, Note, Role,
				Title, Nickname, Rev, Sort_string, Org, Bday,
				Key, Tz, Url, Email, Tel, Label, Fn, Version, N,
				Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"CLASS">>, _attrs, _} = _el | _els], Mailer,
		      Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
		      Sound, Note, Role, Title, Nickname, Rev, Sort_string,
		      Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn, Version,
		      N, Photo, Logo, Geo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr,
				decode_vcard_CLASS(<<"vcard-temp">>, __Opts,
						   _el),
				Categories, Desc, Uid, Prodid, Jabberid, Sound,
				Note, Role, Title, Nickname, Rev, Sort_string,
				Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn,
				Version, N, Photo, Logo, Geo);
      _ ->
	  decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
				Adr, Class, Categories, Desc, Uid, Prodid,
				Jabberid, Sound, Note, Role, Title, Nickname,
				Rev, Sort_string, Org, Bday, Key, Tz, Url,
				Email, Tel, Label, Fn, Version, N, Photo, Logo,
				Geo)
    end;
decode_vcard_temp_els(__TopXMLNS, __Opts, [_ | _els],
		      Mailer, Adr, Class, Categories, Desc, Uid, Prodid,
		      Jabberid, Sound, Note, Role, Title, Nickname, Rev,
		      Sort_string, Org, Bday, Key, Tz, Url, Email, Tel, Label,
		      Fn, Version, N, Photo, Logo, Geo) ->
    decode_vcard_temp_els(__TopXMLNS, __Opts, _els, Mailer,
			  Adr, Class, Categories, Desc, Uid, Prodid, Jabberid,
			  Sound, Note, Role, Title, Nickname, Rev, Sort_string,
			  Org, Bday, Key, Tz, Url, Email, Tel, Label, Fn,
			  Version, N, Photo, Logo, Geo).

encode_vcard_temp({vcard_temp, Version, Fn, N, Nickname,
		   Photo, Bday, Adr, Label, Tel, Email, Jabberid, Mailer,
		   Tz, Geo, Title, Role, Logo, Org, Categories, Note,
		   Prodid, Rev, Sort_string, Sound, Uid, Url, Class, Key,
		   Desc},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_temp_$mailer'(Mailer,
						     __NewTopXMLNS,
						     'encode_vcard_temp_$adr'(Adr,
									      __NewTopXMLNS,
									      'encode_vcard_temp_$class'(Class,
													 __NewTopXMLNS,
													 'encode_vcard_temp_$categories'(Categories,
																	 __NewTopXMLNS,
																	 'encode_vcard_temp_$desc'(Desc,
																				   __NewTopXMLNS,
																				   'encode_vcard_temp_$uid'(Uid,
																							    __NewTopXMLNS,
																							    'encode_vcard_temp_$prodid'(Prodid,
																											__NewTopXMLNS,
																											'encode_vcard_temp_$jabberid'(Jabberid,
																														      __NewTopXMLNS,
																														      'encode_vcard_temp_$sound'(Sound,
																																		 __NewTopXMLNS,
																																		 'encode_vcard_temp_$note'(Note,
																																					   __NewTopXMLNS,
																																					   'encode_vcard_temp_$role'(Role,
																																								     __NewTopXMLNS,
																																								     'encode_vcard_temp_$title'(Title,
																																												__NewTopXMLNS,
																																												'encode_vcard_temp_$nickname'(Nickname,
																																															      __NewTopXMLNS,
																																															      'encode_vcard_temp_$rev'(Rev,
																																																		       __NewTopXMLNS,
																																																		       'encode_vcard_temp_$sort_string'(Sort_string,
																																																							__NewTopXMLNS,
																																																							'encode_vcard_temp_$org'(Org,
																																																										 __NewTopXMLNS,
																																																										 'encode_vcard_temp_$bday'(Bday,
																																																													   __NewTopXMLNS,
																																																													   'encode_vcard_temp_$key'(Key,
																																																																    __NewTopXMLNS,
																																																																    'encode_vcard_temp_$tz'(Tz,
																																																																			    __NewTopXMLNS,
																																																																			    'encode_vcard_temp_$url'(Url,
																																																																						     __NewTopXMLNS,
																																																																						     'encode_vcard_temp_$email'(Email,
																																																																										__NewTopXMLNS,
																																																																										'encode_vcard_temp_$tel'(Tel,
																																																																													 __NewTopXMLNS,
																																																																													 'encode_vcard_temp_$label'(Label,
																																																																																    __NewTopXMLNS,
																																																																																    'encode_vcard_temp_$fn'(Fn,
																																																																																			    __NewTopXMLNS,
																																																																																			    'encode_vcard_temp_$version'(Version,
																																																																																							 __NewTopXMLNS,
																																																																																							 'encode_vcard_temp_$n'(N,
																																																																																										__NewTopXMLNS,
																																																																																										'encode_vcard_temp_$photo'(Photo,
																																																																																													   __NewTopXMLNS,
																																																																																													   'encode_vcard_temp_$logo'(Logo,
																																																																																																     __NewTopXMLNS,
																																																																																																     'encode_vcard_temp_$geo'(Geo,
																																																																																																			      __NewTopXMLNS,
																																																																																																			      [])))))))))))))))))))))))))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"vCard">>, _attrs, _els}.

'encode_vcard_temp_$mailer'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_vcard_temp_$mailer'(Mailer, __TopXMLNS, _acc) ->
    [encode_vcard_MAILER(Mailer, __TopXMLNS) | _acc].

'encode_vcard_temp_$adr'([], __TopXMLNS, _acc) -> _acc;
'encode_vcard_temp_$adr'([Adr | _els], __TopXMLNS,
			 _acc) ->
    'encode_vcard_temp_$adr'(_els, __TopXMLNS,
			     [encode_vcard_ADR(Adr, __TopXMLNS) | _acc]).

'encode_vcard_temp_$class'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_vcard_temp_$class'(Class, __TopXMLNS, _acc) ->
    [encode_vcard_CLASS(Class, __TopXMLNS) | _acc].

'encode_vcard_temp_$categories'([], __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$categories'(Categories, __TopXMLNS,
				_acc) ->
    [encode_vcard_CATEGORIES(Categories, __TopXMLNS)
     | _acc].

'encode_vcard_temp_$desc'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_vcard_temp_$desc'(Desc, __TopXMLNS, _acc) ->
    [encode_vcard_DESC(Desc, __TopXMLNS) | _acc].

'encode_vcard_temp_$uid'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$uid'(Uid, __TopXMLNS, _acc) ->
    [encode_vcard_UID(Uid, __TopXMLNS) | _acc].

'encode_vcard_temp_$prodid'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_vcard_temp_$prodid'(Prodid, __TopXMLNS, _acc) ->
    [encode_vcard_PRODID(Prodid, __TopXMLNS) | _acc].

'encode_vcard_temp_$jabberid'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_vcard_temp_$jabberid'(Jabberid, __TopXMLNS,
			      _acc) ->
    [encode_vcard_JABBERID(Jabberid, __TopXMLNS) | _acc].

'encode_vcard_temp_$sound'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_vcard_temp_$sound'(Sound, __TopXMLNS, _acc) ->
    [encode_vcard_SOUND(Sound, __TopXMLNS) | _acc].

'encode_vcard_temp_$note'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_vcard_temp_$note'(Note, __TopXMLNS, _acc) ->
    [encode_vcard_NOTE(Note, __TopXMLNS) | _acc].

'encode_vcard_temp_$role'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_vcard_temp_$role'(Role, __TopXMLNS, _acc) ->
    [encode_vcard_ROLE(Role, __TopXMLNS) | _acc].

'encode_vcard_temp_$title'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_vcard_temp_$title'(Title, __TopXMLNS, _acc) ->
    [encode_vcard_TITLE(Title, __TopXMLNS) | _acc].

'encode_vcard_temp_$nickname'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_vcard_temp_$nickname'(Nickname, __TopXMLNS,
			      _acc) ->
    [encode_vcard_NICKNAME(Nickname, __TopXMLNS) | _acc].

'encode_vcard_temp_$rev'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$rev'(Rev, __TopXMLNS, _acc) ->
    [encode_vcard_REV(Rev, __TopXMLNS) | _acc].

'encode_vcard_temp_$sort_string'(undefined, __TopXMLNS,
				 _acc) ->
    _acc;
'encode_vcard_temp_$sort_string'(Sort_string,
				 __TopXMLNS, _acc) ->
    [encode_vcard_SORT_STRING(Sort_string, __TopXMLNS)
     | _acc].

'encode_vcard_temp_$org'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$org'(Org, __TopXMLNS, _acc) ->
    [encode_vcard_ORG(Org, __TopXMLNS) | _acc].

'encode_vcard_temp_$bday'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_vcard_temp_$bday'(Bday, __TopXMLNS, _acc) ->
    [encode_vcard_BDAY(Bday, __TopXMLNS) | _acc].

'encode_vcard_temp_$key'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$key'(Key, __TopXMLNS, _acc) ->
    [encode_vcard_KEY(Key, __TopXMLNS) | _acc].

'encode_vcard_temp_$tz'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$tz'(Tz, __TopXMLNS, _acc) ->
    [encode_vcard_TZ(Tz, __TopXMLNS) | _acc].

'encode_vcard_temp_$url'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$url'(Url, __TopXMLNS, _acc) ->
    [encode_vcard_URL(Url, __TopXMLNS) | _acc].

'encode_vcard_temp_$email'([], __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$email'([Email | _els], __TopXMLNS,
			   _acc) ->
    'encode_vcard_temp_$email'(_els, __TopXMLNS,
			       [encode_vcard_EMAIL(Email, __TopXMLNS) | _acc]).

'encode_vcard_temp_$tel'([], __TopXMLNS, _acc) -> _acc;
'encode_vcard_temp_$tel'([Tel | _els], __TopXMLNS,
			 _acc) ->
    'encode_vcard_temp_$tel'(_els, __TopXMLNS,
			     [encode_vcard_TEL(Tel, __TopXMLNS) | _acc]).

'encode_vcard_temp_$label'([], __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$label'([Label | _els], __TopXMLNS,
			   _acc) ->
    'encode_vcard_temp_$label'(_els, __TopXMLNS,
			       [encode_vcard_LABEL(Label, __TopXMLNS) | _acc]).

'encode_vcard_temp_$fn'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$fn'(Fn, __TopXMLNS, _acc) ->
    [encode_vcard_FN(Fn, __TopXMLNS) | _acc].

'encode_vcard_temp_$version'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_vcard_temp_$version'(Version, __TopXMLNS,
			     _acc) ->
    [encode_vcard_VERSION(Version, __TopXMLNS) | _acc].

'encode_vcard_temp_$n'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$n'(N, __TopXMLNS, _acc) ->
    [encode_vcard_N(N, __TopXMLNS) | _acc].

'encode_vcard_temp_$photo'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_vcard_temp_$photo'(Photo, __TopXMLNS, _acc) ->
    [encode_vcard_PHOTO(Photo, __TopXMLNS) | _acc].

'encode_vcard_temp_$logo'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_vcard_temp_$logo'(Logo, __TopXMLNS, _acc) ->
    [encode_vcard_LOGO(Logo, __TopXMLNS) | _acc].

'encode_vcard_temp_$geo'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_temp_$geo'(Geo, __TopXMLNS, _acc) ->
    [encode_vcard_GEO(Geo, __TopXMLNS) | _acc].

decode_vcard_CLASS(__TopXMLNS, __Opts,
		   {xmlel, <<"CLASS">>, _attrs, _els}) ->
    Class = decode_vcard_CLASS_els(__TopXMLNS, __Opts, _els,
				   undefined),
    Class.

decode_vcard_CLASS_els(__TopXMLNS, __Opts, [], Class) ->
    Class;
decode_vcard_CLASS_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"PUBLIC">>, _attrs, _} = _el | _els],
		       Class) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_CLASS_els(__TopXMLNS, __Opts, _els,
				 decode_vcard_PUBLIC(<<"vcard-temp">>, __Opts,
						     _el));
      _ ->
	  decode_vcard_CLASS_els(__TopXMLNS, __Opts, _els, Class)
    end;
decode_vcard_CLASS_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"PRIVATE">>, _attrs, _} = _el | _els],
		       Class) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_CLASS_els(__TopXMLNS, __Opts, _els,
				 decode_vcard_PRIVATE(<<"vcard-temp">>, __Opts,
						      _el));
      _ ->
	  decode_vcard_CLASS_els(__TopXMLNS, __Opts, _els, Class)
    end;
decode_vcard_CLASS_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"CONFIDENTIAL">>, _attrs, _} = _el | _els],
		       Class) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_CLASS_els(__TopXMLNS, __Opts, _els,
				 decode_vcard_CONFIDENTIAL(<<"vcard-temp">>,
							   __Opts, _el));
      _ ->
	  decode_vcard_CLASS_els(__TopXMLNS, __Opts, _els, Class)
    end;
decode_vcard_CLASS_els(__TopXMLNS, __Opts, [_ | _els],
		       Class) ->
    decode_vcard_CLASS_els(__TopXMLNS, __Opts, _els, Class).

encode_vcard_CLASS(Class, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_CLASS_$class'(Class,
						     __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"CLASS">>, _attrs, _els}.

'encode_vcard_CLASS_$class'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_vcard_CLASS_$class'(public = Class, __TopXMLNS,
			    _acc) ->
    [encode_vcard_PUBLIC(Class, __TopXMLNS) | _acc];
'encode_vcard_CLASS_$class'(private = Class, __TopXMLNS,
			    _acc) ->
    [encode_vcard_PRIVATE(Class, __TopXMLNS) | _acc];
'encode_vcard_CLASS_$class'(confidential = Class,
			    __TopXMLNS, _acc) ->
    [encode_vcard_CONFIDENTIAL(Class, __TopXMLNS) | _acc].

decode_vcard_CATEGORIES(__TopXMLNS, __Opts,
			{xmlel, <<"CATEGORIES">>, _attrs, _els}) ->
    Keywords = decode_vcard_CATEGORIES_els(__TopXMLNS,
					   __Opts, _els, []),
    Keywords.

decode_vcard_CATEGORIES_els(__TopXMLNS, __Opts, [],
			    Keywords) ->
    lists:reverse(Keywords);
decode_vcard_CATEGORIES_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"KEYWORD">>, _attrs, _} = _el | _els],
			    Keywords) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_CATEGORIES_els(__TopXMLNS, __Opts, _els,
				      [decode_vcard_KEYWORD(<<"vcard-temp">>,
							    __Opts, _el)
				       | Keywords]);
      _ ->
	  decode_vcard_CATEGORIES_els(__TopXMLNS, __Opts, _els,
				      Keywords)
    end;
decode_vcard_CATEGORIES_els(__TopXMLNS, __Opts,
			    [_ | _els], Keywords) ->
    decode_vcard_CATEGORIES_els(__TopXMLNS, __Opts, _els,
				Keywords).

encode_vcard_CATEGORIES(Keywords, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_vcard_CATEGORIES_$keywords'(Keywords,
							  __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"CATEGORIES">>, _attrs, _els}.

'encode_vcard_CATEGORIES_$keywords'([], __TopXMLNS,
				    _acc) ->
    _acc;
'encode_vcard_CATEGORIES_$keywords'([Keywords | _els],
				    __TopXMLNS, _acc) ->
    'encode_vcard_CATEGORIES_$keywords'(_els, __TopXMLNS,
					[encode_vcard_KEYWORD(Keywords,
							      __TopXMLNS)
					 | _acc]).

decode_vcard_KEY(__TopXMLNS, __Opts,
		 {xmlel, <<"KEY">>, _attrs, _els}) ->
    {Cred, Type} = decode_vcard_KEY_els(__TopXMLNS, __Opts,
					_els, undefined, undefined),
    {vcard_key, Type, Cred}.

decode_vcard_KEY_els(__TopXMLNS, __Opts, [], Cred,
		     Type) ->
    {Cred, Type};
decode_vcard_KEY_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"TYPE">>, _attrs, _} = _el | _els], Cred,
		     Type) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_KEY_els(__TopXMLNS, __Opts, _els, Cred,
			       decode_vcard_TYPE(<<"vcard-temp">>, __Opts,
						 _el));
      _ ->
	  decode_vcard_KEY_els(__TopXMLNS, __Opts, _els, Cred,
			       Type)
    end;
decode_vcard_KEY_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"CRED">>, _attrs, _} = _el | _els], Cred,
		     Type) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_KEY_els(__TopXMLNS, __Opts, _els,
			       decode_vcard_CRED(<<"vcard-temp">>, __Opts, _el),
			       Type);
      _ ->
	  decode_vcard_KEY_els(__TopXMLNS, __Opts, _els, Cred,
			       Type)
    end;
decode_vcard_KEY_els(__TopXMLNS, __Opts, [_ | _els],
		     Cred, Type) ->
    decode_vcard_KEY_els(__TopXMLNS, __Opts, _els, Cred,
			 Type).

encode_vcard_KEY({vcard_key, Type, Cred}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_KEY_$cred'(Cred,
						  __NewTopXMLNS,
						  'encode_vcard_KEY_$type'(Type,
									   __NewTopXMLNS,
									   []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"KEY">>, _attrs, _els}.

'encode_vcard_KEY_$cred'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_KEY_$cred'(Cred, __TopXMLNS, _acc) ->
    [encode_vcard_CRED(Cred, __TopXMLNS) | _acc].

'encode_vcard_KEY_$type'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_KEY_$type'(Type, __TopXMLNS, _acc) ->
    [encode_vcard_TYPE(Type, __TopXMLNS) | _acc].

decode_vcard_SOUND(__TopXMLNS, __Opts,
		   {xmlel, <<"SOUND">>, _attrs, _els}) ->
    {Phonetic, Extval, Binval} =
	decode_vcard_SOUND_els(__TopXMLNS, __Opts, _els,
			       undefined, undefined, undefined),
    {vcard_sound, Phonetic, Binval, Extval}.

decode_vcard_SOUND_els(__TopXMLNS, __Opts, [], Phonetic,
		       Extval, Binval) ->
    {Phonetic, Extval, Binval};
decode_vcard_SOUND_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"BINVAL">>, _attrs, _} = _el | _els],
		       Phonetic, Extval, Binval) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_SOUND_els(__TopXMLNS, __Opts, _els,
				 Phonetic, Extval,
				 decode_vcard_BINVAL(<<"vcard-temp">>, __Opts,
						     _el));
      _ ->
	  decode_vcard_SOUND_els(__TopXMLNS, __Opts, _els,
				 Phonetic, Extval, Binval)
    end;
decode_vcard_SOUND_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"EXTVAL">>, _attrs, _} = _el | _els],
		       Phonetic, Extval, Binval) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_SOUND_els(__TopXMLNS, __Opts, _els,
				 Phonetic,
				 decode_vcard_EXTVAL(<<"vcard-temp">>, __Opts,
						     _el),
				 Binval);
      _ ->
	  decode_vcard_SOUND_els(__TopXMLNS, __Opts, _els,
				 Phonetic, Extval, Binval)
    end;
decode_vcard_SOUND_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"PHONETIC">>, _attrs, _} = _el | _els],
		       Phonetic, Extval, Binval) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_SOUND_els(__TopXMLNS, __Opts, _els,
				 decode_vcard_PHONETIC(<<"vcard-temp">>, __Opts,
						       _el),
				 Extval, Binval);
      _ ->
	  decode_vcard_SOUND_els(__TopXMLNS, __Opts, _els,
				 Phonetic, Extval, Binval)
    end;
decode_vcard_SOUND_els(__TopXMLNS, __Opts, [_ | _els],
		       Phonetic, Extval, Binval) ->
    decode_vcard_SOUND_els(__TopXMLNS, __Opts, _els,
			   Phonetic, Extval, Binval).

encode_vcard_SOUND({vcard_sound, Phonetic, Binval,
		    Extval},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_vcard_SOUND_$phonetic'(Phonetic,
						     __NewTopXMLNS,
						     'encode_vcard_SOUND_$extval'(Extval,
										  __NewTopXMLNS,
										  'encode_vcard_SOUND_$binval'(Binval,
													       __NewTopXMLNS,
													       [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"SOUND">>, _attrs, _els}.

'encode_vcard_SOUND_$phonetic'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_vcard_SOUND_$phonetic'(Phonetic, __TopXMLNS,
			       _acc) ->
    [encode_vcard_PHONETIC(Phonetic, __TopXMLNS) | _acc].

'encode_vcard_SOUND_$extval'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_vcard_SOUND_$extval'(Extval, __TopXMLNS,
			     _acc) ->
    [encode_vcard_EXTVAL(Extval, __TopXMLNS) | _acc].

'encode_vcard_SOUND_$binval'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_vcard_SOUND_$binval'(Binval, __TopXMLNS,
			     _acc) ->
    [encode_vcard_BINVAL(Binval, __TopXMLNS) | _acc].

decode_vcard_ORG(__TopXMLNS, __Opts,
		 {xmlel, <<"ORG">>, _attrs, _els}) ->
    {Units, Name} = decode_vcard_ORG_els(__TopXMLNS, __Opts,
					 _els, [], undefined),
    {vcard_org, Name, Units}.

decode_vcard_ORG_els(__TopXMLNS, __Opts, [], Units,
		     Name) ->
    {lists:reverse(Units), Name};
decode_vcard_ORG_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"ORGNAME">>, _attrs, _} = _el | _els], Units,
		     Name) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ORG_els(__TopXMLNS, __Opts, _els, Units,
			       decode_vcard_ORGNAME(<<"vcard-temp">>, __Opts,
						    _el));
      _ ->
	  decode_vcard_ORG_els(__TopXMLNS, __Opts, _els, Units,
			       Name)
    end;
decode_vcard_ORG_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"ORGUNIT">>, _attrs, _} = _el | _els], Units,
		     Name) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ORG_els(__TopXMLNS, __Opts, _els,
			       [decode_vcard_ORGUNIT(<<"vcard-temp">>, __Opts,
						     _el)
				| Units],
			       Name);
      _ ->
	  decode_vcard_ORG_els(__TopXMLNS, __Opts, _els, Units,
			       Name)
    end;
decode_vcard_ORG_els(__TopXMLNS, __Opts, [_ | _els],
		     Units, Name) ->
    decode_vcard_ORG_els(__TopXMLNS, __Opts, _els, Units,
			 Name).

encode_vcard_ORG({vcard_org, Name, Units},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_ORG_$units'(Units,
						   __NewTopXMLNS,
						   'encode_vcard_ORG_$name'(Name,
									    __NewTopXMLNS,
									    []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ORG">>, _attrs, _els}.

'encode_vcard_ORG_$units'([], __TopXMLNS, _acc) -> _acc;
'encode_vcard_ORG_$units'([Units | _els], __TopXMLNS,
			  _acc) ->
    'encode_vcard_ORG_$units'(_els, __TopXMLNS,
			      [encode_vcard_ORGUNIT(Units, __TopXMLNS) | _acc]).

'encode_vcard_ORG_$name'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_ORG_$name'(Name, __TopXMLNS, _acc) ->
    [encode_vcard_ORGNAME(Name, __TopXMLNS) | _acc].

decode_vcard_PHOTO(__TopXMLNS, __Opts,
		   {xmlel, <<"PHOTO">>, _attrs, _els}) ->
    {Type, Extval, Binval} =
	decode_vcard_PHOTO_els(__TopXMLNS, __Opts, _els,
			       undefined, undefined, undefined),
    {vcard_photo, Type, Binval, Extval}.

decode_vcard_PHOTO_els(__TopXMLNS, __Opts, [], Type,
		       Extval, Binval) ->
    {Type, Extval, Binval};
decode_vcard_PHOTO_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"TYPE">>, _attrs, _} = _el | _els], Type,
		       Extval, Binval) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_PHOTO_els(__TopXMLNS, __Opts, _els,
				 decode_vcard_TYPE(<<"vcard-temp">>, __Opts,
						   _el),
				 Extval, Binval);
      _ ->
	  decode_vcard_PHOTO_els(__TopXMLNS, __Opts, _els, Type,
				 Extval, Binval)
    end;
decode_vcard_PHOTO_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"BINVAL">>, _attrs, _} = _el | _els], Type,
		       Extval, Binval) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_PHOTO_els(__TopXMLNS, __Opts, _els, Type,
				 Extval,
				 decode_vcard_BINVAL(<<"vcard-temp">>, __Opts,
						     _el));
      _ ->
	  decode_vcard_PHOTO_els(__TopXMLNS, __Opts, _els, Type,
				 Extval, Binval)
    end;
decode_vcard_PHOTO_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"EXTVAL">>, _attrs, _} = _el | _els], Type,
		       Extval, Binval) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_PHOTO_els(__TopXMLNS, __Opts, _els, Type,
				 decode_vcard_EXTVAL(<<"vcard-temp">>, __Opts,
						     _el),
				 Binval);
      _ ->
	  decode_vcard_PHOTO_els(__TopXMLNS, __Opts, _els, Type,
				 Extval, Binval)
    end;
decode_vcard_PHOTO_els(__TopXMLNS, __Opts, [_ | _els],
		       Type, Extval, Binval) ->
    decode_vcard_PHOTO_els(__TopXMLNS, __Opts, _els, Type,
			   Extval, Binval).

encode_vcard_PHOTO({vcard_photo, Type, Binval, Extval},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_PHOTO_$type'(Type,
						    __NewTopXMLNS,
						    'encode_vcard_PHOTO_$extval'(Extval,
										 __NewTopXMLNS,
										 'encode_vcard_PHOTO_$binval'(Binval,
													      __NewTopXMLNS,
													      [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PHOTO">>, _attrs, _els}.

'encode_vcard_PHOTO_$type'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_vcard_PHOTO_$type'(Type, __TopXMLNS, _acc) ->
    [encode_vcard_TYPE(Type, __TopXMLNS) | _acc].

'encode_vcard_PHOTO_$extval'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_vcard_PHOTO_$extval'(Extval, __TopXMLNS,
			     _acc) ->
    [encode_vcard_EXTVAL(Extval, __TopXMLNS) | _acc].

'encode_vcard_PHOTO_$binval'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_vcard_PHOTO_$binval'(Binval, __TopXMLNS,
			     _acc) ->
    [encode_vcard_BINVAL(Binval, __TopXMLNS) | _acc].

decode_vcard_LOGO(__TopXMLNS, __Opts,
		  {xmlel, <<"LOGO">>, _attrs, _els}) ->
    {Type, Extval, Binval} =
	decode_vcard_LOGO_els(__TopXMLNS, __Opts, _els,
			      undefined, undefined, undefined),
    {vcard_logo, Type, Binval, Extval}.

decode_vcard_LOGO_els(__TopXMLNS, __Opts, [], Type,
		      Extval, Binval) ->
    {Type, Extval, Binval};
decode_vcard_LOGO_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"TYPE">>, _attrs, _} = _el | _els], Type,
		      Extval, Binval) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LOGO_els(__TopXMLNS, __Opts, _els,
				decode_vcard_TYPE(<<"vcard-temp">>, __Opts,
						  _el),
				Extval, Binval);
      _ ->
	  decode_vcard_LOGO_els(__TopXMLNS, __Opts, _els, Type,
				Extval, Binval)
    end;
decode_vcard_LOGO_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"BINVAL">>, _attrs, _} = _el | _els], Type,
		      Extval, Binval) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LOGO_els(__TopXMLNS, __Opts, _els, Type,
				Extval,
				decode_vcard_BINVAL(<<"vcard-temp">>, __Opts,
						    _el));
      _ ->
	  decode_vcard_LOGO_els(__TopXMLNS, __Opts, _els, Type,
				Extval, Binval)
    end;
decode_vcard_LOGO_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"EXTVAL">>, _attrs, _} = _el | _els], Type,
		      Extval, Binval) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LOGO_els(__TopXMLNS, __Opts, _els, Type,
				decode_vcard_EXTVAL(<<"vcard-temp">>, __Opts,
						    _el),
				Binval);
      _ ->
	  decode_vcard_LOGO_els(__TopXMLNS, __Opts, _els, Type,
				Extval, Binval)
    end;
decode_vcard_LOGO_els(__TopXMLNS, __Opts, [_ | _els],
		      Type, Extval, Binval) ->
    decode_vcard_LOGO_els(__TopXMLNS, __Opts, _els, Type,
			  Extval, Binval).

encode_vcard_LOGO({vcard_logo, Type, Binval, Extval},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_LOGO_$type'(Type,
						   __NewTopXMLNS,
						   'encode_vcard_LOGO_$extval'(Extval,
									       __NewTopXMLNS,
									       'encode_vcard_LOGO_$binval'(Binval,
													   __NewTopXMLNS,
													   [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"LOGO">>, _attrs, _els}.

'encode_vcard_LOGO_$type'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_vcard_LOGO_$type'(Type, __TopXMLNS, _acc) ->
    [encode_vcard_TYPE(Type, __TopXMLNS) | _acc].

'encode_vcard_LOGO_$extval'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_vcard_LOGO_$extval'(Extval, __TopXMLNS, _acc) ->
    [encode_vcard_EXTVAL(Extval, __TopXMLNS) | _acc].

'encode_vcard_LOGO_$binval'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_vcard_LOGO_$binval'(Binval, __TopXMLNS, _acc) ->
    [encode_vcard_BINVAL(Binval, __TopXMLNS) | _acc].

decode_vcard_BINVAL(__TopXMLNS, __Opts,
		    {xmlel, <<"BINVAL">>, _attrs, _els}) ->
    Cdata = decode_vcard_BINVAL_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_BINVAL_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_BINVAL_cdata(__TopXMLNS, Cdata);
decode_vcard_BINVAL_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_BINVAL_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_BINVAL_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_BINVAL_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_BINVAL(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_BINVAL_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"BINVAL">>, _attrs, _els}.

decode_vcard_BINVAL_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_BINVAL_cdata(__TopXMLNS, _val) ->
    case catch base64:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"BINVAL">>, __TopXMLNS}});
      _res -> _res
    end.

encode_vcard_BINVAL_cdata(<<>>, _acc) -> _acc;
encode_vcard_BINVAL_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_vcard_GEO(__TopXMLNS, __Opts,
		 {xmlel, <<"GEO">>, _attrs, _els}) ->
    {Lat, Lon} = decode_vcard_GEO_els(__TopXMLNS, __Opts,
				      _els, undefined, undefined),
    {vcard_geo, Lat, Lon}.

decode_vcard_GEO_els(__TopXMLNS, __Opts, [], Lat,
		     Lon) ->
    {Lat, Lon};
decode_vcard_GEO_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"LAT">>, _attrs, _} = _el | _els], Lat,
		     Lon) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_GEO_els(__TopXMLNS, __Opts, _els,
			       decode_vcard_LAT(<<"vcard-temp">>, __Opts, _el),
			       Lon);
      _ ->
	  decode_vcard_GEO_els(__TopXMLNS, __Opts, _els, Lat, Lon)
    end;
decode_vcard_GEO_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"LON">>, _attrs, _} = _el | _els], Lat,
		     Lon) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_GEO_els(__TopXMLNS, __Opts, _els, Lat,
			       decode_vcard_LON(<<"vcard-temp">>, __Opts, _el));
      _ ->
	  decode_vcard_GEO_els(__TopXMLNS, __Opts, _els, Lat, Lon)
    end;
decode_vcard_GEO_els(__TopXMLNS, __Opts, [_ | _els],
		     Lat, Lon) ->
    decode_vcard_GEO_els(__TopXMLNS, __Opts, _els, Lat,
			 Lon).

encode_vcard_GEO({vcard_geo, Lat, Lon}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_GEO_$lat'(Lat,
						 __NewTopXMLNS,
						 'encode_vcard_GEO_$lon'(Lon,
									 __NewTopXMLNS,
									 []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"GEO">>, _attrs, _els}.

'encode_vcard_GEO_$lat'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_GEO_$lat'(Lat, __TopXMLNS, _acc) ->
    [encode_vcard_LAT(Lat, __TopXMLNS) | _acc].

'encode_vcard_GEO_$lon'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_GEO_$lon'(Lon, __TopXMLNS, _acc) ->
    [encode_vcard_LON(Lon, __TopXMLNS) | _acc].

decode_vcard_EMAIL(__TopXMLNS, __Opts,
		   {xmlel, <<"EMAIL">>, _attrs, _els}) ->
    {X400, Userid, Internet, Home, Pref, Work} =
	decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, false,
			       undefined, false, false, false, false),
    {vcard_email, Home, Work, Internet, Pref, X400, Userid}.

decode_vcard_EMAIL_els(__TopXMLNS, __Opts, [], X400,
		       Userid, Internet, Home, Pref, Work) ->
    {X400, Userid, Internet, Home, Pref, Work};
decode_vcard_EMAIL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"HOME">>, _attrs, _} = _el | _els], X400,
		       Userid, Internet, Home, Pref, Work) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid, Internet,
				 decode_vcard_HOME(<<"vcard-temp">>, __Opts,
						   _el),
				 Pref, Work);
      _ ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid, Internet, Home, Pref, Work)
    end;
decode_vcard_EMAIL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"WORK">>, _attrs, _} = _el | _els], X400,
		       Userid, Internet, Home, Pref, Work) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid, Internet, Home, Pref,
				 decode_vcard_WORK(<<"vcard-temp">>, __Opts,
						   _el));
      _ ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid, Internet, Home, Pref, Work)
    end;
decode_vcard_EMAIL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"INTERNET">>, _attrs, _} = _el | _els], X400,
		       Userid, Internet, Home, Pref, Work) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid,
				 decode_vcard_INTERNET(<<"vcard-temp">>, __Opts,
						       _el),
				 Home, Pref, Work);
      _ ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid, Internet, Home, Pref, Work)
    end;
decode_vcard_EMAIL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"PREF">>, _attrs, _} = _el | _els], X400,
		       Userid, Internet, Home, Pref, Work) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid, Internet, Home,
				 decode_vcard_PREF(<<"vcard-temp">>, __Opts,
						   _el),
				 Work);
      _ ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid, Internet, Home, Pref, Work)
    end;
decode_vcard_EMAIL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"X400">>, _attrs, _} = _el | _els], X400,
		       Userid, Internet, Home, Pref, Work) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els,
				 decode_vcard_X400(<<"vcard-temp">>, __Opts,
						   _el),
				 Userid, Internet, Home, Pref, Work);
      _ ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid, Internet, Home, Pref, Work)
    end;
decode_vcard_EMAIL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"USERID">>, _attrs, _} = _el | _els], X400,
		       Userid, Internet, Home, Pref, Work) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 decode_vcard_USERID(<<"vcard-temp">>, __Opts,
						     _el),
				 Internet, Home, Pref, Work);
      _ ->
	  decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
				 Userid, Internet, Home, Pref, Work)
    end;
decode_vcard_EMAIL_els(__TopXMLNS, __Opts, [_ | _els],
		       X400, Userid, Internet, Home, Pref, Work) ->
    decode_vcard_EMAIL_els(__TopXMLNS, __Opts, _els, X400,
			   Userid, Internet, Home, Pref, Work).

encode_vcard_EMAIL({vcard_email, Home, Work, Internet,
		    Pref, X400, Userid},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_EMAIL_$x400'(X400,
						    __NewTopXMLNS,
						    'encode_vcard_EMAIL_$userid'(Userid,
										 __NewTopXMLNS,
										 'encode_vcard_EMAIL_$internet'(Internet,
														__NewTopXMLNS,
														'encode_vcard_EMAIL_$home'(Home,
																	   __NewTopXMLNS,
																	   'encode_vcard_EMAIL_$pref'(Pref,
																				      __NewTopXMLNS,
																				      'encode_vcard_EMAIL_$work'(Work,
																								 __NewTopXMLNS,
																								 []))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"EMAIL">>, _attrs, _els}.

'encode_vcard_EMAIL_$x400'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_EMAIL_$x400'(X400, __TopXMLNS, _acc) ->
    [encode_vcard_X400(X400, __TopXMLNS) | _acc].

'encode_vcard_EMAIL_$userid'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_vcard_EMAIL_$userid'(Userid, __TopXMLNS,
			     _acc) ->
    [encode_vcard_USERID(Userid, __TopXMLNS) | _acc].

'encode_vcard_EMAIL_$internet'(false, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_vcard_EMAIL_$internet'(Internet, __TopXMLNS,
			       _acc) ->
    [encode_vcard_INTERNET(Internet, __TopXMLNS) | _acc].

'encode_vcard_EMAIL_$home'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_EMAIL_$home'(Home, __TopXMLNS, _acc) ->
    [encode_vcard_HOME(Home, __TopXMLNS) | _acc].

'encode_vcard_EMAIL_$pref'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_EMAIL_$pref'(Pref, __TopXMLNS, _acc) ->
    [encode_vcard_PREF(Pref, __TopXMLNS) | _acc].

'encode_vcard_EMAIL_$work'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_EMAIL_$work'(Work, __TopXMLNS, _acc) ->
    [encode_vcard_WORK(Work, __TopXMLNS) | _acc].

decode_vcard_TEL(__TopXMLNS, __Opts,
		 {xmlel, <<"TEL">>, _attrs, _els}) ->
    {Number, Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
     Work, Cell, Modem, Isdn, Video} =
	decode_vcard_TEL_els(__TopXMLNS, __Opts, _els,
			     undefined, false, false, false, false, false,
			     false, false, false, false, false, false, false,
			     false),
    {vcard_tel, Home, Work, Voice, Fax, Pager, Msg, Cell,
     Video, Bbs, Modem, Isdn, Pcs, Pref, Number}.

decode_vcard_TEL_els(__TopXMLNS, __Opts, [], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    {Number, Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
     Work, Cell, Modem, Isdn, Video};
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"HOME">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice,
			       decode_vcard_HOME(<<"vcard-temp">>, __Opts, _el),
			       Pref, Msg, Fax, Work, Cell, Modem, Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"WORK">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       decode_vcard_WORK(<<"vcard-temp">>, __Opts, _el),
			       Cell, Modem, Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"VOICE">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs,
			       decode_vcard_VOICE(<<"vcard-temp">>, __Opts,
						  _el),
			       Home, Pref, Msg, Fax, Work, Cell, Modem, Isdn,
			       Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"FAX">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg,
			       decode_vcard_FAX(<<"vcard-temp">>, __Opts, _el),
			       Work, Cell, Modem, Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"PAGER">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       decode_vcard_PAGER(<<"vcard-temp">>, __Opts,
						  _el),
			       Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
			       Cell, Modem, Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"MSG">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref,
			       decode_vcard_MSG(<<"vcard-temp">>, __Opts, _el),
			       Fax, Work, Cell, Modem, Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"CELL">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work,
			       decode_vcard_CELL(<<"vcard-temp">>, __Opts, _el),
			       Modem, Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"VIDEO">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn,
			       decode_vcard_VIDEO(<<"vcard-temp">>, __Opts,
						  _el));
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"BBS">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs,
			       decode_vcard_BBS(<<"vcard-temp">>, __Opts, _el),
			       Voice, Home, Pref, Msg, Fax, Work, Cell, Modem,
			       Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"MODEM">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell,
			       decode_vcard_MODEM(<<"vcard-temp">>, __Opts,
						  _el),
			       Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"ISDN">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem,
			       decode_vcard_ISDN(<<"vcard-temp">>, __Opts, _el),
			       Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"PCS">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager,
			       decode_vcard_PCS(<<"vcard-temp">>, __Opts, _el),
			       Bbs, Voice, Home, Pref, Msg, Fax, Work, Cell,
			       Modem, Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"PREF">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home,
			       decode_vcard_PREF(<<"vcard-temp">>, __Opts, _el),
			       Msg, Fax, Work, Cell, Modem, Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"NUMBER">>, _attrs, _} = _el | _els], Number,
		     Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
		     Cell, Modem, Isdn, Video) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els,
			       decode_vcard_NUMBER(<<"vcard-temp">>, __Opts,
						   _el),
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video);
      _ ->
	  decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			       Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
			       Work, Cell, Modem, Isdn, Video)
    end;
decode_vcard_TEL_els(__TopXMLNS, __Opts, [_ | _els],
		     Number, Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax,
		     Work, Cell, Modem, Isdn, Video) ->
    decode_vcard_TEL_els(__TopXMLNS, __Opts, _els, Number,
			 Pager, Pcs, Bbs, Voice, Home, Pref, Msg, Fax, Work,
			 Cell, Modem, Isdn, Video).

encode_vcard_TEL({vcard_tel, Home, Work, Voice, Fax,
		  Pager, Msg, Cell, Video, Bbs, Modem, Isdn, Pcs, Pref,
		  Number},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_TEL_$number'(Number,
						    __NewTopXMLNS,
						    'encode_vcard_TEL_$pager'(Pager,
									      __NewTopXMLNS,
									      'encode_vcard_TEL_$pcs'(Pcs,
												      __NewTopXMLNS,
												      'encode_vcard_TEL_$bbs'(Bbs,
															      __NewTopXMLNS,
															      'encode_vcard_TEL_$voice'(Voice,
																			__NewTopXMLNS,
																			'encode_vcard_TEL_$home'(Home,
																						 __NewTopXMLNS,
																						 'encode_vcard_TEL_$pref'(Pref,
																									  __NewTopXMLNS,
																									  'encode_vcard_TEL_$msg'(Msg,
																												  __NewTopXMLNS,
																												  'encode_vcard_TEL_$fax'(Fax,
																															  __NewTopXMLNS,
																															  'encode_vcard_TEL_$work'(Work,
																																		   __NewTopXMLNS,
																																		   'encode_vcard_TEL_$cell'(Cell,
																																					    __NewTopXMLNS,
																																					    'encode_vcard_TEL_$modem'(Modem,
																																								      __NewTopXMLNS,
																																								      'encode_vcard_TEL_$isdn'(Isdn,
																																											       __NewTopXMLNS,
																																											       'encode_vcard_TEL_$video'(Video,
																																															 __NewTopXMLNS,
																																															 []))))))))))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"TEL">>, _attrs, _els}.

'encode_vcard_TEL_$number'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_vcard_TEL_$number'(Number, __TopXMLNS, _acc) ->
    [encode_vcard_NUMBER(Number, __TopXMLNS) | _acc].

'encode_vcard_TEL_$pager'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$pager'(Pager, __TopXMLNS, _acc) ->
    [encode_vcard_PAGER(Pager, __TopXMLNS) | _acc].

'encode_vcard_TEL_$pcs'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$pcs'(Pcs, __TopXMLNS, _acc) ->
    [encode_vcard_PCS(Pcs, __TopXMLNS) | _acc].

'encode_vcard_TEL_$bbs'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$bbs'(Bbs, __TopXMLNS, _acc) ->
    [encode_vcard_BBS(Bbs, __TopXMLNS) | _acc].

'encode_vcard_TEL_$voice'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$voice'(Voice, __TopXMLNS, _acc) ->
    [encode_vcard_VOICE(Voice, __TopXMLNS) | _acc].

'encode_vcard_TEL_$home'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$home'(Home, __TopXMLNS, _acc) ->
    [encode_vcard_HOME(Home, __TopXMLNS) | _acc].

'encode_vcard_TEL_$pref'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$pref'(Pref, __TopXMLNS, _acc) ->
    [encode_vcard_PREF(Pref, __TopXMLNS) | _acc].

'encode_vcard_TEL_$msg'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$msg'(Msg, __TopXMLNS, _acc) ->
    [encode_vcard_MSG(Msg, __TopXMLNS) | _acc].

'encode_vcard_TEL_$fax'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$fax'(Fax, __TopXMLNS, _acc) ->
    [encode_vcard_FAX(Fax, __TopXMLNS) | _acc].

'encode_vcard_TEL_$work'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$work'(Work, __TopXMLNS, _acc) ->
    [encode_vcard_WORK(Work, __TopXMLNS) | _acc].

'encode_vcard_TEL_$cell'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$cell'(Cell, __TopXMLNS, _acc) ->
    [encode_vcard_CELL(Cell, __TopXMLNS) | _acc].

'encode_vcard_TEL_$modem'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$modem'(Modem, __TopXMLNS, _acc) ->
    [encode_vcard_MODEM(Modem, __TopXMLNS) | _acc].

'encode_vcard_TEL_$isdn'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$isdn'(Isdn, __TopXMLNS, _acc) ->
    [encode_vcard_ISDN(Isdn, __TopXMLNS) | _acc].

'encode_vcard_TEL_$video'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_TEL_$video'(Video, __TopXMLNS, _acc) ->
    [encode_vcard_VIDEO(Video, __TopXMLNS) | _acc].

decode_vcard_LABEL(__TopXMLNS, __Opts,
		   {xmlel, <<"LABEL">>, _attrs, _els}) ->
    {Line, Home, Pref, Work, Intl, Parcel, Postal, Dom} =
	decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, [],
			       false, false, false, false, false, false, false),
    {vcard_label, Home, Work, Postal, Parcel, Dom, Intl,
     Pref, Line}.

decode_vcard_LABEL_els(__TopXMLNS, __Opts, [], Line,
		       Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    {lists:reverse(Line), Home, Pref, Work, Intl, Parcel,
     Postal, Dom};
decode_vcard_LABEL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"HOME">>, _attrs, _} = _el | _els], Line,
		       Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 decode_vcard_HOME(<<"vcard-temp">>, __Opts,
						   _el),
				 Pref, Work, Intl, Parcel, Postal, Dom);
      _ ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel, Postal, Dom)
    end;
decode_vcard_LABEL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"WORK">>, _attrs, _} = _el | _els], Line,
		       Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref,
				 decode_vcard_WORK(<<"vcard-temp">>, __Opts,
						   _el),
				 Intl, Parcel, Postal, Dom);
      _ ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel, Postal, Dom)
    end;
decode_vcard_LABEL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"POSTAL">>, _attrs, _} = _el | _els], Line,
		       Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel,
				 decode_vcard_POSTAL(<<"vcard-temp">>, __Opts,
						     _el),
				 Dom);
      _ ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel, Postal, Dom)
    end;
decode_vcard_LABEL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"PARCEL">>, _attrs, _} = _el | _els], Line,
		       Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl,
				 decode_vcard_PARCEL(<<"vcard-temp">>, __Opts,
						     _el),
				 Postal, Dom);
      _ ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel, Postal, Dom)
    end;
decode_vcard_LABEL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"DOM">>, _attrs, _} = _el | _els], Line,
		       Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel, Postal,
				 decode_vcard_DOM(<<"vcard-temp">>, __Opts,
						  _el));
      _ ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel, Postal, Dom)
    end;
decode_vcard_LABEL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"INTL">>, _attrs, _} = _el | _els], Line,
		       Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work,
				 decode_vcard_INTL(<<"vcard-temp">>, __Opts,
						   _el),
				 Parcel, Postal, Dom);
      _ ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel, Postal, Dom)
    end;
decode_vcard_LABEL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"PREF">>, _attrs, _} = _el | _els], Line,
		       Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home,
				 decode_vcard_PREF(<<"vcard-temp">>, __Opts,
						   _el),
				 Work, Intl, Parcel, Postal, Dom);
      _ ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel, Postal, Dom)
    end;
decode_vcard_LABEL_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"LINE">>, _attrs, _} = _el | _els], Line,
		       Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els,
				 [decode_vcard_LINE(<<"vcard-temp">>, __Opts,
						    _el)
				  | Line],
				 Home, Pref, Work, Intl, Parcel, Postal, Dom);
      _ ->
	  decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
				 Home, Pref, Work, Intl, Parcel, Postal, Dom)
    end;
decode_vcard_LABEL_els(__TopXMLNS, __Opts, [_ | _els],
		       Line, Home, Pref, Work, Intl, Parcel, Postal, Dom) ->
    decode_vcard_LABEL_els(__TopXMLNS, __Opts, _els, Line,
			   Home, Pref, Work, Intl, Parcel, Postal, Dom).

encode_vcard_LABEL({vcard_label, Home, Work, Postal,
		    Parcel, Dom, Intl, Pref, Line},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_LABEL_$line'(Line,
						    __NewTopXMLNS,
						    'encode_vcard_LABEL_$home'(Home,
									       __NewTopXMLNS,
									       'encode_vcard_LABEL_$pref'(Pref,
													  __NewTopXMLNS,
													  'encode_vcard_LABEL_$work'(Work,
																     __NewTopXMLNS,
																     'encode_vcard_LABEL_$intl'(Intl,
																				__NewTopXMLNS,
																				'encode_vcard_LABEL_$parcel'(Parcel,
																							     __NewTopXMLNS,
																							     'encode_vcard_LABEL_$postal'(Postal,
																											  __NewTopXMLNS,
																											  'encode_vcard_LABEL_$dom'(Dom,
																														    __NewTopXMLNS,
																														    []))))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"LABEL">>, _attrs, _els}.

'encode_vcard_LABEL_$line'([], __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_LABEL_$line'([Line | _els], __TopXMLNS,
			   _acc) ->
    'encode_vcard_LABEL_$line'(_els, __TopXMLNS,
			       [encode_vcard_LINE(Line, __TopXMLNS) | _acc]).

'encode_vcard_LABEL_$home'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_LABEL_$home'(Home, __TopXMLNS, _acc) ->
    [encode_vcard_HOME(Home, __TopXMLNS) | _acc].

'encode_vcard_LABEL_$pref'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_LABEL_$pref'(Pref, __TopXMLNS, _acc) ->
    [encode_vcard_PREF(Pref, __TopXMLNS) | _acc].

'encode_vcard_LABEL_$work'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_LABEL_$work'(Work, __TopXMLNS, _acc) ->
    [encode_vcard_WORK(Work, __TopXMLNS) | _acc].

'encode_vcard_LABEL_$intl'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_LABEL_$intl'(Intl, __TopXMLNS, _acc) ->
    [encode_vcard_INTL(Intl, __TopXMLNS) | _acc].

'encode_vcard_LABEL_$parcel'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_LABEL_$parcel'(Parcel, __TopXMLNS,
			     _acc) ->
    [encode_vcard_PARCEL(Parcel, __TopXMLNS) | _acc].

'encode_vcard_LABEL_$postal'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_LABEL_$postal'(Postal, __TopXMLNS,
			     _acc) ->
    [encode_vcard_POSTAL(Postal, __TopXMLNS) | _acc].

'encode_vcard_LABEL_$dom'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_LABEL_$dom'(Dom, __TopXMLNS, _acc) ->
    [encode_vcard_DOM(Dom, __TopXMLNS) | _acc].

decode_vcard_ADR(__TopXMLNS, __Opts,
		 {xmlel, <<"ADR">>, _attrs, _els}) ->
    {Street, Extadd, Pcode, Home, Pref, Pobox, Ctry,
     Locality, Work, Intl, Parcel, Postal, Dom, Region} =
	decode_vcard_ADR_els(__TopXMLNS, __Opts, _els,
			     undefined, undefined, undefined, false, false,
			     undefined, undefined, undefined, false, false,
			     false, false, false, undefined),
    {vcard_adr, Home, Work, Postal, Parcel, Dom, Intl, Pref,
     Pobox, Extadd, Street, Locality, Region, Pcode, Ctry}.

decode_vcard_ADR_els(__TopXMLNS, __Opts, [], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    {Street, Extadd, Pcode, Home, Pref, Pobox, Ctry,
     Locality, Work, Intl, Parcel, Postal, Dom, Region};
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"HOME">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode,
			       decode_vcard_HOME(<<"vcard-temp">>, __Opts, _el),
			       Pref, Pobox, Ctry, Locality, Work, Intl, Parcel,
			       Postal, Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"WORK">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       decode_vcard_WORK(<<"vcard-temp">>, __Opts, _el),
			       Intl, Parcel, Postal, Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"POSTAL">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel,
			       decode_vcard_POSTAL(<<"vcard-temp">>, __Opts,
						   _el),
			       Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"PARCEL">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl,
			       decode_vcard_PARCEL(<<"vcard-temp">>, __Opts,
						   _el),
			       Postal, Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"DOM">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal,
			       decode_vcard_DOM(<<"vcard-temp">>, __Opts, _el),
			       Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"INTL">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work,
			       decode_vcard_INTL(<<"vcard-temp">>, __Opts, _el),
			       Parcel, Postal, Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"PREF">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home,
			       decode_vcard_PREF(<<"vcard-temp">>, __Opts, _el),
			       Pobox, Ctry, Locality, Work, Intl, Parcel,
			       Postal, Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"POBOX">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref,
			       decode_vcard_POBOX(<<"vcard-temp">>, __Opts,
						  _el),
			       Ctry, Locality, Work, Intl, Parcel, Postal, Dom,
			       Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"EXTADD">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       decode_vcard_EXTADD(<<"vcard-temp">>, __Opts,
						   _el),
			       Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
			       Intl, Parcel, Postal, Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"STREET">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els,
			       decode_vcard_STREET(<<"vcard-temp">>, __Opts,
						   _el),
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"LOCALITY">>, _attrs, _} = _el | _els],
		     Street, Extadd, Pcode, Home, Pref, Pobox, Ctry,
		     Locality, Work, Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry,
			       decode_vcard_LOCALITY(<<"vcard-temp">>, __Opts,
						     _el),
			       Work, Intl, Parcel, Postal, Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"REGION">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom,
			       decode_vcard_REGION(<<"vcard-temp">>, __Opts,
						   _el));
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"PCODE">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd,
			       decode_vcard_PCODE(<<"vcard-temp">>, __Opts,
						  _el),
			       Home, Pref, Pobox, Ctry, Locality, Work, Intl,
			       Parcel, Postal, Dom, Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"CTRY">>, _attrs, _} = _el | _els], Street,
		     Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
		     Intl, Parcel, Postal, Dom, Region) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox,
			       decode_vcard_CTRY(<<"vcard-temp">>, __Opts, _el),
			       Locality, Work, Intl, Parcel, Postal, Dom,
			       Region);
      _ ->
	  decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			       Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality,
			       Work, Intl, Parcel, Postal, Dom, Region)
    end;
decode_vcard_ADR_els(__TopXMLNS, __Opts, [_ | _els],
		     Street, Extadd, Pcode, Home, Pref, Pobox, Ctry,
		     Locality, Work, Intl, Parcel, Postal, Dom, Region) ->
    decode_vcard_ADR_els(__TopXMLNS, __Opts, _els, Street,
			 Extadd, Pcode, Home, Pref, Pobox, Ctry, Locality, Work,
			 Intl, Parcel, Postal, Dom, Region).

encode_vcard_ADR({vcard_adr, Home, Work, Postal, Parcel,
		  Dom, Intl, Pref, Pobox, Extadd, Street, Locality,
		  Region, Pcode, Ctry},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_ADR_$street'(Street,
						    __NewTopXMLNS,
						    'encode_vcard_ADR_$extadd'(Extadd,
									       __NewTopXMLNS,
									       'encode_vcard_ADR_$pcode'(Pcode,
													 __NewTopXMLNS,
													 'encode_vcard_ADR_$home'(Home,
																  __NewTopXMLNS,
																  'encode_vcard_ADR_$pref'(Pref,
																			   __NewTopXMLNS,
																			   'encode_vcard_ADR_$pobox'(Pobox,
																						     __NewTopXMLNS,
																						     'encode_vcard_ADR_$ctry'(Ctry,
																									      __NewTopXMLNS,
																									      'encode_vcard_ADR_$locality'(Locality,
																													   __NewTopXMLNS,
																													   'encode_vcard_ADR_$work'(Work,
																																    __NewTopXMLNS,
																																    'encode_vcard_ADR_$intl'(Intl,
																																			     __NewTopXMLNS,
																																			     'encode_vcard_ADR_$parcel'(Parcel,
																																							__NewTopXMLNS,
																																							'encode_vcard_ADR_$postal'(Postal,
																																										   __NewTopXMLNS,
																																										   'encode_vcard_ADR_$dom'(Dom,
																																													   __NewTopXMLNS,
																																													   'encode_vcard_ADR_$region'(Region,
																																																      __NewTopXMLNS,
																																																      []))))))))))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ADR">>, _attrs, _els}.

'encode_vcard_ADR_$street'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_vcard_ADR_$street'(Street, __TopXMLNS, _acc) ->
    [encode_vcard_STREET(Street, __TopXMLNS) | _acc].

'encode_vcard_ADR_$extadd'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_vcard_ADR_$extadd'(Extadd, __TopXMLNS, _acc) ->
    [encode_vcard_EXTADD(Extadd, __TopXMLNS) | _acc].

'encode_vcard_ADR_$pcode'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_vcard_ADR_$pcode'(Pcode, __TopXMLNS, _acc) ->
    [encode_vcard_PCODE(Pcode, __TopXMLNS) | _acc].

'encode_vcard_ADR_$home'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_ADR_$home'(Home, __TopXMLNS, _acc) ->
    [encode_vcard_HOME(Home, __TopXMLNS) | _acc].

'encode_vcard_ADR_$pref'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_ADR_$pref'(Pref, __TopXMLNS, _acc) ->
    [encode_vcard_PREF(Pref, __TopXMLNS) | _acc].

'encode_vcard_ADR_$pobox'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_vcard_ADR_$pobox'(Pobox, __TopXMLNS, _acc) ->
    [encode_vcard_POBOX(Pobox, __TopXMLNS) | _acc].

'encode_vcard_ADR_$ctry'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_ADR_$ctry'(Ctry, __TopXMLNS, _acc) ->
    [encode_vcard_CTRY(Ctry, __TopXMLNS) | _acc].

'encode_vcard_ADR_$locality'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_vcard_ADR_$locality'(Locality, __TopXMLNS,
			     _acc) ->
    [encode_vcard_LOCALITY(Locality, __TopXMLNS) | _acc].

'encode_vcard_ADR_$work'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_ADR_$work'(Work, __TopXMLNS, _acc) ->
    [encode_vcard_WORK(Work, __TopXMLNS) | _acc].

'encode_vcard_ADR_$intl'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_ADR_$intl'(Intl, __TopXMLNS, _acc) ->
    [encode_vcard_INTL(Intl, __TopXMLNS) | _acc].

'encode_vcard_ADR_$parcel'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_ADR_$parcel'(Parcel, __TopXMLNS, _acc) ->
    [encode_vcard_PARCEL(Parcel, __TopXMLNS) | _acc].

'encode_vcard_ADR_$postal'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_ADR_$postal'(Postal, __TopXMLNS, _acc) ->
    [encode_vcard_POSTAL(Postal, __TopXMLNS) | _acc].

'encode_vcard_ADR_$dom'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_ADR_$dom'(Dom, __TopXMLNS, _acc) ->
    [encode_vcard_DOM(Dom, __TopXMLNS) | _acc].

'encode_vcard_ADR_$region'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_vcard_ADR_$region'(Region, __TopXMLNS, _acc) ->
    [encode_vcard_REGION(Region, __TopXMLNS) | _acc].

decode_vcard_N(__TopXMLNS, __Opts,
	       {xmlel, <<"N">>, _attrs, _els}) ->
    {Middle, Suffix, Prefix, Family, Given} =
	decode_vcard_N_els(__TopXMLNS, __Opts, _els, undefined,
			   undefined, undefined, undefined, undefined),
    {vcard_name, Family, Given, Middle, Prefix, Suffix}.

decode_vcard_N_els(__TopXMLNS, __Opts, [], Middle,
		   Suffix, Prefix, Family, Given) ->
    {Middle, Suffix, Prefix, Family, Given};
decode_vcard_N_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"FAMILY">>, _attrs, _} = _el | _els], Middle,
		   Suffix, Prefix, Family, Given) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
			     Suffix, Prefix,
			     decode_vcard_FAMILY(<<"vcard-temp">>, __Opts, _el),
			     Given);
      _ ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
			     Suffix, Prefix, Family, Given)
    end;
decode_vcard_N_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"GIVEN">>, _attrs, _} = _el | _els], Middle,
		   Suffix, Prefix, Family, Given) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
			     Suffix, Prefix, Family,
			     decode_vcard_GIVEN(<<"vcard-temp">>, __Opts, _el));
      _ ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
			     Suffix, Prefix, Family, Given)
    end;
decode_vcard_N_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"MIDDLE">>, _attrs, _} = _el | _els], Middle,
		   Suffix, Prefix, Family, Given) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els,
			     decode_vcard_MIDDLE(<<"vcard-temp">>, __Opts, _el),
			     Suffix, Prefix, Family, Given);
      _ ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
			     Suffix, Prefix, Family, Given)
    end;
decode_vcard_N_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"PREFIX">>, _attrs, _} = _el | _els], Middle,
		   Suffix, Prefix, Family, Given) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
			     Suffix,
			     decode_vcard_PREFIX(<<"vcard-temp">>, __Opts, _el),
			     Family, Given);
      _ ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
			     Suffix, Prefix, Family, Given)
    end;
decode_vcard_N_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"SUFFIX">>, _attrs, _} = _el | _els], Middle,
		   Suffix, Prefix, Family, Given) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"vcard-temp">> ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
			     decode_vcard_SUFFIX(<<"vcard-temp">>, __Opts, _el),
			     Prefix, Family, Given);
      _ ->
	  decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
			     Suffix, Prefix, Family, Given)
    end;
decode_vcard_N_els(__TopXMLNS, __Opts, [_ | _els],
		   Middle, Suffix, Prefix, Family, Given) ->
    decode_vcard_N_els(__TopXMLNS, __Opts, _els, Middle,
		       Suffix, Prefix, Family, Given).

encode_vcard_N({vcard_name, Family, Given, Middle,
		Prefix, Suffix},
	       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_vcard_N_$middle'(Middle,
						  __NewTopXMLNS,
						  'encode_vcard_N_$suffix'(Suffix,
									   __NewTopXMLNS,
									   'encode_vcard_N_$prefix'(Prefix,
												    __NewTopXMLNS,
												    'encode_vcard_N_$family'(Family,
															     __NewTopXMLNS,
															     'encode_vcard_N_$given'(Given,
																		     __NewTopXMLNS,
																		     [])))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"N">>, _attrs, _els}.

'encode_vcard_N_$middle'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_N_$middle'(Middle, __TopXMLNS, _acc) ->
    [encode_vcard_MIDDLE(Middle, __TopXMLNS) | _acc].

'encode_vcard_N_$suffix'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_N_$suffix'(Suffix, __TopXMLNS, _acc) ->
    [encode_vcard_SUFFIX(Suffix, __TopXMLNS) | _acc].

'encode_vcard_N_$prefix'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_N_$prefix'(Prefix, __TopXMLNS, _acc) ->
    [encode_vcard_PREFIX(Prefix, __TopXMLNS) | _acc].

'encode_vcard_N_$family'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_N_$family'(Family, __TopXMLNS, _acc) ->
    [encode_vcard_FAMILY(Family, __TopXMLNS) | _acc].

'encode_vcard_N_$given'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_vcard_N_$given'(Given, __TopXMLNS, _acc) ->
    [encode_vcard_GIVEN(Given, __TopXMLNS) | _acc].

decode_vcard_CONFIDENTIAL(__TopXMLNS, __Opts,
			  {xmlel, <<"CONFIDENTIAL">>, _attrs, _els}) ->
    confidential.

encode_vcard_CONFIDENTIAL(confidential, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"CONFIDENTIAL">>, _attrs, _els}.

decode_vcard_PRIVATE(__TopXMLNS, __Opts,
		     {xmlel, <<"PRIVATE">>, _attrs, _els}) ->
    private.

encode_vcard_PRIVATE(private, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PRIVATE">>, _attrs, _els}.

decode_vcard_PUBLIC(__TopXMLNS, __Opts,
		    {xmlel, <<"PUBLIC">>, _attrs, _els}) ->
    public.

encode_vcard_PUBLIC(public, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PUBLIC">>, _attrs, _els}.

decode_vcard_EXTVAL(__TopXMLNS, __Opts,
		    {xmlel, <<"EXTVAL">>, _attrs, _els}) ->
    Cdata = decode_vcard_EXTVAL_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_EXTVAL_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_EXTVAL_cdata(__TopXMLNS, Cdata);
decode_vcard_EXTVAL_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_EXTVAL_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_EXTVAL_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_EXTVAL_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_EXTVAL(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_EXTVAL_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"EXTVAL">>, _attrs, _els}.

decode_vcard_EXTVAL_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_EXTVAL_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_EXTVAL_cdata(<<>>, _acc) -> _acc;
encode_vcard_EXTVAL_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_TYPE(__TopXMLNS, __Opts,
		  {xmlel, <<"TYPE">>, _attrs, _els}) ->
    Cdata = decode_vcard_TYPE_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_vcard_TYPE_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_TYPE_cdata(__TopXMLNS, Cdata);
decode_vcard_TYPE_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_TYPE_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_vcard_TYPE_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_vcard_TYPE_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_TYPE(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_TYPE_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"TYPE">>, _attrs, _els}.

decode_vcard_TYPE_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_TYPE_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_TYPE_cdata(<<>>, _acc) -> _acc;
encode_vcard_TYPE_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_DESC(__TopXMLNS, __Opts,
		  {xmlel, <<"DESC">>, _attrs, _els}) ->
    Cdata = decode_vcard_DESC_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_vcard_DESC_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_DESC_cdata(__TopXMLNS, Cdata);
decode_vcard_DESC_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_DESC_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_vcard_DESC_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_vcard_DESC_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_DESC(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_DESC_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"DESC">>, _attrs, _els}.

decode_vcard_DESC_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_DESC_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_DESC_cdata(<<>>, _acc) -> _acc;
encode_vcard_DESC_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_URL(__TopXMLNS, __Opts,
		 {xmlel, <<"URL">>, _attrs, _els}) ->
    Cdata = decode_vcard_URL_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_vcard_URL_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_URL_cdata(__TopXMLNS, Cdata);
decode_vcard_URL_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_URL_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_vcard_URL_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_vcard_URL_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_URL(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_URL_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"URL">>, _attrs, _els}.

decode_vcard_URL_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_URL_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_URL_cdata(<<>>, _acc) -> _acc;
encode_vcard_URL_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_UID(__TopXMLNS, __Opts,
		 {xmlel, <<"UID">>, _attrs, _els}) ->
    Cdata = decode_vcard_UID_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_vcard_UID_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_UID_cdata(__TopXMLNS, Cdata);
decode_vcard_UID_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_UID_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_vcard_UID_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_vcard_UID_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_UID(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_UID_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"UID">>, _attrs, _els}.

decode_vcard_UID_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_UID_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_UID_cdata(<<>>, _acc) -> _acc;
encode_vcard_UID_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_SORT_STRING(__TopXMLNS, __Opts,
			 {xmlel, <<"SORT-STRING">>, _attrs, _els}) ->
    Cdata = decode_vcard_SORT_STRING_els(__TopXMLNS, __Opts,
					 _els, <<>>),
    Cdata.

decode_vcard_SORT_STRING_els(__TopXMLNS, __Opts, [],
			     Cdata) ->
    decode_vcard_SORT_STRING_cdata(__TopXMLNS, Cdata);
decode_vcard_SORT_STRING_els(__TopXMLNS, __Opts,
			     [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_SORT_STRING_els(__TopXMLNS, __Opts, _els,
				 <<Cdata/binary, _data/binary>>);
decode_vcard_SORT_STRING_els(__TopXMLNS, __Opts,
			     [_ | _els], Cdata) ->
    decode_vcard_SORT_STRING_els(__TopXMLNS, __Opts, _els,
				 Cdata).

encode_vcard_SORT_STRING(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_SORT_STRING_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"SORT-STRING">>, _attrs, _els}.

decode_vcard_SORT_STRING_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_vcard_SORT_STRING_cdata(__TopXMLNS, _val) ->
    _val.

encode_vcard_SORT_STRING_cdata(<<>>, _acc) -> _acc;
encode_vcard_SORT_STRING_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_REV(__TopXMLNS, __Opts,
		 {xmlel, <<"REV">>, _attrs, _els}) ->
    Cdata = decode_vcard_REV_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_vcard_REV_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_REV_cdata(__TopXMLNS, Cdata);
decode_vcard_REV_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_REV_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_vcard_REV_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_vcard_REV_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_REV(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_REV_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"REV">>, _attrs, _els}.

decode_vcard_REV_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_REV_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_REV_cdata(<<>>, _acc) -> _acc;
encode_vcard_REV_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_PRODID(__TopXMLNS, __Opts,
		    {xmlel, <<"PRODID">>, _attrs, _els}) ->
    Cdata = decode_vcard_PRODID_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_PRODID_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_PRODID_cdata(__TopXMLNS, Cdata);
decode_vcard_PRODID_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_PRODID_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_PRODID_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_PRODID_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_PRODID(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_PRODID_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PRODID">>, _attrs, _els}.

decode_vcard_PRODID_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_PRODID_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_PRODID_cdata(<<>>, _acc) -> _acc;
encode_vcard_PRODID_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_NOTE(__TopXMLNS, __Opts,
		  {xmlel, <<"NOTE">>, _attrs, _els}) ->
    Cdata = decode_vcard_NOTE_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_vcard_NOTE_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_NOTE_cdata(__TopXMLNS, Cdata);
decode_vcard_NOTE_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_NOTE_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_vcard_NOTE_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_vcard_NOTE_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_NOTE(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_NOTE_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"NOTE">>, _attrs, _els}.

decode_vcard_NOTE_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_NOTE_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_NOTE_cdata(<<>>, _acc) -> _acc;
encode_vcard_NOTE_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_KEYWORD(__TopXMLNS, __Opts,
		     {xmlel, <<"KEYWORD">>, _attrs, _els}) ->
    Cdata = decode_vcard_KEYWORD_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_vcard_KEYWORD_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_vcard_KEYWORD_cdata(__TopXMLNS, Cdata);
decode_vcard_KEYWORD_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_KEYWORD_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_vcard_KEYWORD_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_vcard_KEYWORD_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_vcard_KEYWORD(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_KEYWORD_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"KEYWORD">>, _attrs, _els}.

decode_vcard_KEYWORD_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_KEYWORD_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_KEYWORD_cdata(<<>>, _acc) -> _acc;
encode_vcard_KEYWORD_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_ROLE(__TopXMLNS, __Opts,
		  {xmlel, <<"ROLE">>, _attrs, _els}) ->
    Cdata = decode_vcard_ROLE_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_vcard_ROLE_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_ROLE_cdata(__TopXMLNS, Cdata);
decode_vcard_ROLE_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_ROLE_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_vcard_ROLE_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_vcard_ROLE_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_ROLE(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_ROLE_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ROLE">>, _attrs, _els}.

decode_vcard_ROLE_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_ROLE_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_ROLE_cdata(<<>>, _acc) -> _acc;
encode_vcard_ROLE_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_TITLE(__TopXMLNS, __Opts,
		   {xmlel, <<"TITLE">>, _attrs, _els}) ->
    Cdata = decode_vcard_TITLE_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Cdata.

decode_vcard_TITLE_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_TITLE_cdata(__TopXMLNS, Cdata);
decode_vcard_TITLE_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_TITLE_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_vcard_TITLE_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_vcard_TITLE_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_TITLE(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_TITLE_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"TITLE">>, _attrs, _els}.

decode_vcard_TITLE_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_TITLE_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_TITLE_cdata(<<>>, _acc) -> _acc;
encode_vcard_TITLE_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_TZ(__TopXMLNS, __Opts,
		{xmlel, <<"TZ">>, _attrs, _els}) ->
    Cdata = decode_vcard_TZ_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Cdata.

decode_vcard_TZ_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_TZ_cdata(__TopXMLNS, Cdata);
decode_vcard_TZ_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_TZ_els(__TopXMLNS, __Opts, _els,
			<<Cdata/binary, _data/binary>>);
decode_vcard_TZ_els(__TopXMLNS, __Opts, [_ | _els],
		    Cdata) ->
    decode_vcard_TZ_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_TZ(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_TZ_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"TZ">>, _attrs, _els}.

decode_vcard_TZ_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_TZ_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_TZ_cdata(<<>>, _acc) -> _acc;
encode_vcard_TZ_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_MAILER(__TopXMLNS, __Opts,
		    {xmlel, <<"MAILER">>, _attrs, _els}) ->
    Cdata = decode_vcard_MAILER_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_MAILER_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_MAILER_cdata(__TopXMLNS, Cdata);
decode_vcard_MAILER_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_MAILER_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_MAILER_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_MAILER_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_MAILER(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_MAILER_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"MAILER">>, _attrs, _els}.

decode_vcard_MAILER_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_MAILER_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_MAILER_cdata(<<>>, _acc) -> _acc;
encode_vcard_MAILER_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_JABBERID(__TopXMLNS, __Opts,
		      {xmlel, <<"JABBERID">>, _attrs, _els}) ->
    Cdata = decode_vcard_JABBERID_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_vcard_JABBERID_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_vcard_JABBERID_cdata(__TopXMLNS, Cdata);
decode_vcard_JABBERID_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_JABBERID_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_vcard_JABBERID_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_vcard_JABBERID_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_vcard_JABBERID(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_JABBERID_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"JABBERID">>, _attrs, _els}.

decode_vcard_JABBERID_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_JABBERID_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_JABBERID_cdata(<<>>, _acc) -> _acc;
encode_vcard_JABBERID_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_BDAY(__TopXMLNS, __Opts,
		  {xmlel, <<"BDAY">>, _attrs, _els}) ->
    Cdata = decode_vcard_BDAY_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_vcard_BDAY_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_BDAY_cdata(__TopXMLNS, Cdata);
decode_vcard_BDAY_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_BDAY_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_vcard_BDAY_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_vcard_BDAY_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_BDAY(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_BDAY_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"BDAY">>, _attrs, _els}.

decode_vcard_BDAY_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_BDAY_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_BDAY_cdata(<<>>, _acc) -> _acc;
encode_vcard_BDAY_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_NICKNAME(__TopXMLNS, __Opts,
		      {xmlel, <<"NICKNAME">>, _attrs, _els}) ->
    Cdata = decode_vcard_NICKNAME_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_vcard_NICKNAME_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_vcard_NICKNAME_cdata(__TopXMLNS, Cdata);
decode_vcard_NICKNAME_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_NICKNAME_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_vcard_NICKNAME_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_vcard_NICKNAME_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_vcard_NICKNAME(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_NICKNAME_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"NICKNAME">>, _attrs, _els}.

decode_vcard_NICKNAME_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_NICKNAME_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_NICKNAME_cdata(<<>>, _acc) -> _acc;
encode_vcard_NICKNAME_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_FN(__TopXMLNS, __Opts,
		{xmlel, <<"FN">>, _attrs, _els}) ->
    Cdata = decode_vcard_FN_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Cdata.

decode_vcard_FN_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_FN_cdata(__TopXMLNS, Cdata);
decode_vcard_FN_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_FN_els(__TopXMLNS, __Opts, _els,
			<<Cdata/binary, _data/binary>>);
decode_vcard_FN_els(__TopXMLNS, __Opts, [_ | _els],
		    Cdata) ->
    decode_vcard_FN_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_FN(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_FN_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"FN">>, _attrs, _els}.

decode_vcard_FN_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_FN_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_FN_cdata(<<>>, _acc) -> _acc;
encode_vcard_FN_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_VERSION(__TopXMLNS, __Opts,
		     {xmlel, <<"VERSION">>, _attrs, _els}) ->
    Cdata = decode_vcard_VERSION_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_vcard_VERSION_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_vcard_VERSION_cdata(__TopXMLNS, Cdata);
decode_vcard_VERSION_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_VERSION_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_vcard_VERSION_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_vcard_VERSION_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_vcard_VERSION(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_VERSION_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"VERSION">>, _attrs, _els}.

decode_vcard_VERSION_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_VERSION_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_VERSION_cdata(<<>>, _acc) -> _acc;
encode_vcard_VERSION_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_CRED(__TopXMLNS, __Opts,
		  {xmlel, <<"CRED">>, _attrs, _els}) ->
    Cdata = decode_vcard_CRED_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_vcard_CRED_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_CRED_cdata(__TopXMLNS, Cdata);
decode_vcard_CRED_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_CRED_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_vcard_CRED_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_vcard_CRED_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_CRED(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_CRED_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"CRED">>, _attrs, _els}.

decode_vcard_CRED_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_CRED_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_CRED_cdata(<<>>, _acc) -> _acc;
encode_vcard_CRED_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_PHONETIC(__TopXMLNS, __Opts,
		      {xmlel, <<"PHONETIC">>, _attrs, _els}) ->
    Cdata = decode_vcard_PHONETIC_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_vcard_PHONETIC_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_vcard_PHONETIC_cdata(__TopXMLNS, Cdata);
decode_vcard_PHONETIC_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_PHONETIC_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_vcard_PHONETIC_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_vcard_PHONETIC_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_vcard_PHONETIC(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_PHONETIC_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PHONETIC">>, _attrs, _els}.

decode_vcard_PHONETIC_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_PHONETIC_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_PHONETIC_cdata(<<>>, _acc) -> _acc;
encode_vcard_PHONETIC_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_ORGUNIT(__TopXMLNS, __Opts,
		     {xmlel, <<"ORGUNIT">>, _attrs, _els}) ->
    Cdata = decode_vcard_ORGUNIT_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_vcard_ORGUNIT_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_vcard_ORGUNIT_cdata(__TopXMLNS, Cdata);
decode_vcard_ORGUNIT_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_ORGUNIT_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_vcard_ORGUNIT_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_vcard_ORGUNIT_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_vcard_ORGUNIT(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_ORGUNIT_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ORGUNIT">>, _attrs, _els}.

decode_vcard_ORGUNIT_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_ORGUNIT_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_ORGUNIT_cdata(<<>>, _acc) -> _acc;
encode_vcard_ORGUNIT_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_ORGNAME(__TopXMLNS, __Opts,
		     {xmlel, <<"ORGNAME">>, _attrs, _els}) ->
    Cdata = decode_vcard_ORGNAME_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_vcard_ORGNAME_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_vcard_ORGNAME_cdata(__TopXMLNS, Cdata);
decode_vcard_ORGNAME_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_ORGNAME_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_vcard_ORGNAME_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_vcard_ORGNAME_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_vcard_ORGNAME(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_ORGNAME_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ORGNAME">>, _attrs, _els}.

decode_vcard_ORGNAME_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_ORGNAME_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_ORGNAME_cdata(<<>>, _acc) -> _acc;
encode_vcard_ORGNAME_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_LON(__TopXMLNS, __Opts,
		 {xmlel, <<"LON">>, _attrs, _els}) ->
    Cdata = decode_vcard_LON_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_vcard_LON_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_LON_cdata(__TopXMLNS, Cdata);
decode_vcard_LON_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_LON_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_vcard_LON_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_vcard_LON_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_LON(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_LON_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"LON">>, _attrs, _els}.

decode_vcard_LON_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_LON_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_LON_cdata(<<>>, _acc) -> _acc;
encode_vcard_LON_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_LAT(__TopXMLNS, __Opts,
		 {xmlel, <<"LAT">>, _attrs, _els}) ->
    Cdata = decode_vcard_LAT_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Cdata.

decode_vcard_LAT_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_LAT_cdata(__TopXMLNS, Cdata);
decode_vcard_LAT_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_LAT_els(__TopXMLNS, __Opts, _els,
			 <<Cdata/binary, _data/binary>>);
decode_vcard_LAT_els(__TopXMLNS, __Opts, [_ | _els],
		     Cdata) ->
    decode_vcard_LAT_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_LAT(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_LAT_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"LAT">>, _attrs, _els}.

decode_vcard_LAT_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_LAT_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_LAT_cdata(<<>>, _acc) -> _acc;
encode_vcard_LAT_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_USERID(__TopXMLNS, __Opts,
		    {xmlel, <<"USERID">>, _attrs, _els}) ->
    Cdata = decode_vcard_USERID_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_USERID_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_USERID_cdata(__TopXMLNS, Cdata);
decode_vcard_USERID_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_USERID_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_USERID_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_USERID_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_USERID(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_USERID_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"USERID">>, _attrs, _els}.

decode_vcard_USERID_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_USERID_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_USERID_cdata(<<>>, _acc) -> _acc;
encode_vcard_USERID_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_NUMBER(__TopXMLNS, __Opts,
		    {xmlel, <<"NUMBER">>, _attrs, _els}) ->
    Cdata = decode_vcard_NUMBER_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_NUMBER_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_NUMBER_cdata(__TopXMLNS, Cdata);
decode_vcard_NUMBER_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_NUMBER_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_NUMBER_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_NUMBER_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_NUMBER(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_NUMBER_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"NUMBER">>, _attrs, _els}.

decode_vcard_NUMBER_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_NUMBER_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_NUMBER_cdata(<<>>, _acc) -> _acc;
encode_vcard_NUMBER_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_LINE(__TopXMLNS, __Opts,
		  {xmlel, <<"LINE">>, _attrs, _els}) ->
    Cdata = decode_vcard_LINE_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_vcard_LINE_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_LINE_cdata(__TopXMLNS, Cdata);
decode_vcard_LINE_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_LINE_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_vcard_LINE_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_vcard_LINE_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_LINE(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_LINE_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"LINE">>, _attrs, _els}.

decode_vcard_LINE_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_LINE_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_LINE_cdata(<<>>, _acc) -> _acc;
encode_vcard_LINE_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_CTRY(__TopXMLNS, __Opts,
		  {xmlel, <<"CTRY">>, _attrs, _els}) ->
    Cdata = decode_vcard_CTRY_els(__TopXMLNS, __Opts, _els,
				  <<>>),
    Cdata.

decode_vcard_CTRY_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_CTRY_cdata(__TopXMLNS, Cdata);
decode_vcard_CTRY_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_CTRY_els(__TopXMLNS, __Opts, _els,
			  <<Cdata/binary, _data/binary>>);
decode_vcard_CTRY_els(__TopXMLNS, __Opts, [_ | _els],
		      Cdata) ->
    decode_vcard_CTRY_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_CTRY(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_CTRY_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"CTRY">>, _attrs, _els}.

decode_vcard_CTRY_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_CTRY_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_CTRY_cdata(<<>>, _acc) -> _acc;
encode_vcard_CTRY_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_PCODE(__TopXMLNS, __Opts,
		   {xmlel, <<"PCODE">>, _attrs, _els}) ->
    Cdata = decode_vcard_PCODE_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Cdata.

decode_vcard_PCODE_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_PCODE_cdata(__TopXMLNS, Cdata);
decode_vcard_PCODE_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_PCODE_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_vcard_PCODE_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_vcard_PCODE_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_PCODE(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_PCODE_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PCODE">>, _attrs, _els}.

decode_vcard_PCODE_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_PCODE_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_PCODE_cdata(<<>>, _acc) -> _acc;
encode_vcard_PCODE_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_REGION(__TopXMLNS, __Opts,
		    {xmlel, <<"REGION">>, _attrs, _els}) ->
    Cdata = decode_vcard_REGION_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_REGION_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_REGION_cdata(__TopXMLNS, Cdata);
decode_vcard_REGION_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_REGION_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_REGION_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_REGION_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_REGION(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_REGION_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"REGION">>, _attrs, _els}.

decode_vcard_REGION_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_REGION_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_REGION_cdata(<<>>, _acc) -> _acc;
encode_vcard_REGION_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_LOCALITY(__TopXMLNS, __Opts,
		      {xmlel, <<"LOCALITY">>, _attrs, _els}) ->
    Cdata = decode_vcard_LOCALITY_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_vcard_LOCALITY_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_vcard_LOCALITY_cdata(__TopXMLNS, Cdata);
decode_vcard_LOCALITY_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_LOCALITY_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_vcard_LOCALITY_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_vcard_LOCALITY_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_vcard_LOCALITY(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_LOCALITY_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"LOCALITY">>, _attrs, _els}.

decode_vcard_LOCALITY_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_LOCALITY_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_LOCALITY_cdata(<<>>, _acc) -> _acc;
encode_vcard_LOCALITY_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_STREET(__TopXMLNS, __Opts,
		    {xmlel, <<"STREET">>, _attrs, _els}) ->
    Cdata = decode_vcard_STREET_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_STREET_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_STREET_cdata(__TopXMLNS, Cdata);
decode_vcard_STREET_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_STREET_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_STREET_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_STREET_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_STREET(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_STREET_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"STREET">>, _attrs, _els}.

decode_vcard_STREET_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_STREET_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_STREET_cdata(<<>>, _acc) -> _acc;
encode_vcard_STREET_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_EXTADD(__TopXMLNS, __Opts,
		    {xmlel, <<"EXTADD">>, _attrs, _els}) ->
    Cdata = decode_vcard_EXTADD_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_EXTADD_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_EXTADD_cdata(__TopXMLNS, Cdata);
decode_vcard_EXTADD_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_EXTADD_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_EXTADD_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_EXTADD_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_EXTADD(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_EXTADD_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"EXTADD">>, _attrs, _els}.

decode_vcard_EXTADD_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_EXTADD_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_EXTADD_cdata(<<>>, _acc) -> _acc;
encode_vcard_EXTADD_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_POBOX(__TopXMLNS, __Opts,
		   {xmlel, <<"POBOX">>, _attrs, _els}) ->
    Cdata = decode_vcard_POBOX_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Cdata.

decode_vcard_POBOX_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_POBOX_cdata(__TopXMLNS, Cdata);
decode_vcard_POBOX_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_POBOX_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_vcard_POBOX_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_vcard_POBOX_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_POBOX(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_POBOX_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"POBOX">>, _attrs, _els}.

decode_vcard_POBOX_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_POBOX_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_POBOX_cdata(<<>>, _acc) -> _acc;
encode_vcard_POBOX_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_SUFFIX(__TopXMLNS, __Opts,
		    {xmlel, <<"SUFFIX">>, _attrs, _els}) ->
    Cdata = decode_vcard_SUFFIX_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_SUFFIX_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_SUFFIX_cdata(__TopXMLNS, Cdata);
decode_vcard_SUFFIX_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_SUFFIX_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_SUFFIX_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_SUFFIX_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_SUFFIX(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_SUFFIX_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"SUFFIX">>, _attrs, _els}.

decode_vcard_SUFFIX_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_SUFFIX_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_SUFFIX_cdata(<<>>, _acc) -> _acc;
encode_vcard_SUFFIX_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_PREFIX(__TopXMLNS, __Opts,
		    {xmlel, <<"PREFIX">>, _attrs, _els}) ->
    Cdata = decode_vcard_PREFIX_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_PREFIX_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_PREFIX_cdata(__TopXMLNS, Cdata);
decode_vcard_PREFIX_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_PREFIX_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_PREFIX_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_PREFIX_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_PREFIX(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_PREFIX_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PREFIX">>, _attrs, _els}.

decode_vcard_PREFIX_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_PREFIX_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_PREFIX_cdata(<<>>, _acc) -> _acc;
encode_vcard_PREFIX_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_MIDDLE(__TopXMLNS, __Opts,
		    {xmlel, <<"MIDDLE">>, _attrs, _els}) ->
    Cdata = decode_vcard_MIDDLE_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_MIDDLE_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_MIDDLE_cdata(__TopXMLNS, Cdata);
decode_vcard_MIDDLE_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_MIDDLE_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_MIDDLE_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_MIDDLE_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_MIDDLE(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_MIDDLE_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"MIDDLE">>, _attrs, _els}.

decode_vcard_MIDDLE_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_MIDDLE_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_MIDDLE_cdata(<<>>, _acc) -> _acc;
encode_vcard_MIDDLE_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_GIVEN(__TopXMLNS, __Opts,
		   {xmlel, <<"GIVEN">>, _attrs, _els}) ->
    Cdata = decode_vcard_GIVEN_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Cdata.

decode_vcard_GIVEN_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_vcard_GIVEN_cdata(__TopXMLNS, Cdata);
decode_vcard_GIVEN_els(__TopXMLNS, __Opts,
		       [{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_GIVEN_els(__TopXMLNS, __Opts, _els,
			   <<Cdata/binary, _data/binary>>);
decode_vcard_GIVEN_els(__TopXMLNS, __Opts, [_ | _els],
		       Cdata) ->
    decode_vcard_GIVEN_els(__TopXMLNS, __Opts, _els, Cdata).

encode_vcard_GIVEN(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_GIVEN_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"GIVEN">>, _attrs, _els}.

decode_vcard_GIVEN_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_GIVEN_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_GIVEN_cdata(<<>>, _acc) -> _acc;
encode_vcard_GIVEN_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_FAMILY(__TopXMLNS, __Opts,
		    {xmlel, <<"FAMILY">>, _attrs, _els}) ->
    Cdata = decode_vcard_FAMILY_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    Cdata.

decode_vcard_FAMILY_els(__TopXMLNS, __Opts, [],
			Cdata) ->
    decode_vcard_FAMILY_cdata(__TopXMLNS, Cdata);
decode_vcard_FAMILY_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Cdata) ->
    decode_vcard_FAMILY_els(__TopXMLNS, __Opts, _els,
			    <<Cdata/binary, _data/binary>>);
decode_vcard_FAMILY_els(__TopXMLNS, __Opts, [_ | _els],
			Cdata) ->
    decode_vcard_FAMILY_els(__TopXMLNS, __Opts, _els,
			    Cdata).

encode_vcard_FAMILY(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_vcard_FAMILY_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"FAMILY">>, _attrs, _els}.

decode_vcard_FAMILY_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_vcard_FAMILY_cdata(__TopXMLNS, _val) -> _val.

encode_vcard_FAMILY_cdata(<<>>, _acc) -> _acc;
encode_vcard_FAMILY_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_vcard_X400(__TopXMLNS, __Opts,
		  {xmlel, <<"X400">>, _attrs, _els}) ->
    true.

encode_vcard_X400(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"X400">>, _attrs, _els}.

decode_vcard_INTERNET(__TopXMLNS, __Opts,
		      {xmlel, <<"INTERNET">>, _attrs, _els}) ->
    true.

encode_vcard_INTERNET(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"INTERNET">>, _attrs, _els}.

decode_vcard_PREF(__TopXMLNS, __Opts,
		  {xmlel, <<"PREF">>, _attrs, _els}) ->
    true.

encode_vcard_PREF(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PREF">>, _attrs, _els}.

decode_vcard_INTL(__TopXMLNS, __Opts,
		  {xmlel, <<"INTL">>, _attrs, _els}) ->
    true.

encode_vcard_INTL(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"INTL">>, _attrs, _els}.

decode_vcard_DOM(__TopXMLNS, __Opts,
		 {xmlel, <<"DOM">>, _attrs, _els}) ->
    true.

encode_vcard_DOM(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"DOM">>, _attrs, _els}.

decode_vcard_PARCEL(__TopXMLNS, __Opts,
		    {xmlel, <<"PARCEL">>, _attrs, _els}) ->
    true.

encode_vcard_PARCEL(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PARCEL">>, _attrs, _els}.

decode_vcard_POSTAL(__TopXMLNS, __Opts,
		    {xmlel, <<"POSTAL">>, _attrs, _els}) ->
    true.

encode_vcard_POSTAL(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"POSTAL">>, _attrs, _els}.

decode_vcard_PCS(__TopXMLNS, __Opts,
		 {xmlel, <<"PCS">>, _attrs, _els}) ->
    true.

encode_vcard_PCS(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PCS">>, _attrs, _els}.

decode_vcard_ISDN(__TopXMLNS, __Opts,
		  {xmlel, <<"ISDN">>, _attrs, _els}) ->
    true.

encode_vcard_ISDN(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"ISDN">>, _attrs, _els}.

decode_vcard_MODEM(__TopXMLNS, __Opts,
		   {xmlel, <<"MODEM">>, _attrs, _els}) ->
    true.

encode_vcard_MODEM(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"MODEM">>, _attrs, _els}.

decode_vcard_BBS(__TopXMLNS, __Opts,
		 {xmlel, <<"BBS">>, _attrs, _els}) ->
    true.

encode_vcard_BBS(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"BBS">>, _attrs, _els}.

decode_vcard_VIDEO(__TopXMLNS, __Opts,
		   {xmlel, <<"VIDEO">>, _attrs, _els}) ->
    true.

encode_vcard_VIDEO(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"VIDEO">>, _attrs, _els}.

decode_vcard_CELL(__TopXMLNS, __Opts,
		  {xmlel, <<"CELL">>, _attrs, _els}) ->
    true.

encode_vcard_CELL(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"CELL">>, _attrs, _els}.

decode_vcard_MSG(__TopXMLNS, __Opts,
		 {xmlel, <<"MSG">>, _attrs, _els}) ->
    true.

encode_vcard_MSG(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"MSG">>, _attrs, _els}.

decode_vcard_PAGER(__TopXMLNS, __Opts,
		   {xmlel, <<"PAGER">>, _attrs, _els}) ->
    true.

encode_vcard_PAGER(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PAGER">>, _attrs, _els}.

decode_vcard_FAX(__TopXMLNS, __Opts,
		 {xmlel, <<"FAX">>, _attrs, _els}) ->
    true.

encode_vcard_FAX(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"FAX">>, _attrs, _els}.

decode_vcard_VOICE(__TopXMLNS, __Opts,
		   {xmlel, <<"VOICE">>, _attrs, _els}) ->
    true.

encode_vcard_VOICE(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"VOICE">>, _attrs, _els}.

decode_vcard_WORK(__TopXMLNS, __Opts,
		  {xmlel, <<"WORK">>, _attrs, _els}) ->
    true.

encode_vcard_WORK(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"WORK">>, _attrs, _els}.

decode_vcard_HOME(__TopXMLNS, __Opts,
		  {xmlel, <<"HOME">>, _attrs, _els}) ->
    true.

encode_vcard_HOME(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"vcard-temp">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"HOME">>, _attrs, _els}.
