%%%-------------------------------------------------------------------
%%% @author Evgeny Khramtsov <ekhramtsov@process-one.net>
%%% @doc
%%%   JID processing library
%%% @end
%%% Created : 24 Nov 2015 by Evgeny Khramtsov <ekhramtsov@process-one.net>
%%%
%%%
%%% Copyright (C) 2002-2025 ProcessOne, SARL. All Rights Reserved.
%%%
%%% Licensed under the Apache License, Version 2.0 (the "License");
%%% you may not use this file except in compliance with the License.
%%% You may obtain a copy of the License at
%%%
%%%     http://www.apache.org/licenses/LICENSE-2.0
%%%
%%% Unless required by applicable law or agreed to in writing, software
%%% distributed under the License is distributed on an "AS IS" BASIS,
%%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%% See the License for the specific language governing permissions and
%%% limitations under the License.
%%%
%%%-------------------------------------------------------------------

-module(jid).

%% API
-export([start/0,
	 make/1,
	 make/2,
	 make/3,
	 split/1,
	 decode/1,
	 encode/1,
	 is_nodename/1,
	 nodeprep/1,
	 nameprep/1,
	 resourceprep/1,
	 tolower/1,
	 remove_resource/1,
	 replace_resource/2]).

%% to_string/1 and from_string/1 are deprecated for the following reasons:
%% (1) The naming is misleading, because there are actually no strings to
%%     decode/encode
%% (2) What's more important, a user typically doesn't check the output
%%     of from_string/1, which leads to hard to debug side effects,
%%     because the value of 'error' is propagated downstream and will fail
%%     in unexpected places where it's impossible to understand where
%%     this 'error' value came from; thus, it's much better to generate
%%     an exception; to_string/1 is renamed to encode/1 for consistency
%% (3) As a consequence of (2) Dialyzer produces typings in the form
%%     of 'error | #jid{}' for some functions which is not very good
-export([from_string/1, to_string/1]).
-deprecated([{from_string, 1}, {to_string, 1}]).

%% For tests only
-export([string_to_usr/1]).

-include("jid.hrl").

-export_type([jid/0]).
-export_type([ljid/0]).

%%%===================================================================
%%% API
%%%===================================================================
-spec start() -> ok | {error, unable_to_load_nif}.

start() ->
    load_nif(p1_nif_utils:get_so_path(?MODULE, [jid], "jid")).

load_nif(SOPath) ->
    case catch erlang:load_nif(SOPath, 0) of
	ok -> ok;
	{error, {reload, _}} -> ok;
	Err -> error_logger:warning_msg("unable to load jid NIF: ~p~n", [Err]),
	       {error, unable_to_load_nif}
    end.

-spec make(binary(), binary(), binary()) -> jid() | error.

make(User, Server, Resource) ->
    case nodeprep(User) of
      error -> error;
      LUser ->
	  case nameprep(Server) of
	    error -> error;
	    LServer ->
		case resourceprep(Resource) of
		  error -> error;
		  LResource ->
		      #jid{user = User, server = Server, resource = Resource,
			   luser = LUser, lserver = LServer,
			   lresource = LResource}
		end
	  end
    end.

-spec make(binary(), binary()) -> jid() | error.
make(User, Server) ->
    make(User, Server, <<"">>).

-spec make({binary(), binary(), binary()} | binary()) -> jid() | error.

make({User, Server, Resource}) ->
    make(User, Server, Resource);
make(Server) ->
    make(<<"">>, Server, <<"">>).

%% This is the reverse of make_jid/1
-spec split(jid()) -> {binary(), binary(), binary()} | error.

split(#jid{user = U, server = S, resource = R}) ->
    {U, S, R};
split(_) ->
    error.

-spec string_to_usr(binary()) -> {binary(), binary(), binary()} | error.
string_to_usr(_S) ->
    erlang:nif_error(nif_not_loaded).

-spec from_string(binary() | string()) -> jid() | error.
from_string(S) when is_list(S) ->
    %% We do not accept list because we want to enforce good practice of
    %% using binaries for string. However, we do not let it crash to avoid
    %% losing associated ets table.
    {error, need_jid_as_binary};
from_string(<<>>) ->
    error;
from_string(S) when is_binary(S) ->
    make(string_to_usr(S)).

-spec decode(binary()) -> jid().
decode(S) when is_binary(S) ->
    case string_to_usr(S) of
	error ->
	    erlang:error({bad_jid, S});
	Val ->
	    case make(Val) of
		error -> erlang:error({bad_jid, S});
		Prepped -> Prepped
	    end
    end.

-spec encode(jid() | ljid()) -> binary().
encode(J) ->
    to_string(J).

-spec to_string(jid() | ljid()) -> binary().

to_string(#jid{user = User, server = Server,
	       resource = Resource}) ->
    to_string({User, Server, Resource});
to_string({N, S, R}) ->
    Node = iolist_to_binary(N),
    Server = iolist_to_binary(S),
    Resource = iolist_to_binary(R),
    S1 = case Node of
	   <<"">> -> <<"">>;
	   _ -> <<Node/binary, "@">>
	 end,
    S2 = <<S1/binary, Server/binary>>,
    S3 = case Resource of
	   <<"">> -> S2;
	   _ -> <<S2/binary, "/", Resource/binary>>
	 end,
    S3.

-spec is_nodename(binary()) -> boolean().

is_nodename(Node) ->
    N = nodeprep(Node),
    (N /= error) and (N /= <<>>).

-define(LOWER(Char),
	if Char >= $A, Char =< $Z -> Char + 32;
	   true -> Char
	end).

-spec nodeprep(binary()) -> binary() | error.

nodeprep("") -> <<>>;
nodeprep(S) when byte_size(S) < 1024 ->
    R = stringprep:nodeprep(S),
    if byte_size(R) < 1024 -> R;
       true -> error
    end;
nodeprep(_) -> error.

-spec nameprep(binary()) -> binary() | error.

nameprep(S) when byte_size(S) < 1024 ->
    R = stringprep:nameprep(S),
    if byte_size(R) < 1024 -> R;
       true -> error
    end;
nameprep(_) -> error.

-spec resourceprep(binary()) -> binary() | error.

resourceprep(S) when byte_size(S) < 1024 ->
    R = stringprep:resourceprep(S),
    if byte_size(R) < 1024 -> R;
       true -> error
    end;
resourceprep(_) -> error.

-spec tolower(jid()) -> ljid();
	     (ljid()) -> error | ljid().
tolower(#jid{luser = U, lserver = S,
	     lresource = R}) ->
    {U, S, R};
tolower({U, S, R}) ->
    case nodeprep(U) of
      error -> error;
      LUser ->
	  case nameprep(S) of
	    error -> error;
	    LServer ->
		case resourceprep(R) of
		  error -> error;
		  LResource -> {LUser, LServer, LResource}
		end
	  end
    end.

-spec remove_resource(jid()) -> jid();
		     (ljid()) -> ljid().

remove_resource(#jid{} = JID) ->
    JID#jid{resource = <<"">>, lresource = <<"">>};
remove_resource({U, S, _R}) -> {U, S, <<"">>}.

-spec replace_resource(jid(), binary()) -> error | jid().

replace_resource(JID, Resource) ->
    case resourceprep(Resource) of
      error -> error;
      LResource ->
	  JID#jid{resource = Resource, lresource = LResource}
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
