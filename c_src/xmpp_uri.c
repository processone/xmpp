
#line 1 "xmpp_uri.rl"
#include <erl_nif.h>
#include <string.h>


#line 9 "xmpp_uri.rl"


static const int xmpp_uri_start = 1;

static int load(ErlNifEnv* env, void** priv, ERL_NIF_TERM load_info)
{
  return 0;
}

static ERL_NIF_TERM is_valid(ErlNifEnv* env, int argc,
			     const ERL_NIF_TERM argv[])
{
  ErlNifBinary input;
  int cs = 0, ret = 1;
  if (argc != 1)
    return enif_make_badarg(env);

  if (!(enif_inspect_binary(env, argv[0], &input)))
    return enif_make_badarg(env);

  if (!input.size)
    return enif_make_atom(env, "false");

  char *p = (char *) input.data;
  char *pe = p + input.size;
  char *eof = pe;

  
#line 37 "xmpp_uri.c"
	{
	cs = xmpp_uri_start;
	}

#line 37 "xmpp_uri.rl"
  
#line 44 "xmpp_uri.c"
	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
case 1:
	switch( (*p) ) {
		case 88: goto st2;
		case 120: goto st2;
	}
	goto tr0;
tr0:
#line 7 "xmpp_uri.rl"
	{ ret=0; }
	goto st0;
#line 60 "xmpp_uri.c"
st0:
cs = 0;
	goto _out;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
	switch( (*p) ) {
		case 77: goto st3;
		case 109: goto st3;
	}
	goto tr0;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
	switch( (*p) ) {
		case 80: goto st4;
		case 112: goto st4;
	}
	goto tr0;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
	switch( (*p) ) {
		case 80: goto st5;
		case 112: goto st5;
	}
	goto tr0;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
	if ( (*p) == 58 )
		goto st6;
	goto tr0;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
	switch( (*p) ) {
		case 33: goto st339;
		case 36: goto st339;
		case 37: goto st9;
		case 47: goto st176;
		case 59: goto st339;
		case 61: goto st339;
		case 64: goto st20;
		case 91: goto st21;
		case 95: goto st339;
		case 126: goto st339;
	}
	if ( (*p) < 40 ) {
		if ( 38 <= (*p) && (*p) <= 39 )
			goto st341;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st339;
		} else if ( (*p) >= 65 )
			goto st339;
	} else
		goto st339;
	goto tr0;
st339:
	if ( ++p == pe )
		goto _test_eof339;
case 339:
	switch( (*p) ) {
		case 33: goto st339;
		case 35: goto st340;
		case 36: goto st339;
		case 37: goto st9;
		case 47: goto st342;
		case 59: goto st339;
		case 61: goto st339;
		case 63: goto st343;
		case 64: goto st20;
		case 95: goto st339;
		case 126: goto st339;
	}
	if ( (*p) < 40 ) {
		if ( 38 <= (*p) && (*p) <= 39 )
			goto st341;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st339;
		} else if ( (*p) >= 65 )
			goto st339;
	} else
		goto st339;
	goto tr0;
st340:
	if ( ++p == pe )
		goto _test_eof340;
case 340:
	switch( (*p) ) {
		case 33: goto st340;
		case 37: goto st7;
		case 61: goto st340;
		case 95: goto st340;
		case 126: goto st340;
	}
	if ( (*p) < 63 ) {
		if ( 36 <= (*p) && (*p) <= 59 )
			goto st340;
	} else if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto st340;
	} else
		goto st340;
	goto tr0;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st8;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st8;
	} else
		goto st8;
	goto tr0;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st340;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st340;
	} else
		goto st340;
	goto tr0;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st10;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st10;
	} else
		goto st10;
	goto tr0;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st339;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st339;
	} else
		goto st339;
	goto tr0;
st341:
	if ( ++p == pe )
		goto _test_eof341;
case 341:
	switch( (*p) ) {
		case 33: goto st341;
		case 35: goto st340;
		case 37: goto st11;
		case 47: goto st342;
		case 59: goto st341;
		case 61: goto st341;
		case 63: goto st343;
		case 95: goto st341;
		case 126: goto st341;
	}
	if ( (*p) < 65 ) {
		if ( 36 <= (*p) && (*p) <= 57 )
			goto st341;
	} else if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto st341;
	} else
		goto st341;
	goto tr0;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st12;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st12;
	} else
		goto st12;
	goto tr0;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st341;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st341;
	} else
		goto st341;
	goto tr0;
st342:
	if ( ++p == pe )
		goto _test_eof342;
case 342:
	switch( (*p) ) {
		case 33: goto st342;
		case 35: goto st340;
		case 37: goto st13;
		case 61: goto st342;
		case 63: goto st343;
		case 95: goto st342;
		case 126: goto st342;
	}
	if ( (*p) < 48 ) {
		if ( 36 <= (*p) && (*p) <= 46 )
			goto st342;
	} else if ( (*p) > 59 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st342;
		} else if ( (*p) >= 65 )
			goto st342;
	} else
		goto st342;
	goto tr0;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st14;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st14;
	} else
		goto st14;
	goto tr0;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st342;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st342;
	} else
		goto st342;
	goto tr0;
st343:
	if ( ++p == pe )
		goto _test_eof343;
case 343:
	switch( (*p) ) {
		case 35: goto st340;
		case 37: goto st15;
		case 59: goto st17;
		case 95: goto st343;
		case 126: goto st343;
	}
	if ( (*p) < 48 ) {
		if ( 45 <= (*p) && (*p) <= 46 )
			goto st343;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st343;
		} else if ( (*p) >= 65 )
			goto st343;
	} else
		goto st343;
	goto tr0;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st16;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st16;
	} else
		goto st16;
	goto tr0;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st343;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st343;
	} else
		goto st343;
	goto tr0;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	switch( (*p) ) {
		case 37: goto st18;
		case 61: goto st343;
		case 95: goto st17;
		case 126: goto st17;
	}
	if ( (*p) < 48 ) {
		if ( 45 <= (*p) && (*p) <= 46 )
			goto st17;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st17;
		} else if ( (*p) >= 65 )
			goto st17;
	} else
		goto st17;
	goto tr0;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st19;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st19;
	} else
		goto st19;
	goto tr0;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st17;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st17;
	} else
		goto st17;
	goto tr0;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
	switch( (*p) ) {
		case 33: goto st341;
		case 37: goto st11;
		case 59: goto st341;
		case 61: goto st341;
		case 91: goto st21;
		case 95: goto st341;
		case 126: goto st341;
	}
	if ( (*p) < 48 ) {
		if ( 36 <= (*p) && (*p) <= 46 )
			goto st341;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st341;
		} else if ( (*p) >= 65 )
			goto st341;
	} else
		goto st341;
	goto tr0;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	switch( (*p) ) {
		case 58: goto st157;
		case 86: goto st172;
		case 118: goto st172;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st22;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st22;
	} else
		goto st22;
	goto tr0;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
	if ( (*p) == 58 )
		goto st26;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st23;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st23;
	} else
		goto st23;
	goto tr0;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
	if ( (*p) == 58 )
		goto st26;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st24;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st24;
	} else
		goto st24;
	goto tr0;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
	if ( (*p) == 58 )
		goto st26;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st25;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st25;
	} else
		goto st25;
	goto tr0;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
	if ( (*p) == 58 )
		goto st26;
	goto tr0;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
	if ( (*p) == 58 )
		goto st143;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st27;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st27;
	} else
		goto st27;
	goto tr0;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
	if ( (*p) == 58 )
		goto st31;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st28;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st28;
	} else
		goto st28;
	goto tr0;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
	if ( (*p) == 58 )
		goto st31;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st29;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st29;
	} else
		goto st29;
	goto tr0;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	if ( (*p) == 58 )
		goto st31;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st30;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st30;
	} else
		goto st30;
	goto tr0;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
	if ( (*p) == 58 )
		goto st31;
	goto tr0;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
	if ( (*p) == 58 )
		goto st129;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st32;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st32;
	} else
		goto st32;
	goto tr0;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
	if ( (*p) == 58 )
		goto st36;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st33;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st33;
	} else
		goto st33;
	goto tr0;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
	if ( (*p) == 58 )
		goto st36;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st34;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st34;
	} else
		goto st34;
	goto tr0;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
	if ( (*p) == 58 )
		goto st36;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st35;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st35;
	} else
		goto st35;
	goto tr0;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
	if ( (*p) == 58 )
		goto st36;
	goto tr0;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
	if ( (*p) == 58 )
		goto st115;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st37;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st37;
	} else
		goto st37;
	goto tr0;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
	if ( (*p) == 58 )
		goto st41;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st38;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st38;
	} else
		goto st38;
	goto tr0;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
	if ( (*p) == 58 )
		goto st41;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st39;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st39;
	} else
		goto st39;
	goto tr0;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
	if ( (*p) == 58 )
		goto st41;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st40;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st40;
	} else
		goto st40;
	goto tr0;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
	if ( (*p) == 58 )
		goto st41;
	goto tr0;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
	if ( (*p) == 58 )
		goto st101;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st42;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st42;
	} else
		goto st42;
	goto tr0;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
	if ( (*p) == 58 )
		goto st46;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st43;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st43;
	} else
		goto st43;
	goto tr0;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
	if ( (*p) == 58 )
		goto st46;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st44;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st44;
	} else
		goto st44;
	goto tr0;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
	if ( (*p) == 58 )
		goto st46;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st45;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st45;
	} else
		goto st45;
	goto tr0;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
	if ( (*p) == 58 )
		goto st46;
	goto tr0;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
	if ( (*p) == 58 )
		goto st87;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st47;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st47;
	} else
		goto st47;
	goto tr0;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
	if ( (*p) == 58 )
		goto st51;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st48;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st48;
	} else
		goto st48;
	goto tr0;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
	if ( (*p) == 58 )
		goto st51;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st49;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st49;
	} else
		goto st49;
	goto tr0;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
	if ( (*p) == 58 )
		goto st51;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st50;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st50;
	} else
		goto st50;
	goto tr0;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
	if ( (*p) == 58 )
		goto st51;
	goto tr0;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
	switch( (*p) ) {
		case 48: goto st52;
		case 49: goto st78;
		case 50: goto st81;
		case 58: goto st85;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st84;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st86;
	} else
		goto st86;
	goto tr0;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st74;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st71;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st71;
	} else
		goto st71;
	goto tr0;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
	switch( (*p) ) {
		case 48: goto st54;
		case 49: goto st67;
		case 50: goto st69;
	}
	if ( 51 <= (*p) && (*p) <= 57 )
		goto st68;
	goto tr0;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
	if ( (*p) == 46 )
		goto st55;
	goto tr0;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
	switch( (*p) ) {
		case 48: goto st56;
		case 49: goto st63;
		case 50: goto st65;
	}
	if ( 51 <= (*p) && (*p) <= 57 )
		goto st64;
	goto tr0;
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
	if ( (*p) == 46 )
		goto st57;
	goto tr0;
st57:
	if ( ++p == pe )
		goto _test_eof57;
case 57:
	switch( (*p) ) {
		case 48: goto st58;
		case 49: goto st59;
		case 50: goto st61;
	}
	if ( 51 <= (*p) && (*p) <= 57 )
		goto st60;
	goto tr0;
st58:
	if ( ++p == pe )
		goto _test_eof58;
case 58:
	if ( (*p) == 93 )
		goto st344;
	goto tr0;
st344:
	if ( ++p == pe )
		goto _test_eof344;
case 344:
	switch( (*p) ) {
		case 35: goto st340;
		case 47: goto st342;
		case 63: goto st343;
	}
	goto tr0;
