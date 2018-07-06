%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_roomconfig.xdata
%% Form type: http://jabber.org/protocol/muc#roomconfig
%% Document: XEP-0045

-module(muc_roomconfig).

-export([encode/1, encode/2]).

-export([decode/1, decode/2, format_error/1,
	 io_format_error/1]).

-include("xmpp_codec.hrl").

-include("muc_roomconfig.hrl").

-export_type([property/0, result/0, form/0]).

-dialyzer({nowarn_function, {dec_int, 3}}).

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> integer_to_binary(Int).

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

dec_enum_int(Val, Enums, Min, Max) ->
    try dec_int(Val, Min, Max) catch
      _:_ -> dec_enum(Val, Enums)
    end.

enc_enum_int(Int) when is_integer(Int) -> enc_int(Int);
enc_enum_int(Atom) -> enc_enum(Atom).

dec_bool(<<"1">>) -> true;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"false">>) -> false.

enc_bool(true) -> <<"1">>;
enc_bool(false) -> <<"0">>.

format_error({form_type_mismatch, Type}) ->
    <<"FORM_TYPE doesn't match '", Type/binary, "'">>;
format_error({bad_var_value, Var, Type}) ->
    <<"Bad value of field '", Var/binary, "' of type '",
      Type/binary, "'">>;
format_error({missing_value, Var, Type}) ->
    <<"Missing value of field '", Var/binary, "' of type '",
      Type/binary, "'">>;
format_error({too_many_values, Var, Type}) ->
    <<"Too many values for field '", Var/binary,
      "' of type '", Type/binary, "'">>;
format_error({unknown_var, Var, Type}) ->
    <<"Unknown field '", Var/binary, "' of type '",
      Type/binary, "'">>;
format_error({missing_required_var, Var, Type}) ->
    <<"Missing required field '", Var/binary, "' of type '",
      Type/binary, "'">>.

io_format_error({form_type_mismatch, Type}) ->
    {<<"FORM_TYPE doesn't match '~s'">>, [Type]};
io_format_error({bad_var_value, Var, Type}) ->
    {<<"Bad value of field '~s' of type '~s'">>,
     [Var, Type]};
io_format_error({missing_value, Var, Type}) ->
    {<<"Missing value of field '~s' of type "
       "'~s'">>,
     [Var, Type]};
io_format_error({too_many_values, Var, Type}) ->
    {<<"Too many values for field '~s' of type "
       "'~s'">>,
     [Var, Type]};
io_format_error({unknown_var, Var, Type}) ->
    {<<"Unknown field '~s' of type '~s'">>, [Var, Type]};
io_format_error({missing_required_var, Var, Type}) ->
    {<<"Missing required field '~s' of type "
       "'~s'">>,
     [Var, Type]}.

decode(Fs) -> decode(Fs, []).

decode(Fs, Acc) ->
    case lists:keyfind(<<"FORM_TYPE">>, #xdata_field.var,
		       Fs)
	of
      false ->
	  decode(Fs, Acc,
		 <<"http://jabber.org/protocol/muc#roomconfig">>, []);
      #xdata_field{values = [XMLNS]}
	  when XMLNS ==
		 <<"http://jabber.org/protocol/muc#roomconfig">> ->
	  decode(Fs, Acc, XMLNS, []);
      _ ->
	  erlang:error({?MODULE,
			{form_type_mismatch,
			 <<"http://jabber.org/protocol/muc#roomconfig">>}})
    end.

encode(Cfg) -> encode(Cfg, <<"en">>).

