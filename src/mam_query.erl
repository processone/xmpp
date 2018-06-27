%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: mam_query.xdata
%% Form type: urn:xmpp:mam:1
%% Document: XEP-0313

-module(mam_query).

-export([encode/1, encode/2]).

-export([decode/1, decode/2, format_error/1,
	 io_format_error/1]).

-include("xmpp_codec.hrl").

-include("mam_query.hrl").

-export_type([property/0, result/0, form/0]).

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
      false -> decode(Fs, Acc, <<"urn:xmpp:mam:1">>, []);
      #xdata_field{values = [XMLNS]}
	  when XMLNS == <<"urn:xmpp:mam:1">> ->
	  decode(Fs, Acc, XMLNS, []);
      _ ->
	  erlang:error({?MODULE,
			{form_type_mismatch, <<"urn:xmpp:mam:1">>}})
    end.

encode(Cfg) -> encode(Cfg, <<"en">>).

encode(List, Lang) when is_list(List) ->
    Fs = [case Opt of
	    {with, Val} -> [encode_with(Val, Lang)];
	    {with, _, _} -> erlang:error({badarg, Opt});
	    {start, Val} -> [encode_start(Val, Lang)];
	    {start, _, _} -> erlang:error({badarg, Opt});
	    {'end', Val} -> [encode_end(Val, Lang)];
	    {'end', _, _} -> erlang:error({badarg, Opt});
	    {withtext, Val} -> [encode_withtext(Val, Lang)];
	    {withtext, _, _} -> erlang:error({badarg, Opt});
	    #xdata_field{} -> [Opt];
	    _ -> []
	  end
	  || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
			    type = hidden, values = [<<"urn:xmpp:mam:1">>]},
    [FormType | lists:flatten(Fs)].

decode([#xdata_field{var = <<"with">>, values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try jid:decode(Value) of
      Result ->
	  decode(Fs, [{with, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"with">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"with">>, values = []} = F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"with">>, values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"with">>} | _], _, XMLNS,
       _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"with">>, XMLNS}});
decode([#xdata_field{var = <<"start">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try xmpp_util:decode_timestamp(Value) of
      Result ->
	  decode(Fs, [{start, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"start">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"start">>, values = []} = F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"start">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"start">>} | _], _, XMLNS,
       _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"start">>, XMLNS}});
decode([#xdata_field{var = <<"end">>, values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try xmpp_util:decode_timestamp(Value) of
      Result ->
	  decode(Fs, [{'end', Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"end">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"end">>, values = []} = F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"end">>, values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"end">>} | _], _, XMLNS,
       _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"end">>, XMLNS}});
decode([#xdata_field{var = <<"withtext">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{withtext, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"withtext">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"withtext">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"withtext">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"withtext">>} | _], _,
       XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"withtext">>, XMLNS}});
decode([#xdata_field{var = Var} | Fs], Acc, XMLNS,
       Required) ->
    if Var /= <<"FORM_TYPE">> ->
	   erlang:error({?MODULE, {unknown_var, Var, XMLNS}});
       true -> decode(Fs, Acc, XMLNS, Required)
    end;
decode([], Acc, _, []) -> Acc.

encode_with(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [jid:encode(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"with">>, values = Values,
		 required = false, type = 'jid-single', options = Opts,
		 desc = <<>>, label = xmpp_tr:tr(Lang, <<"User JID">>)}.

encode_start(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"start">>, values = Values,
		 required = false, type = 'text-single', options = Opts,
		 desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Search from the date">>)}.

encode_end(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"end">>, values = Values,
		 required = false, type = 'text-single', options = Opts,
		 desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Search until the date">>)}.

encode_withtext(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"withtext">>, values = Values,
		 required = false, type = 'text-single', options = Opts,
		 desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Search the text">>)}.
