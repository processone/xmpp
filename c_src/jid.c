
#line 1 "jid.rl"
#include <erl_nif.h>
#include <string.h>


#line 28 "jid.rl"


static const int jid_start = 1;

static int load(ErlNifEnv* env, void** priv, ERL_NIF_TERM load_info)
{
  return 0;
}

static ERL_NIF_TERM mk_binary_term(ErlNifEnv* env, char *start, char *stop,
				   int start_offset, int stop_offset)
{
  ERL_NIF_TERM result;

  if (stop && start) {
    stop += stop_offset;
    start += start_offset;
    if (stop > start) {
      size_t size = stop - start;
      unsigned char *buf = enif_make_new_binary(env, size, &result);
      if (buf) {
	memcpy(buf, start, size);
	return result;
      }
    }
  }

  enif_make_new_binary(env, 0, &result);
  return result;
}

static ERL_NIF_TERM string_to_usr(ErlNifEnv* env, int argc,
				  const ERL_NIF_TERM argv[])
{
  ErlNifBinary input;
  ERL_NIF_TERM node, domain, resource;
  int cs = 0, ret = 1;
  signed char *node_start = NULL;
  signed char *node_end = NULL;
  signed char *domain_start = NULL;
  signed char *domain_end = NULL;
  signed char *resource_start = NULL;
  signed char *resource_end = NULL;

  if (argc != 1)
    return enif_make_badarg(env);

  if (!(enif_inspect_binary(env, argv[0], &input)))
    return enif_make_badarg(env);

  if (!input.size)
    return enif_make_atom(env, "error");

  signed char *p = (signed char *) input.data;
  signed char *pe = p + input.size;
  signed char *eof = pe;

  
#line 67 "jid.c"
	{
	cs = jid_start;
	}

#line 86 "jid.rl"
  
#line 74 "jid.c"
	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
case 1:
	switch( (*p) ) {
		case -32: goto tr2;
		case -19: goto tr4;
		case -16: goto tr5;
		case -12: goto tr7;
		case 32: goto tr0;
		case 34: goto tr9;
		case 46: goto tr10;
		case 47: goto tr0;
		case 58: goto tr9;
		case 60: goto tr9;
		case 62: goto tr9;
		case 64: goto tr0;
	}
	if ( (*p) < -15 ) {
		if ( (*p) < -62 ) {
			if ( (*p) <= -63 )
				goto tr0;
		} else if ( (*p) > -33 ) {
			if ( -31 <= (*p) && (*p) <= -17 )
				goto tr3;
		} else
			goto tr1;
	} else if ( (*p) > -13 ) {
		if ( (*p) < 9 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr0;
		} else if ( (*p) > 13 ) {
			if ( 38 <= (*p) && (*p) <= 39 )
				goto tr9;
		} else
			goto tr0;
	} else
		goto tr6;
	goto tr8;
tr0:
#line 15 "jid.rl"
	{ ret = 0; }
	goto st0;
#line 120 "jid.c"
st0:
cs = 0;
	goto _out;
tr1:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st2;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
#line 134 "jid.c"
	if ( (*p) <= -65 )
		goto tr11;
	goto tr0;
tr8:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st33;
tr11:
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st33;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 154 "jid.c"
	switch( (*p) ) {
		case -32: goto st3;
		case -19: goto st5;
		case -16: goto st6;
		case -12: goto st8;
		case 32: goto tr0;
		case 34: goto tr14;
		case 46: goto tr47;
		case 47: goto tr48;
		case 58: goto tr14;
		case 60: goto tr14;
		case 62: goto tr14;
		case 64: goto tr33;
	}
	if ( (*p) < -15 ) {
		if ( (*p) < -62 ) {
			if ( (*p) <= -63 )
				goto tr0;
		} else if ( (*p) > -33 ) {
			if ( -31 <= (*p) && (*p) <= -17 )
				goto st4;
		} else
			goto st2;
	} else if ( (*p) > -13 ) {
		if ( (*p) < 9 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr0;
		} else if ( (*p) > 13 ) {
			if ( 38 <= (*p) && (*p) <= 39 )
				goto tr14;
		} else
			goto tr0;
	} else
		goto st7;
	goto tr11;
tr2:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st3;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 200 "jid.c"
	if ( -96 <= (*p) && (*p) <= -65 )
		goto st2;
	goto tr0;
tr3:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st4;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
#line 214 "jid.c"
	if ( (*p) <= -65 )
		goto st2;
	goto tr0;
tr4:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st5;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 228 "jid.c"
	if ( (*p) <= -97 )
		goto st2;
	goto tr0;
tr5:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
#line 242 "jid.c"
	if ( -112 <= (*p) && (*p) <= -65 )
		goto st4;
	goto tr0;
tr6:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st7;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
#line 256 "jid.c"
	if ( (*p) <= -65 )
		goto st4;
	goto tr0;
tr7:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st8;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
#line 270 "jid.c"
	if ( (*p) <= -113 )
		goto st4;
	goto tr0;
tr9:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st34;
tr14:
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st34;
tr41:
#line 10 "jid.rl"
	{ domain_start = p; }
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st34;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 296 "jid.c"
	switch( (*p) ) {
		case -32: goto st10;
		case -19: goto st12;
		case -16: goto st13;
		case -12: goto st15;
		case 32: goto tr0;
		case 46: goto tr54;
		case 47: goto tr48;
		case 64: goto tr0;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto st9;
		} else
			goto tr0;
	} else if ( (*p) > -17 ) {
		if ( (*p) < -11 ) {
			if ( -15 <= (*p) && (*p) <= -13 )
				goto st14;
		} else if ( (*p) > -1 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr0;
		} else
			goto tr0;
	} else
		goto st11;
	goto tr14;
