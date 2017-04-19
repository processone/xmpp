#include <erl_nif.h>
#include <string.h>

static int load(ErlNifEnv* env, void** priv, ERL_NIF_TERM load_info)
{
  return 0;
}

static ERL_NIF_TERM *create_term(ErlNifEnv* env, ERL_NIF_TERM *term, unsigned char* start,
                                 unsigned char* end, ERL_NIF_TERM* empty, int* initialized)
{
  if (start == end) {
    if (!*initialized) {
        enif_make_new_binary(env, 0, empty);
        *initialized = 1;
    }
    return empty;
  }
  memcpy(enif_make_new_binary(env, end-start, term), start, end-start);

  return term;
}

static ERL_NIF_TERM split_str(ErlNifEnv* env, ErlNifBinary* input,
                              unsigned char* split1, unsigned char* split2, unsigned char* end)
{
  ERL_NIF_TERM node, domain, resource, empty;
  ERL_NIF_TERM *nodep, *domainp, *resourcep;
  int empty_initialized = 0;
  unsigned char *start = input->data;

  nodep = create_term(env, &node, start, split1, &empty, &empty_initialized);
  domainp = create_term(env, &domain, start==split1||split1==split2 ? split1 : split1+1, split2, &empty, &empty_initialized);
  resourcep = create_term(env, &resource, split1==split2||split2==end ? split2 : split2+1, end, &empty, &empty_initialized);
  enif_release_binary(input);

  return enif_make_tuple3(env,
                          *nodep,
                          *domainp,
                          *resourcep);
}

static ERL_NIF_TERM string_to_usr(ErlNifEnv* env, int argc,
				  const ERL_NIF_TERM argv[])
{
  ErlNifBinary input;

  if (argc != 1)
    return enif_make_badarg(env);

  if (!(enif_inspect_iolist_as_binary(env, argv[0], &input)))
    return enif_make_badarg(env);

  if (input.size == 0)
    return enif_make_atom(env, "error");

  unsigned char *end = input.data+input.size;
  unsigned char *c = input.data;

  while (c < end) {
    if (*c == '/' || *c == '@')
      break;
    c++;
  }

  if (c == end) {
    ERL_NIF_TERM empty;
    enif_make_new_binary(env, 0, &empty);

    return enif_make_tuple3(env,
                            empty,
                            enif_make_binary(env, &input),
                            empty);
  }

  if (c == input.data || c+1 == end) {
    enif_release_binary(&input);
    return enif_make_atom(env, "error");
  }

  if (*c == '/') {
    return split_str(env, &input, input.data, c, end);
  }

  unsigned char *c1 = c;
  c++;

  while (c < end) {
    if (*c == '/' || *c == '@')
      break;
    c++;
  }

  if (c == end) {
    return split_str(env, &input, c1, end, end);
  }

  if (c == c1+1 || c+1 == end) {
    enif_release_binary(&input);
    return enif_make_atom(env, "error");
  }

  if (*c == '@') {
    enif_release_binary(&input);
    return enif_make_atom(env, "error");
  }

  return split_str(env, &input, c1, c, end);
}

static ErlNifFunc nif_funcs[] =
  {
    {"string_to_usr", 1, string_to_usr}
  };

ERL_NIF_INIT(jid, nif_funcs, load, NULL, NULL, NULL)
