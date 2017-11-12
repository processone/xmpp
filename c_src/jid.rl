#include <erl_nif.h>
#include <string.h>

%%{
  machine jid;

  include utf8 "utf8.rl";

  action node_start { node_start = p; }
  action domain_start { domain_start = p; }
  action resource_start { resource_start = p; }
  action node_end { node_end = p; }
  action domain_end { domain_end = p; }
  action resource_end { resource_end = p; }
  action parse_error { ret = 0; }

  idbyte = UTF8_char -- (space | [\"&\'/:<>@]);
  domainbyte = UTF8_char -- (space | [.@/]);

  node = (idbyte+ '@')?;
  domain = (domainbyte+ '.')* domainbyte+ '.'?;
  resource = ('/' UTF8_char+)?;
  main := (
	   (node     > node_start     @ node_end)
	   (domain   > domain_start   @ domain_end)
	   (resource > resource_start @ resource_end)
	  ) $! parse_error;
}%%

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
  char *node_start = NULL;
  char *node_end = NULL;
  char *domain_start = NULL;
  char *domain_end = NULL;
  char *resource_start = NULL;
  char *resource_end = NULL;

  if (argc != 1)
    return enif_make_badarg(env);

  if (!(enif_inspect_binary(env, argv[0], &input)))
    return enif_make_badarg(env);

  if (!input.size)
    return enif_make_atom(env, "error");

  char *p = (char *) input.data;
  char *pe = p + input.size;
  char *eof = pe;

  %% write init;
  %% write exec;

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
