%%%-------------------------------------------------------------------
%%% @author Stephen Röttger <stephen.roettger@googlemail.com>
%%%
%%% Copyright (C) 2002-2024 ProcessOne, SARL. All Rights Reserved.
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

hi(Algo, Password, Salt, IterationCount) ->
    U1 = sha_mac(Algo, Password, <<Salt/binary, 0, 0, 0, 1>>),
    crypto:exor(U1, hi_round(Algo, Password, U1, IterationCount - 1)).

hi_round(Algo, Password, UPrev, 1) ->
    sha_mac(Algo, Password, UPrev);
hi_round(Algo, Password, UPrev, IterationCount) ->
    U = sha_mac(Algo, Password, UPrev),
    crypto:exor(U, hi_round(Algo, Password, U, IterationCount - 1)).

-ifdef(USE_OLD_CRYPTO_HMAC).
sha_mac(Algo, Key, Data) ->
    crypto:hmac(Algo, Key, Data).
-else.
sha_mac(Algo, Key, Data) ->
    crypto:mac(hmac, Algo, Key, Data).
-endif.