tr34:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 333 "jid.c"
	if ( (*p) <= -65 )
		goto tr14;
	goto tr0;
tr35:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 345 "jid.c"
	if ( -96 <= (*p) && (*p) <= -65 )
		goto st9;
	goto tr0;
tr36:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st11;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 357 "jid.c"
	if ( (*p) <= -65 )
		goto st9;
	goto tr0;
tr37:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st12;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
#line 369 "jid.c"
	if ( (*p) <= -97 )
		goto st9;
	goto tr0;
tr38:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 381 "jid.c"
	if ( -112 <= (*p) && (*p) <= -65 )
		goto st11;
	goto tr0;
tr39:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st14;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
#line 393 "jid.c"
	if ( (*p) <= -65 )
		goto st11;
	goto tr0;
tr40:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st15;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
#line 405 "jid.c"
	if ( (*p) <= -113 )
		goto st11;
	goto tr0;
tr54:
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st35;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
#line 417 "jid.c"
	switch( (*p) ) {
		case -32: goto st10;
		case -19: goto st12;
		case -16: goto st13;
		case -12: goto st15;
		case 32: goto tr0;
		case 46: goto tr0;
		case 47: goto tr48;
		case 64: goto tr0;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto st9;
		} else
			goto tr0;
	} else if ( (*p) > -17 ) {
		if ( (*p) < -11 ) {
			if ( -15 <= (*p) && (*p) <= -13 )
				goto st14;
		} else if ( (*p) > -1 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr0;
		} else
			goto tr0;
	} else
		goto st11;
	goto tr14;
tr48:
#line 11 "jid.rl"
	{ resource_start = p; }
	goto st16;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
#line 454 "jid.c"
	switch( (*p) ) {
		case -32: goto st18;
		case -19: goto st20;
		case -16: goto st21;
		case -12: goto st23;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto st17;
		} else
			goto tr0;
	} else if ( (*p) > -17 ) {
		if ( (*p) > -13 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr0;
		} else if ( (*p) >= -15 )
			goto st22;
	} else
		goto st19;
	goto tr24;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	if ( (*p) <= -65 )
		goto tr24;
	goto tr0;
tr24:
#line 14 "jid.rl"
	{ resource_end = p; }
	goto st36;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 491 "jid.c"
	switch( (*p) ) {
		case -32: goto st18;
		case -19: goto st20;
		case -16: goto st21;
		case -12: goto st23;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto st17;
		} else
			goto tr0;
	} else if ( (*p) > -17 ) {
		if ( (*p) > -13 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr0;
		} else if ( (*p) >= -15 )
			goto st22;
	} else
		goto st19;
	goto tr24;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	if ( -96 <= (*p) && (*p) <= -65 )
		goto st17;
	goto tr0;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	if ( (*p) <= -65 )
		goto st17;
	goto tr0;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
	if ( (*p) <= -97 )
		goto st17;
	goto tr0;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	if ( -112 <= (*p) && (*p) <= -65 )
		goto st19;
	goto tr0;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
	if ( (*p) <= -65 )
		goto st19;
	goto tr0;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
	if ( (*p) <= -113 )
		goto st19;
	goto tr0;
