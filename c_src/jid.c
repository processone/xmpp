
#line 1 "jid.rl"
#include <erl_nif.h>
#include <string.h>


#line 28 "jid.rl"



#line 12 "jid.c"
static const int foo_start = 31;
static const int foo_first_final = 31;
static const int foo_error = 0;

static const int foo_en_main = 31;


#line 31 "jid.rl"

static int load(ErlNifEnv* env, void** priv, ERL_NIF_TERM load_info)
{
  return 0;
}

static ERL_NIF_TERM mk_binary_term(ErlNifEnv* env, char *start, char *stop,
				   int start_offset, int stop_offset)
{
  if (stop && start) {
    stop += stop_offset;
    start += start_offset;
    if (stop > start) {
      ErlNifBinary bin;
      size_t size = stop - start;
      if (enif_alloc_binary(size, &bin)) {
	memcpy(bin.data, start, size);
	return enif_make_binary(env, &bin);
      }
    }
  }

  ERL_NIF_TERM empty;
  enif_make_new_binary(env, 0, &empty);
  return empty;
}

static ERL_NIF_TERM string_to_usr(ErlNifEnv* env, int argc,
				  const ERL_NIF_TERM argv[])
{
  ErlNifBinary input;
  ERL_NIF_TERM node, domain, resource;
  int cs = 0, ret = 1;
  char *node_start = NULL;
  char *node_end = NULL;
  char *domain_start = NULL;
  char *domain_end = NULL;
  char *resource_start = NULL;
  char *resource_end = NULL;

  if (argc != 1)
    return enif_make_badarg(env);

  if (!(enif_inspect_iolist_as_binary(env, argv[0], &input)))
    return enif_make_badarg(env);

  if (!input.size)
    return enif_make_atom(env, "error");

  char *p = (char *) input.data;
  char *pe = p + input.size;
  char *eof = pe;

  
#line 75 "jid.c"
	{
	cs = foo_start;
	}

#line 85 "jid.rl"
  
#line 82 "jid.c"
	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
case 31:
	switch( (*p) ) {
		case -32: goto tr25;
		case -19: goto tr27;
		case -16: goto tr28;
		case -12: goto tr30;
		case 32: goto tr1;
		case 34: goto tr32;
		case 46: goto tr33;
		case 47: goto tr34;
		case 58: goto tr32;
		case 60: goto tr32;
		case 62: goto tr32;
		case 64: goto tr1;
	}
	if ( (*p) < -15 ) {
		if ( (*p) < -62 ) {
			if ( (*p) <= -63 )
				goto tr1;
		} else if ( (*p) > -33 ) {
			if ( -31 <= (*p) && (*p) <= -17 )
				goto tr26;
		} else
			goto tr24;
	} else if ( (*p) > -13 ) {
		if ( (*p) < 9 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr1;
		} else if ( (*p) > 13 ) {
			if ( 38 <= (*p) && (*p) <= 39 )
				goto tr32;
		} else
			goto tr1;
	} else
		goto tr29;
	goto tr31;
tr1:
#line 15 "jid.rl"
	{ ret = 0; }
	goto st0;
#line 128 "jid.c"
st0:
cs = 0;
	goto _out;
tr24:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 142 "jid.c"
	if ( (*p) <= -65 )
		goto tr0;
	goto tr1;
tr0:
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st32;
tr31:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st32;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
#line 162 "jid.c"
	switch( (*p) ) {
		case -32: goto st2;
		case -19: goto st4;
		case -16: goto st5;
		case -12: goto st7;
		case 32: goto tr1;
		case 34: goto tr4;
		case 46: goto tr40;
		case 47: goto tr41;
		case 58: goto tr4;
		case 60: goto tr4;
		case 62: goto tr4;
		case 64: goto tr23;
	}
	if ( (*p) < -15 ) {
		if ( (*p) < -62 ) {
			if ( (*p) <= -63 )
				goto tr1;
		} else if ( (*p) > -33 ) {
			if ( -31 <= (*p) && (*p) <= -17 )
				goto st3;
		} else
			goto st1;
	} else if ( (*p) > -13 ) {
		if ( (*p) < 9 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr1;
		} else if ( (*p) > 13 ) {
			if ( 38 <= (*p) && (*p) <= 39 )
				goto tr4;
		} else
			goto tr1;
	} else
		goto st6;
	goto tr0;
tr25:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st2;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
#line 208 "jid.c"
	if ( -96 <= (*p) && (*p) <= -65 )
		goto st1;
	goto tr1;
tr26:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st3;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 222 "jid.c"
	if ( (*p) <= -65 )
		goto st1;
	goto tr1;
tr27:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st4;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
#line 236 "jid.c"
	if ( (*p) <= -97 )
		goto st1;
	goto tr1;
tr28:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st5;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
#line 250 "jid.c"
	if ( -112 <= (*p) && (*p) <= -65 )
		goto st3;
	goto tr1;
tr29:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
#line 264 "jid.c"
	if ( (*p) <= -65 )
		goto st3;
	goto tr1;
tr30:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st7;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
#line 278 "jid.c"
	if ( (*p) <= -113 )
		goto st3;
	goto tr1;
tr4:
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st33;
tr32:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st33;
tr55:
#line 10 "jid.rl"
	{ domain_start = p; }
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st33;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 304 "jid.c"
	switch( (*p) ) {
		case -32: goto st9;
		case -19: goto st11;
		case -16: goto st12;
		case -12: goto st14;
		case 32: goto tr1;
		case 46: goto tr47;
		case 47: goto tr41;
		case 64: goto tr1;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto st8;
		} else
			goto tr1;
	} else if ( (*p) > -17 ) {
		if ( (*p) < -11 ) {
			if ( -15 <= (*p) && (*p) <= -13 )
				goto st13;
		} else if ( (*p) > -1 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr1;
		} else
			goto tr1;
	} else
		goto st10;
	goto tr4;