st59:
	if ( ++p == pe )
		goto _test_eof59;
case 59:
	if ( (*p) == 93 )
		goto st344;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st60;
	goto tr0;
st60:
	if ( ++p == pe )
		goto _test_eof60;
case 60:
	if ( (*p) == 93 )
		goto st344;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st58;
	goto tr0;
st61:
	if ( ++p == pe )
		goto _test_eof61;
case 61:
	switch( (*p) ) {
		case 53: goto st62;
		case 93: goto st344;
	}
	if ( (*p) > 52 ) {
		if ( 54 <= (*p) && (*p) <= 57 )
			goto st58;
	} else if ( (*p) >= 48 )
		goto st60;
	goto tr0;
st62:
	if ( ++p == pe )
		goto _test_eof62;
case 62:
	if ( (*p) == 93 )
		goto st344;
	if ( 48 <= (*p) && (*p) <= 53 )
		goto st58;
	goto tr0;
st63:
	if ( ++p == pe )
		goto _test_eof63;
case 63:
	if ( (*p) == 46 )
		goto st57;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st64;
	goto tr0;
st64:
	if ( ++p == pe )
		goto _test_eof64;
case 64:
	if ( (*p) == 46 )
		goto st57;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st56;
	goto tr0;
st65:
	if ( ++p == pe )
		goto _test_eof65;
case 65:
	switch( (*p) ) {
		case 46: goto st57;
		case 53: goto st66;
	}
	if ( (*p) > 52 ) {
		if ( 54 <= (*p) && (*p) <= 57 )
			goto st56;
	} else if ( (*p) >= 48 )
		goto st64;
	goto tr0;
st66:
	if ( ++p == pe )
		goto _test_eof66;
case 66:
	if ( (*p) == 46 )
		goto st57;
	if ( 48 <= (*p) && (*p) <= 53 )
		goto st56;
	goto tr0;
st67:
	if ( ++p == pe )
		goto _test_eof67;
case 67:
	if ( (*p) == 46 )
		goto st55;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st68;
	goto tr0;
st68:
	if ( ++p == pe )
		goto _test_eof68;
case 68:
	if ( (*p) == 46 )
		goto st55;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st54;
	goto tr0;
st69:
	if ( ++p == pe )
		goto _test_eof69;
case 69:
	switch( (*p) ) {
		case 46: goto st55;
		case 53: goto st70;
	}
	if ( (*p) > 52 ) {
		if ( 54 <= (*p) && (*p) <= 57 )
			goto st54;
	} else if ( (*p) >= 48 )
		goto st68;
	goto tr0;
st70:
	if ( ++p == pe )
		goto _test_eof70;
case 70:
	if ( (*p) == 46 )
		goto st55;
	if ( 48 <= (*p) && (*p) <= 53 )
		goto st54;
	goto tr0;
st71:
	if ( ++p == pe )
		goto _test_eof71;
case 71:
	if ( (*p) == 58 )
		goto st74;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st72;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st72;
	} else
		goto st72;
	goto tr0;
st72:
	if ( ++p == pe )
		goto _test_eof72;
case 72:
	if ( (*p) == 58 )
		goto st74;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st73;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st73;
	} else
		goto st73;
	goto tr0;
st73:
	if ( ++p == pe )
		goto _test_eof73;
case 73:
	if ( (*p) == 58 )
		goto st74;
	goto tr0;
st74:
	if ( ++p == pe )
		goto _test_eof74;
case 74:
	if ( (*p) == 58 )
		goto st58;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st75;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st75;
	} else
		goto st75;
	goto tr0;
st75:
	if ( ++p == pe )
		goto _test_eof75;
case 75:
	if ( (*p) == 93 )
		goto st344;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st76;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st76;
	} else
		goto st76;
	goto tr0;
st76:
	if ( ++p == pe )
		goto _test_eof76;
case 76:
	if ( (*p) == 93 )
		goto st344;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st77;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st77;
	} else
		goto st77;
	goto tr0;
st77:
	if ( ++p == pe )
		goto _test_eof77;
case 77:
	if ( (*p) == 93 )
		goto st344;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st58;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st58;
	} else
		goto st58;
	goto tr0;
st78:
	if ( ++p == pe )
		goto _test_eof78;
case 78:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st74;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st79;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st71;
	} else
		goto st71;
	goto tr0;
st79:
	if ( ++p == pe )
		goto _test_eof79;
case 79:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st74;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st80;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st72;
	} else
		goto st72;
	goto tr0;
st80:
	if ( ++p == pe )
		goto _test_eof80;
case 80:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st74;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st73;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st73;
	} else
		goto st73;
	goto tr0;
st81:
	if ( ++p == pe )
		goto _test_eof81;
case 81:
	switch( (*p) ) {
		case 46: goto st53;
		case 53: goto st82;
		case 58: goto st74;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st79;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st71;
		} else if ( (*p) >= 65 )
			goto st71;
	} else
		goto st83;
	goto tr0;
st82:
	if ( ++p == pe )
		goto _test_eof82;
case 82:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st74;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st80;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st72;
		} else if ( (*p) >= 65 )
			goto st72;
	} else
		goto st72;
	goto tr0;
st83:
	if ( ++p == pe )
		goto _test_eof83;
case 83:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st74;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st72;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st72;
	} else
		goto st72;
	goto tr0;
st84:
	if ( ++p == pe )
		goto _test_eof84;
case 84:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st74;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st83;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st71;
	} else
		goto st71;
	goto tr0;
st85:
	if ( ++p == pe )
		goto _test_eof85;
case 85:
	if ( (*p) == 93 )
		goto st344;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st75;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st75;
	} else
		goto st75;
	goto tr0;
st86:
	if ( ++p == pe )
		goto _test_eof86;
case 86:
	if ( (*p) == 58 )
		goto st74;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st71;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st71;
	} else
		goto st71;
	goto tr0;
st87:
	if ( ++p == pe )
		goto _test_eof87;
case 87:
	switch( (*p) ) {
		case 48: goto st88;
		case 49: goto st93;
		case 50: goto st96;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st99;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st100;
	} else
		goto st100;
	goto tr0;
st88:
	if ( ++p == pe )
		goto _test_eof88;
case 88:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st89;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st89;
	} else
		goto st89;
	goto tr0;
st89:
	if ( ++p == pe )
		goto _test_eof89;
case 89:
	switch( (*p) ) {
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st90;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st90;
	} else
		goto st90;
	goto tr0;
st90:
	if ( ++p == pe )
		goto _test_eof90;
case 90:
	switch( (*p) ) {
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st91;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st91;
	} else
		goto st91;
	goto tr0;
st91:
	if ( ++p == pe )
		goto _test_eof91;
case 91:
	switch( (*p) ) {
		case 58: goto st92;
		case 93: goto st344;
	}
	goto tr0;
st92:
	if ( ++p == pe )
		goto _test_eof92;
case 92:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st75;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st75;
	} else
		goto st75;
	goto tr0;
st93:
	if ( ++p == pe )
		goto _test_eof93;
case 93:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st94;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st89;
	} else
		goto st89;
	goto tr0;
st94:
	if ( ++p == pe )
		goto _test_eof94;
case 94:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st95;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st90;
	} else
		goto st90;
	goto tr0;
st95:
	if ( ++p == pe )
		goto _test_eof95;
case 95:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st91;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st91;
	} else
		goto st91;
	goto tr0;
st96:
	if ( ++p == pe )
		goto _test_eof96;
case 96:
	switch( (*p) ) {
		case 46: goto st53;
		case 53: goto st97;
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st94;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st89;
		} else if ( (*p) >= 65 )
			goto st89;
	} else
		goto st98;
	goto tr0;
st97:
	if ( ++p == pe )
		goto _test_eof97;
case 97:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st95;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st90;
		} else if ( (*p) >= 65 )
			goto st90;
	} else
		goto st90;
	goto tr0;
st98:
	if ( ++p == pe )
		goto _test_eof98;
case 98:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st90;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st90;
	} else
		goto st90;
	goto tr0;
st99:
	if ( ++p == pe )
		goto _test_eof99;
case 99:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st98;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st89;
	} else
		goto st89;
	goto tr0;
st100:
	if ( ++p == pe )
		goto _test_eof100;
case 100:
	switch( (*p) ) {
		case 58: goto st92;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st89;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st89;
	} else
		goto st89;
	goto tr0;
st101:
	if ( ++p == pe )
		goto _test_eof101;
case 101:
	switch( (*p) ) {
		case 48: goto st102;
		case 49: goto st107;
		case 50: goto st110;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st113;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st114;
	} else
		goto st114;
	goto tr0;
st102:
	if ( ++p == pe )
		goto _test_eof102;
case 102:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st103;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st103;
	} else
		goto st103;
	goto tr0;
st103:
	if ( ++p == pe )
		goto _test_eof103;
case 103:
	switch( (*p) ) {
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st104;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st104;
	} else
		goto st104;
	goto tr0;
st104:
	if ( ++p == pe )
		goto _test_eof104;
case 104:
	switch( (*p) ) {
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st105;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st105;
	} else
		goto st105;
	goto tr0;
st105:
	if ( ++p == pe )
		goto _test_eof105;
case 105:
	switch( (*p) ) {
		case 58: goto st106;
		case 93: goto st344;
	}
	goto tr0;
st106:
	if ( ++p == pe )
		goto _test_eof106;
case 106:
	switch( (*p) ) {
		case 48: goto st88;
		case 49: goto st93;
		case 50: goto st96;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st99;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st100;
	} else
		goto st100;
	goto tr0;
st107:
	if ( ++p == pe )
		goto _test_eof107;
case 107:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st108;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st103;
	} else
		goto st103;
	goto tr0;
st108:
	if ( ++p == pe )
		goto _test_eof108;
case 108:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st109;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st104;
	} else
		goto st104;
	goto tr0;
st109:
	if ( ++p == pe )
		goto _test_eof109;
case 109:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st105;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st105;
	} else
		goto st105;
	goto tr0;
st110:
	if ( ++p == pe )
		goto _test_eof110;
case 110:
	switch( (*p) ) {
		case 46: goto st53;
		case 53: goto st111;
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st108;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st103;
		} else if ( (*p) >= 65 )
			goto st103;
	} else
		goto st112;
	goto tr0;
st111:
	if ( ++p == pe )
		goto _test_eof111;
case 111:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st109;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st104;
		} else if ( (*p) >= 65 )
			goto st104;
	} else
		goto st104;
	goto tr0;
st112:
	if ( ++p == pe )
		goto _test_eof112;
case 112:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st104;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st104;
	} else
		goto st104;
	goto tr0;
st113:
	if ( ++p == pe )
		goto _test_eof113;
case 113:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st112;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st103;
	} else
		goto st103;
	goto tr0;
st114:
	if ( ++p == pe )
		goto _test_eof114;
case 114:
	switch( (*p) ) {
		case 58: goto st106;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st103;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st103;
	} else
		goto st103;
	goto tr0;
st115:
	if ( ++p == pe )
		goto _test_eof115;
case 115:
	switch( (*p) ) {
		case 48: goto st116;
		case 49: goto st121;
		case 50: goto st124;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st127;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st128;
	} else
		goto st128;
	goto tr0;
st116:
	if ( ++p == pe )
		goto _test_eof116;
case 116:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st117;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st117;
	} else
		goto st117;
	goto tr0;
st117:
	if ( ++p == pe )
		goto _test_eof117;
case 117:
	switch( (*p) ) {
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st118;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st118;
	} else
		goto st118;
	goto tr0;
st118:
	if ( ++p == pe )
		goto _test_eof118;
