%%%-------------------------------------------------------------------
%%% @author Stephen Röttger <stephen.roettger@googlemail.com>
%%%
%%% Copyright (C) 2002-2020 ProcessOne, SARL. All Rights Reserved.
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
-export([salted_password/3, stored_key/1, server_key/1,
	 server_signature/2, client_signature/2, client_key/1,
	 client_key/2]).

-spec salted_password(binary(), binary(), non_neg_integer()) -> binary().

salted_password(Password, Salt, IterationCount) ->
    hi(jid:resourceprep(Password), Salt, IterationCount).

-spec client_key(binary()) -> binary().

client_key(SaltedPassword) ->
    sha_mac(SaltedPassword, <<"Client Key">>).

-spec stored_key(binary()) -> binary().

stored_key(ClientKey) -> crypto:hash(sha, ClientKey).

-spec server_key(binary()) -> binary().

server_key(SaltedPassword) ->
    sha_mac(SaltedPassword, <<"Server Key">>).

-spec client_signature(binary(), binary()) -> binary().

client_signature(StoredKey, AuthMessage) ->
    sha_mac(StoredKey, AuthMessage).

-spec client_key(binary(), binary()) -> binary().

client_key(ClientProof, ClientSignature) ->
    crypto:exor(ClientProof, ClientSignature).

-spec server_signature(binary(), binary()) -> binary().

server_signature(ServerKey, AuthMessage) ->
    sha_mac(ServerKey, AuthMessage).

hi(Password, Salt, IterationCount) ->
    U1 = sha_mac(Password, <<Salt/binary, 0, 0, 0, 1>>),
    crypto:exor(U1, hi_round(Password, U1, IterationCount - 1)).

hi_round(Password, UPrev, 1) ->
    sha_mac(Password, UPrev);
hi_round(Password, UPrev, IterationCount) ->
    U = sha_mac(Password, UPrev),
    crypto:exor(U, hi_round(Password, U, IterationCount - 1)).

sha_mac(Key, Data) ->
    crypto:hmac(sha, Key, Data).
