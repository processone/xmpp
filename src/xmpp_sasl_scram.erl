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
-module(xmpp_sasl_scram).
-behaviour(xmpp_sasl).
-author('stephen.roettger@googlemail.com').
-protocol({rfc, 5802}).
-protocol({xep, 474, '0.3.0'}).

-export([mech_new/6, mech_step/2, format_error/1]).

-include("scram.hrl").

-type password() :: binary() | #scram{}.
-type get_password_fun() :: fun((binary()) -> {false | {false, atom(), binary()} | password(), module()}).

-record(state,
	{step = 2                :: 2 | 4,
	 algo = sha              :: sha | sha256 | sha512,
	 channel_bindings = none :: none | not_available | #{atom() => binary()},
	 ssdp                    :: undefined | binary(),
	 stored_key = <<"">>     :: binary(),
	 server_key = <<"">>     :: binary(),
	 username = <<"">>       :: binary(),
	 auth_module             :: module(),
	 get_password            :: get_password_fun(),
	 auth_message = <<"">>   :: binary(),
	 client_nonce = <<"">>   :: binary(),
	 server_nonce = <<"">>   :: binary()}).

-define(SALT_LENGTH, 16).
-define(NONCE_LENGTH, 16).

-type error_reason() :: unsupported_extension | bad_username |
			not_authorized | saslprep_failed |
			parser_failed | bad_attribute |
			nonce_mismatch | bad_channel_binding |
                        incompatible_mechs | {atom(), binary()}.

-export_type([error_reason/0]).

-spec format_error(error_reason()) -> {atom(), binary()}.
format_error({Condition, Text}) ->
    {Condition, Text};
format_error(unsupported_extension) ->
    {'not-authorized', <<"Unsupported extension">>};
format_error(bad_username) ->
    {'invalid-authzid', <<"Malformed username">>};
format_error(not_authorized) ->
    {'not-authorized', <<"Invalid username or password">>};
format_error(saslprep_failed) ->
    {'not-authorized', <<"SASLprep failed">>};
format_error(parser_failed) ->
    {'not-authorized', <<"Response decoding failed">>};
format_error(bad_attribute) ->
    {'not-authorized', <<"Malformed or unexpected attribute">>};
format_error(nonce_mismatch) ->
    {'not-authorized', <<"Nonce mismatch">>};
format_error(bad_channel_binding) ->
    {'not-authorized', <<"Invalid channel binding">>};
format_error(incompatible_mechs) ->
    {'not-authorized', <<"Incompatible SCRAM methods">>}.

mech_new(Mech, ChannelBindings, Mechs, _UAId, _Host, #{get_password := GetPassword}) ->
    NCB = case ChannelBindings of
	      #{} -> none;
	      _ -> ChannelBindings
	  end,
    {Algo, CB} =
    case Mech of
	<<"SCRAM-SHA-1">> -> {sha, NCB};
	<<"SCRAM-SHA-1-PLUS">> -> {sha, ChannelBindings};
	<<"SCRAM-SHA-256">> -> {sha256, NCB};
	<<"SCRAM-SHA-256-PLUS">> -> {sha256, ChannelBindings};
	<<"SCRAM-SHA-512">> -> {sha512, NCB};
	<<"SCRAM-SHA-512-PLUS">> -> {sha512, ChannelBindings}
    end,
    Ssdp = case Mechs of
	       undefined -> undefined;
	       _ ->
		   base64:encode(crypto:hash(Algo, [
		       lists:join(<<",">>, lists:sort(Mechs)),
		       case ChannelBindings of
			   none -> [];
			   not_available -> [];
			   _ when map_size(ChannelBindings) == 0 -> [];
			   _ -> [<<"|">>, lists:join(<<",">>, lists:sort(maps:keys(ChannelBindings)))]
		       end]))
	   end,
    #state{step = 2, get_password = GetPassword, algo = Algo,
	channel_bindings = CB, ssdp = Ssdp}.