tr48:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st8;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
#line 341 "jid.c"
	if ( (*p) <= -65 )
		goto tr4;
	goto tr1;
tr49:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 353 "jid.c"
	if ( -96 <= (*p) && (*p) <= -65 )
		goto st8;
	goto tr1;
tr50:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 365 "jid.c"
	if ( (*p) <= -65 )
		goto st8;
	goto tr1;
tr51:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st11;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
#line 377 "jid.c"
	if ( (*p) <= -97 )
		goto st8;
	goto tr1;
tr52:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st12;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
#line 389 "jid.c"
	if ( -112 <= (*p) && (*p) <= -65 )
		goto st10;
	goto tr1;
tr53:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 401 "jid.c"
	if ( (*p) <= -65 )
		goto st10;
	goto tr1;
tr54:
#line 10 "jid.rl"
	{ domain_start = p; }
	goto st14;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
#line 413 "jid.c"
	if ( (*p) <= -113 )
		goto st10;
	goto tr1;
tr47:
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st34;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 425 "jid.c"
	switch( (*p) ) {
		case -32: goto st9;
		case -19: goto st11;
		case -16: goto st12;
		case -12: goto st14;
		case 32: goto tr1;
		case 46: goto tr1;
		case 47: goto tr41;
		case 64: goto tr1;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto st8;
		} else
			goto tr1;
	} else if ( (*p) > -17 ) {
		if ( (*p) < -11 ) {
			if ( -15 <= (*p) && (*p) <= -13 )
				goto st13;
		} else if ( (*p) > -1 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr1;
		} else
			goto tr1;
	} else
		goto st10;
	goto tr4;
tr34:
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
#line 11 "jid.rl"
	{ resource_start = p; }
	goto st15;
tr41:
#line 11 "jid.rl"
	{ resource_start = p; }
	goto st15;
tr56:
#line 10 "jid.rl"
	{ domain_start = p; }
#line 11 "jid.rl"
	{ resource_start = p; }
	goto st15;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
#line 476 "jid.c"
	switch( (*p) ) {
		case -32: goto st17;
		case -19: goto st19;
		case -16: goto st20;
		case -12: goto st22;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto st16;
		} else
			goto tr1;
	} else if ( (*p) > -17 ) {
		if ( (*p) > -13 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr1;
		} else if ( (*p) >= -15 )
			goto st21;
	} else
		goto st18;
	goto tr14;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
	if ( (*p) <= -65 )
		goto tr14;
	goto tr1;
tr14:
#line 14 "jid.rl"
	{ resource_end = p; }
	goto st35;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
#line 513 "jid.c"
	switch( (*p) ) {
		case -32: goto st17;
		case -19: goto st19;
		case -16: goto st20;
		case -12: goto st22;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto st16;
		} else
			goto tr1;
	} else if ( (*p) > -17 ) {
		if ( (*p) > -13 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr1;
		} else if ( (*p) >= -15 )
			goto st21;
	} else
		goto st18;
	goto tr14;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
	if ( -96 <= (*p) && (*p) <= -65 )
		goto st16;
	goto tr1;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	if ( (*p) <= -65 )
		goto st16;
	goto tr1;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
	if ( (*p) <= -97 )
		goto st16;
	goto tr1;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
	if ( -112 <= (*p) && (*p) <= -65 )
		goto st18;
	goto tr1;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	if ( (*p) <= -65 )
		goto st18;
	goto tr1;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
	if ( (*p) <= -113 )
		goto st18;
	goto tr1;
