%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_node_config.xdata
%% Form type: http://jabber.org/protocol/pubsub#node_config
%% Document: XEP-0060

-module(pubsub_node_config).

-export([decode/1, decode/2, encode/1, encode/2,
	 format_error/1, io_format_error/1]).

-include("xmpp_codec.hrl").

-include("pubsub_node_config.hrl").

-export_type([property/0, result/0, form/0]).

dec_int(Val, Min, Max) ->
    case list_to_integer(binary_to_list(Val)) of
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
		       [<<"http://jabber.org/protocol/pubsub#node_config">>]} ->
	  decode(Fs, Acc, []);
      _ ->
	  erlang:error({?MODULE,
			{form_type_mismatch,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end.

encode(Cfg) -> encode(Cfg, <<"en">>).

encode(List, Lang) when is_list(List) ->
    Fs = [case Opt of
	    {access_model, Val} ->
		[encode_access_model(Val, default, Lang)];
	    {access_model, Val, Opts} ->
		[encode_access_model(Val, Opts, Lang)];
	    {body_xslt, Val} -> [encode_body_xslt(Val, Lang)];
	    {body_xslt, _, _} -> erlang:error({badarg, Opt});
	    {children_association_policy, Val} ->
		[encode_children_association_policy(Val, default,
						    Lang)];
	    {children_association_policy, Val, Opts} ->
		[encode_children_association_policy(Val, Opts, Lang)];
	    {children_association_whitelist, Val} ->
		[encode_children_association_whitelist(Val, Lang)];
	    {children_association_whitelist, _, _} ->
		erlang:error({badarg, Opt});
	    {children, Val} -> [encode_children(Val, Lang)];
	    {children, _, _} -> erlang:error({badarg, Opt});
	    {children_max, Val} -> [encode_children_max(Val, Lang)];
	    {children_max, _, _} -> erlang:error({badarg, Opt});
	    {collection, Val} -> [encode_collection(Val, Lang)];
	    {collection, _, _} -> erlang:error({badarg, Opt});
	    {contact, Val} -> [encode_contact(Val, Lang)];
	    {contact, _, _} -> erlang:error({badarg, Opt});
	    {dataform_xslt, Val} ->
		[encode_dataform_xslt(Val, Lang)];
	    {dataform_xslt, _, _} -> erlang:error({badarg, Opt});
	    {deliver_notifications, Val} ->
		[encode_deliver_notifications(Val, Lang)];
	    {deliver_notifications, _, _} ->
		erlang:error({badarg, Opt});
	    {deliver_payloads, Val} ->
		[encode_deliver_payloads(Val, Lang)];
	    {deliver_payloads, _, _} -> erlang:error({badarg, Opt});
	    {description, Val} -> [encode_description(Val, Lang)];
	    {description, _, _} -> erlang:error({badarg, Opt});
	    {item_expire, Val} -> [encode_item_expire(Val, Lang)];
	    {item_expire, _, _} -> erlang:error({badarg, Opt});
	    {itemreply, Val} ->
		[encode_itemreply(Val, default, Lang)];
	    {itemreply, Val, Opts} ->
		[encode_itemreply(Val, Opts, Lang)];
	    {language, Val} ->
		[encode_language(Val, default, Lang)];
	    {language, Val, Opts} ->
		[encode_language(Val, Opts, Lang)];
	    {max_items, Val} -> [encode_max_items(Val, Lang)];
	    {max_items, _, _} -> erlang:error({badarg, Opt});
	    {max_payload_size, Val} ->
		[encode_max_payload_size(Val, Lang)];
	    {max_payload_size, _, _} -> erlang:error({badarg, Opt});
	    {node_type, Val} ->
		[encode_node_type(Val, default, Lang)];
	    {node_type, Val, Opts} ->
		[encode_node_type(Val, Opts, Lang)];
	    {notification_type, Val} ->
		[encode_notification_type(Val, default, Lang)];
	    {notification_type, Val, Opts} ->
		[encode_notification_type(Val, Opts, Lang)];
	    {notify_config, Val} ->
		[encode_notify_config(Val, Lang)];
	    {notify_config, _, _} -> erlang:error({badarg, Opt});
	    {notify_delete, Val} ->
		[encode_notify_delete(Val, Lang)];
	    {notify_delete, _, _} -> erlang:error({badarg, Opt});
	    {notify_retract, Val} ->
		[encode_notify_retract(Val, Lang)];
	    {notify_retract, _, _} -> erlang:error({badarg, Opt});
	    {notify_sub, Val} -> [encode_notify_sub(Val, Lang)];
	    {notify_sub, _, _} -> erlang:error({badarg, Opt});
	    {persist_items, Val} ->
		[encode_persist_items(Val, Lang)];
	    {persist_items, _, _} -> erlang:error({badarg, Opt});
	    {presence_based_delivery, Val} ->
		[encode_presence_based_delivery(Val, Lang)];
	    {presence_based_delivery, _, _} ->
		erlang:error({badarg, Opt});
	    {publish_model, Val} ->
		[encode_publish_model(Val, default, Lang)];
	    {publish_model, Val, Opts} ->
		[encode_publish_model(Val, Opts, Lang)];
	    {purge_offline, Val} ->
		[encode_purge_offline(Val, Lang)];
	    {purge_offline, _, _} -> erlang:error({badarg, Opt});
	    {roster_groups_allowed, Val} ->
		[encode_roster_groups_allowed(Val, default, Lang)];
	    {roster_groups_allowed, Val, Opts} ->
		[encode_roster_groups_allowed(Val, Opts, Lang)];
	    {send_last_published_item, Val} ->
		[encode_send_last_published_item(Val, default, Lang)];
	    {send_last_published_item, Val, Opts} ->
		[encode_send_last_published_item(Val, Opts, Lang)];
	    {tempsub, Val} -> [encode_tempsub(Val, Lang)];
	    {tempsub, _, _} -> erlang:error({badarg, Opt});
	    {subscribe, Val} -> [encode_subscribe(Val, Lang)];
	    {subscribe, _, _} -> erlang:error({badarg, Opt});
	    {title, Val} -> [encode_title(Val, Lang)];
	    {title, _, _} -> erlang:error({badarg, Opt});
	    {type, Val} -> [encode_type(Val, Lang)];
	    {type, _, _} -> erlang:error({badarg, Opt});
	    #xdata_field{} -> [Opt];
	    _ -> []
	  end
	  || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
			    type = hidden,
			    values =
				[<<"http://jabber.org/protocol/pubsub#node_config">>]},
    [FormType | lists:flatten(Fs)].

decode([#xdata_field{var = <<"pubsub#access_model">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_enum(Value,
		 [authorize, open, presence, roster, whitelist])
    of
      Result ->
	  decode(Fs, [{access_model, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#access_model">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#access_model">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#access_model">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#access_model">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#access_model">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#body_xslt">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{body_xslt, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#body_xslt">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#body_xslt">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#body_xslt">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#body_xslt">>} | _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#body_xslt">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var =
			 <<"pubsub#children_association_policy">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_enum(Value, [all, owners, whitelist]) of
      Result ->
	  decode(Fs,
		 [{children_association_policy, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value,
			 <<"pubsub#children_association_policy">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var =
			 <<"pubsub#children_association_policy">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"pubsub#children_association_policy">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"pubsub#children_association_policy">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values,
		   <<"pubsub#children_association_policy">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var =
			 <<"pubsub#children_association_whitelist">>,
		     values = [<<>>]} =
	    F
	| Fs],
       Acc, Required) ->
    %% Psi work-around
    decode([F#xdata_field{var =
			      <<"pubsub#children_association_whitelist">>,
			  values = []}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"pubsub#children_association_whitelist">>,
		     values = Values}
	| Fs],
       Acc, Required) ->
    try [jid:decode(Value) || Value <- Values] of
      Result ->
	  decode(Fs,
		 [{children_association_whitelist, Result} | Acc],
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value,
			 <<"pubsub#children_association_whitelist">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#children">>,
		     values = Values}
	| Fs],
       Acc, Required) ->
    try [Value || Value <- Values] of
      Result ->
	  decode(Fs, [{children, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#children">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#children_max">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{children_max, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#children_max">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#children_max">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#children_max">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#children_max">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#children_max">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#collection">>,
		     values = Values}
	| Fs],
       Acc, Required) ->
    try [Value || Value <- Values] of
      Result ->
	  decode(Fs, [{collection, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#collection">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#contact">>,
		     values = [<<>>]} =
	    F
	| Fs],
       Acc, Required) ->
    %% Psi work-around
    decode([F#xdata_field{var = <<"pubsub#contact">>,
			  values = []}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#contact">>,
		     values = Values}
	| Fs],
       Acc, Required) ->
    try [jid:decode(Value) || Value <- Values] of
      Result ->
	  decode(Fs, [{contact, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#contact">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#dataform_xslt">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{dataform_xslt, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#dataform_xslt">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#dataform_xslt">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#dataform_xslt">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#dataform_xslt">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#dataform_xslt">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var =
			 <<"pubsub#deliver_notifications">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{deliver_notifications, Result} | Acc],
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#deliver_notifications">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var =
			 <<"pubsub#deliver_notifications">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"pubsub#deliver_notifications">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"pubsub#deliver_notifications">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#deliver_notifications">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var =
			 <<"pubsub#deliver_payloads">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{deliver_payloads, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#deliver_payloads">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var =
			 <<"pubsub#deliver_payloads">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"pubsub#deliver_payloads">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"pubsub#deliver_payloads">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#deliver_payloads">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#description">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{description, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#description">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#description">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#description">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#description">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#description">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#item_expire">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{item_expire, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#item_expire">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#item_expire">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#item_expire">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#item_expire">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#item_expire">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#itemreply">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_enum(Value, [owner, publisher, none]) of
      Result ->
	  decode(Fs, [{itemreply, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#itemreply">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#itemreply">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#itemreply">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#itemreply">>} | _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#itemreply">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#language">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result ->
	  decode(Fs, [{language, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#language">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#language">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#language">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#language">>} | _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#language">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#max_items">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs, [{max_items, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#max_items">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#max_items">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#max_items">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#max_items">>} | _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#max_items">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var =
			 <<"pubsub#max_payload_size">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs, [{max_payload_size, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#max_payload_size">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var =
			 <<"pubsub#max_payload_size">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"pubsub#max_payload_size">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"pubsub#max_payload_size">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#max_payload_size">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#node_type">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_enum(Value, [leaf, collection]) of
      Result ->
	  decode(Fs, [{node_type, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#node_type">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#node_type">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#node_type">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#node_type">>} | _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#node_type">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var =
			 <<"pubsub#notification_type">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_enum(Value, [normal, headline]) of
      Result ->
	  decode(Fs, [{notification_type, Result} | Acc],
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#notification_type">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var =
			 <<"pubsub#notification_type">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"pubsub#notification_type">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"pubsub#notification_type">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#notification_type">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#notify_config">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{notify_config, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#notify_config">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#notify_config">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#notify_config">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#notify_config">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#notify_config">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#notify_delete">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{notify_delete, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#notify_delete">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#notify_delete">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#notify_delete">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#notify_delete">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#notify_delete">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#notify_retract">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{notify_retract, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#notify_retract">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#notify_retract">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#notify_retract">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#notify_retract">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#notify_retract">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#notify_sub">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{notify_sub, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#notify_sub">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#notify_sub">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#notify_sub">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#notify_sub">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#notify_sub">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#persist_items">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{persist_items, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#persist_items">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#persist_items">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#persist_items">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#persist_items">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#persist_items">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var =
			 <<"pubsub#presence_based_delivery">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{presence_based_delivery, Result} | Acc],
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#presence_based_delivery">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var =
			 <<"pubsub#presence_based_delivery">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"pubsub#presence_based_delivery">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"pubsub#presence_based_delivery">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#presence_based_delivery">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#publish_model">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_enum(Value, [publishers, subscribers, open]) of
      Result ->
	  decode(Fs, [{publish_model, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#publish_model">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#publish_model">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#publish_model">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#publish_model">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#publish_model">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#purge_offline">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{purge_offline, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#purge_offline">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#purge_offline">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#purge_offline">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#purge_offline">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#purge_offline">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var =
			 <<"pubsub#roster_groups_allowed">>,
		     values = Values}
	| Fs],
       Acc, Required) ->
    try [Value || Value <- Values] of
      Result ->
	  decode(Fs, [{roster_groups_allowed, Result} | Acc],
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#roster_groups_allowed">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var =
			 <<"pubsub#send_last_published_item">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_enum(Value,
		 [never, on_sub, on_sub_and_presence])
    of
      Result ->
	  decode(Fs, [{send_last_published_item, Result} | Acc],
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#send_last_published_item">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var =
			 <<"pubsub#send_last_published_item">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var =
			      <<"pubsub#send_last_published_item">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var =
			 <<"pubsub#send_last_published_item">>}
	| _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#send_last_published_item">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#tempsub">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{tempsub, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#tempsub">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#tempsub">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#tempsub">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#tempsub">>} | _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#tempsub">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#subscribe">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try dec_bool(Value) of
      Result ->
	  decode(Fs, [{subscribe, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#subscribe">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#subscribe">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#subscribe">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#subscribe">>} | _],
       _, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#subscribe">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#title">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result -> decode(Fs, [{title, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#title">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#title">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#title">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#title">>} | _], _,
       _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#title">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = <<"pubsub#type">>,
		     values = [Value]}
	| Fs],
       Acc, Required) ->
    try Value of
      Result -> decode(Fs, [{type, Result} | Acc], Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"pubsub#type">>,
			 <<"http://jabber.org/protocol/pubsub#node_config">>}})
    end;
decode([#xdata_field{var = <<"pubsub#type">>,
		     values = []} =
	    F
	| Fs],
       Acc, Required) ->
    decode([F#xdata_field{var = <<"pubsub#type">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, Required);
decode([#xdata_field{var = <<"pubsub#type">>} | _], _,
       _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"pubsub#type">>,
		   <<"http://jabber.org/protocol/pubsub#node_config">>}});
decode([#xdata_field{var = Var} | Fs], Acc, Required) ->
    if Var /= <<"FORM_TYPE">> ->
	   erlang:error({?MODULE,
			 {unknown_var, Var,
			  <<"http://jabber.org/protocol/pubsub#node_config">>}});
       true -> decode(Fs, Acc, Required)
    end;
decode([], Acc, []) -> Acc.

encode_access_model(Value, Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Subscription requests must be approved "
						  "and only subscribers may retrieve items">>),
				 value = <<"authorize">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Anyone may subscribe and retrieve items">>),
				 value = <<"open">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Anyone with a presence subscription "
						  "of both or from may subscribe and retrieve "
						  "items">>),
				 value = <<"presence">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Anyone in the specified roster group(s) "
						  "may subscribe and retrieve items">>),
				 value = <<"roster">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Only those on a whitelist may subscribe "
						  "and retrieve items">>),
				 value = <<"whitelist">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"pubsub#access_model">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Specify the access model">>)}.

encode_body_xslt(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#body_xslt">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The URL of an XSL transformation which "
				  "can be applied to payloads in order "
				  "to generate an appropriate message body "
				  "element.">>)}.

encode_children_association_policy(Value, Options,
				   Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Anyone may associate leaf nodes with "
						  "the collection">>),
				 value = <<"all">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Only collection node owners may associate "
						  "leaf nodes with the collection">>),
				 value = <<"owners">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Only those on a whitelist may associate "
						  "leaf nodes with the collection">>),
				 value = <<"whitelist">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var =
		     <<"pubsub#children_association_policy">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Who may associate leaf nodes with a "
				  "collection">>)}.

encode_children_association_whitelist(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [jid:encode(V) || V <- Value]
	     end,
    Opts = [],
    #xdata_field{var =
		     <<"pubsub#children_association_whitelist">>,
		 values = Values, required = false, type = 'jid-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The list of JIDs that may associate "
				  "leaf nodes with a collection">>)}.

encode_children(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#children">>,
		 values = Values, required = false, type = 'text-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The child nodes (leaf or collection) "
				  "associated with a collection">>)}.

encode_children_max(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#children_max">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The maximum number of child nodes that "
				  "can be associated with a collection">>)}.

encode_collection(Value, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#collection">>,
		 values = Values, required = false, type = 'text-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The collections with which a node is "
				  "affiliated">>)}.

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

encode_dataform_xslt(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#dataform_xslt">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The URL of an XSL transformation which "
				  "can be applied to the payload format "
				  "in order to generate a valid Data Forms "
				  "result that the client could display "
				  "using a generic Data Forms rendering "
				  "engine">>)}.

encode_deliver_notifications(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#deliver_notifications">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Deliver event notifications">>)}.

encode_deliver_payloads(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#deliver_payloads">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Deliver payloads with event notifications">>)}.

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

encode_item_expire(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#item_expire">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Number of seconds after which to automaticall"
				  "y purge items">>)}.

encode_itemreply(Value, Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Statically specify a replyto of the "
						  "node owner(s)">>),
				 value = <<"owner">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Dynamically specify a replyto of the "
						  "item publisher">>),
				 value = <<"publisher">>},
		   #xdata_option{value = <<"none">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"pubsub#itemreply">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Whether owners or publisher should receive "
				  "replies to items">>)}.

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
		     xmpp_tr:tr(Lang, <<"Max # of items to persist">>)}.