mech_step(#state{step = 2, algo = Algo, ssdp = Ssdp} = State, ClientIn) ->
    case re:split(ClientIn, <<",">>, [{return, binary}]) of
      [CBind, _AuthorizationIdentity, UserNameAttribute, ClientNonceAttribute | Extensions] ->
          case {cbind_valid(State, CBind),
		extensions_valid(State, Extensions),
		parse_attribute(UserNameAttribute)} of
              {false, _, _} ->
                  {error, bad_channel_binding};
	      {_, false, _} ->
                  {error, unsupported_extension};
              {_, _, {error, Reason}} ->
                  {error, Reason};
              {_, _, {_, EscapedUserName}} ->
		case unescape_username(EscapedUserName) of
		  error -> {error, bad_username};
		  UserName ->
		      case parse_attribute(ClientNonceAttribute) of
			{$r, ClientNonce} ->
			    {Pass, AuthModule} = (State#state.get_password)(UserName),
			    LPass = if is_binary(Pass) -> jid:resourceprep(Pass);
				       true -> Pass
				    end,
			    case Pass of
				{false, Condition, Text} ->
				  {error, {Condition, Text}, UserName};
				false ->
				  {error, not_authorized, UserName};
				#scram{hash = Hash } when Algo /= Hash ->
				  {error, incompatible_mechs};
				_ when LPass == error ->
				  {error, saslprep_failed, UserName};
				_ ->
				  {StoredKey, ServerKey, Salt, IterationCount} =
				  case Pass of
				      #scram{storedkey = STK, serverkey = SEK, salt = Slt,
					     iterationcount = IC} ->
					  {base64:decode(STK),
					   base64:decode(SEK),
					   base64:decode(Slt), IC};
				      _ ->
					  TempSalt =
					  p1_rand:bytes(?SALT_LENGTH),
					  SaltedPassword =
					  scram:salted_password(Algo, Pass,
								TempSalt,
								?SCRAM_DEFAULT_ITERATION_COUNT),
					  {scram:stored_key(Algo, scram:client_key(Algo, SaltedPassword)),
					   scram:server_key(Algo, SaltedPassword),
					   TempSalt,
					   ?SCRAM_DEFAULT_ITERATION_COUNT}
				  end,
				  ClientFirstMessageBare =
				      substr(ClientIn,
                                                 str(ClientIn, <<"n=">>)),
				  ServerNonce =
				      base64:encode(p1_rand:bytes(?NONCE_LENGTH)),
				  SsdpPart = case Ssdp of
						 undefined -> [];
						 _ -> [",d=", Ssdp]
					     end,
				  ServerFirstMessage =
                                        iolist_to_binary(
                                          ["r=",
                                           ClientNonce,
                                           ServerNonce,
                                           ",", "s=",
                                           base64:encode(Salt),
                                           ",", "i=",
                                           integer_to_list(IterationCount),
					   SsdpPart]),
				  {continue, ServerFirstMessage,
				   State#state{step = 4, stored_key = StoredKey,
					       server_key = ServerKey,
					       auth_module = AuthModule,
					       auth_message =
						   <<ClientFirstMessageBare/binary,
						     ",", ServerFirstMessage/binary>>,
					       client_nonce = ClientNonce,
					       server_nonce = ServerNonce,
					       username = UserName}}
			    end;
			  _ -> {error, bad_attribute}
		      end
		end
	  end;
      _Else -> {error, parser_failed}
    end;
