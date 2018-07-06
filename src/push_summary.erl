%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: push_summary.xdata
%% Form type: urn:xmpp:push:summary
%% Document: XEP-0357

-module(push_summary).

-export([encode/1, encode/2]).

-export([decode/1, decode/2, format_error/1,
	 io_format_error/1]).

-include("xmpp_codec.hrl").

-include("push_summary.hrl").

-export_type([property/0, result/0, form/0]).

-dialyzer({nowarn_function, {dec_int, 3}}).

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> integer_to_binary(Int).

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
	  decode(Fs, Acc, <<"urn:xmpp:push:summary">>, []);
      #xdata_field{values = [XMLNS]}
	  when XMLNS == <<"urn:xmpp:push:summary">> ->
	  decode(Fs, Acc, XMLNS, []);
      _ ->
	  erlang:error({?MODULE,
			{form_type_mismatch, <<"urn:xmpp:push:summary">>}})
    end.

encode(Cfg) -> encode(Cfg, <<"en">>).

encode(List, Lang) when is_list(List) ->
    Fs = [case Opt of
	    {'message-count', Val} ->
		['encode_message-count'(Val, Lang)];
	    {'message-count', _, _} -> erlang:error({badarg, Opt});
	    {'pending-subscription-count', Val} ->
		['encode_pending-subscription-count'(Val, Lang)];
	    {'pending-subscription-count', _, _} ->
		erlang:error({badarg, Opt});
	    {'last-message-sender', Val} ->
		['encode_last-message-sender'(Val, Lang)];
	    {'last-message-sender', _, _} ->
		erlang:error({badarg, Opt});
	    {'last-message-body', Val} ->
		['encode_last-message-body'(Val, Lang)];
	    {'last-message-body', _, _} ->
		erlang:error({badarg, Opt});
	    #xdata_field{} -> [Opt];
	    _ -> []
	  end
	  || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
			    type = hidden,
			    values = [<<"urn:xmpp:push:summary">>]},
    [FormType | lists:flatten(Fs)].

decode([#xdata_field{var = <<"message-count">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs, [{'message-count', Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"message-count">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"message-count">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"message-count">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"message-count">>} | _], _,
       XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"message-count">>, XMLNS}});
decode([#xdata_field{var =
			 <<"pending-subscription-count">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs,
		 [{'pending-subscription-count', Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pending-subscription-count">>,
			 XMLNS}})
    end;
decode([#xdata_field{var =
			 <<"pending-subscription-count">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"pending-subscription-count">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var =
			 <<"pending-subscription-count">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pending-subscription-count">>,
		   XMLNS}});
decode([#xdata_field{var = <<"last-message-sender">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try jid:decode(Value) of
      Result ->
	  decode(Fs, [{'last-message-sender', Result} | Acc],
		 XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"last-message-sender">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"last-message-sender">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"last-message-sender">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"last-message-sender">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"last-message-sender">>, XMLNS}});
decode([#xdata_field{var = <<"last-message-body">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{'last-message-body', Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"last-message-body">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"last-message-body">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"last-message-body">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"last-message-body">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"last-message-body">>, XMLNS}});
decode([#xdata_field{var = Var} | Fs], Acc, XMLNS,
       Required) ->
    if Var /= <<"FORM_TYPE">> ->
	   erlang:error({?MODULE, {unknown_var, Var, XMLNS}});
       true -> decode(Fs, Acc, XMLNS, Required)
    end;
decode([], Acc, _, []) -> Acc.

'encode_message-count'(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_int(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"message-count">>, values = Values,
		 required = false, type = 'text-single', options = Opts,
		 desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The number of unread or undelivered "
				  "messages">>)}.

'encode_pending-subscription-count'(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_int(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pending-subscription-count">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The number of pending incoming presence "
				  "subscription requests">>)}.

'encode_last-message-sender'(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [jid:encode(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"last-message-sender">>,
		 values = Values, required = false, type = 'jid-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The sender of the last received message">>)}.

'encode_last-message-body'(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"last-message-body">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The body text of the last received message">>)}.
