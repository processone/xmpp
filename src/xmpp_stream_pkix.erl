%%%-------------------------------------------------------------------
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
-module(xmpp_stream_pkix).

%% API
-export([authenticate/1, authenticate/2, get_cert_domains/1, format_error/1]).

-include("xmpp.hrl").
-include_lib("public_key/include/public_key.hrl").
-include("XmppAddr.hrl").

-type cert() :: #'OTPCertificate'{}.

%%%===================================================================
%%% API
%%%===================================================================
-spec authenticate(xmpp_stream_in:state() | xmpp_stream_out:state())
      -> {ok, binary()} | {error, atom(), binary()}.
authenticate(State) ->
    authenticate(State, <<"">>).

-spec authenticate(xmpp_stream_in:state() | xmpp_stream_out:state(), binary())
      -> {ok, binary()} | {error, atom(), binary()}.
authenticate(#{xmlns := ?NS_SERVER,
	       socket := Socket} = State, Authzid) ->
    Peer = maps:get(remote_server, State, Authzid),
    case verify_server_cert(Peer, Socket) of
	ok ->
	    {ok, Peer};
	{error, Reason} ->
	    {error, Reason, Peer}
    end;
authenticate(#{xmlns := ?NS_CLIENT, stream_direction := out,
	       socket := Socket, server := Server}, _) ->
    case verify_server_cert(Server, Socket) of
	ok ->
	    {ok, Server};
	{error, Reason} ->
	    {error, Reason, Server}
    end;
authenticate(#{xmlns := ?NS_CLIENT, stream_direction := in,
	       socket := Socket, server := Server}, Authzid) ->
    JID = try jid:decode(Authzid)
	  catch _:{bad_jid, <<>>} -> jid:make(Server);
		_:{bad_jid, _} -> {error, invalid_authzid, Authzid}
	  end,
    case JID of
	#jid{user = User, lserver = LServer} ->
	    case verify_cert(Socket) of
		{ok, Cert} ->
		    JIDs = get_xmpp_addrs(Cert),
		    get_username(JID, JIDs, LServer);
		{error, Reason} ->
		    {error, Reason, User}
	    end;
	Err ->
	    Err
    end.

format_error(idna_failed) ->
    {'not-authorized', <<"Remote domain is not an IDN hostname">>};
format_error(hostname_mismatch) ->
    {'not-authorized', <<"Certificate host name mismatch">>};
format_error(jid_mismatch) ->
    {'not-authorized', <<"Certificate JID mismatch">>};
format_error(get_cert_failed) ->
    {'not-authorized', <<"Failed to get peer certificate">>};
format_error(invalid_authzid) ->
    {'invalid-authzid', <<"Malformed JID">>};
format_error(Other) ->
    {'not-authorized', erlang:atom_to_binary(Other, utf8)}.

-spec get_cert_domains(cert()) -> [binary()].
get_cert_domains(Cert) ->
    TBSCert = Cert#'OTPCertificate'.tbsCertificate,
    {rdnSequence, Subject} = TBSCert#'OTPTBSCertificate'.subject,
    Extensions = TBSCert#'OTPTBSCertificate'.extensions,
    get_domain_from_subject(lists:flatten(Subject)) ++
	get_domains_from_san(Extensions).

%%%===================================================================
%%% Internal functions
%%%===================================================================
-spec verify_server_cert(binary(), xmpp_socket:socket()) -> ok | {error, atom()}.
verify_server_cert(Server, Socket) ->
    case verify_cert(Socket) of
	{ok, Cert} ->
	    try list_to_binary(idna:utf8_to_ascii(Server)) of
		AsciiServer ->
		    case lists:any(
			   fun(D) -> match_domain(AsciiServer, D) end,
			   get_cert_domains(Cert)) of
			true ->
			    ok;
			false ->
			    {error, hostname_mismatch}
		    end
	    catch _:_ ->
		    {error, idna_failed}
	    end;
	{error, _} = Err ->
	    Err
    end.

-spec verify_cert(xmpp_socket:socket()) -> {ok, cert()} | {error, atom()}.
verify_cert(Socket) ->
    case xmpp_socket:get_peer_certificate(Socket, otp) of
	{ok, Cert} ->
	    case xmpp_socket:get_verify_result(Socket) of
		0 ->
		    {ok, Cert};
		VerifyRes ->
		    %% TODO: return atomic errors
		    %% This should be improved in fast_tls
		    Reason = fast_tls:get_cert_verify_string(VerifyRes, Cert),
		    {error, erlang:binary_to_atom(Reason, utf8)}
	    end;
	error ->
	    {error, get_cert_failed}
    end.