encode(List, Lang) when is_list(List) ->
    Fs = [case Opt of
	    {maxhistoryfetch, Val} ->
		[encode_maxhistoryfetch(Val, Lang)];
	    {maxhistoryfetch, _, _} -> erlang:error({badarg, Opt});
	    {allowpm, Val} -> [encode_allowpm(Val, default, Lang)];
	    {allowpm, Val, Opts} ->
		[encode_allowpm(Val, Opts, Lang)];
	    {allow_private_messages, Val} ->
		[encode_allow_private_messages(Val, Lang)];
	    {allow_private_messages, _, _} ->
		erlang:error({badarg, Opt});
	    {allow_private_messages_from_visitors, Val} ->
		[encode_allow_private_messages_from_visitors(Val,
							     default, Lang)];
	    {allow_private_messages_from_visitors, Val, Opts} ->
		[encode_allow_private_messages_from_visitors(Val, Opts,
							     Lang)];
	    {allow_visitor_status, Val} ->
		[encode_allow_visitor_status(Val, Lang)];
	    {allow_visitor_status, _, _} ->
		erlang:error({badarg, Opt});
	    {allow_visitor_nickchange, Val} ->
		[encode_allow_visitor_nickchange(Val, Lang)];
	    {allow_visitor_nickchange, _, _} ->
		erlang:error({badarg, Opt});
	    {allow_voice_requests, Val} ->
		[encode_allow_voice_requests(Val, Lang)];
	    {allow_voice_requests, _, _} ->
		erlang:error({badarg, Opt});
	    {allow_subscription, Val} ->
		[encode_allow_subscription(Val, Lang)];
	    {allow_subscription, _, _} ->
		erlang:error({badarg, Opt});
	    {voice_request_min_interval, Val} ->
		[encode_voice_request_min_interval(Val, Lang)];
	    {voice_request_min_interval, _, _} ->
		erlang:error({badarg, Opt});
	    {captcha_protected, Val} ->
		[encode_captcha_protected(Val, Lang)];
	    {captcha_protected, _, _} ->
		erlang:error({badarg, Opt});
	    {captcha_whitelist, Val} ->
		[encode_captcha_whitelist(Val, Lang)];
	    {captcha_whitelist, _, _} ->
		erlang:error({badarg, Opt});
	    {allow_query_users, Val} ->
		[encode_allow_query_users(Val, Lang)];
	    {allow_query_users, _, _} ->
		erlang:error({badarg, Opt});
	    {allowinvites, Val} -> [encode_allowinvites(Val, Lang)];
	    {allowinvites, _, _} -> erlang:error({badarg, Opt});
	    {changesubject, Val} ->
		[encode_changesubject(Val, Lang)];
	    {changesubject, _, _} -> erlang:error({badarg, Opt});
	    {enablelogging, Val} ->
		[encode_enablelogging(Val, Lang)];
	    {enablelogging, _, _} -> erlang:error({badarg, Opt});
	    {getmemberlist, Val} ->
		[encode_getmemberlist(Val, default, Lang)];
	    {getmemberlist, Val, Opts} ->
		[encode_getmemberlist(Val, Opts, Lang)];
	    {lang, Val} -> [encode_lang(Val, Lang)];
	    {lang, _, _} -> erlang:error({badarg, Opt});
	    {pubsub, Val} -> [encode_pubsub(Val, Lang)];
	    {pubsub, _, _} -> erlang:error({badarg, Opt});
	    {maxusers, Val} ->
		[encode_maxusers(Val, default, Lang)];
	    {maxusers, Val, Opts} ->
		[encode_maxusers(Val, Opts, Lang)];
	    {membersonly, Val} -> [encode_membersonly(Val, Lang)];
	    {membersonly, _, _} -> erlang:error({badarg, Opt});
	    {moderatedroom, Val} ->
		[encode_moderatedroom(Val, Lang)];
	    {moderatedroom, _, _} -> erlang:error({badarg, Opt});
	    {members_by_default, Val} ->
		[encode_members_by_default(Val, Lang)];
	    {members_by_default, _, _} ->
		erlang:error({badarg, Opt});
	    {passwordprotectedroom, Val} ->
		[encode_passwordprotectedroom(Val, Lang)];
	    {passwordprotectedroom, _, _} ->
		erlang:error({badarg, Opt});
	    {persistentroom, Val} ->
		[encode_persistentroom(Val, Lang)];
	    {persistentroom, _, _} -> erlang:error({badarg, Opt});
	    {presencebroadcast, Val} ->
		[encode_presencebroadcast(Val, default, Lang)];
	    {presencebroadcast, Val, Opts} ->
		[encode_presencebroadcast(Val, Opts, Lang)];
	    {publicroom, Val} -> [encode_publicroom(Val, Lang)];
	    {publicroom, _, _} -> erlang:error({badarg, Opt});
	    {public_list, Val} -> [encode_public_list(Val, Lang)];
	    {public_list, _, _} -> erlang:error({badarg, Opt});
	    {roomadmins, Val} -> [encode_roomadmins(Val, Lang)];
	    {roomadmins, _, _} -> erlang:error({badarg, Opt});
	    {roomdesc, Val} -> [encode_roomdesc(Val, Lang)];
	    {roomdesc, _, _} -> erlang:error({badarg, Opt});
	    {roomname, Val} -> [encode_roomname(Val, Lang)];
	    {roomname, _, _} -> erlang:error({badarg, Opt});
	    {roomowners, Val} -> [encode_roomowners(Val, Lang)];
	    {roomowners, _, _} -> erlang:error({badarg, Opt});
	    {roomsecret, Val} -> [encode_roomsecret(Val, Lang)];
	    {roomsecret, _, _} -> erlang:error({badarg, Opt});
	    {whois, Val} -> [encode_whois(Val, default, Lang)];
	    {whois, Val, Opts} -> [encode_whois(Val, Opts, Lang)];
	    {mam, Val} -> [encode_mam(Val, Lang)];
	    {mam, _, _} -> erlang:error({badarg, Opt});
	    #xdata_field{} -> [Opt];
	    _ -> []
	  end
	  || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
			    type = hidden,
			    values =
				[<<"http://jabber.org/protocol/muc#roomconfig">>]},
    [FormType | lists:flatten(Fs)].

