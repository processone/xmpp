%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_roominfo.xdata
%% Form type: http://jabber.org/protocol/muc#roominfo
%% Document: XEP-0045

-module(muc_roominfo).

-export([decode/1, decode/2, encode/1, encode/2,
	 format_error/1, io_format_error/1]).

-include("xmpp_codec.hrl").

-include("muc_roominfo.hrl").

-export_type([property/0, result/0, form/0]).

dec_int(Val, Min, Max) ->
    case list_to_integer(binary_to_list(Val)) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> integer_to_binary(Int).

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
      false -> decode(Fs, Acc, []);
      #xdata_field{values =
		       [<<"http://jabber.org/protocol/muc#roominfo">>]} ->
	  decode(Fs, Acc, []);
      _ ->
	  erlang:error({?MODULE,
			{form_type_mismatch,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end.

encode(Cfg) -> encode(Cfg, <<"en">>).

encode(List, Lang) when is_list(List) ->
    Fs = [case Opt of
	    {maxhistoryfetch, Val} ->
		[encode_maxhistoryfetch(Val, Lang)];
	    {maxhistoryfetch, _, _} -> erlang:error({badarg, Opt});
	    {contactjid, Val} -> [encode_contactjid(Val, Lang)];
	    {contactjid, _, _} -> erlang:error({badarg, Opt});
	    {description, Val} -> [encode_description(Val, Lang)];
	    {description, _, _} -> erlang:error({badarg, Opt});
	    {lang, Val} -> [encode_lang(Val, Lang)];
	    {lang, _, _} -> erlang:error({badarg, Opt});
	    {ldapgroup, Val} -> [encode_ldapgroup(Val, Lang)];
	    {ldapgroup, _, _} -> erlang:error({badarg, Opt});
	    {logs, Val} -> [encode_logs(Val, Lang)];
	    {logs, _, _} -> erlang:error({badarg, Opt});
	    {occupants, Val} -> [encode_occupants(Val, Lang)];
	    {occupants, _, _} -> erlang:error({badarg, Opt});
	    {subject, Val} -> [encode_subject(Val, Lang)];
	    {subject, _, _} -> erlang:error({badarg, Opt});
	    {subjectmod, Val} -> [encode_subjectmod(Val, Lang)];
	    {subjectmod, _, _} -> erlang:error({badarg, Opt});
	    #xdata_field{} -> [Opt];
	    _ -> []
	  end
	  || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
			    type = hidden,
			    values =
				[<<"http://jabber.org/protocol/muc#roominfo">>]},
    [FormType | lists:flatten(Fs)].

decode([#xdata_field{var = <<"muc#maxhistoryfetch">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs, [{maxhistoryfetch, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#maxhistoryfetch">>,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end;
decode([#xdata_field{var = <<"muc#maxhistoryfetch">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"muc#maxhistoryfetch">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"muc#maxhistoryfetch">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#maxhistoryfetch">>,
		   <<"http://jabber.org/protocol/muc#roominfo">>}});
decode([#xdata_field{var =
			 <<"muc#roominfo_contactjid">>,
		     values = [<<>>]} =
	    F
	| Fs],
       Acc, Required) ->
    %% Psi work-around
    decode([F#xdata_field{var =
			      <<"muc#roominfo_contactjid">>,
			  values = []}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"muc#roominfo_contactjid">>,
		     values = Values}
	| Fs],
       Acc, Required) ->
    try [jid:decode(Value) || Value <- Values] of
      Result ->
	  decode(Fs, [{contactjid, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roominfo_contactjid">>,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end;
decode([#xdata_field{var =
			 <<"muc#roominfo_description">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{description, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roominfo_description">>,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end;
decode([#xdata_field{var =
			 <<"muc#roominfo_description">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roominfo_description">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"muc#roominfo_description">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roominfo_description">>,
		   <<"http://jabber.org/protocol/muc#roominfo">>}});
decode([#xdata_field{var = <<"muc#roominfo_lang">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result -> decode(Fs, [{lang, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roominfo_lang">>,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end;
decode([#xdata_field{var = <<"muc#roominfo_lang">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"muc#roominfo_lang">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"muc#roominfo_lang">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roominfo_lang">>,
		   <<"http://jabber.org/protocol/muc#roominfo">>}});
decode([#xdata_field{var = <<"muc#roominfo_ldapgroup">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{ldapgroup, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roominfo_ldapgroup">>,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end;
decode([#xdata_field{var = <<"muc#roominfo_ldapgroup">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roominfo_ldapgroup">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"muc#roominfo_ldapgroup">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roominfo_ldapgroup">>,
		   <<"http://jabber.org/protocol/muc#roominfo">>}});
decode([#xdata_field{var = <<"muc#roominfo_logs">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result -> decode(Fs, [{logs, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roominfo_logs">>,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end;
decode([#xdata_field{var = <<"muc#roominfo_logs">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"muc#roominfo_logs">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"muc#roominfo_logs">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roominfo_logs">>,
		   <<"http://jabber.org/protocol/muc#roominfo">>}});
decode([#xdata_field{var = <<"muc#roominfo_occupants">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs, [{occupants, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roominfo_occupants">>,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end;
decode([#xdata_field{var = <<"muc#roominfo_occupants">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roominfo_occupants">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"muc#roominfo_occupants">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roominfo_occupants">>,
		   <<"http://jabber.org/protocol/muc#roominfo">>}});
decode([#xdata_field{var = <<"muc#roominfo_subject">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{subject, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roominfo_subject">>,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end;
decode([#xdata_field{var = <<"muc#roominfo_subject">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"muc#roominfo_subject">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"muc#roominfo_subject">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roominfo_subject">>,
		   <<"http://jabber.org/protocol/muc#roominfo">>}});
decode([#xdata_field{var =
			 <<"muc#roominfo_subjectmod">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{subjectmod, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"muc#roominfo_subjectmod">>,
			 <<"http://jabber.org/protocol/muc#roominfo">>}})
    end;
decode([#xdata_field{var =
			 <<"muc#roominfo_subjectmod">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"muc#roominfo_subjectmod">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"muc#roominfo_subjectmod">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"muc#roominfo_subjectmod">>,
		   <<"http://jabber.org/protocol/muc#roominfo">>}});
decode([#xdata_field{var = Var} | Fs], Acc, Required) ->
    if Var /= <<"FORM_TYPE">> ->
	   erlang:error({?MODULE,
			 {unknown_var, Var,
			  <<"http://jabber.org/protocol/muc#roominfo">>}});
       true -> decode(Fs, Acc, Required)
    end;
decode([], Acc, []) -> Acc.

encode_maxhistoryfetch(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_int(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#maxhistoryfetch">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Maximum Number of History Messages Returned "
				  "by Room">>)}.

encode_contactjid(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [jid:encode(V) || V <- Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_contactjid">>,
		 values = Values, required = false, type = 'jid-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Contact Addresses (normally, room owner "
				  "or owners)">>)}.

encode_description(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_description">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Room description">>)}.

encode_lang(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_lang">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Natural Language for Room Discussions">>)}.

encode_ldapgroup(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_ldapgroup">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"An associated LDAP group that defines "
				  "room membership; this should be an LDAP "
				  "Distinguished Name according to an implementa"
				  "tion-specific or deployment-specific "
				  "definition of a group.">>)}.

encode_logs(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_logs">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"URL for Archived Discussion Logs">>)}.

encode_occupants(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_int(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_occupants">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Number of occupants">>)}.

encode_subject(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_subject">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Current Discussion Topic">>)}.

encode_subjectmod(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_subjectmod">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The room subject can be modified by "
				  "participants">>)}.