case 118:
	switch( (*p) ) {
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st119;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st119;
	} else
		goto st119;
	goto tr0;
st119:
	if ( ++p == pe )
		goto _test_eof119;
case 119:
	switch( (*p) ) {
		case 58: goto st120;
		case 93: goto st344;
	}
	goto tr0;
st120:
	if ( ++p == pe )
		goto _test_eof120;
case 120:
	switch( (*p) ) {
		case 48: goto st102;
		case 49: goto st107;
		case 50: goto st110;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st113;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st114;
	} else
		goto st114;
	goto tr0;
st121:
	if ( ++p == pe )
		goto _test_eof121;
case 121:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st122;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st117;
	} else
		goto st117;
	goto tr0;
st122:
	if ( ++p == pe )
		goto _test_eof122;
case 122:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st123;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st118;
	} else
		goto st118;
	goto tr0;
st123:
	if ( ++p == pe )
		goto _test_eof123;
case 123:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st119;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st119;
	} else
		goto st119;
	goto tr0;
st124:
	if ( ++p == pe )
		goto _test_eof124;
case 124:
	switch( (*p) ) {
		case 46: goto st53;
		case 53: goto st125;
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st122;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st117;
		} else if ( (*p) >= 65 )
			goto st117;
	} else
		goto st126;
	goto tr0;
st125:
	if ( ++p == pe )
		goto _test_eof125;
case 125:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st123;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st118;
		} else if ( (*p) >= 65 )
			goto st118;
	} else
		goto st118;
	goto tr0;
st126:
	if ( ++p == pe )
		goto _test_eof126;
case 126:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st118;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st118;
	} else
		goto st118;
	goto tr0;
st127:
	if ( ++p == pe )
		goto _test_eof127;
case 127:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st126;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st117;
	} else
		goto st117;
	goto tr0;
st128:
	if ( ++p == pe )
		goto _test_eof128;
case 128:
	switch( (*p) ) {
		case 58: goto st120;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st117;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st117;
	} else
		goto st117;
	goto tr0;
st129:
	if ( ++p == pe )
		goto _test_eof129;
case 129:
	switch( (*p) ) {
		case 48: goto st130;
		case 49: goto st135;
		case 50: goto st138;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st141;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st142;
	} else
		goto st142;
	goto tr0;
st130:
	if ( ++p == pe )
		goto _test_eof130;
case 130:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st131;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st131;
	} else
		goto st131;
	goto tr0;
st131:
	if ( ++p == pe )
		goto _test_eof131;
case 131:
	switch( (*p) ) {
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st132;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st132;
	} else
		goto st132;
	goto tr0;
st132:
	if ( ++p == pe )
		goto _test_eof132;
case 132:
	switch( (*p) ) {
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st133;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st133;
	} else
		goto st133;
	goto tr0;
st133:
	if ( ++p == pe )
		goto _test_eof133;
case 133:
	switch( (*p) ) {
		case 58: goto st134;
		case 93: goto st344;
	}
	goto tr0;
st134:
	if ( ++p == pe )
		goto _test_eof134;
case 134:
	switch( (*p) ) {
		case 48: goto st116;
		case 49: goto st121;
		case 50: goto st124;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st127;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st128;
	} else
		goto st128;
	goto tr0;
st135:
	if ( ++p == pe )
		goto _test_eof135;
case 135:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st136;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st131;
	} else
		goto st131;
	goto tr0;
st136:
	if ( ++p == pe )
		goto _test_eof136;
case 136:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st137;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st132;
	} else
		goto st132;
	goto tr0;
st137:
	if ( ++p == pe )
		goto _test_eof137;
case 137:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st133;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st133;
	} else
		goto st133;
	goto tr0;
st138:
	if ( ++p == pe )
		goto _test_eof138;
case 138:
	switch( (*p) ) {
		case 46: goto st53;
		case 53: goto st139;
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st136;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st131;
		} else if ( (*p) >= 65 )
			goto st131;
	} else
		goto st140;
	goto tr0;
st139:
	if ( ++p == pe )
		goto _test_eof139;
case 139:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st137;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st132;
		} else if ( (*p) >= 65 )
			goto st132;
	} else
		goto st132;
	goto tr0;
st140:
	if ( ++p == pe )
		goto _test_eof140;
case 140:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st132;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st132;
	} else
		goto st132;
	goto tr0;
st141:
	if ( ++p == pe )
		goto _test_eof141;
case 141:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st140;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st131;
	} else
		goto st131;
	goto tr0;
st142:
	if ( ++p == pe )
		goto _test_eof142;
case 142:
	switch( (*p) ) {
		case 58: goto st134;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st131;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st131;
	} else
		goto st131;
	goto tr0;
st143:
	if ( ++p == pe )
		goto _test_eof143;
case 143:
	switch( (*p) ) {
		case 48: goto st144;
		case 49: goto st149;
		case 50: goto st152;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st155;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st156;
	} else
		goto st156;
	goto tr0;
st144:
	if ( ++p == pe )
		goto _test_eof144;
case 144:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st145;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st145;
	} else
		goto st145;
	goto tr0;
st145:
	if ( ++p == pe )
		goto _test_eof145;
case 145:
	switch( (*p) ) {
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st146;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st146;
	} else
		goto st146;
	goto tr0;
st146:
	if ( ++p == pe )
		goto _test_eof146;
case 146:
	switch( (*p) ) {
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st147;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st147;
	} else
		goto st147;
	goto tr0;
st147:
	if ( ++p == pe )
		goto _test_eof147;
case 147:
	switch( (*p) ) {
		case 58: goto st148;
		case 93: goto st344;
	}
	goto tr0;
st148:
	if ( ++p == pe )
		goto _test_eof148;
case 148:
	switch( (*p) ) {
		case 48: goto st130;
		case 49: goto st135;
		case 50: goto st138;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st141;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st142;
	} else
		goto st142;
	goto tr0;
st149:
	if ( ++p == pe )
		goto _test_eof149;
case 149:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st150;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st145;
	} else
		goto st145;
	goto tr0;
st150:
	if ( ++p == pe )
		goto _test_eof150;
case 150:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st151;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st146;
	} else
		goto st146;
	goto tr0;
st151:
	if ( ++p == pe )
		goto _test_eof151;
case 151:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st147;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st147;
	} else
		goto st147;
	goto tr0;
st152:
	if ( ++p == pe )
		goto _test_eof152;
case 152:
	switch( (*p) ) {
		case 46: goto st53;
		case 53: goto st153;
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st150;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st145;
		} else if ( (*p) >= 65 )
			goto st145;
	} else
		goto st154;
	goto tr0;
st153:
	if ( ++p == pe )
		goto _test_eof153;
case 153:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st151;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st146;
		} else if ( (*p) >= 65 )
			goto st146;
	} else
		goto st146;
	goto tr0;
st154:
	if ( ++p == pe )
		goto _test_eof154;
case 154:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st146;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st146;
	} else
		goto st146;
	goto tr0;
st155:
	if ( ++p == pe )
		goto _test_eof155;
case 155:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st154;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st145;
	} else
		goto st145;
	goto tr0;
st156:
	if ( ++p == pe )
		goto _test_eof156;
case 156:
	switch( (*p) ) {
		case 58: goto st148;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st145;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st145;
	} else
		goto st145;
	goto tr0;
st157:
	if ( ++p == pe )
		goto _test_eof157;
case 157:
	if ( (*p) == 58 )
		goto st158;
	goto tr0;
st158:
	if ( ++p == pe )
		goto _test_eof158;
case 158:
	switch( (*p) ) {
		case 48: goto st159;
		case 49: goto st164;
		case 50: goto st167;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st170;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st171;
	} else
		goto st171;
	goto tr0;
st159:
	if ( ++p == pe )
		goto _test_eof159;
case 159:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st160;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st160;
	} else
		goto st160;
	goto tr0;
st160:
	if ( ++p == pe )
		goto _test_eof160;
case 160:
	switch( (*p) ) {
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st161;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st161;
	} else
		goto st161;
	goto tr0;
st161:
	if ( ++p == pe )
		goto _test_eof161;
case 161:
	switch( (*p) ) {
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st162;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st162;
	} else
		goto st162;
	goto tr0;
st162:
	if ( ++p == pe )
		goto _test_eof162;
case 162:
	switch( (*p) ) {
		case 58: goto st163;
		case 93: goto st344;
	}
	goto tr0;
st163:
	if ( ++p == pe )
		goto _test_eof163;
case 163:
	switch( (*p) ) {
		case 48: goto st144;
		case 49: goto st149;
		case 50: goto st152;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st155;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st156;
	} else
		goto st156;
	goto tr0;
st164:
	if ( ++p == pe )
		goto _test_eof164;
case 164:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st165;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st160;
	} else
		goto st160;
	goto tr0;
st165:
	if ( ++p == pe )
		goto _test_eof165;
case 165:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st166;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st161;
	} else
		goto st161;
	goto tr0;
st166:
	if ( ++p == pe )
		goto _test_eof166;
case 166:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st162;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st162;
	} else
		goto st162;
	goto tr0;
st167:
	if ( ++p == pe )
		goto _test_eof167;
case 167:
	switch( (*p) ) {
		case 46: goto st53;
		case 53: goto st168;
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st165;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st160;
		} else if ( (*p) >= 65 )
			goto st160;
	} else
		goto st169;
	goto tr0;
st168:
	if ( ++p == pe )
		goto _test_eof168;
case 168:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st166;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st161;
		} else if ( (*p) >= 65 )
			goto st161;
	} else
		goto st161;
	goto tr0;
st169:
	if ( ++p == pe )
		goto _test_eof169;
case 169:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st161;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st161;
	} else
		goto st161;
	goto tr0;
st170:
	if ( ++p == pe )
		goto _test_eof170;
case 170:
	switch( (*p) ) {
		case 46: goto st53;
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st169;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st160;
	} else
		goto st160;
	goto tr0;
st171:
	if ( ++p == pe )
		goto _test_eof171;
case 171:
	switch( (*p) ) {
		case 58: goto st163;
		case 93: goto st344;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st160;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st160;
	} else
		goto st160;
	goto tr0;
st172:
	if ( ++p == pe )
		goto _test_eof172;
case 172:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st173;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st173;
	} else
		goto st173;
	goto tr0;
st173:
	if ( ++p == pe )
		goto _test_eof173;
case 173:
	if ( (*p) == 46 )
		goto st174;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st173;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st173;
	} else
		goto st173;
	goto tr0;
st174:
	if ( ++p == pe )
		goto _test_eof174;
case 174:
	switch( (*p) ) {
		case 33: goto st175;
		case 36: goto st175;
		case 61: goto st175;
		case 95: goto st175;
		case 126: goto st175;
	}
	if ( (*p) < 48 ) {
		if ( 38 <= (*p) && (*p) <= 46 )
			goto st175;
	} else if ( (*p) > 59 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st175;
		} else if ( (*p) >= 65 )
			goto st175;
	} else
		goto st175;
	goto tr0;
st175:
	if ( ++p == pe )
		goto _test_eof175;
case 175:
	switch( (*p) ) {
		case 33: goto st175;
		case 36: goto st175;
		case 61: goto st175;
		case 93: goto st344;
		case 95: goto st175;
		case 126: goto st175;
	}
	if ( (*p) < 48 ) {
		if ( 38 <= (*p) && (*p) <= 46 )
			goto st175;
	} else if ( (*p) > 59 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st175;
		} else if ( (*p) >= 65 )
			goto st175;
	} else
		goto st175;
	goto tr0;
st176:
	if ( ++p == pe )
		goto _test_eof176;
case 176:
	if ( (*p) == 47 )
		goto st177;
	goto tr0;