decode([#xdata_field{var = <<"muc#maxhistoryfetch">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{maxhistoryfetch, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#maxhistoryfetch">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"muc#maxhistoryfetch">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"muc#maxhistoryfetch">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"muc#maxhistoryfetch">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#maxhistoryfetch">>, XMLNS}});
decode([#xdata_field{var = <<"muc#roomconfig_allowpm">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_enum(Value,
		 [anyone, participants, moderators, none])
    of
      Result ->
	  decode(Fs, [{allowpm, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_allowpm">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"muc#roomconfig_allowpm">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_allowpm">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"muc#roomconfig_allowpm">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_allowpm">>,
		   XMLNS}});
decode([#xdata_field{var = <<"allow_private_messages">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{allow_private_messages, Result} | Acc],
		 XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"allow_private_messages">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"allow_private_messages">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"allow_private_messages">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"allow_private_messages">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"allow_private_messages">>,
		   XMLNS}});
decode([#xdata_field{var =
			 <<"allow_private_messages_from_visitors">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_enum(Value, [nobody, moderators, anyone]) of
      Result ->
	  decode(Fs,
		 [{allow_private_messages_from_visitors, Result} | Acc],
		 XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value,
			 <<"allow_private_messages_from_visitors">>, XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"allow_private_messages_from_visitors">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"allow_private_messages_from_visitors">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"allow_private_messages_from_visitors">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values,
		   <<"allow_private_messages_from_visitors">>, XMLNS}});
decode([#xdata_field{var = <<"allow_visitor_status">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{allow_visitor_status, Result} | Acc],
		 XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"allow_visitor_status">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"allow_visitor_status">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"allow_visitor_status">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"allow_visitor_status">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"allow_visitor_status">>, XMLNS}});
decode([#xdata_field{var =
			 <<"allow_visitor_nickchange">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{allow_visitor_nickchange, Result} | Acc],
		 XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"allow_visitor_nickchange">>, XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"allow_visitor_nickchange">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"allow_visitor_nickchange">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"allow_visitor_nickchange">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"allow_visitor_nickchange">>,
		   XMLNS}});
decode([#xdata_field{var = <<"allow_voice_requests">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{allow_voice_requests, Result} | Acc],
		 XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"allow_voice_requests">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"allow_voice_requests">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"allow_voice_requests">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"allow_voice_requests">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"allow_voice_requests">>, XMLNS}});