mech_step(#state{step = 4, algo = Algo} = State, ClientIn) ->
    case tokens(ClientIn, <<",">>) of
	#{$m := _} ->
	    {error, unsupported_extension};
	#{$c := ClientBinding, $r := ClientNonce, $p := ClientProofB64} ->
	    ChannelBindingSupport = try base64:decode(ClientBinding)
				    catch _:badarg -> <<>>
				    end,
	    case cbind_verify(State, ChannelBindingSupport) of
		true ->
		    Nonce = <<(State#state.client_nonce)/binary,
			      (State#state.server_nonce)/binary>>,
		    if
			ClientNonce == Nonce ->
			    ClientProof = try base64:decode(ClientProofB64)
					  catch _:badarg -> <<>>
					  end,
			    AuthMessage = iolist_to_binary(
				[State#state.auth_message, ",",
				 substr(ClientIn, 1, str(ClientIn, <<",p=">>) - 1)]),
			    ClientSignature = scram:client_signature(Algo, State#state.stored_key,
								     AuthMessage),
			    if
				size(ClientProof) /= size(ClientSignature) ->
				    {error, bad_attribute};
				true ->
				    ClientKey =
				    scram:client_key_xor(ClientProof, ClientSignature),
				    CompareStoredKey = scram:stored_key(Algo, ClientKey),
				    if
					CompareStoredKey == State#state.stored_key ->
					    ServerSignature =
					    scram:server_signature(Algo,
								   State#state.server_key,
								   AuthMessage),
					    {ok, [{username, State#state.username},
						  {auth_module, State#state.auth_module},
						  {authzid, State#state.username}],
					     <<"v=", (base64:encode(ServerSignature))/binary>>};
					true ->
					    {error, not_authorized, State#state.username}
				    end
			    end;
			true -> {error, nonce_mismatch}
		    end;
		_ -> {error, bad_channel_binding}
	    end;
	_ ->
	    {error, parser_failed}
    end.

cbind_valid(#state{channel_bindings = #{} = Bindings}, <<"p=", Binding/binary>>) ->
    maps:is_key(Binding, Bindings);
cbind_valid(#state{channel_bindings = #{}}, _) ->
    false;
cbind_valid(_, <<"y", _/binary>>) ->
    true;
cbind_valid(_, <<"n", _/binary>>) ->
    true;
cbind_valid(_, _) ->
    false.

extensions_valid(_State, Ext) ->
    lists:all(
	fun(<<"m=", _/binary>>) -> false;
	   (_) -> true
	end, Ext).

cbind_verify(#state{channel_bindings = #{} = Bindings}, <<"p=", Binding/binary>>) ->
    case re:split(Binding, <<",">>, [{parts, 3}, {return, binary}]) of
	[Type, _, Data] ->
	    maps:get(Type, Bindings, none) == Data;
	_ ->
	    false
    end;
cbind_verify(#state{channel_bindings = #{}}, _) ->
    false;
cbind_verify(#state{channel_bindings = not_available}, <<"y", _/binary>>) ->
    true;
cbind_verify(_, <<"y", _/binary>>) ->
    false;
cbind_verify(_, <<"n", _/binary>>) ->
    true;
cbind_verify(_, _) ->
    false.

parse_attribute(<<Name, $=, Val/binary>>) when Val /= <<>> ->
    case is_alpha(Name) of
	true -> {Name, Val};
	false -> {error, bad_attribute}
    end;
parse_attribute(_) ->
    {error, bad_attribute}.

unescape_username(<<"">>) -> <<"">>;
unescape_username(EscapedUsername) ->
    Pos = str(EscapedUsername, <<"=">>),
    if Pos == 0 -> EscapedUsername;
       true ->
	   Start = substr(EscapedUsername, 1, Pos - 1),
	   End = substr(EscapedUsername, Pos),
	   EndLen = byte_size(End),
	   if EndLen < 3 -> error;
	      true ->
		  case substr(End, 1, 3) of
		    <<"=2C">> ->
			<<Start/binary, ",",
			  (unescape_username(substr(End, 4)))/binary>>;
		    <<"=3D">> ->
			<<Start/binary, "=",
			  (unescape_username(substr(End, 4)))/binary>>;
		    _Else -> error
		  end
	   end
    end.

is_alpha(Char) when Char >= $a, Char =< $z -> true;
is_alpha(Char) when Char >= $A, Char =< $Z -> true;
is_alpha(_) -> false.

-spec str(binary(), binary()) -> non_neg_integer().
str(B1, B2) ->
    case binary:match(B1, B2) of
        {R, _Len} -> R+1;
        _ -> 0
    end.

-spec substr(binary(), pos_integer()) -> binary().
substr(B, N) ->
    binary_part(B, N-1, byte_size(B)-N+1).

-spec substr(binary(), pos_integer(), non_neg_integer()) -> binary().
substr(B, S, E) ->
    binary_part(B, S-1, E).

-spec tokens(binary(), binary()) -> map().
tokens(B1, B2) ->
    lists:foldl(
	fun(<<Id, "=", Value/binary>>, Acc) when is_map(Acc) ->
	    maps:put(Id, Value, Acc);
	   (_, _) -> error
	end, #{}, binary:split(B1, B2, [global])).