st177:
	if ( ++p == pe )
		goto _test_eof177;
case 177:
	switch( (*p) ) {
		case 33: goto st177;
		case 36: goto st177;
		case 37: goto st178;
		case 59: goto st177;
		case 61: goto st177;
		case 64: goto st180;
		case 95: goto st177;
		case 126: goto st177;
	}
	if ( (*p) < 48 ) {
		if ( 40 <= (*p) && (*p) <= 46 )
			goto st177;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st177;
		} else if ( (*p) >= 65 )
			goto st177;
	} else
		goto st177;
	goto tr0;
st178:
	if ( ++p == pe )
		goto _test_eof178;
case 178:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st179;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st179;
	} else
		goto st179;
	goto tr0;
st179:
	if ( ++p == pe )
		goto _test_eof179;
case 179:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st177;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st177;
	} else
		goto st177;
	goto tr0;
st180:
	if ( ++p == pe )
		goto _test_eof180;
case 180:
	switch( (*p) ) {
		case 33: goto st345;
		case 37: goto st181;
		case 59: goto st345;
		case 61: goto st345;
		case 91: goto st184;
		case 95: goto st345;
		case 126: goto st345;
	}
	if ( (*p) < 48 ) {
		if ( 36 <= (*p) && (*p) <= 46 )
			goto st345;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st345;
		} else if ( (*p) >= 65 )
			goto st345;
	} else
		goto st345;
	goto tr0;
st345:
	if ( ++p == pe )
		goto _test_eof345;
case 345:
	switch( (*p) ) {
		case 33: goto st345;
		case 35: goto st340;
		case 37: goto st181;
		case 47: goto st183;
		case 59: goto st345;
		case 61: goto st345;
		case 63: goto st343;
		case 95: goto st345;
		case 126: goto st345;
	}
	if ( (*p) < 65 ) {
		if ( 36 <= (*p) && (*p) <= 57 )
			goto st345;
	} else if ( (*p) > 90 ) {
		if ( 97 <= (*p) && (*p) <= 122 )
			goto st345;
	} else
		goto st345;
	goto tr0;
st181:
	if ( ++p == pe )
		goto _test_eof181;
case 181:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st182;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st182;
	} else
		goto st182;
	goto tr0;
st182:
	if ( ++p == pe )
		goto _test_eof182;
case 182:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st345;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st345;
	} else
		goto st345;
	goto tr0;
st183:
	if ( ++p == pe )
		goto _test_eof183;
case 183:
	switch( (*p) ) {
		case 33: goto st339;
		case 36: goto st339;
		case 37: goto st9;
		case 59: goto st339;
		case 61: goto st339;
		case 64: goto st20;
		case 91: goto st21;
		case 95: goto st339;
		case 126: goto st339;
	}
	if ( (*p) < 48 ) {
		if ( (*p) > 39 ) {
			if ( 40 <= (*p) && (*p) <= 46 )
				goto st339;
		} else if ( (*p) >= 38 )
			goto st341;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st339;
		} else if ( (*p) >= 65 )
			goto st339;
	} else
		goto st339;
	goto tr0;
st184:
	if ( ++p == pe )
		goto _test_eof184;
case 184:
	switch( (*p) ) {
		case 58: goto st320;
		case 86: goto st335;
		case 118: goto st335;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st185;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st185;
	} else
		goto st185;
	goto tr0;
st185:
	if ( ++p == pe )
		goto _test_eof185;
case 185:
	if ( (*p) == 58 )
		goto st189;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st186;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st186;
	} else
		goto st186;
	goto tr0;
st186:
	if ( ++p == pe )
		goto _test_eof186;
case 186:
	if ( (*p) == 58 )
		goto st189;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st187;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st187;
	} else
		goto st187;
	goto tr0;
st187:
	if ( ++p == pe )
		goto _test_eof187;
case 187:
	if ( (*p) == 58 )
		goto st189;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st188;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st188;
	} else
		goto st188;
	goto tr0;
st188:
	if ( ++p == pe )
		goto _test_eof188;
case 188:
	if ( (*p) == 58 )
		goto st189;
	goto tr0;
st189:
	if ( ++p == pe )
		goto _test_eof189;
case 189:
	if ( (*p) == 58 )
		goto st306;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st190;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st190;
	} else
		goto st190;
	goto tr0;
st190:
	if ( ++p == pe )
		goto _test_eof190;
case 190:
	if ( (*p) == 58 )
		goto st194;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st191;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st191;
	} else
		goto st191;
	goto tr0;
st191:
	if ( ++p == pe )
		goto _test_eof191;
case 191:
	if ( (*p) == 58 )
		goto st194;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st192;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st192;
	} else
		goto st192;
	goto tr0;
st192:
	if ( ++p == pe )
		goto _test_eof192;
case 192:
	if ( (*p) == 58 )
		goto st194;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st193;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st193;
	} else
		goto st193;
	goto tr0;
st193:
	if ( ++p == pe )
		goto _test_eof193;
case 193:
	if ( (*p) == 58 )
		goto st194;
	goto tr0;
st194:
	if ( ++p == pe )
		goto _test_eof194;
case 194:
	if ( (*p) == 58 )
		goto st292;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st195;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st195;
	} else
		goto st195;
	goto tr0;
st195:
	if ( ++p == pe )
		goto _test_eof195;
case 195:
	if ( (*p) == 58 )
		goto st199;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st196;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st196;
	} else
		goto st196;
	goto tr0;
st196:
	if ( ++p == pe )
		goto _test_eof196;
case 196:
	if ( (*p) == 58 )
		goto st199;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st197;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st197;
	} else
		goto st197;
	goto tr0;
st197:
	if ( ++p == pe )
		goto _test_eof197;
case 197:
	if ( (*p) == 58 )
		goto st199;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st198;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st198;
	} else
		goto st198;
	goto tr0;
st198:
	if ( ++p == pe )
		goto _test_eof198;
case 198:
	if ( (*p) == 58 )
		goto st199;
	goto tr0;
st199:
	if ( ++p == pe )
		goto _test_eof199;
case 199:
	if ( (*p) == 58 )
		goto st278;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st200;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st200;
	} else
		goto st200;
	goto tr0;
st200:
	if ( ++p == pe )
		goto _test_eof200;
case 200:
	if ( (*p) == 58 )
		goto st204;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st201;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st201;
	} else
		goto st201;
	goto tr0;
st201:
	if ( ++p == pe )
		goto _test_eof201;
case 201:
	if ( (*p) == 58 )
		goto st204;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st202;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st202;
	} else
		goto st202;
	goto tr0;
st202:
	if ( ++p == pe )
		goto _test_eof202;
case 202:
	if ( (*p) == 58 )
		goto st204;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st203;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st203;
	} else
		goto st203;
	goto tr0;
st203:
	if ( ++p == pe )
		goto _test_eof203;
case 203:
	if ( (*p) == 58 )
		goto st204;
	goto tr0;
st204:
	if ( ++p == pe )
		goto _test_eof204;
case 204:
	if ( (*p) == 58 )
		goto st264;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st205;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st205;
	} else
		goto st205;
	goto tr0;
st205:
	if ( ++p == pe )
		goto _test_eof205;
case 205:
	if ( (*p) == 58 )
		goto st209;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st206;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st206;
	} else
		goto st206;
	goto tr0;
st206:
	if ( ++p == pe )
		goto _test_eof206;
case 206:
	if ( (*p) == 58 )
		goto st209;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st207;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st207;
	} else
		goto st207;
	goto tr0;
st207:
	if ( ++p == pe )
		goto _test_eof207;
case 207:
	if ( (*p) == 58 )
		goto st209;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st208;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st208;
	} else
		goto st208;
	goto tr0;
st208:
	if ( ++p == pe )
		goto _test_eof208;
case 208:
	if ( (*p) == 58 )
		goto st209;
	goto tr0;
st209:
	if ( ++p == pe )
		goto _test_eof209;
case 209:
	if ( (*p) == 58 )
		goto st250;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st210;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st210;
	} else
		goto st210;
	goto tr0;
st210:
	if ( ++p == pe )
		goto _test_eof210;
case 210:
	if ( (*p) == 58 )
		goto st214;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st211;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st211;
	} else
		goto st211;
	goto tr0;
st211:
	if ( ++p == pe )
		goto _test_eof211;
case 211:
	if ( (*p) == 58 )
		goto st214;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st212;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st212;
	} else
		goto st212;
	goto tr0;
st212:
	if ( ++p == pe )
		goto _test_eof212;
case 212:
	if ( (*p) == 58 )
		goto st214;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st213;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st213;
	} else
		goto st213;
	goto tr0;
st213:
	if ( ++p == pe )
		goto _test_eof213;
case 213:
	if ( (*p) == 58 )
		goto st214;
	goto tr0;
st214:
	if ( ++p == pe )
		goto _test_eof214;
case 214:
	switch( (*p) ) {
		case 48: goto st215;
		case 49: goto st241;
		case 50: goto st244;
		case 58: goto st248;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st247;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st249;
	} else
		goto st249;
	goto tr0;
st215:
	if ( ++p == pe )
		goto _test_eof215;
case 215:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st237;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st234;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st234;
	} else
		goto st234;
	goto tr0;
st216:
	if ( ++p == pe )
		goto _test_eof216;
case 216:
	switch( (*p) ) {
		case 48: goto st217;
		case 49: goto st230;
		case 50: goto st232;
	}
	if ( 51 <= (*p) && (*p) <= 57 )
		goto st231;
	goto tr0;
st217:
	if ( ++p == pe )
		goto _test_eof217;
case 217:
	if ( (*p) == 46 )
		goto st218;
	goto tr0;
st218:
	if ( ++p == pe )
		goto _test_eof218;
case 218:
	switch( (*p) ) {
		case 48: goto st219;
		case 49: goto st226;
		case 50: goto st228;
	}
	if ( 51 <= (*p) && (*p) <= 57 )
		goto st227;
	goto tr0;
st219:
	if ( ++p == pe )
		goto _test_eof219;
case 219:
	if ( (*p) == 46 )
		goto st220;
	goto tr0;
st220:
	if ( ++p == pe )
		goto _test_eof220;
case 220:
	switch( (*p) ) {
		case 48: goto st221;
		case 49: goto st222;
		case 50: goto st224;
	}
	if ( 51 <= (*p) && (*p) <= 57 )
		goto st223;
	goto tr0;
st221:
	if ( ++p == pe )
		goto _test_eof221;
case 221:
	if ( (*p) == 93 )
		goto st346;
	goto tr0;
st346:
	if ( ++p == pe )
		goto _test_eof346;
case 346:
	switch( (*p) ) {
		case 35: goto st340;
		case 47: goto st183;
		case 63: goto st343;
	}
	goto tr0;
st222:
	if ( ++p == pe )
		goto _test_eof222;
case 222:
	if ( (*p) == 93 )
		goto st346;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st223;
	goto tr0;
st223:
	if ( ++p == pe )
		goto _test_eof223;
case 223:
	if ( (*p) == 93 )
		goto st346;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st221;
	goto tr0;
st224:
	if ( ++p == pe )
		goto _test_eof224;
case 224:
	switch( (*p) ) {
		case 53: goto st225;
		case 93: goto st346;
	}
	if ( (*p) > 52 ) {
		if ( 54 <= (*p) && (*p) <= 57 )
			goto st221;
	} else if ( (*p) >= 48 )
		goto st223;
	goto tr0;
st225:
	if ( ++p == pe )
		goto _test_eof225;
case 225:
	if ( (*p) == 93 )
		goto st346;
	if ( 48 <= (*p) && (*p) <= 53 )
		goto st221;
	goto tr0;
