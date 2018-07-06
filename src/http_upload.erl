%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: http_upload.xdata
%% Form type: urn:xmpp:http:upload:0, urn:xmpp:http:upload, eu:siacs:conversations:http:upload
%% Document: XEP-0363

-module(http_upload).

-export([encode/2, encode/3]).

-export([decode/1, decode/2, format_error/1,
	 io_format_error/1]).

-include("xmpp_codec.hrl").

-include("http_upload.hrl").

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
	  decode(Fs, Acc, <<"urn:xmpp:http:upload:0">>, []);
      #xdata_field{values = [XMLNS]}
	  when XMLNS == <<"urn:xmpp:http:upload:0">>;
	       XMLNS == <<"urn:xmpp:http:upload">>;
	       XMLNS == <<"eu:siacs:conversations:http:upload">> ->
	  decode(Fs, Acc, XMLNS, []);
      _ ->
	  erlang:error({?MODULE,
			{form_type_mismatch, <<"urn:xmpp:http:upload:0">>}})
    end.

encode(Cfg, XMLNS) -> encode(Cfg, XMLNS, <<"en">>).

encode(List, XMLNS, Lang) when is_list(List) ->
    Fs = [case Opt of
	    {'max-file-size', Val} ->
		['encode_max-file-size'(Val, Lang)];
	    {'max-file-size', _, _} -> erlang:error({badarg, Opt});
	    #xdata_field{} -> [Opt];
	    _ -> []
	  end
	  || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
			    type = hidden, values = [XMLNS]},
    [FormType | lists:flatten(Fs)].

decode([#xdata_field{var = <<"max-file-size">>,
		     values = [Value]}
	| Fs],
       Acc, XMLNS, Required) ->
    try dec_int(Value, 0, infinity) of
      Result ->
	  decode(Fs, [{'max-file-size', Result} | Acc], XMLNS,
		 Required)
    catch
      _:_ ->
	  erlang:error({?MODULE,
			{bad_var_value, <<"max-file-size">>, XMLNS}})
    end;
decode([#xdata_field{var = <<"max-file-size">>,
		     values = []} =
	    F
	| Fs],
       Acc, XMLNS, Required) ->
    decode([F#xdata_field{var = <<"max-file-size">>,
			  values = [<<>>]}
	    | Fs],
	   Acc, XMLNS, Required);
decode([#xdata_field{var = <<"max-file-size">>} | _], _,
       XMLNS, _) ->
    erlang:error({?MODULE,
		  {too_many_values, <<"max-file-size">>, XMLNS}});
decode([#xdata_field{var = Var} | Fs], Acc, XMLNS,
       Required) ->
    if Var /= <<"FORM_TYPE">> ->
	   erlang:error({?MODULE, {unknown_var, Var, XMLNS}});
       true -> decode(Fs, Acc, XMLNS, Required)
    end;
decode([], Acc, _, []) -> Acc.

'encode_max-file-size'(Value, Lang) ->
    Values = case Value of
	       undefined -> [];
	       Value -> [enc_int(Value)]
	     end,
    Opts = [],
    #xdata_field{var = <<"max-file-size">>, values = Values,
		 required = false, type = 'text-single', options = Opts,
		 desc = <<>>,
		 label = xmpp_tr:tr(Lang, <<"Maximum file size">>)}.