encode_max_payload_size(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_int(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#max_payload_size">>,
		 values = Values, required = false, type = 'text-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Max payload size in bytes">>)}.

encode_node_type(Value, Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"The node is a leaf node (default)">>),
				 value = <<"leaf">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"The node is a collection node">>),
				 value = <<"collection">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"pubsub#node_type">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Whether the node is a leaf (default) "
				  "or a collection">>)}.

encode_notification_type(Value, Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Messages of type normal">>),
				 value = <<"normal">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Messages of type headline">>),
				 value = <<"headline">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"pubsub#notification_type">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Specify the event message type">>)}.

encode_notify_config(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#notify_config">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Notify subscribers when the node configuratio"
				  "n changes">>)}.

encode_notify_delete(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#notify_delete">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Notify subscribers when the node is "
				  "deleted">>)}.

encode_notify_retract(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#notify_retract">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Notify subscribers when items are removed "
				  "from the node">>)}.

encode_notify_sub(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#notify_sub">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Whether to notify owners about new subscriber"
				  "s and unsubscribes">>)}.

encode_persist_items(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#persist_items">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Persist items to storage">>)}.

encode_presence_based_delivery(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#presence_based_delivery">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Only deliver notifications to available "
				  "users">>)}.

encode_publish_model(Value, Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Only publishers may publish">>),
				 value = <<"publishers">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"Subscribers may publish">>),
				 value = <<"subscribers">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang, <<"Anyone may publish">>),
				 value = <<"open">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"pubsub#publish_model">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Specify the publisher model">>)}.