st226:
	if ( ++p == pe )
		goto _test_eof226;
case 226:
	if ( (*p) == 46 )
		goto st220;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st227;
	goto tr0;
st227:
	if ( ++p == pe )
		goto _test_eof227;
case 227:
	if ( (*p) == 46 )
		goto st220;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st219;
	goto tr0;
st228:
	if ( ++p == pe )
		goto _test_eof228;
case 228:
	switch( (*p) ) {
		case 46: goto st220;
		case 53: goto st229;
	}
	if ( (*p) > 52 ) {
		if ( 54 <= (*p) && (*p) <= 57 )
			goto st219;
	} else if ( (*p) >= 48 )
		goto st227;
	goto tr0;
st229:
	if ( ++p == pe )
		goto _test_eof229;
case 229:
	if ( (*p) == 46 )
		goto st220;
	if ( 48 <= (*p) && (*p) <= 53 )
		goto st219;
	goto tr0;
st230:
	if ( ++p == pe )
		goto _test_eof230;
case 230:
	if ( (*p) == 46 )
		goto st218;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st231;
	goto tr0;
st231:
	if ( ++p == pe )
		goto _test_eof231;
case 231:
	if ( (*p) == 46 )
		goto st218;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st217;
	goto tr0;
st232:
	if ( ++p == pe )
		goto _test_eof232;
case 232:
	switch( (*p) ) {
		case 46: goto st218;
		case 53: goto st233;
	}
	if ( (*p) > 52 ) {
		if ( 54 <= (*p) && (*p) <= 57 )
			goto st217;
	} else if ( (*p) >= 48 )
		goto st231;
	goto tr0;
st233:
	if ( ++p == pe )
		goto _test_eof233;
case 233:
	if ( (*p) == 46 )
		goto st218;
	if ( 48 <= (*p) && (*p) <= 53 )
		goto st217;
	goto tr0;
st234:
	if ( ++p == pe )
		goto _test_eof234;
case 234:
	if ( (*p) == 58 )
		goto st237;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st235;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st235;
	} else
		goto st235;
	goto tr0;
st235:
	if ( ++p == pe )
		goto _test_eof235;
case 235:
	if ( (*p) == 58 )
		goto st237;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st236;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st236;
	} else
		goto st236;
	goto tr0;
st236:
	if ( ++p == pe )
		goto _test_eof236;
case 236:
	if ( (*p) == 58 )
		goto st237;
	goto tr0;
st237:
	if ( ++p == pe )
		goto _test_eof237;
case 237:
	if ( (*p) == 58 )
		goto st221;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st238;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st238;
	} else
		goto st238;
	goto tr0;
st238:
	if ( ++p == pe )
		goto _test_eof238;
case 238:
	if ( (*p) == 93 )
		goto st346;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st239;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st239;
	} else
		goto st239;
	goto tr0;
st239:
	if ( ++p == pe )
		goto _test_eof239;
case 239:
	if ( (*p) == 93 )
		goto st346;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st240;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st240;
	} else
		goto st240;
	goto tr0;
st240:
	if ( ++p == pe )
		goto _test_eof240;
case 240:
	if ( (*p) == 93 )
		goto st346;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st221;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st221;
	} else
		goto st221;
	goto tr0;
st241:
	if ( ++p == pe )
		goto _test_eof241;
case 241:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st237;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st242;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st234;
	} else
		goto st234;
	goto tr0;
st242:
	if ( ++p == pe )
		goto _test_eof242;
case 242:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st237;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st243;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st235;
	} else
		goto st235;
	goto tr0;
st243:
	if ( ++p == pe )
		goto _test_eof243;
case 243:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st237;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st236;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st236;
	} else
		goto st236;
	goto tr0;
st244:
	if ( ++p == pe )
		goto _test_eof244;
case 244:
	switch( (*p) ) {
		case 46: goto st216;
		case 53: goto st245;
		case 58: goto st237;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st242;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st234;
		} else if ( (*p) >= 65 )
			goto st234;
	} else
		goto st246;
	goto tr0;
st245:
	if ( ++p == pe )
		goto _test_eof245;
case 245:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st237;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st243;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st235;
		} else if ( (*p) >= 65 )
			goto st235;
	} else
		goto st235;
	goto tr0;
st246:
	if ( ++p == pe )
		goto _test_eof246;
case 246:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st237;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st235;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st235;
	} else
		goto st235;
	goto tr0;
st247:
	if ( ++p == pe )
		goto _test_eof247;
case 247:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st237;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st246;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st234;
	} else
		goto st234;
	goto tr0;
st248:
	if ( ++p == pe )
		goto _test_eof248;
case 248:
	if ( (*p) == 93 )
		goto st346;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st238;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st238;
	} else
		goto st238;
	goto tr0;
st249:
	if ( ++p == pe )
		goto _test_eof249;
case 249:
	if ( (*p) == 58 )
		goto st237;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st234;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st234;
	} else
		goto st234;
	goto tr0;
st250:
	if ( ++p == pe )
		goto _test_eof250;
case 250:
	switch( (*p) ) {
		case 48: goto st251;
		case 49: goto st256;
		case 50: goto st259;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st262;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st263;
	} else
		goto st263;
	goto tr0;
st251:
	if ( ++p == pe )
		goto _test_eof251;
case 251:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st252;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st252;
	} else
		goto st252;
	goto tr0;
st252:
	if ( ++p == pe )
		goto _test_eof252;
case 252:
	switch( (*p) ) {
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st253;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st253;
	} else
		goto st253;
	goto tr0;
st253:
	if ( ++p == pe )
		goto _test_eof253;
case 253:
	switch( (*p) ) {
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st254;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st254;
	} else
		goto st254;
	goto tr0;
st254:
	if ( ++p == pe )
		goto _test_eof254;
case 254:
	switch( (*p) ) {
		case 58: goto st255;
		case 93: goto st346;
	}
	goto tr0;
st255:
	if ( ++p == pe )
		goto _test_eof255;
case 255:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st238;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st238;
	} else
		goto st238;
	goto tr0;
st256:
	if ( ++p == pe )
		goto _test_eof256;
case 256:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st257;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st252;
	} else
		goto st252;
	goto tr0;
st257:
	if ( ++p == pe )
		goto _test_eof257;
case 257:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st258;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st253;
	} else
		goto st253;
	goto tr0;
st258:
	if ( ++p == pe )
		goto _test_eof258;
case 258:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st254;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st254;
	} else
		goto st254;
	goto tr0;
st259:
	if ( ++p == pe )
		goto _test_eof259;
case 259:
	switch( (*p) ) {
		case 46: goto st216;
		case 53: goto st260;
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st257;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st252;
		} else if ( (*p) >= 65 )
			goto st252;
	} else
		goto st261;
	goto tr0;
st260:
	if ( ++p == pe )
		goto _test_eof260;
case 260:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st258;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st253;
		} else if ( (*p) >= 65 )
			goto st253;
	} else
		goto st253;
	goto tr0;
st261:
	if ( ++p == pe )
		goto _test_eof261;
case 261:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st253;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st253;
	} else
		goto st253;
	goto tr0;
st262:
	if ( ++p == pe )
		goto _test_eof262;
case 262:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st261;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st252;
	} else
		goto st252;
	goto tr0;
st263:
	if ( ++p == pe )
		goto _test_eof263;
case 263:
	switch( (*p) ) {
		case 58: goto st255;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st252;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st252;
	} else
		goto st252;
	goto tr0;
st264:
	if ( ++p == pe )
		goto _test_eof264;
case 264:
	switch( (*p) ) {
		case 48: goto st265;
		case 49: goto st270;
		case 50: goto st273;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st276;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st277;
	} else
		goto st277;
	goto tr0;
st265:
	if ( ++p == pe )
		goto _test_eof265;
case 265:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st266;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st266;
	} else
		goto st266;
	goto tr0;
st266:
	if ( ++p == pe )
		goto _test_eof266;
case 266:
	switch( (*p) ) {
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st267;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st267;
	} else
		goto st267;
	goto tr0;
st267:
	if ( ++p == pe )
		goto _test_eof267;
case 267:
	switch( (*p) ) {
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st268;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st268;
	} else
		goto st268;
	goto tr0;
st268:
	if ( ++p == pe )
		goto _test_eof268;
case 268:
	switch( (*p) ) {
		case 58: goto st269;
		case 93: goto st346;
	}
	goto tr0;
st269:
	if ( ++p == pe )
		goto _test_eof269;
case 269:
	switch( (*p) ) {
		case 48: goto st251;
		case 49: goto st256;
		case 50: goto st259;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st262;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st263;
	} else
		goto st263;
	goto tr0;
st270:
	if ( ++p == pe )
		goto _test_eof270;
case 270:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st271;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st266;
	} else
		goto st266;
	goto tr0;
st271:
	if ( ++p == pe )
		goto _test_eof271;
case 271:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st272;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st267;
	} else
		goto st267;
	goto tr0;
st272:
	if ( ++p == pe )
		goto _test_eof272;
case 272:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st268;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st268;
	} else
		goto st268;
	goto tr0;
st273:
	if ( ++p == pe )
		goto _test_eof273;
case 273:
	switch( (*p) ) {
		case 46: goto st216;
		case 53: goto st274;
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st271;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st266;
		} else if ( (*p) >= 65 )
			goto st266;
	} else
		goto st275;
	goto tr0;
st274:
	if ( ++p == pe )
		goto _test_eof274;
case 274:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st272;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st267;
		} else if ( (*p) >= 65 )
			goto st267;
	} else
		goto st267;
	goto tr0;
st275:
	if ( ++p == pe )
		goto _test_eof275;
case 275:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st267;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st267;
	} else
		goto st267;
	goto tr0;
st276:
	if ( ++p == pe )
		goto _test_eof276;
case 276:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st275;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st266;
	} else
		goto st266;
	goto tr0;
st277:
	if ( ++p == pe )
		goto _test_eof277;
case 277:
	switch( (*p) ) {
		case 58: goto st269;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st266;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st266;
	} else
		goto st266;
	goto tr0;
st278:
	if ( ++p == pe )
		goto _test_eof278;
case 278:
	switch( (*p) ) {
		case 48: goto st279;
		case 49: goto st284;
		case 50: goto st287;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st290;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st291;
	} else
		goto st291;
	goto tr0;
st279:
	if ( ++p == pe )
		goto _test_eof279;
case 279:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st280;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st280;
	} else
		goto st280;
	goto tr0;
st280:
	if ( ++p == pe )
		goto _test_eof280;
case 280:
	switch( (*p) ) {
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st281;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st281;
	} else
		goto st281;
	goto tr0;
st281:
	if ( ++p == pe )
		goto _test_eof281;
case 281:
	switch( (*p) ) {
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st282;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st282;
	} else
		goto st282;
	goto tr0;
st282:
	if ( ++p == pe )
		goto _test_eof282;
case 282:
	switch( (*p) ) {
		case 58: goto st283;
		case 93: goto st346;
	}
	goto tr0;
st283:
	if ( ++p == pe )
		goto _test_eof283;
case 283:
	switch( (*p) ) {
		case 48: goto st265;
		case 49: goto st270;
		case 50: goto st273;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st276;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st277;
	} else
		goto st277;
	goto tr0;
st284:
	if ( ++p == pe )
		goto _test_eof284;
case 284:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st285;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st280;
	} else
		goto st280;
	goto tr0;
st285:
	if ( ++p == pe )
		goto _test_eof285;
case 285:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st286;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st281;
	} else
		goto st281;
	goto tr0;
st286:
	if ( ++p == pe )
		goto _test_eof286;
case 286:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st282;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st282;
	} else
		goto st282;
	goto tr0;
