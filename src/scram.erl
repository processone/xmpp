%%%-------------------------------------------------------------------
%%% @author Stephen Röttger <stephen.roettger@googlemail.com>
%%%
%%% Copyright (C) 2002-2026 ProcessOne, SARL. All Rights Reserved.
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
-module(scram).
-author('stephen.roettger@googlemail.com').

%% External exports
%% SASLPREP is not implemented, so we use the similar RESOURCEPREP instead
-export([salted_password/4, stored_key/2, server_key/2,
         server_signature/3, client_signature/3, client_key/2,
         client_key_xor/2]).

-compile({nowarn_unused_function, [{hi_legacy,4}, {hi_legacy_round,4}]}).

-type algo() :: sha | sha256 | sha512.
-spec salted_password(algo(), binary(), binary(), non_neg_integer()) -> binary().

salted_password(Algo, Password, Salt, IterationCount) ->
    hi(Algo, jid:resourceprep(Password), Salt, IterationCount).

-spec client_key(algo(), binary()) -> binary().

client_key(Algo, SaltedPassword) ->
    sha_mac(Algo, SaltedPassword, <<"Client Key">>).

-spec stored_key(algo(), binary()) -> binary().

stored_key(Algo, ClientKey) -> crypto:hash(Algo, ClientKey).

-spec server_key(algo(), binary()) -> binary().

server_key(Algo, SaltedPassword) ->
    sha_mac(Algo, SaltedPassword, <<"Server Key">>).

-spec client_signature(algo(), binary(), binary()) -> binary().

client_signature(Algo, StoredKey, AuthMessage) ->
    sha_mac(Algo, StoredKey, AuthMessage).

-spec client_key_xor(binary(), binary()) -> binary().

client_key_xor(ClientProof, ClientSignature) ->
    crypto:exor(ClientProof, ClientSignature).

-spec server_signature(algo(), binary(), binary()) -> binary().

server_signature(Algo, ServerKey, AuthMessage) ->
    sha_mac(Algo, ServerKey, AuthMessage).

-ifdef(NO_PBKDF2_HMAC).
hi(Algo, Password, Salt, IterationCount) ->
    hi_legacy(Algo, Password, Salt, IterationCount).
-else.
hi(_Algo, _Password, _Salt, 0) ->
    <<>>;
hi(sha, Password, Salt, IterationCount) ->
    crypto:pbkdf2_hmac(sha, Password, Salt, IterationCount, 20);
hi(sha256, Password, Salt, IterationCount) ->
    crypto:pbkdf2_hmac(sha256, Password, Salt, IterationCount, 32);
hi(sha512, Password, Salt, IterationCount) ->
    crypto:pbkdf2_hmac(sha512, Password, Salt, IterationCount, 64).
-endif.

hi_legacy(Algo, Password, Salt, IterationCount) ->
    U1 = sha_mac(Algo, Password, <<Salt/binary, 0, 0, 0, 1>>),
    crypto:exor(U1, hi_legacy_round(Algo, Password, U1, IterationCount - 1)).

hi_legacy_round(Algo, Password, UPrev, 1) ->
    sha_mac(Algo, Password, UPrev);
hi_legacy_round(Algo, Password, UPrev, IterationCount) ->
    U = sha_mac(Algo, Password, UPrev),
    crypto:exor(U, hi_legacy_round(Algo, Password, U, IterationCount - 1)).

-ifdef(USE_OLD_CRYPTO_HMAC).
sha_mac(Algo, Key, Data) ->
    crypto:hmac(Algo, Key, Data).
-else.
sha_mac(Algo, Key, Data) ->
    crypto:mac(hmac, Algo, Key, Data).
-endif.

-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").

scram_algo_test_() -> [
    {<<"scram_algo_", (atom_to_binary(Algo))/binary, "_test">>,
      fun() ->
	  Password = <<"pencil">>,
	  Salt = base64:decode(<<"QSXCR+Q6sek8bf92">>),
	  Iterations = Iterations,
	  SaltedPassword = salted_password(Algo, Password, Salt, Iterations),
	  ?assertEqual(DkLen, byte_size(SaltedPassword)),
	  ClientKey = client_key(Algo, SaltedPassword),
	  ?assertEqual(DkLen, byte_size(ClientKey)),
	  StoredKey = stored_key(Algo, ClientKey),
	  ?assertEqual(DkLen, byte_size(StoredKey)),
	  ServerKey = server_key(Algo, SaltedPassword),
	  ?assertEqual(DkLen, byte_size(ServerKey)),
	  AuthMessage = <<"p,y,t,h,o,n,r,,">>,
	  ServerSig = server_signature(Algo, ServerKey, AuthMessage),
	  ?assertEqual(DkLen, byte_size(ServerSig)),
	  ClientSig = client_signature(Algo, StoredKey, AuthMessage),
	  ?assertEqual(DkLen, byte_size(ClientSig)),
	  ?assertEqual(ServerKey, crypto:mac(hmac, Algo, SaltedPassword, <<"Server Key">>)),
	  ?assertEqual(StoredKey, crypto:hash(Algo, client_key(Algo, SaltedPassword)))
      end
    } || {Algo, DkLen, Iterations} <- [{sha, 20, 4096}, {sha256, 32, 4096}, {sha512, 64, 10000}]].

client_key_xor_test() ->
    Key1 = <<1,2,3,4,5,6,7,8,9,10>>,
    Key2 = <<10,9,8,7,6,5,4,3,2,1>>,
    Result = client_key_xor(Key1, Key2),
    ?assertEqual(<<11,11,11,3,3,3,3,11,11,11>>, Result),
    ?assertEqual(Key1, client_key_xor(Result, Key2)).

scram_zero_iterations_test() ->
    Password = <<"test">>,
    Salt = <<"salt">>,
    ?assertEqual(<<>>, salted_password(sha, Password, Salt, 0)),
    ?assertEqual(<<>>, salted_password(sha256, Password, Salt, 0)),
    ?assertEqual(<<>>, salted_password(sha512, Password, Salt, 0)).

-ifndef(NO_PBKDF2_HMAC).
pbkdf2_hmac_vs_hi_legacy_test_() -> [
    {timeout, 30,
	{<<"scram_hi_", (atom_to_binary(Algo))/binary, "_test">>,
	    fun() ->
		lists:foreach(
		    fun(_) ->
			Password = << <<(rand:uniform(255))>> || _ <- lists:seq(1, rand:uniform(128)) >>,
			Salt = << <<(rand:uniform(255))>> || _ <- lists:seq(1, rand:uniform(64)) >>,
			Iterations = 1 + rand:uniform(10000),
			SaltedPassword1 = hi(Algo, Password, Salt, Iterations),
			SaltedPassword2 = hi_legacy(Algo, Password, Salt, Iterations),
			?assertEqual(byte_size(SaltedPassword1), DkLen),
			?assertEqual(SaltedPassword1, SaltedPassword2)
		    end,
		    lists:seq(1, 500)
		)
	    end
	}
    } || {Algo, DkLen} <- [{sha, 20}, {sha256, 32}, {sha512, 64}]
].
-endif.

-endif.
