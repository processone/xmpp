%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_meta_data.xdata
%% Form type: http://jabber.org/protocol/pubsub#meta-data
%% Document: XEP-0060

-module(pubsub_meta_data).

-export([encode/1, encode/2]).

-export([decode/1, decode/2, format_error/1,
	 io_format_error/1]).

-include("xmpp_codec.hrl").

-include("pubsub_meta_data.hrl").

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
	  decode(Fs, Acc,
		 <<"http://jabber.org/protocol/pubsub#meta-data">>, []);
      #xdata_field{values = [XMLNS]}
	  when XMLNS ==
		 <<"http://jabber.org/protocol/pubsub#meta-data">> ->
	  decode(Fs, Acc, XMLNS, []);
      _ ->
	  erlang:error({?MODULE,
			{form_type_mismatch,
			 <<"http://jabber.org/protocol/pubsub#meta-data">>}})
    end.

encode(Cfg) -> encode(Cfg, <<"en">>).

encode(List, Lang) when is_list(List) ->
    Fs = [case Opt of
	    {contact, Val} -> [encode_contact(Val, Lang)];
	    {contact, _, _} -> erlang:error({badarg, Opt});
	    {creation_date, Val} ->
		[encode_creation_date(Val, Lang)];
	    {creation_date, _, _} -> erlang:error({badarg, Opt});
	    {creator, Val} -> [encode_creator(Val, Lang)];
	    {creator, _, _} -> erlang:error({badarg, Opt});
	    {description, Val} -> [encode_description(Val, Lang)];
	    {description, _, _} -> erlang:error({badarg, Opt});
	    {language, Val} ->
		[encode_language(Val, default, Lang)];
	    {language, Val, Opts} ->
		[encode_language(Val, Opts, Lang)];
	    {num_subscribers, Val} ->
		[encode_num_subscribers(Val, Lang)];
	    {num_subscribers, _, _} -> erlang:error({badarg, Opt});
	    {owner, Val} -> [encode_owner(Val, Lang)];
	    {owner, _, _} -> erlang:error({badarg, Opt});
	    {publisher, Val} -> [encode_publisher(Val, Lang)];
	    {publisher, _, _} -> erlang:error({badarg, Opt});
	    {title, Val} -> [encode_title(Val, Lang)];
	    {title, _, _} -> erlang:error({badarg, Opt});
	    {type, Val} -> [encode_type(Val, Lang)];
	    {type, _, _} -> erlang:error({badarg, Opt});
	    {max_items, Val} -> [encode_max_items(Val, Lang)];
	    {max_items, _, _} -> erlang:error({badarg, Opt});
	    #xdata_field{} -> [Opt];
	    _ -> []
	  end
	  || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
			    type = hidden,
			    values =
				[<<"http://jabber.org/protocol/pubsub#meta-data">>]},
    [FormType | lists:flatten(Fs)].

decode([#xdata_field{var = <<"pubsub#contact">>,
		     values = [<<>>]} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    %% Psi work-around
    decode([F#xdata_field{var = <<"pubsub#contact">>,
			  values = []}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#contact">>,
		     values = Values}
	| Fs],
       Acc, XMLNS, Required) ->
    try [jid:decode(Value) || Value <- Values] of
      Result ->
	  decode(Fs, [{contact, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#contact">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#creation_date">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try xmpp_util:decode_timestamp(Value) of
      Result ->
	  decode(Fs, [{creation_date, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#creation_date">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#creation_date">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"pubsub#creation_date">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#creation_date">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#creation_date">>, XMLNS}});
decode([#xdata_field{var = <<"pubsub#creator">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try jid:decode(Value) of
      Result ->
	  decode(Fs, [{creator, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#creator">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#creator">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"pubsub#creator">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#creator">>} | _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#creator">>, XMLNS}});
decode([#xdata_field{var = <<"pubsub#description">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{description, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#description">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#description">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"pubsub#description">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#description">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#description">>, XMLNS}});
decode([#xdata_field{var = <<"pubsub#language">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{language, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#language">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#language">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"pubsub#language">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#language">>} | _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#language">>, XMLNS}});
decode([#xdata_field{var = <<"pubsub#num_subscribers">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs, [{num_subscribers, Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#num_subscribers">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#num_subscribers">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var =
			      <<"pubsub#num_subscribers">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#num_subscribers">>}
	| _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#num_subscribers">>,
		   XMLNS}});
decode([#xdata_field{var = <<"pubsub#owner">>,
		     values = [<<>>]} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    %% Psi work-around
    decode([F#xdata_field{var = <<"pubsub#owner">>,
			  values = []}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#owner">>,
		     values = Values}
	| Fs],
       Acc, XMLNS, Required) ->
    try [jid:decode(Value) || Value <- Values] of
      Result ->
	  decode(Fs, [{owner, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#owner">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#publisher">>,
		     values = [<<>>]} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    %% Psi work-around
    decode([F#xdata_field{var = <<"pubsub#publisher">>,
			  values = []}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#publisher">>,
		     values = Values}
	| Fs],
       Acc, XMLNS, Required) ->
    try [jid:decode(Value) || Value <- Values] of
      Result ->
	  decode(Fs, [{publisher, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#publisher">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#title">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{title, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#title">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#title">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"pubsub#title">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#title">>} | _], _,
       XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#title">>, XMLNS}});
decode([#xdata_field{var = <<"pubsub#type">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{type, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#type">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#type">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"pubsub#type">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#type">>} | _], _,
       XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#type">>, XMLNS}});
decode([#xdata_field{var = <<"pubsub#max_items">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs, [{max_items, Result} | Acc], XMLNS, Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#max_items">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"pubsub#max_items">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"pubsub#max_items">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"pubsub#max_items">>} | _],
       _, XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#max_items">>, XMLNS}});
decode([#xdata_field{var = Var} | Fs], Acc, XMLNS,
       Required) ->
    if Var /= <<"FORM_TYPE">> ->
	   erlang:error({?MODULE, {unknown_var, Var, XMLNS}});
       true -> decode(Fs, Acc, XMLNS, Required)
    end;
decode([], Acc, _, []) -> Acc.

encode_contact(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [jid:encode(V) || V <- Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#contact">>,
		 values = Values, required = false, type = 'jid-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The JIDs of those to contact with questions">>)}.

encode_creation_date(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [xmpp_util:encode_timestamp(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#creation_date">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The datetime when the node was created">>)}.

encode_creator(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [jid:encode(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#creator">>,
		 values = Values, required = false, type = 'jid-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"The JID of the node creator">>)}.

encode_description(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#description">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"A description of the node">>)}.

encode_language(Value, Options, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = if Options == default -> [];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L), value = V}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"pubsub#language">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The default language of the node">>)}.

encode_num_subscribers(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_int(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#num_subscribers">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The number of subscribers to the node">>)}.

encode_owner(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [jid:encode(V) || V <- Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#owner">>, values = Values,
		 required = false, type = 'jid-multi', options = Opts,
		 desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The JIDs of those with an affiliation "
				  "of owner">>)}.

encode_publisher(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [jid:encode(V) || V <- Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#publisher">>,
		 values = Values, required = false, type = 'jid-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The JIDs of those with an affiliation "
				  "of publisher">>)}.

encode_title(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#title">>, values = Values,
		 required = false, type = 'text-single', options = Opts,
		 desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"The name of the node">>)}.

encode_type(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#type">>, values = Values,
		 required = false, type = 'text-single', options = Opts,
		 desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Payload type">>)}.

encode_max_items(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_int(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#max_items">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Maximum number of items to persist">>)}.