st287:
	if ( ++p == pe )
		goto _test_eof287;
case 287:
	switch( (*p) ) {
		case 46: goto st216;
		case 53: goto st288;
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st285;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st280;
		} else if ( (*p) >= 65 )
			goto st280;
	} else
		goto st289;
	goto tr0;
st288:
	if ( ++p == pe )
		goto _test_eof288;
case 288:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st286;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st281;
		} else if ( (*p) >= 65 )
			goto st281;
	} else
		goto st281;
	goto tr0;
st289:
	if ( ++p == pe )
		goto _test_eof289;
case 289:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st281;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st281;
	} else
		goto st281;
	goto tr0;
st290:
	if ( ++p == pe )
		goto _test_eof290;
case 290:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st289;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st280;
	} else
		goto st280;
	goto tr0;
st291:
	if ( ++p == pe )
		goto _test_eof291;
case 291:
	switch( (*p) ) {
		case 58: goto st283;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st280;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st280;
	} else
		goto st280;
	goto tr0;
st292:
	if ( ++p == pe )
		goto _test_eof292;
case 292:
	switch( (*p) ) {
		case 48: goto st293;
		case 49: goto st298;
		case 50: goto st301;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st304;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st305;
	} else
		goto st305;
	goto tr0;
st293:
	if ( ++p == pe )
		goto _test_eof293;
case 293:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st294;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st294;
	} else
		goto st294;
	goto tr0;
st294:
	if ( ++p == pe )
		goto _test_eof294;
case 294:
	switch( (*p) ) {
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st295;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st295;
	} else
		goto st295;
	goto tr0;
st295:
	if ( ++p == pe )
		goto _test_eof295;
case 295:
	switch( (*p) ) {
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st296;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st296;
	} else
		goto st296;
	goto tr0;
st296:
	if ( ++p == pe )
		goto _test_eof296;
case 296:
	switch( (*p) ) {
		case 58: goto st297;
		case 93: goto st346;
	}
	goto tr0;
st297:
	if ( ++p == pe )
		goto _test_eof297;
case 297:
	switch( (*p) ) {
		case 48: goto st279;
		case 49: goto st284;
		case 50: goto st287;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st290;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st291;
	} else
		goto st291;
	goto tr0;
st298:
	if ( ++p == pe )
		goto _test_eof298;
case 298:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st299;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st294;
	} else
		goto st294;
	goto tr0;
st299:
	if ( ++p == pe )
		goto _test_eof299;
case 299:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st300;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st295;
	} else
		goto st295;
	goto tr0;
st300:
	if ( ++p == pe )
		goto _test_eof300;
case 300:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st296;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st296;
	} else
		goto st296;
	goto tr0;
st301:
	if ( ++p == pe )
		goto _test_eof301;
case 301:
	switch( (*p) ) {
		case 46: goto st216;
		case 53: goto st302;
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st299;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st294;
		} else if ( (*p) >= 65 )
			goto st294;
	} else
		goto st303;
	goto tr0;
st302:
	if ( ++p == pe )
		goto _test_eof302;
case 302:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st300;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st295;
		} else if ( (*p) >= 65 )
			goto st295;
	} else
		goto st295;
	goto tr0;
st303:
	if ( ++p == pe )
		goto _test_eof303;
case 303:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st295;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st295;
	} else
		goto st295;
	goto tr0;
st304:
	if ( ++p == pe )
		goto _test_eof304;
case 304:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st303;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st294;
	} else
		goto st294;
	goto tr0;
st305:
	if ( ++p == pe )
		goto _test_eof305;
case 305:
	switch( (*p) ) {
		case 58: goto st297;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st294;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st294;
	} else
		goto st294;
	goto tr0;
st306:
	if ( ++p == pe )
		goto _test_eof306;
case 306:
	switch( (*p) ) {
		case 48: goto st307;
		case 49: goto st312;
		case 50: goto st315;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st318;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st319;
	} else
		goto st319;
	goto tr0;
st307:
	if ( ++p == pe )
		goto _test_eof307;
case 307:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st308;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st308;
	} else
		goto st308;
	goto tr0;
st308:
	if ( ++p == pe )
		goto _test_eof308;
case 308:
	switch( (*p) ) {
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st309;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st309;
	} else
		goto st309;
	goto tr0;
st309:
	if ( ++p == pe )
		goto _test_eof309;
case 309:
	switch( (*p) ) {
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st310;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st310;
	} else
		goto st310;
	goto tr0;
st310:
	if ( ++p == pe )
		goto _test_eof310;
case 310:
	switch( (*p) ) {
		case 58: goto st311;
		case 93: goto st346;
	}
	goto tr0;
st311:
	if ( ++p == pe )
		goto _test_eof311;
case 311:
	switch( (*p) ) {
		case 48: goto st293;
		case 49: goto st298;
		case 50: goto st301;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st304;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st305;
	} else
		goto st305;
	goto tr0;
st312:
	if ( ++p == pe )
		goto _test_eof312;
case 312:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st313;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st308;
	} else
		goto st308;
	goto tr0;
st313:
	if ( ++p == pe )
		goto _test_eof313;
case 313:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st314;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st309;
	} else
		goto st309;
	goto tr0;
st314:
	if ( ++p == pe )
		goto _test_eof314;
case 314:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st310;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st310;
	} else
		goto st310;
	goto tr0;
st315:
	if ( ++p == pe )
		goto _test_eof315;
case 315:
	switch( (*p) ) {
		case 46: goto st216;
		case 53: goto st316;
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st313;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st308;
		} else if ( (*p) >= 65 )
			goto st308;
	} else
		goto st317;
	goto tr0;
st316:
	if ( ++p == pe )
		goto _test_eof316;
case 316:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st314;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st309;
		} else if ( (*p) >= 65 )
			goto st309;
	} else
		goto st309;
	goto tr0;
st317:
	if ( ++p == pe )
		goto _test_eof317;
case 317:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st309;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st309;
	} else
		goto st309;
	goto tr0;
st318:
	if ( ++p == pe )
		goto _test_eof318;
case 318:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st317;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st308;
	} else
		goto st308;
	goto tr0;
st319:
	if ( ++p == pe )
		goto _test_eof319;
case 319:
	switch( (*p) ) {
		case 58: goto st311;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st308;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st308;
	} else
		goto st308;
	goto tr0;
st320:
	if ( ++p == pe )
		goto _test_eof320;
case 320:
	if ( (*p) == 58 )
		goto st321;
	goto tr0;
st321:
	if ( ++p == pe )
		goto _test_eof321;
case 321:
	switch( (*p) ) {
		case 48: goto st322;
		case 49: goto st327;
		case 50: goto st330;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st333;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st334;
	} else
		goto st334;
	goto tr0;
st322:
	if ( ++p == pe )
		goto _test_eof322;
case 322:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st323;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st323;
	} else
		goto st323;
	goto tr0;
st323:
	if ( ++p == pe )
		goto _test_eof323;
case 323:
	switch( (*p) ) {
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st324;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st324;
	} else
		goto st324;
	goto tr0;
st324:
	if ( ++p == pe )
		goto _test_eof324;
case 324:
	switch( (*p) ) {
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st325;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st325;
	} else
		goto st325;
	goto tr0;
st325:
	if ( ++p == pe )
		goto _test_eof325;
case 325:
	switch( (*p) ) {
		case 58: goto st326;
		case 93: goto st346;
	}
	goto tr0;
st326:
	if ( ++p == pe )
		goto _test_eof326;
case 326:
	switch( (*p) ) {
		case 48: goto st307;
		case 49: goto st312;
		case 50: goto st315;
	}
	if ( (*p) < 65 ) {
		if ( 51 <= (*p) && (*p) <= 57 )
			goto st318;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st319;
	} else
		goto st319;
	goto tr0;
st327:
	if ( ++p == pe )
		goto _test_eof327;
case 327:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st328;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st323;
	} else
		goto st323;
	goto tr0;
st328:
	if ( ++p == pe )
		goto _test_eof328;
case 328:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st329;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st324;
	} else
		goto st324;
	goto tr0;
st329:
	if ( ++p == pe )
		goto _test_eof329;
case 329:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st325;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st325;
	} else
		goto st325;
	goto tr0;
st330:
	if ( ++p == pe )
		goto _test_eof330;
case 330:
	switch( (*p) ) {
		case 46: goto st216;
		case 53: goto st331;
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 52 )
			goto st328;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st323;
		} else if ( (*p) >= 65 )
			goto st323;
	} else
		goto st332;
	goto tr0;
st331:
	if ( ++p == pe )
		goto _test_eof331;
case 331:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 54 ) {
		if ( 48 <= (*p) && (*p) <= 53 )
			goto st329;
	} else if ( (*p) > 57 ) {
		if ( (*p) > 70 ) {
			if ( 97 <= (*p) && (*p) <= 102 )
				goto st324;
		} else if ( (*p) >= 65 )
			goto st324;
	} else
		goto st324;
	goto tr0;
st332:
	if ( ++p == pe )
		goto _test_eof332;
case 332:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st324;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st324;
	} else
		goto st324;
	goto tr0;
st333:
	if ( ++p == pe )
		goto _test_eof333;
case 333:
	switch( (*p) ) {
		case 46: goto st216;
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st332;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st323;
	} else
		goto st323;
	goto tr0;
st334:
	if ( ++p == pe )
		goto _test_eof334;
case 334:
	switch( (*p) ) {
		case 58: goto st326;
		case 93: goto st346;
	}
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st323;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st323;
	} else
		goto st323;
	goto tr0;
st335:
	if ( ++p == pe )
		goto _test_eof335;
case 335:
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st336;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st336;
	} else
		goto st336;
	goto tr0;
st336:
	if ( ++p == pe )
		goto _test_eof336;
case 336:
	if ( (*p) == 46 )
		goto st337;
	if ( (*p) < 65 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st336;
	} else if ( (*p) > 70 ) {
		if ( 97 <= (*p) && (*p) <= 102 )
			goto st336;
	} else
		goto st336;
	goto tr0;
st337:
	if ( ++p == pe )
		goto _test_eof337;
case 337:
	switch( (*p) ) {
		case 33: goto st338;
		case 36: goto st338;
		case 61: goto st338;
		case 95: goto st338;
		case 126: goto st338;
	}
	if ( (*p) < 48 ) {
		if ( 38 <= (*p) && (*p) <= 46 )
			goto st338;
	} else if ( (*p) > 59 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st338;
		} else if ( (*p) >= 65 )
			goto st338;
	} else
		goto st338;
	goto tr0;
st338:
	if ( ++p == pe )
		goto _test_eof338;
