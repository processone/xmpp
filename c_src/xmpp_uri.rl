#include <erl_nif.h>
#include <string.h>

%%{
  machine xmpp_uri;
  include uri "uri.rl";
  action uri_parse_error { ret=0; }
  main := xmppuri $! uri_parse_error;
}%%

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

  %% write init;
  %% write exec;

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