encode_purge_offline(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#purge_offline">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Purge all items when the relevant publisher "
				  "goes offline">>)}.

encode_roster_groups_allowed(Value, Options, Lang) ->
    Values = case Value of
	       [] -> [];
	       Value -> [Value]
	     end,
    Opts = if Options == default -> [];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L), value = V}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var = <<"pubsub#roster_groups_allowed">>,
		 values = Values, required = false, type = 'list-multi',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Roster groups allowed to subscribe">>)}.

encode_send_last_published_item(Value, Options, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_enum(Value)]
	     end,
    Opts = if Options == default ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, <<"Never">>),
				 value = <<"never">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"When a new subscription is processed">>),
				 value = <<"on_sub">>},
		   #xdata_option{label =
				     xmpp_tr:tr(Lang,
						<<"When a new subscription is processed "
						  "and whenever a subscriber comes online">>),
				 value = <<"on_sub_and_presence">>}];
	      true ->
		  [#xdata_option{label = xmpp_tr:tr(Lang, L),
				 value = enc_enum(V)}
		   || {L, V} <- Options]
	   end,
    #xdata_field{var =
		     <<"pubsub#send_last_published_item">>,
		 values = Values, required = false, type = 'list-single',
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"When to send the last published item">>)}.

encode_tempsub(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#tempsub">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"Whether to make all subscriptions temporary, "
				  "based on subscriber presence">>)}.

encode_subscribe(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_bool(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#subscribe">>,
		 values = Values, required = false, type = boolean,
		 options = Opts, desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"Whether to allow subscriptions">>)}.

encode_title(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#title">>, values = Values,
		 required = false, type = 'text-single', options = Opts,
		 desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang, <<"A friendly name for the node">>)}.

encode_type(Value, Lang) ->
    Values = case Value of
	       <<>> -> [];
	       Value -> [Value]
	     end,
    Opts = [],
    #xdata_field{var = <<"pubsub#type">>, values = Values,
		 required = false, type = 'text-single', options = Opts,
		 desc = <<>>,
		 label =
		     xmpp_tr:tr(Lang,
				<<"The type of node data, usually specified "
				  "by the namespace of the payload (if "
				  "any)">>)}.