case 338:
	switch( (*p) ) {
		case 33: goto st338;
		case 36: goto st338;
		case 61: goto st338;
		case 93: goto st346;
		case 95: goto st338;
		case 126: goto st338;
	}
	if ( (*p) < 48 ) {
		if ( 38 <= (*p) && (*p) <= 46 )
			goto st338;
	} else if ( (*p) > 59 ) {
		if ( (*p) > 90 ) {
			if ( 97 <= (*p) && (*p) <= 122 )
				goto st338;
		} else if ( (*p) >= 65 )
			goto st338;
	} else
		goto st338;
	goto tr0;
	}
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof339: cs = 339; goto _test_eof; 
	_test_eof340: cs = 340; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof341: cs = 341; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof342: cs = 342; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof343: cs = 343; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
	_test_eof52: cs = 52; goto _test_eof; 
	_test_eof53: cs = 53; goto _test_eof; 
	_test_eof54: cs = 54; goto _test_eof; 
	_test_eof55: cs = 55; goto _test_eof; 
	_test_eof56: cs = 56; goto _test_eof; 
	_test_eof57: cs = 57; goto _test_eof; 
	_test_eof58: cs = 58; goto _test_eof; 
	_test_eof344: cs = 344; goto _test_eof; 
	_test_eof59: cs = 59; goto _test_eof; 
	_test_eof60: cs = 60; goto _test_eof; 
	_test_eof61: cs = 61; goto _test_eof; 
	_test_eof62: cs = 62; goto _test_eof; 
	_test_eof63: cs = 63; goto _test_eof; 
	_test_eof64: cs = 64; goto _test_eof; 
	_test_eof65: cs = 65; goto _test_eof; 
	_test_eof66: cs = 66; goto _test_eof; 
	_test_eof67: cs = 67; goto _test_eof; 
	_test_eof68: cs = 68; goto _test_eof; 
	_test_eof69: cs = 69; goto _test_eof; 
	_test_eof70: cs = 70; goto _test_eof; 
	_test_eof71: cs = 71; goto _test_eof; 
	_test_eof72: cs = 72; goto _test_eof; 
	_test_eof73: cs = 73; goto _test_eof; 
	_test_eof74: cs = 74; goto _test_eof; 
	_test_eof75: cs = 75; goto _test_eof; 
	_test_eof76: cs = 76; goto _test_eof; 
	_test_eof77: cs = 77; goto _test_eof; 
	_test_eof78: cs = 78; goto _test_eof; 
	_test_eof79: cs = 79; goto _test_eof; 
	_test_eof80: cs = 80; goto _test_eof; 
	_test_eof81: cs = 81; goto _test_eof; 
	_test_eof82: cs = 82; goto _test_eof; 
	_test_eof83: cs = 83; goto _test_eof; 
	_test_eof84: cs = 84; goto _test_eof; 
	_test_eof85: cs = 85; goto _test_eof; 
	_test_eof86: cs = 86; goto _test_eof; 
	_test_eof87: cs = 87; goto _test_eof; 
	_test_eof88: cs = 88; goto _test_eof; 
	_test_eof89: cs = 89; goto _test_eof; 
	_test_eof90: cs = 90; goto _test_eof; 
	_test_eof91: cs = 91; goto _test_eof; 
	_test_eof92: cs = 92; goto _test_eof; 
	_test_eof93: cs = 93; goto _test_eof; 
	_test_eof94: cs = 94; goto _test_eof; 
	_test_eof95: cs = 95; goto _test_eof; 
	_test_eof96: cs = 96; goto _test_eof; 
	_test_eof97: cs = 97; goto _test_eof; 
	_test_eof98: cs = 98; goto _test_eof; 
	_test_eof99: cs = 99; goto _test_eof; 
	_test_eof100: cs = 100; goto _test_eof; 
	_test_eof101: cs = 101; goto _test_eof; 
	_test_eof102: cs = 102; goto _test_eof; 
	_test_eof103: cs = 103; goto _test_eof; 
	_test_eof104: cs = 104; goto _test_eof; 
	_test_eof105: cs = 105; goto _test_eof; 
	_test_eof106: cs = 106; goto _test_eof; 
	_test_eof107: cs = 107; goto _test_eof; 
	_test_eof108: cs = 108; goto _test_eof; 
	_test_eof109: cs = 109; goto _test_eof; 
	_test_eof110: cs = 110; goto _test_eof; 
	_test_eof111: cs = 111; goto _test_eof; 
	_test_eof112: cs = 112; goto _test_eof; 
	_test_eof113: cs = 113; goto _test_eof; 
	_test_eof114: cs = 114; goto _test_eof; 
	_test_eof115: cs = 115; goto _test_eof; 
	_test_eof116: cs = 116; goto _test_eof; 
	_test_eof117: cs = 117; goto _test_eof; 
	_test_eof118: cs = 118; goto _test_eof; 
	_test_eof119: cs = 119; goto _test_eof; 
	_test_eof120: cs = 120; goto _test_eof; 
	_test_eof121: cs = 121; goto _test_eof; 
	_test_eof122: cs = 122; goto _test_eof; 
	_test_eof123: cs = 123; goto _test_eof; 
	_test_eof124: cs = 124; goto _test_eof; 
	_test_eof125: cs = 125; goto _test_eof; 
	_test_eof126: cs = 126; goto _test_eof; 
	_test_eof127: cs = 127; goto _test_eof; 
	_test_eof128: cs = 128; goto _test_eof; 
	_test_eof129: cs = 129; goto _test_eof; 
	_test_eof130: cs = 130; goto _test_eof; 
	_test_eof131: cs = 131; goto _test_eof; 
	_test_eof132: cs = 132; goto _test_eof; 
	_test_eof133: cs = 133; goto _test_eof; 
	_test_eof134: cs = 134; goto _test_eof; 
	_test_eof135: cs = 135; goto _test_eof; 
	_test_eof136: cs = 136; goto _test_eof; 
	_test_eof137: cs = 137; goto _test_eof; 
	_test_eof138: cs = 138; goto _test_eof; 
	_test_eof139: cs = 139; goto _test_eof; 
	_test_eof140: cs = 140; goto _test_eof; 
	_test_eof141: cs = 141; goto _test_eof; 
	_test_eof142: cs = 142; goto _test_eof; 
	_test_eof143: cs = 143; goto _test_eof; 
	_test_eof144: cs = 144; goto _test_eof; 
	_test_eof145: cs = 145; goto _test_eof; 
	_test_eof146: cs = 146; goto _test_eof; 
	_test_eof147: cs = 147; goto _test_eof; 
	_test_eof148: cs = 148; goto _test_eof; 
	_test_eof149: cs = 149; goto _test_eof; 
	_test_eof150: cs = 150; goto _test_eof; 
	_test_eof151: cs = 151; goto _test_eof; 
	_test_eof152: cs = 152; goto _test_eof; 
	_test_eof153: cs = 153; goto _test_eof; 
	_test_eof154: cs = 154; goto _test_eof; 
	_test_eof155: cs = 155; goto _test_eof; 
	_test_eof156: cs = 156; goto _test_eof; 
	_test_eof157: cs = 157; goto _test_eof; 
	_test_eof158: cs = 158; goto _test_eof; 
	_test_eof159: cs = 159; goto _test_eof; 
	_test_eof160: cs = 160; goto _test_eof; 
	_test_eof161: cs = 161; goto _test_eof; 
	_test_eof162: cs = 162; goto _test_eof; 
	_test_eof163: cs = 163; goto _test_eof; 
	_test_eof164: cs = 164; goto _test_eof; 
	_test_eof165: cs = 165; goto _test_eof; 
	_test_eof166: cs = 166; goto _test_eof; 
	_test_eof167: cs = 167; goto _test_eof; 
	_test_eof168: cs = 168; goto _test_eof; 
	_test_eof169: cs = 169; goto _test_eof; 
	_test_eof170: cs = 170; goto _test_eof; 
	_test_eof171: cs = 171; goto _test_eof; 
	_test_eof172: cs = 172; goto _test_eof; 
	_test_eof173: cs = 173; goto _test_eof; 
	_test_eof174: cs = 174; goto _test_eof; 
	_test_eof175: cs = 175; goto _test_eof; 
	_test_eof176: cs = 176; goto _test_eof; 
	_test_eof177: cs = 177; goto _test_eof; 
	_test_eof178: cs = 178; goto _test_eof; 
	_test_eof179: cs = 179; goto _test_eof; 
	_test_eof180: cs = 180; goto _test_eof; 
	_test_eof345: cs = 345; goto _test_eof; 
	_test_eof181: cs = 181; goto _test_eof; 
	_test_eof182: cs = 182; goto _test_eof; 
	_test_eof183: cs = 183; goto _test_eof; 
	_test_eof184: cs = 184; goto _test_eof; 
	_test_eof185: cs = 185; goto _test_eof; 
	_test_eof186: cs = 186; goto _test_eof; 
	_test_eof187: cs = 187; goto _test_eof; 
	_test_eof188: cs = 188; goto _test_eof; 
	_test_eof189: cs = 189; goto _test_eof; 
	_test_eof190: cs = 190; goto _test_eof; 
	_test_eof191: cs = 191; goto _test_eof; 
	_test_eof192: cs = 192; goto _test_eof; 
	_test_eof193: cs = 193; goto _test_eof; 
	_test_eof194: cs = 194; goto _test_eof; 
	_test_eof195: cs = 195; goto _test_eof; 
	_test_eof196: cs = 196; goto _test_eof; 
	_test_eof197: cs = 197; goto _test_eof; 
	_test_eof198: cs = 198; goto _test_eof; 
	_test_eof199: cs = 199; goto _test_eof; 
	_test_eof200: cs = 200; goto _test_eof; 
	_test_eof201: cs = 201; goto _test_eof; 
	_test_eof202: cs = 202; goto _test_eof; 
	_test_eof203: cs = 203; goto _test_eof; 
	_test_eof204: cs = 204; goto _test_eof; 
	_test_eof205: cs = 205; goto _test_eof; 
	_test_eof206: cs = 206; goto _test_eof; 
	_test_eof207: cs = 207; goto _test_eof; 
	_test_eof208: cs = 208; goto _test_eof; 
	_test_eof209: cs = 209; goto _test_eof; 
	_test_eof210: cs = 210; goto _test_eof; 
	_test_eof211: cs = 211; goto _test_eof; 
	_test_eof212: cs = 212; goto _test_eof; 
	_test_eof213: cs = 213; goto _test_eof; 
	_test_eof214: cs = 214; goto _test_eof; 
	_test_eof215: cs = 215; goto _test_eof; 
	_test_eof216: cs = 216; goto _test_eof; 
	_test_eof217: cs = 217; goto _test_eof; 
	_test_eof218: cs = 218; goto _test_eof; 
	_test_eof219: cs = 219; goto _test_eof; 
	_test_eof220: cs = 220; goto _test_eof; 
	_test_eof221: cs = 221; goto _test_eof; 
	_test_eof346: cs = 346; goto _test_eof; 
	_test_eof222: cs = 222; goto _test_eof; 
	_test_eof223: cs = 223; goto _test_eof; 
	_test_eof224: cs = 224; goto _test_eof; 
	_test_eof225: cs = 225; goto _test_eof; 
	_test_eof226: cs = 226; goto _test_eof; 
	_test_eof227: cs = 227; goto _test_eof; 
	_test_eof228: cs = 228; goto _test_eof; 
	_test_eof229: cs = 229; goto _test_eof; 
	_test_eof230: cs = 230; goto _test_eof; 
	_test_eof231: cs = 231; goto _test_eof; 
	_test_eof232: cs = 232; goto _test_eof; 
	_test_eof233: cs = 233; goto _test_eof; 
	_test_eof234: cs = 234; goto _test_eof; 
	_test_eof235: cs = 235; goto _test_eof; 
	_test_eof236: cs = 236; goto _test_eof; 
	_test_eof237: cs = 237; goto _test_eof; 
	_test_eof238: cs = 238; goto _test_eof; 
	_test_eof239: cs = 239; goto _test_eof; 
	_test_eof240: cs = 240; goto _test_eof; 
	_test_eof241: cs = 241; goto _test_eof; 
	_test_eof242: cs = 242; goto _test_eof; 
	_test_eof243: cs = 243; goto _test_eof; 
	_test_eof244: cs = 244; goto _test_eof; 
	_test_eof245: cs = 245; goto _test_eof; 
	_test_eof246: cs = 246; goto _test_eof; 
	_test_eof247: cs = 247; goto _test_eof; 
	_test_eof248: cs = 248; goto _test_eof; 
	_test_eof249: cs = 249; goto _test_eof; 
	_test_eof250: cs = 250; goto _test_eof; 
	_test_eof251: cs = 251; goto _test_eof; 
	_test_eof252: cs = 252; goto _test_eof; 
	_test_eof253: cs = 253; goto _test_eof; 
	_test_eof254: cs = 254; goto _test_eof; 
	_test_eof255: cs = 255; goto _test_eof; 
	_test_eof256: cs = 256; goto _test_eof; 
	_test_eof257: cs = 257; goto _test_eof; 
	_test_eof258: cs = 258; goto _test_eof; 
	_test_eof259: cs = 259; goto _test_eof; 
	_test_eof260: cs = 260; goto _test_eof; 
	_test_eof261: cs = 261; goto _test_eof; 
	_test_eof262: cs = 262; goto _test_eof; 
	_test_eof263: cs = 263; goto _test_eof; 
	_test_eof264: cs = 264; goto _test_eof; 
	_test_eof265: cs = 265; goto _test_eof; 
	_test_eof266: cs = 266; goto _test_eof; 
	_test_eof267: cs = 267; goto _test_eof; 
	_test_eof268: cs = 268; goto _test_eof; 
	_test_eof269: cs = 269; goto _test_eof; 
	_test_eof270: cs = 270; goto _test_eof; 
	_test_eof271: cs = 271; goto _test_eof; 
	_test_eof272: cs = 272; goto _test_eof; 
	_test_eof273: cs = 273; goto _test_eof; 
	_test_eof274: cs = 274; goto _test_eof; 
	_test_eof275: cs = 275; goto _test_eof; 
	_test_eof276: cs = 276; goto _test_eof; 
	_test_eof277: cs = 277; goto _test_eof; 
	_test_eof278: cs = 278; goto _test_eof; 
	_test_eof279: cs = 279; goto _test_eof; 
	_test_eof280: cs = 280; goto _test_eof; 
	_test_eof281: cs = 281; goto _test_eof; 
	_test_eof282: cs = 282; goto _test_eof; 
	_test_eof283: cs = 283; goto _test_eof; 
	_test_eof284: cs = 284; goto _test_eof; 
	_test_eof285: cs = 285; goto _test_eof; 
	_test_eof286: cs = 286; goto _test_eof; 
	_test_eof287: cs = 287; goto _test_eof; 
	_test_eof288: cs = 288; goto _test_eof; 
	_test_eof289: cs = 289; goto _test_eof; 
	_test_eof290: cs = 290; goto _test_eof; 
	_test_eof291: cs = 291; goto _test_eof; 
	_test_eof292: cs = 292; goto _test_eof; 
	_test_eof293: cs = 293; goto _test_eof; 
	_test_eof294: cs = 294; goto _test_eof; 
	_test_eof295: cs = 295; goto _test_eof; 
	_test_eof296: cs = 296; goto _test_eof; 
	_test_eof297: cs = 297; goto _test_eof; 
	_test_eof298: cs = 298; goto _test_eof; 
	_test_eof299: cs = 299; goto _test_eof; 
	_test_eof300: cs = 300; goto _test_eof; 
	_test_eof301: cs = 301; goto _test_eof; 
	_test_eof302: cs = 302; goto _test_eof; 
	_test_eof303: cs = 303; goto _test_eof; 
	_test_eof304: cs = 304; goto _test_eof; 
	_test_eof305: cs = 305; goto _test_eof; 
	_test_eof306: cs = 306; goto _test_eof; 
	_test_eof307: cs = 307; goto _test_eof; 
	_test_eof308: cs = 308; goto _test_eof; 
	_test_eof309: cs = 309; goto _test_eof; 
	_test_eof310: cs = 310; goto _test_eof; 
	_test_eof311: cs = 311; goto _test_eof; 
	_test_eof312: cs = 312; goto _test_eof; 
	_test_eof313: cs = 313; goto _test_eof; 
	_test_eof314: cs = 314; goto _test_eof; 
	_test_eof315: cs = 315; goto _test_eof; 
	_test_eof316: cs = 316; goto _test_eof; 
	_test_eof317: cs = 317; goto _test_eof; 
	_test_eof318: cs = 318; goto _test_eof; 
	_test_eof319: cs = 319; goto _test_eof; 
	_test_eof320: cs = 320; goto _test_eof; 
	_test_eof321: cs = 321; goto _test_eof; 
	_test_eof322: cs = 322; goto _test_eof; 
	_test_eof323: cs = 323; goto _test_eof; 
	_test_eof324: cs = 324; goto _test_eof; 
	_test_eof325: cs = 325; goto _test_eof; 
	_test_eof326: cs = 326; goto _test_eof; 
	_test_eof327: cs = 327; goto _test_eof; 
	_test_eof328: cs = 328; goto _test_eof; 
	_test_eof329: cs = 329; goto _test_eof; 
	_test_eof330: cs = 330; goto _test_eof; 
	_test_eof331: cs = 331; goto _test_eof; 
	_test_eof332: cs = 332; goto _test_eof; 
	_test_eof333: cs = 333; goto _test_eof; 
	_test_eof334: cs = 334; goto _test_eof; 
	_test_eof335: cs = 335; goto _test_eof; 
	_test_eof336: cs = 336; goto _test_eof; 
	_test_eof337: cs = 337; goto _test_eof; 
	_test_eof338: cs = 338; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 1: 
	case 2: 
	case 3: 
	case 4: 
	case 5: 
	case 6: 
	case 7: 
	case 8: 
	case 9: 
	case 10: 
	case 11: 
	case 12: 
	case 13: 
	case 14: 
	case 15: 
	case 16: 
	case 17: 
	case 18: 
	case 19: 
	case 20: 
	case 21: 
	case 22: 
	case 23: 
	case 24: 
	case 25: 
	case 26: 
	case 27: 
	case 28: 
	case 29: 
	case 30: 
	case 31: 
	case 32: 
	case 33: 
	case 34: 
	case 35: 
	case 36: 
	case 37: 
	case 38: 
	case 39: 
	case 40: 
	case 41: 
	case 42: 
	case 43: 
	case 44: 
	case 45: 
	case 46: 
	case 47: 
	case 48: 
	case 49: 
	case 50: 
	case 51: 
	case 52: 
	case 53: 
	case 54: 
	case 55: 
	case 56: 
	case 57: 
	case 58: 
	case 59: 
	case 60: 
	case 61: 
	case 62: 
	case 63: 
	case 64: 
	case 65: 
	case 66: 
	case 67: 
	case 68: 
	case 69: 
	case 70: 
	case 71: 
	case 72: 
	case 73: 
	case 74: 
	case 75: 
	case 76: 
	case 77: 
	case 78: 
	case 79: 
	case 80: 
	case 81: 
	case 82: 
	case 83: 
	case 84: 
	case 85: 
	case 86: 
	case 87: 
	case 88: 
	case 89: 
	case 90: 
	case 91: 
	case 92: 
	case 93: 
	case 94: 
	case 95: 
	case 96: 
	case 97: 
	case 98: 
	case 99: 
	case 100: 
	case 101: 
	case 102: 
	case 103: 
	case 104: 
	case 105: 
	case 106: 
	case 107: 
	case 108: 
	case 109: 
	case 110: 
	case 111: 
	case 112: 
	case 113: 
	case 114: 
	case 115: 
	case 116: 
	case 117: 
	case 118: 
	case 119: 
	case 120: 
	case 121: 
	case 122: 
	case 123: 
	case 124: 
	case 125: 
	case 126: 
	case 127: 
	case 128: 
	case 129: 
	case 130: 
	case 131: 
	case 132: 
	case 133: 
	case 134: 
	case 135: 
	case 136: 
	case 137: 
	case 138: 
	case 139: 
	case 140: 
	case 141: 
	case 142: 
	case 143: 
	case 144: 
	case 145: 
	case 146: 
	case 147: 
	case 148: 
	case 149: 
	case 150: 
	case 151: 
	case 152: 
	case 153: 
	case 154: 
	case 155: 
	case 156: 
	case 157: 
	case 158: 
	case 159: 
	case 160: 
	case 161: 
	case 162: 
	case 163: 
	case 164: 
	case 165: 
	case 166: 
	case 167: 
	case 168: 
	case 169: 
	case 170: 
	case 171: 
	case 172: 
	case 173: 
	case 174: 
	case 175: 
	case 176: 
	case 177: 
	case 178: 
	case 179: 
	case 180: 
	case 181: 
	case 182: 
	case 183: 
	case 184: 
	case 185: 
	case 186: 
	case 187: 
	case 188: 
	case 189: 
	case 190: 
	case 191: 
	case 192: 
	case 193: 
	case 194: 
	case 195: 
	case 196: 
	case 197: 
	case 198: 
	case 199: 
	case 200: 
	case 201: 
	case 202: 
	case 203: 
	case 204: 
	case 205: 
	case 206: 
	case 207: 
	case 208: 
	case 209: 
	case 210: 
	case 211: 
	case 212: 
	case 213: 
	case 214: 
	case 215: 
	case 216: 
	case 217: 
	case 218: 
	case 219: 
	case 220: 
	case 221: 
	case 222: 
	case 223: 
	case 224: 
	case 225: 
	case 226: 
	case 227: 
	case 228: 
	case 229: 
	case 230: 
	case 231: 
	case 232: 
	case 233: 
	case 234: 
	case 235: 
	case 236: 
	case 237: 
	case 238: 
	case 239: 
	case 240: 
	case 241: 
	case 242: 
	case 243: 
	case 244: 
	case 245: 
	case 246: 
	case 247: 
	case 248: 
	case 249: 
	case 250: 
	case 251: 
	case 252: 
	case 253: 
	case 254: 
	case 255: 
	case 256: 
	case 257: 
	case 258: 
	case 259: 
	case 260: 
	case 261: 
	case 262: 
	case 263: 
	case 264: 
	case 265: 
	case 266: 
	case 267: 
	case 268: 
	case 269: 
	case 270: 
	case 271: 
	case 272: 
	case 273: 
	case 274: 
	case 275: 
	case 276: 
	case 277: 
	case 278: 
	case 279: 
	case 280: 
	case 281: 
	case 282: 
	case 283: 
	case 284: 
	case 285: 
	case 286: 
	case 287: 
	case 288: 
	case 289: 
	case 290: 
	case 291: 
	case 292: 
	case 293: 
	case 294: 
	case 295: 
	case 296: 
	case 297: 
	case 298: 
	case 299: 
	case 300: 
	case 301: 
	case 302: 
	case 303: 
	case 304: 
	case 305: 
	case 306: 
	case 307: 
	case 308: 
	case 309: 
	case 310: 
	case 311: 
	case 312: 
	case 313: 
	case 314: 
	case 315: 
	case 316: 
	case 317: 
	case 318: 
	case 319: 
	case 320: 
	case 321: 
	case 322: 
	case 323: 
	case 324: 
	case 325: 
	case 326: 
	case 327: 
	case 328: 
	case 329: 
	case 330: 
	case 331: 
	case 332: 
	case 333: 
	case 334: 
	case 335: 
	case 336: 
	case 337: 
	case 338: 
#line 7 "xmpp_uri.rl"
	{ ret=0; }
	break;
#line 6204 "xmpp_uri.c"
	}
	}

	_out: {}
	}

#line 38 "xmpp_uri.rl"

  if (ret)
    return enif_make_atom(env, "true");
  else
    return enif_make_atom(env, "false");
}

static ErlNifFunc nif_funcs[] =
  {
    {"is_valid", 1, is_valid}
  };

ERL_NIF_INIT(xmpp_uri, nif_funcs, load, NULL, NULL, NULL)