tr40:
#line 13 "jid.rl"
	{ domain_end = p; }
	goto st36;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 585 "jid.c"
	switch( (*p) ) {
		case -32: goto st2;
		case -19: goto st4;
		case -16: goto st5;
		case -12: goto st7;
		case 32: goto tr1;
		case 34: goto tr4;
		case 46: goto st23;
		case 47: goto tr41;
		case 58: goto tr4;
		case 60: goto tr4;
		case 62: goto tr4;
		case 64: goto tr23;
	}
	if ( (*p) < -15 ) {
		if ( (*p) < -62 ) {
			if ( (*p) <= -63 )
				goto tr1;
		} else if ( (*p) > -33 ) {
			if ( -31 <= (*p) && (*p) <= -17 )
				goto st3;
		} else
			goto st1;
	} else if ( (*p) > -13 ) {
		if ( (*p) < 9 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr1;
		} else if ( (*p) > 13 ) {
			if ( 38 <= (*p) && (*p) <= 39 )
				goto tr4;
		} else
			goto tr1;
	} else
		goto st6;
	goto tr0;
tr33:
#line 9 "jid.rl"
	{ node_start = p; }
	goto st23;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 629 "jid.c"
	switch( (*p) ) {
		case -32: goto st25;
		case -19: goto st27;
		case -16: goto st28;
		case -12: goto st30;
		case 32: goto tr1;
		case 34: goto tr1;
		case 47: goto tr1;
		case 58: goto tr1;
		case 60: goto tr1;
		case 62: goto tr1;
		case 64: goto tr23;
	}
	if ( (*p) < -15 ) {
		if ( (*p) < -62 ) {
			if ( (*p) <= -63 )
				goto tr1;
		} else if ( (*p) > -33 ) {
			if ( -31 <= (*p) && (*p) <= -17 )
				goto st26;
		} else
			goto st24;
	} else if ( (*p) > -13 ) {
		if ( (*p) < 9 ) {
			if ( -11 <= (*p) && (*p) <= -1 )
				goto tr1;
		} else if ( (*p) > 13 ) {
			if ( 38 <= (*p) && (*p) <= 39 )
				goto tr1;
		} else
			goto tr1;
	} else
		goto st29;
	goto st23;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
	if ( (*p) <= -65 )
		goto st23;
	goto tr1;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
	if ( -96 <= (*p) && (*p) <= -65 )
		goto st24;
	goto tr1;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
	if ( (*p) <= -65 )
		goto st24;
	goto tr1;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
	if ( (*p) <= -97 )
		goto st24;
	goto tr1;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
	if ( -112 <= (*p) && (*p) <= -65 )
		goto st26;
	goto tr1;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	if ( (*p) <= -65 )
		goto st26;
	goto tr1;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
	if ( (*p) <= -113 )
		goto st26;
	goto tr1;
tr23:
#line 12 "jid.rl"
	{ node_end = p; }
	goto st37;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 721 "jid.c"
	switch( (*p) ) {
		case -32: goto tr49;
		case -19: goto tr51;
		case -16: goto tr52;
		case -12: goto tr54;
		case 32: goto tr1;
		case 46: goto tr1;
		case 47: goto tr56;
		case 64: goto tr1;
	}
	if ( (*p) < -31 ) {
		if ( (*p) > -63 ) {
			if ( -62 <= (*p) && (*p) <= -33 )
				goto tr48;
		} else
			goto tr1;
	} else if ( (*p) > -17 ) {
		if ( (*p) < -11 ) {
			if ( -15 <= (*p) && (*p) <= -13 )
				goto tr53;
		} else if ( (*p) > -1 ) {
			if ( 9 <= (*p) && (*p) <= 13 )
				goto tr1;
		} else
			goto tr1;
	} else
		goto tr50;
	goto tr55;
	}
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 32: 
	case 33: 
	case 34: 
	case 36: 
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
#line 15 "jid.rl"
	{ ret = 0; }
	break;
	case 37: 
#line 10 "jid.rl"
	{ domain_start = p; }
#line 11 "jid.rl"
	{ resource_start = p; }
	break;
	case 31: 
#line 9 "jid.rl"
	{ node_start = p; }
#line 10 "jid.rl"
	{ domain_start = p; }
#line 11 "jid.rl"
	{ resource_start = p; }
	break;
#line 846 "jid.c"
	}
	}

	_out: {}
	}

#line 86 "jid.rl"

  if (ret) {
    node = mk_binary_term(env, node_start, node_end, 0, 0);
    domain = mk_binary_term(env, domain_start, domain_end, 0, 1);
    resource = mk_binary_term(env, resource_start, resource_end, 1, 1);
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