tr47:
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st37;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 563 "jid.c"
	switch( (*p) ) {
		case -32: goto st3;
		case -19: goto st5;
		case -16: goto st6;
		case -12: goto st8;
		case 32: goto tr0;
		case 34: goto tr14;
		case 46: goto st24;
		case 47: goto tr48;
		case 58: goto tr14;
		case 60: goto tr14;
		case 62: goto tr14;
		case 64: goto tr33;
	}
	if ( (*p) < -15 ) {
		if ( (*p) < -62 ) {
			if ( (*p) <= -63 )
				goto tr0;
		} else if ( (*p) > -33 ) {
			if ( -31 <= (*p) && (*p) <= -17 )
				goto st4;
		} else
			goto st2;
	} else if ( (*p) > -13 ) {
		if ( (*p) < 9 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr0;
		} else if ( (*p) > 13 ) {
			if ( 38 <= (*p) && (*p) <= 39 )
				goto tr14;
		} else
			goto tr0;
	} else
		goto st7;
	goto tr11;
tr10:
#line 9 "jid.rl"
	{ node_start = p; }
	goto st24;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
#line 607 "jid.c"
	switch( (*p) ) {
		case -32: goto st26;
		case -19: goto st28;
		case -16: goto st29;
		case -12: goto st31;
		case 32: goto tr0;
		case 34: goto tr0;
		case 47: goto tr0;
		case 58: goto tr0;
		case 60: goto tr0;
		case 62: goto tr0;
		case 64: goto tr33;
	}
	if ( (*p) < -15 ) {
		if ( (*p) < -62 ) {
			if ( (*p) <= -63 )
				goto tr0;
		} else if ( (*p) > -33 ) {
			if ( -31 <= (*p) && (*p) <= -17 )
				goto st27;
		} else
			goto st25;
	} else if ( (*p) > -13 ) {
		if ( (*p) < 9 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr0;
		} else if ( (*p) > 13 ) {
			if ( 38 <= (*p) && (*p) <= 39 )
				goto tr0;
		} else
			goto tr0;
	} else
		goto st30;
	goto st24;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
	if ( (*p) <= -65 )
		goto st24;
	goto tr0;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
	if ( -96 <= (*p) && (*p) <= -65 )
		goto st25;
	goto tr0;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
	if ( (*p) <= -65 )
		goto st25;
	goto tr0;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
	if ( (*p) <= -97 )
		goto st25;
	goto tr0;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	if ( -112 <= (*p) && (*p) <= -65 )
		goto st27;
	goto tr0;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
	if ( (*p) <= -65 )
		goto st27;
	goto tr0;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
	if ( (*p) <= -113 )
		goto st27;
	goto tr0;
tr33:
#line 12 "jid.rl"
	{ node_end = p; }
	goto st32;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
#line 699 "jid.c"
	switch( (*p) ) {
		case -32: goto tr35;
		case -19: goto tr37;
		case -16: goto tr38;
		case -12: goto tr40;
		case 32: goto tr0;
		case 64: goto tr0;
	}
	if ( (*p) < -15 ) {
		if ( (*p) < -62 ) {
			if ( (*p) <= -63 )
				goto tr0;
		} else if ( (*p) > -33 ) {
			if ( -31 <= (*p) && (*p) <= -17 )
				goto tr36;
		} else
			goto tr34;
	} else if ( (*p) > -13 ) {
		if ( (*p) < 9 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr0;
		} else if ( (*p) > 13 ) {
			if ( 46 <= (*p) && (*p) <= 47 )
				goto tr0;
		} else
			goto tr0;
	} else
		goto tr39;
	goto tr41;
	}
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 33: 
	case 34: 
	case 35: 
	case 37: 
#line 11 "jid.rl"
	{ resource_start = p; }
	break;
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
#line 15 "jid.rl"
	{ ret = 0; }
	break;
#line 813 "jid.c"
	}
	}

	_out: {}
	}

#line 87 "jid.rl"

  if (ret) {
    node = mk_binary_term(env, (char *) node_start, (char *) node_end, 0, 0);
    domain = mk_binary_term(env, (char *) domain_start, (char *) domain_end, 0, 1);
    resource = mk_binary_term(env, (char *) resource_start, (char *) resource_end, 1, 1);
    return enif_make_tuple3(env, node, domain, resource);
  } else {
    return enif_make_atom(env, "error");
  }
}

static ErlNifFunc nif_funcs[] =
  {
    {"string_to_usr", 1, string_to_usr}
  };

ERL_NIF_INIT(jid, nif_funcs, load, NULL, NULL, NULL)