-spec get_domain_from_subject([#'AttributeTypeAndValue'{}]) -> [binary()].
get_domain_from_subject(AttrVals) ->
    case lists:keyfind(?'id-at-commonName',
		       #'AttributeTypeAndValue'.type,
		       AttrVals) of
	#'AttributeTypeAndValue'{value = {_, S}} ->
	    try jid:decode(iolist_to_binary(S)) of
		#jid{luser = <<"">>, lresource = <<"">>, lserver = Domain} ->
		    [Domain];
		_ ->
		    []
	    catch _:{bad_jid, _} ->
		    []
	    end;
	_ ->
	    []
    end.

-spec get_domains_from_san([#'Extension'{}] | asn1_NOVALUE) -> [binary()].
get_domains_from_san(Extensions) when is_list(Extensions) ->
    case lists:keyfind(?'id-ce-subjectAltName',
		       #'Extension'.extnID,
		       Extensions) of
	#'Extension'{extnValue = Vals} ->
	    lists:flatmap(
	      fun({dNSName, S}) ->
		      [iolist_to_binary(S)];
		 ({otherName, AnotherName}) ->
		      case decode_xmpp_addr(AnotherName) of
			  {ok, #jid{luser = <<"">>,
				    lresource = <<"">>,
				    lserver = Domain}} ->
			      try list_to_binary(idna:utf8_to_ascii(Domain))
			      catch _:_ -> []
			      end;
			  _ ->
			      []
		      end;
		 (_) ->
		      []
	      end, Vals);
	_ ->
	    []
    end;
get_domains_from_san(_) ->
    [].

-spec decode_xmpp_addr(#'AnotherName'{}) -> {ok, jid()} | error.
decode_xmpp_addr(#'AnotherName'{'type-id' = ?'id-on-xmppAddr',
				value = XmppAddr}) ->
    try 'XmppAddr':decode('XmppAddr', XmppAddr) of
	{ok, JIDStr} ->
	    try {ok, jid:decode(iolist_to_binary(JIDStr))}
	    catch _:{bad_jid, _} -> error
	    end;
	_ ->
	    error
    catch _:_ ->
	    error
    end;
decode_xmpp_addr(_) ->
    error.

-spec get_xmpp_addrs(cert()) -> [jid()].
get_xmpp_addrs(Cert) ->
    TBSCert = Cert#'OTPCertificate'.tbsCertificate,
    case TBSCert#'OTPTBSCertificate'.extensions of
	Extensions when is_list(Extensions) ->
	    case lists:keyfind(?'id-ce-subjectAltName',
			       #'Extension'.extnID,
			       Extensions) of
		#'Extension'{extnValue = Vals} ->
		    lists:flatmap(
		      fun({otherName, AnotherName}) ->
			      case decode_xmpp_addr(AnotherName) of
				  {ok, JID} -> [JID];
				  _ -> []
			      end;
			 (_) ->
			      []
		      end, Vals);
		_ ->
		    []
	    end;
	_ ->
	    []
    end.

-spec get_username(jid(), [jid()], binary()) ->
			  {ok, binary()} | {error, jid_mismatch, binary()}.
get_username(#jid{user = User, lserver = LS}, _, LServer) when LS /= LServer ->
    %% The user provided JID from different domain
    {error, jid_mismatch, User};
get_username(#jid{user = <<>>}, [#jid{user = U, lserver = LS}], LServer)
  when U /= <<>> andalso LS == LServer ->
    %% The user didn't provide JID or username, and there is only
    %% one 'non-global' JID matching current domain
    {ok, U};
get_username(#jid{user = User}, [], _) when User /= <<>> ->
    %% The user provided username, but the certificate contains no JIDs
    %% We accept this since the certificate is verified
    {ok, User};
get_username(#jid{user = User, luser = LUser}, JIDs, LServer) when User /= <<>> ->
    %% The user provided username
    lists:foldl(
      fun(_, {ok, _} = OK) ->
	      OK;
	 (#jid{user = <<>>, lserver = LS}, _) when LS == LServer ->
	      %% Found "global" JID in the certificate
	      %% (i.e. in the form of 'domain.com')
	      %% within current domain, so we force matching
	      {ok, User};
	 (#jid{luser = LU, lserver = LS}, _) when LU == LUser, LS == LServer ->
	      %% Found exact JID matching
	      {ok, User};
	 (_, Err) ->
	      Err
      end, {error, jid_mismatch, User}, JIDs);
get_username(#jid{user = User}, _, _) ->
    %% Nothing from above is true
    {error, jid_mismatch, User}.

-spec match_domain(binary(), binary()) -> boolean().
match_domain(Domain, Domain) -> true;
match_domain(Domain, <<"*.", Rest/binary>>) ->
    %% RFC6120 states:
    %% DNS domain names in server certificates MAY contain the wildcard
    %% character '*' as the complete left-most label within the identifier
    case binary:split(Domain, <<$.>>) of
	[_, Rest] -> true;
	_ -> false
    end;
match_domain(_, _) ->
    false.