decode([#xdata_field{var = <<"allow_subscription">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{allow_subscription, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"allow_subscription">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"allow_subscription">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"allow_subscription">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"allow_subscription">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"allow_subscription">>, XMLNS}});
decode([#xdata_field{var =
			 <<"voice_request_min_interval">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs, [{voice_request_min_interval, Result} | Acc],
		 XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"voice_request_min_interval">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"voice_request_min_interval">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"voice_request_min_interval">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"voice_request_min_interval">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"voice_request_min_interval">>,
		   XMLNS}});
decode([#xdata_field{var = <<"captcha_protected">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{captcha_protected, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"captcha_protected">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"captcha_protected">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"captcha_protected">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"captcha_protected">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"captcha_protected">>, XMLNS}});
decode([#xdata_field{var = <<"captcha_whitelist">>,
		     values = [<<>>]} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    %% Psi work-around
    decode([F#xdata_field{var = <<"captcha_whitelist">>,
			  values = []}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"captcha_whitelist">>,
		     values = Values}
	| Fs],
       Acc, XMLNS, Required) ->
    try [jid:decode(Value) || Value <- Values] of
      Result ->
	  decode(Fs, [{captcha_whitelist, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"captcha_whitelist">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"allow_query_users">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{allow_query_users, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"allow_query_users">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"allow_query_users">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"allow_query_users">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"allow_query_users">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"allow_query_users">>, XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_allowinvites">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{allowinvites, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_allowinvites">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_allowinvites">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_allowinvites">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_allowinvites">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_allowinvites">>,
		   XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_changesubject">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{changesubject, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_changesubject">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_changesubject">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_changesubject">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_changesubject">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_changesubject">>,
		   XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_enablelogging">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{enablelogging, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_enablelogging">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_enablelogging">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_enablelogging">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_enablelogging">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_enablelogging">>,
		   XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_getmemberlist">>,
		     values = Values}
	| Fs],
       Acc, XMLNS, Required) ->
    try [Value || Value <- Values] of
      Result ->
	  decode(Fs, [{getmemberlist, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_getmemberlist">>,
			 XMLNS}})
    end;
decode([#xdata_field{var = <<"muc#roomconfig_lang">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try xmpp_lang:check(Value) of
      Result ->
	  decode(Fs, [{lang, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_lang">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"muc#roomconfig_lang">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"muc#roomconfig_lang">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"muc#roomconfig_lang">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_lang">>, XMLNS}});
decode([#xdata_field{var = <<"muc#roomconfig_pubsub">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try xmpp_uri:check(Value) of
      Result ->
	  decode(Fs, [{pubsub, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_pubsub">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"muc#roomconfig_pubsub">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"muc#roomconfig_pubsub">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"muc#roomconfig_pubsub">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_pubsub">>, XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_maxusers">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_enum_int(Value, [none], 0, infinity) of
      Result ->
	  decode(Fs, [{maxusers, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_maxusers">>, XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_maxusers">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_maxusers">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_maxusers">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_maxusers">>,
		   XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_membersonly">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{membersonly, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_membersonly">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_membersonly">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_membersonly">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_membersonly">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_membersonly">>,
		   XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_moderatedroom">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{moderatedroom, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_moderatedroom">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_moderatedroom">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_moderatedroom">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_moderatedroom">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_moderatedroom">>,
		   XMLNS}});
decode([#xdata_field{var = <<"members_by_default">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{members_by_default, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"members_by_default">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"members_by_default">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"members_by_default">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"members_by_default">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"members_by_default">>, XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_passwordprotectedroom">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{passwordprotectedroom, Result} | Acc],
		 XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value,
			 <<"muc#roomconfig_passwordprotectedroom">>, XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_passwordprotectedroom">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_passwordprotectedroom">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_passwordprotectedroom">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values,
		   <<"muc#roomconfig_passwordprotectedroom">>, XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_persistentroom">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{persistentroom, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_persistentroom">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_persistentroom">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_persistentroom">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_persistentroom">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_persistentroom">>,
		   XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_presencebroadcast">>,
		     values = Values}
	| Fs],
       Acc, XMLNS, Required) ->
    try [dec_enum(Value, [moderator, participant, visitor])
	 || Value <- Values]
    of
      Result ->
	  decode(Fs, [{presencebroadcast, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_presencebroadcast">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_publicroom">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{publicroom, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_publicroom">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_publicroom">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_publicroom">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_publicroom">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_publicroom">>,
		   XMLNS}});
decode([#xdata_field{var = <<"public_list">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{public_list, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"public_list">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"public_list">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"public_list">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"public_list">>} | _], _,
       XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"public_list">>, XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomadmins">>,
		     values = [<<>>]} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    %% Psi work-around
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_roomadmins">>,
			  values = []}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomadmins">>,
		     values = Values}
	| Fs],
       Acc, XMLNS, Required) ->
    try [jid:decode(Value) || Value <- Values] of
      Result ->
	  decode(Fs, [{roomadmins, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_roomadmins">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomdesc">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{roomdesc, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_roomdesc">>, XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomdesc">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_roomdesc">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomdesc">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_roomdesc">>,
		   XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomname">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{roomname, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_roomname">>, XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomname">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_roomname">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomname">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_roomname">>,
		   XMLNS}});
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomowners">>,
		     values = [<<>>]} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    %% Psi work-around
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_roomowners">>,
			  values = []}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomowners">>,
		     values = Values}
	| Fs],
       Acc, XMLNS, Required) ->
    try [jid:decode(Value) || Value <- Values] of
      Result ->
	  decode(Fs, [{roomowners, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_roomowners">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomsecret">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{roomsecret, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_roomsecret">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomsecret">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roomconfig_roomsecret">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"muc#roomconfig_roomsecret">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_roomsecret">>,
		   XMLNS}});
decode([#xdata_field{var = <<"muc#roomconfig_whois">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_enum(Value, [moderators, anyone]) of
      Result ->
	  decode(Fs, [{whois, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roomconfig_whois">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"muc#roomconfig_whois">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"muc#roomconfig_whois">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"muc#roomconfig_whois">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roomconfig_whois">>, XMLNS}});
decode([#xdata_field{var = <<"mam">>, values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{mam, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"mam">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"mam">>, values = []} = F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"mam">>, values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"mam">>} | _], _, XMLNS,
       _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"mam">>, XMLNS}});
decode([#xdata_field{var = Var} | Fs], Acc, XMLNS,
       Required) ->
    if Var /= <<"FORM_TYPE">> ->
	   erlang:error({?MODULE, {unknown_var, Var, XMLNS}});
       true -> decode(Fs, Acc, XMLNS, Required)
    end;
decode([], Acc, _, []) -> Acc.

encode_maxhistoryfetch(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#maxhistoryfetch">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Maximum Number of History Messages Returned "
				  "by Room">>)}.

encode_allowpm(Value, Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, <<"Anyone">>),
				 value = <<"anyone">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang, <<"Anyone with Voice">>),
				 value = <<"participants">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang, <<"Moderators Only">>),
				 value = <<"moderators">>},
		   #xdata_option{label = xmpp_tr:tr(Lang, <<"Nobody">>),
				 value = <<"none">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"muc#roomconfig_allowpm">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Roles that May Send Private Messages">>)}.

encode_allow_private_messages(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"allow_private_messages">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Allow users to send private messages">>)}.

encode_allow_private_messages_from_visitors(Value,
					    Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, <<"Nobody">>),
				 value = <<"nobody">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang, <<"Moderators Only">>),
				 value = <<"moderators">>},
		   #xdata_option{label = xmpp_tr:tr(Lang, <<"Anyone">>),
				 value = <<"anyone">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var =
		     <<"allow_private_messages_from_visitors">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Allow visitors to send private messages to">>)}.

encode_allow_visitor_status(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"allow_visitor_status">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Allow visitors to send status text in "
				  "presence updates">>)}.

encode_allow_visitor_nickchange(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"allow_visitor_nickchange">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Allow visitors to change nickname">>)}.

encode_allow_voice_requests(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"allow_voice_requests">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Allow visitors to send voice requests">>)}.

encode_allow_subscription(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"allow_subscription">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Allow subscription">>)}.

encode_voice_request_min_interval(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_int(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"voice_request_min_interval">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Minimum interval between voice requests "
				  "(in seconds)">>)}.

encode_captcha_protected(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"captcha_protected">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Make room CAPTCHA protected">>)}.

encode_captcha_whitelist(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [jid:encode(V) || V <- Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"captcha_whitelist">>,
		 values = Values, required = false, type = 'jid-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Exclude Jabber IDs from CAPTCHA challenge">>)}.

encode_allow_query_users(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"allow_query_users">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Allow users to query other users">>)}.

encode_allowinvites(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_allowinvites">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Allow users to send invites">>)}.

encode_changesubject(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_changesubject">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Allow users to change the subject">>)}.

encode_enablelogging(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_enablelogging">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Enable logging">>)}.

encode_getmemberlist(Value, Options, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [Value]
	     end,
    Opts = if Options == default -> [];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L), value = V}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"muc#roomconfig_getmemberlist">>,
		 values = Values, required = false, type = 'list-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Roles and Affiliations that May Retrieve "
				  "Member List">>)}.

encode_lang(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_lang">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Natural Language for Room Discussions">>)}.

encode_pubsub(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_pubsub">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"XMPP URI of Associated Publish-Subscribe "
				  "Node">>)}.

encode_maxusers(Value, Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum_int(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, <<"No limit">>),
				 value = <<"none">>},
		   #xdata_option{value = <<"5">>},
		   #xdata_option{value = <<"10">>},
		   #xdata_option{value = <<"20">>},
		   #xdata_option{value = <<"30">>},
		   #xdata_option{value = <<"50">>},
		   #xdata_option{value = <<"100">>},
		   #xdata_option{value = <<"200">>},
		   #xdata_option{value = <<"500">>},
		   #xdata_option{value = <<"1000">>},
		   #xdata_option{value = <<"2000">>},
		   #xdata_option{value = <<"5000">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum_int(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"muc#roomconfig_maxusers">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Maximum Number of Occupants">>)}.

encode_membersonly(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_membersonly">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Make room members-only">>)}.

encode_moderatedroom(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_moderatedroom">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Make room moderated">>)}.

encode_members_by_default(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"members_by_default">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Default users as participants">>)}.

encode_passwordprotectedroom(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var =
		     <<"muc#roomconfig_passwordprotectedroom">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Make room password protected">>)}.

encode_persistentroom(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_persistentroom">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Make room persistent">>)}.

encode_presencebroadcast(Value, Options, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [enc_enum(V) || V <- Value]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label =
				     xmpp_tr:tr(Lang, <<"Moderator">>),
				 value = <<"moderator">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang, <<"Participant">>),
				 value = <<"participant">>},
		   #xdata_option{label = xmpp_tr:tr(Lang, <<"Visitor">>),
				 value = <<"visitor">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var =
		     <<"muc#roomconfig_presencebroadcast">>,
		 values = Values, required = false, type = 'list-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Roles for which Presence is Broadcasted">>)}.

encode_publicroom(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_publicroom">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Make room public searchable">>)}.

encode_public_list(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"public_list">>, values = Values,
		 required = false, type = boolean, options = Opts,
		 desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Make participants list public">>)}.

encode_roomadmins(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [jid:encode(V) || V <- Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomadmins">>,
		 values = Values, required = false, type = 'jid-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Full List of Room Admins">>)}.

encode_roomdesc(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomdesc">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Room description">>)}.

encode_roomname(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomname">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Room title">>)}.

encode_roomowners(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [jid:encode(V) || V <- Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomowners">>,
		 values = Values, required = false, type = 'jid-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Full List of Room Owners">>)}.

encode_roomsecret(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomsecret">>,
		 values = Values, required = false,
		 type = 'text-private', options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Password">>)}.

encode_whois(Value, Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label =
				     xmpp_tr:tr(Lang, <<"Moderators Only">>),
				 value = <<"moderators">>},
		   #xdata_option{label = xmpp_tr:tr(Lang, <<"Anyone">>),
				 value = <<"anyone">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"muc#roomconfig_whois">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Present real Jabber IDs to">>)}.

encode_mam(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"mam">>, values = Values,
		 required = false, type = boolean, options = Opts,
		 desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Enable message archiving">>)}.
