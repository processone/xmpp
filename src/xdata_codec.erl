%%%-------------------------------------------------------------------
%%% @author Evgeny Khramtsov <ekhramtsov@process-one.net>
%%% @doc
%%%
%%% @end
%%%
%%%
%%% Copyright (C) 2002-2025 ProcessOne, SARL. All Rights Reserved.
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

-module(xdata_codec).

%% API
-export([compile/1, compile/2]).
-export([dec_int/1, dec_int/3, dec_enum/2, dec_bool/1, not_empty/1,
	 dec_enum_int/2, dec_enum_int/4, enc_int/1, enc_enum/1,
	 enc_bool/1, enc_enum_int/1, dec_ip/1, enc_ip/1,
	 format_error/1, io_format_error/1]).
-include("xmpp.hrl").

-type mfargs() :: {atom(), atom(), list()} | {atom(), list()}.
-record(state, {mod_name :: atom(),
		file_name :: string(),
		erl = "" :: string(),
		hrl = "" :: string(),
		dir = "" :: string(),
		xmlns = [] :: [string()],
		doc = <<>> :: binary(),
		erl_dir = "" :: string(),
		hrl_dir = "" :: string(),
		prefix = [] :: [binary()],
		dec_mfas = [] :: [{binary(), mfargs()}],
		enc_mfas = [] :: [{binary(), mfargs()}],
		specs = [] :: [{binary(), string()}],
		ignore_unknown = false :: boolean(),
		required = [] :: [{binary(), boolean()} | binary()],
		defaults = [] :: [{binary(), any()}]}).

-define(is_multi_type(T),
	((T == 'list-multi') or (T == 'jid-multi') or (T == 'text-multi'))).

-define(is_list_type(T),
	((T == 'list-single') or (T == 'list-multi'))).

%%%===================================================================
%%% API
%%%===================================================================
compile(Path) ->
    compile(Path, []).

compile(Path, Opts) ->
    case filelib:is_dir(Path) of
	true ->
	    filelib:fold_files(
	      Path, ".*.xdata", false,
	      fun(File, ok) ->
		      compile_file(File, Opts);
		 (_, Err) ->
		      Err
	      end, ok);
	false ->
	    compile_file(Path, Opts)
    end.

compile_file(Path, Opts) ->
    try
	{ok, _} = application:ensure_all_started(fast_xml),
	DirName = filename:dirname(Path),
	FileName = filename:basename(Path),
	RootName = filename:rootname(FileName),
	ConfigPath = filename:join(DirName, RootName) ++ ".cfg",
	ModName = list_to_atom(RootName),
	{ok, Data} = file:read_file(Path),
	Config = case file:consult(ConfigPath) of
		     {ok, Terms} -> lists:flatten(Terms);
		     {error, enoent} -> []
		 end,
	State = #state{mod_name = ModName,
		       file_name = FileName,
		       erl = filename:rootname(FileName) ++ ".erl",
		       hrl = filename:rootname(FileName) ++ ".hrl",
		       dir = DirName,
		       prefix = proplists:get_all_values(prefix, Config),
		       erl_dir = proplists:get_value(erl_dir, Opts, DirName),
		       hrl_dir = proplists:get_value(hrl_dir, Opts, DirName),
		       dec_mfas = proplists:get_value(decode, Config, []),
		       enc_mfas = proplists:get_value(encode, Config, []),
		       specs = proplists:get_value(specs, Config, []),
		       ignore_unknown = proplists:get_bool(ignore_unknown, Config),
		       required = proplists:get_value(required, Config, []),
		       defaults = proplists:get_value(defaults, Config, [])},
	#xmlel{} = El = fxml_stream:parse_element(Data),
	ok = compile_element(normalize(El), State),
	io:format("Compiled ~s~n", [Path])
    catch _:{badmatch, Err} ->
	    io:format(standard_error, "Failed to compile ~s: ~p~n",
		      [Path, Err]),
	    Err
    end.

emit_raw(Str) ->
    put(outbuf, get(outbuf) ++ Str).

emit(Format) ->
    emit(Format, []).

emit(Format, Args) ->
    put(outbuf, get(outbuf) ++ io_lib:format(Format, Args)).

dec_int(Val) ->
    dec_int(Val, infinity, infinity).

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
        Int when Int =< Max, Min == infinity ->
            Int;
        Int when Int =< Max, Int >= Min ->
            Int
    end.

enc_int(Int) ->
    integer_to_binary(Int).

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
        true ->
            AtomVal
    end.

enc_enum(Atom) ->
    erlang:atom_to_binary(Atom, utf8).

dec_enum_int(Val, Enums) ->
    try dec_int(Val)
    catch _:_ -> dec_enum(Val, Enums)
    end.

dec_enum_int(Val, Enums, Min, Max) ->
    try dec_int(Val, Min, Max)
    catch _:_ -> dec_enum(Val, Enums)
    end.

enc_enum_int(Int) when is_integer(Int) ->
    enc_int(Int);
enc_enum_int(Atom) ->
    enc_enum(Atom).

dec_bool(<<"1">>) -> true;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"false">>) -> false.

enc_bool(true) -> <<"1">>;
enc_bool(false) -> <<"0">>.

not_empty(<<_, _/binary>> = Val) ->
    Val.

dec_ip(Val) ->
    {ok, Addr} = inet_parse:address(binary_to_list(Val)),
    Addr.

enc_ip({0,0,0,0,0,16#ffff,A,B}) ->
    enc_ip({(A bsr 8) band 16#ff, A band 16#ff,
            (B bsr 8) band 16#ff, B band 16#ff});
enc_ip(Addr) ->
    list_to_binary(inet_parse:ntoa(Addr)).

format_error({form_type_mismatch, Type}) ->
    <<"FORM_TYPE doesn't match '", Type/binary, "'">>;
format_error({bad_var_value, Var, Type}) ->
    <<"Bad value of field '", Var/binary, "' of type '", Type/binary, "'">>;
format_error({missing_value, Var, Type}) ->
    <<"Missing value of field '", Var/binary, "' of type '", Type/binary, "'">>;
format_error({too_many_values, Var, Type}) ->
    <<"Too many values for field '", Var/binary, "' of type '", Type/binary, "'">>;
format_error({unknown_var, Var, Type}) ->
    <<"Unknown field '", Var/binary, "' of type '", Type/binary, "'">>;
format_error({missing_required_var, Var, Type}) ->
    <<"Missing required field '", Var/binary, "' of type '", Type/binary, "'">>.

io_format_error({form_type_mismatch, Type}) ->
    {<<"FORM_TYPE doesn't match '~s'">>, [Type]};
io_format_error({bad_var_value, Var, Type}) ->
    {<<"Bad value of field '~s' of type '~s'">>, [Var, Type]};
io_format_error({missing_value, Var, Type}) ->
    {<<"Missing value of field '~s' of type '~s'">>, [Var, Type]};
io_format_error({too_many_values, Var, Type}) ->
    {<<"Too many values for field '~s' of type '~s'">>, [Var, Type]};
io_format_error({unknown_var, Var, Type}) ->
    {<<"Unknown field '~s' of type '~s'">>, [Var, Type]};
io_format_error({missing_required_var, Var, Type}) ->
    {<<"Missing required field '~s' of type '~s'">>, [Var, Type]}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
compile_element(#xmlel{name = <<"form_type">>, children = Els} = Form,
		#state{erl = OutErl, erl_dir = ErlDir,
		       hrl = OutHrl, hrl_dir = HrlDir} = State0) ->
    try
	Names = lists:flatmap(
		  fun(#xmlel{name = <<"name">>} = Tag) ->
			  case fxml:get_tag_cdata(Tag) of
			      <<"">> -> [];
			      N -> [binary_to_list(N)]
			  end;
		     (_) -> []
		  end, Els),
	Doc = fxml:get_subtag_cdata(Form, <<"doc">>),
	X = #xmlel{name = <<"x">>,
		   attrs = [{<<"type">>, <<"form">>},
			    {<<"xmlns">>, <<"jabber:x:data">>}],
		   children = Els},
	State = State0#state{xmlns = Names, doc = Doc},
	#xdata{fields = Fs} = xmpp_codec:decode(X),
	put(outbuf, []),
	mk_header(State),
	mk_specs(Fs, State),
	mk_aux_funs(),
	mk_top_decoder(Fs, State),
	mk_top_encoder(Fs, State),
	mk_decoder(Fs, State),
	mk_encoders(Fs, State),
	ErlData = get(outbuf),
	ok = file:write_file(filename:join(ErlDir, OutErl), ErlData),
	ok = erl_tidy:file(filename:join(ErlDir, OutErl),
			   [{backups, false}, {keep_unused, true}]),
	put(outbuf, []),
	mk_type_definitions(Fs, State),
	HrlData = get(outbuf),
	ok = file:write_file(filename:join(HrlDir, OutHrl), HrlData)
    catch _:{badmatch, Err} ->
	    Err
    end.

mk_aux_funs() ->
    case get_abstract_code_from_myself() of
        {ok, AbsCode} ->
            AST = lists:filter(
		    fun(T) ->
			    try erl_syntax_lib:analyze_function(T) of
				{format_error, 1} -> true;
				{io_format_error, 1} -> true;
				FA -> lists:member(FA, codec_funs())
			    catch _:_ ->
				    false
			    end
		    end, AbsCode),
	    emit_raw(erl_prettypr:format(erl_syntax:form_list(AST)) ++ io_lib:nl());
        error ->
            erlang:error({no_abstract_code_found, ?MODULE})
    end.

get_abstract_code_from_myself() ->
    {file, File} = code:is_loaded(?MODULE),
    case beam_lib:chunks(File, [abstract_code]) of
        {ok, {_, List}} ->
            case lists:keyfind(abstract_code, 1, List) of
                {abstract_code, {raw_abstract_v1, Abstr}} ->
                    {ok, Abstr};
                _ ->
                    error
            end;
        _ ->
            error
    end.

mk_comment_header(#state{file_name = Source, xmlns = NS, doc = Doc}) ->
    emit("%% Created automatically by xdata generator (xdata_codec.erl)~n"
	 "%% Source: ~s~n"
	 "%% Form type: ~s~n",
	 [Source, string:join(NS, ", ")]),
    if Doc /= <<>> -> emit("%% Document: ~s~n~n", [Doc]);
       true -> emit("~n")
    end.

mk_header(#state{mod_name = Mod, hrl = Include, xmlns = NS} = State) ->
    mk_comment_header(State),
    emit("~n-module(~s).~n", [Mod]),
    emit("-compile({nowarn_unused_function, ~p}).~n", [codec_funs()]),
    emit("-compile(nowarn_unused_vars).~n"),
    emit("-dialyzer({nowarn_function, dec_int/3}).~n"),
    case NS of
	[_] -> emit("-export([encode/1, encode/2, encode/3]).~n");
	_ -> emit("-export([encode/2, encode/3, encode/4]).~n")
    end,
    emit("-export([decode/1, decode/2, decode/3, format_error/1, io_format_error/1]).~n"),
    emit("-include(\"xmpp_codec.hrl\").~n"),
    emit("-include(\"~s\").~n", [Include]),
    emit("-export_type([property/0, result/0, form/0, error_reason/0]).~n"),
    emit("-define(T(S), <<S>>).~n").

mk_specs(Fs, State) ->
    emit("-spec format_error(error_reason()) -> binary().~n"),
    emit("-spec io_format_error(error_reason()) -> {binary(), [binary()]}.~n"),
    emit("-spec decode([xdata_field()]) -> result().~n"),
    emit("-spec decode([xdata_field()], [binary(), ...]) -> result().~n"),
    emit("-spec decode([xdata_field()], [binary(), ...], [binary()]) -> result().~n"),
    emit("-spec decode([xdata_field()], [binary(), ...], [binary()], result()) -> result().~n"),
    emit("-spec do_decode([xdata_field()], binary(), [binary()], result()) -> result().~n"),
    BinType = case State#state.xmlns of
		  [_] -> "";
		  _ -> ", binary()"
	      end,
    Required = [io_lib:format("'~s'", [var_to_rec_field(Var, State)])
		|| #xdata_field{var = Var} <- Fs],
    emit("-spec encode(form()~s) -> [xdata_field()].~n", [BinType]),
    emit("-spec encode(form()~s, binary()) -> [xdata_field()].~n", [BinType]),
    emit("-spec encode(form()~s, binary(), [~s]) -> [xdata_field()].~n",
	 [BinType, string:join(Required, " | ")]).

mk_type_definitions(Fs, State) ->
    mk_comment_header(State),
    lists:foreach(
      fun(#xdata_field{var = Var} = F) ->
	      Spec = get_typespec(F, State),
	      case is_complex_type(Spec) of
		  true ->
		      emit("-type '~s'() :: ~s.~n",
			   [var_to_rec_field(Var, State), Spec]);
		  false ->
		      ok
	      end
      end, Fs),
    emit("~n-type property() :: "),
    Fields = lists:map(
	       fun(#xdata_field{var = Var} = F) ->
		       RecField = var_to_rec_field(Var, State),
		       [io_lib:format("{'~s', ~s}",
				      [RecField, mk_typespec(F, State)])]
	       end, Fs),
    emit(string:join(Fields, " |~n                    ") ++ ".~n"),
    emit("-type result() :: [property()].~n~n"),
    Options = lists:flatmap(
		fun(#xdata_field{type = T, var = Var} = F) ->
			RecName = var_to_rec_field(Var, State),
			Spec1 = mk_typespec(F, State),
			Spec2 = case default(F, State) of
				    undefined -> Spec1 ++ " | undefined";
				    _ -> Spec1
				end,
			[io_lib:format("{'~s', ~s}", [RecName, Spec2])|
			 if ?is_list_type(T) ->
				 Spec3 = get_typespec(F, State),
				 Spec4 = case is_complex_type(Spec3) of
					     true ->
						 io_lib:format("'~s'()", [RecName]);
					     false ->
						 Spec3
					 end,
				 [io_lib:format(
				    "{'~s', ~s, options(~s)}",
				    [RecName, Spec2, Spec4])];
			    true ->
				 []
			 end]
		end, Fs),
    case lists:any(fun(#xdata_field{type = T}) -> ?is_list_type(T) end, Fs) of
	true -> emit("-type options(T) :: [{binary(), T}].~n");
	false -> ok
    end,
    emit("-type form_property() ::~n      "),
    emit(string:join(Options, " |~n      ") ++ ".~n"),
    emit("-type form() :: [form_property() | xdata_field()].~n~n"),
    emit("-type error_reason() :: {form_type_mismatch, binary()} |~n"
	 "                        {bad_var_value, binary(), binary()} |~n"
	 "                        {missing_required_var, binary(), binary()} |~n"
	 "                        {missing_value, binary(), binary()} |~n"
	 "                        {too_many_values, binary(), binary()} |~n"
	 "                        {unknown_var, binary(), binary()}.~n").

mk_top_decoder(Fs, State) ->
    Required = [Var || #xdata_field{var = Var} <- Fs, is_required(Var, State)],
    NSList = "[" ++ string:join(["<<\"" ++ NS ++ "\">>" || NS <- State#state.xmlns], ", ") ++ "]",
    emit("decode(Fs) -> decode(Fs, ~s, ~p, []).~n",
	 [NSList, Required]),
    emit("decode(Fs, XMLNSList) -> decode(Fs, XMLNSList, ~p, []).~n",
	 [Required]),
    emit("decode(Fs, XMLNSList, Required) -> decode(Fs, XMLNSList, Required, []).~n"),
    emit("decode(Fs, [_|_] = XMLNSList, Required, Acc) ->"
	 "  case lists:keyfind(<<\"FORM_TYPE\">>, #xdata_field.var, Fs) of"
	 "    false ->"
	 "      do_decode(Fs, hd(XMLNSList), Required, Acc);"
	 "    #xdata_field{values = [XMLNS]} ->"
	 "      case lists:member(XMLNS, XMLNSList) of"
	 "          true -> do_decode(Fs, XMLNS, Required, Acc);"
	 "          false -> erlang:error({?MODULE, {form_type_mismatch, XMLNS}})"
	 "    end"
	 "  end.~n").

mk_top_encoder(Fs, State) ->
    Required = "[" ++ string:join(
			[io_lib:format("'~s'", [var_to_rec_field(Var, State)])
			 || #xdata_field{var = Var} <- Fs, is_required(Var, State)],
			", ") ++ "]",
    Clauses = string:join(
		lists:map(
		  fun(#xdata_field{var = Var, type = T}) when ?is_list_type(T) ->
			  Field = var_to_rec_field(Var, State),
			  io_lib:format(
			    "{'~s', Val} ->"
			    "  ['encode_~s'(Val, default, Lang, lists:member('~s', Required))];"
			    "{'~s', Val, Opts} ->"
			    "  ['encode_~s'(Val, Opts, Lang, lists:member('~s', Required))]",
			    [Field, Field, Field, Field, Field, Field]);
		     (#xdata_field{var = Var}) ->
			  Field = var_to_rec_field(Var, State),
			  io_lib:format(
			    "{'~s', Val} -> ['encode_~s'(Val, Lang, lists:member('~s', Required))]",
			    [Field, Field, Field])
		  end, Fs) ++ ["#xdata_field{} -> [Opt]"],
		";"),
    case State#state.xmlns of
	[_] ->
	    emit("encode(Cfg) -> encode(Cfg, <<\"en\">>, ~s).~n", [Required]),
	    emit("encode(Cfg, Lang) -> encode(Cfg, Lang, ~s).~n", [Required]),
	    emit("encode(List, Lang, Required) ->");
	_ ->
	    emit("encode(Cfg, XMLNS) -> encode(Cfg, XMLNS, <<\"en\">>, ~s).~n", [Required]),
	    emit("encode(Cfg, XMLNS, Lang) -> encode(Cfg, XMLNS, Lang, ~s).~n", [Required]),
	    emit("encode(List, XMLNS, Lang, Required) ->")
    end,
    XMLNS = case State#state.xmlns of
		[NS] -> io_lib:format("<<~p>>", [NS]);
		_ -> "XMLNS"
	    end,
    emit("  Fs = [case Opt of ~s end || Opt <- List],"
	 "  FormType = #xdata_field{var = <<\"FORM_TYPE\">>, type = hidden,"
	 "                          values = [~s]},"
	 "  [FormType|lists:flatten(Fs)].~n",
	 [Clauses, XMLNS]).

mk_decoder([#xdata_field{var = Var, type = Type} = F|Fs], State) ->
    ValVar = if ?is_multi_type(Type) -> "Values";
		true -> "[Value]"
	     end,
    DecFun = if ?is_multi_type(Type) ->
		     ["[", mk_decoding_fun(F, State), " || Value <- Values]"];
		true ->
		     mk_decoding_fun(F, State)
	     end,
    DelRequired = io_lib:format("lists:delete(~p, Required)", [Var]),
    if Type == 'jid-multi' ->
	    %% Psi work-around
	    emit("do_decode([#xdata_field{var = ~p, values = [<<>>]} = F|Fs],"
		 "       XMLNS, Required, Acc) ->~n"
		 "    %% Psi work-around~n"
		 "  do_decode([F#xdata_field{var = ~p, values = []}|Fs],"
		 "         XMLNS, Required, Acc);",
		 [Var, Var]);
       true ->
	    ok
    end,
    emit("do_decode([#xdata_field{var = ~p, values = ~s}|Fs], XMLNS, Required, Acc) ->"
	 "  try ~s of"
	 "    Result -> do_decode(Fs, XMLNS, ~s, [{'~s', Result}|Acc])"
	 "  catch _:_ ->"
	 "    erlang:error({?MODULE, {bad_var_value, ~p, XMLNS}})"
	 "  end;",
	 [Var, ValVar, DecFun, DelRequired,
	  var_to_rec_field(Var, State), Var]),
    if not ?is_multi_type(Type) ->
	    emit("do_decode([#xdata_field{var = ~p, values = []} = F|Fs],"
		 "       XMLNS, Required, Acc) ->"
		 "  do_decode([F#xdata_field{var = ~p, values = [<<>>]}|Fs],"
		 "         XMLNS, Required, Acc);",
		 [Var, Var]),
	    emit("do_decode([#xdata_field{var = ~p}|_], XMLNS, _, _) ->"
		 "  erlang:error({?MODULE, {too_many_values, ~p, XMLNS}});",
		 [Var, Var]);
       true ->
	    ok
    end,
    mk_decoder(Fs, State);
mk_decoder([], State) ->
    if State#state.ignore_unknown ->
	    emit("do_decode([_|Fs], XMLNS, Required, Acc) ->"
		 "  do_decode(Fs, XMLNS, Required, Acc);");
       true ->
	    emit("do_decode([#xdata_field{var = Var}|Fs], XMLNS, Required, Acc) ->"
		 "  if Var /= <<\"FORM_TYPE\">> ->"
		 "    erlang:error({?MODULE, {unknown_var, Var, XMLNS}});"
		 "  true ->"
		 "    do_decode(Fs, XMLNS, Required, Acc)"
		 "  end;")
    end,
    emit("do_decode([], XMLNS, [Var|_], _) ->"
	 "  erlang:error({?MODULE, {missing_required_var, Var, XMLNS}});~n"),
    emit("do_decode([], _, [], Acc) -> Acc.~n").

mk_encoders(Fs, State) ->
    lists:foreach(
      fun(#xdata_field{var = Var, desc = Desc,
		       label = Label, type = Type} = F) ->
	      Spec0 = mk_typespec(F, State),
	      Spec1 = case default(F, State) of
			  undefined -> Spec0 ++ " | undefined";
			  _ -> Spec0
		      end,
	      EncVals = mk_encoded_values(F, State),
	      EncOpts = mk_encoded_options(F, State),
	      FieldName = var_to_rec_field(Var, State),
	      DescStr = if Desc == <<>> -> "<<>>";
			   true -> io_lib:format("xmpp_tr:tr(Lang, ?T(\"~s\"))", [Desc])
			end,
	      LabelStr = if Label == <<>> -> "<<>>";
			    true -> io_lib:format("xmpp_tr:tr(Lang, ?T(\"~s\"))", [Label])
			 end,
	      if ?is_list_type(Type) ->
		      Spec2 = get_typespec(F, State),
		      Spec3 = case is_complex_type(Spec2) of
				  true -> io_lib:format("'~s'()", [FieldName]);
				  false -> Spec2
			      end,
		      emit("-spec 'encode_~s'(~s, default | options(~s), binary(), boolean()) -> xdata_field().~n"
			   "'encode_~s'(Value, Options, Lang, IsRequired) ->",
			   [FieldName, Spec1, Spec3, FieldName]);
		 true ->
		      emit("-spec 'encode_~s'(~s, binary(), boolean()) -> xdata_field().~n"
			   "'encode_~s'(Value, Lang, IsRequired) ->",
			   [FieldName, Spec1, FieldName])
	      end,
	      emit("  Values = ~s,"
		   "  Opts = ~s,"
		   "  #xdata_field{var = ~p,"
		   "               values = Values,"
		   "               required = IsRequired,"
		   "               type = ~p,"
		   "               options = Opts,"
		   "               desc = ~s,"
		   "               label = ~s}.~n",
		   [EncVals, EncOpts, Var, Type, DescStr, LabelStr])
      end, Fs).

mk_encoded_values(#xdata_field{var = Var, type = Type,
			       options = Options} = F, State) ->
    EncFun =
	case get_enc_fun(Var, Type, Options, State) of
	    {M, Fun, Args} ->
		Mod = if M == undefined -> "";
			 true -> io_lib:format("~s:", [M])
		      end,
		FArgs = [io_lib:format(", ~p", [A]) || A <- Args],
		if ?is_multi_type(Type) ->
			"[" ++ io_lib:format("~s~s(V~s)", [Mod, Fun, FArgs]) ++
			    " || V <- Value]";
		   true ->
			"[" ++ io_lib:format("~s~s(Value~s)", [Mod, Fun, FArgs])
			    ++ "]"
		end;
	    undefined when ?is_multi_type(Type) ->
		"Value";
	    undefined ->
		"[Value]"
	end,
    io_lib:format(
      "case Value of"
      "  ~p -> [];~n"
      "  Value -> ~s~n"
      "end",
      [default(F, State), EncFun]).

mk_encoded_options(#xdata_field{var = Var, type = Type,
				options = Options}, State) ->
    EncFun = case get_enc_fun(Var, Type, Options, State) of
		 {M, Fun, Args} ->
		     Mod = if M == undefined -> "";
			      true -> io_lib:format("~s:", [M])
			   end,
		     FArgs = [io_lib:format(", ~p", [A]) || A <- Args],
		     io_lib:format("~s~s(V~s)", [Mod, Fun, FArgs]);
		 undefined ->
		     "V"
	     end,
    EncOpts = string:join(
		[case L of
		     <<>> ->
			 io_lib:format("#xdata_option{value = ~p}", [V]);
		     _ ->
			 io_lib:format(
			   "#xdata_option{label = xmpp_tr:tr(Lang, ?T(\"~s\")), value = ~p}",
			   [L, V])
		 end || #xdata_option{label = L, value = V} <- Options],
		","),
    if ?is_list_type(Type) ->
	    io_lib:format(
	      "if Options == default ->"
	      "   [~s];"
	      "true ->"
	      "   [#xdata_option{label = xmpp_tr:tr(Lang, L), value = ~s}"
	      "    || {L, V} <- Options]"
	      "end",
	      [EncOpts, EncFun]);
       true ->
	    "[]"
    end.

mk_decoding_fun(#xdata_field{var = Var, type = Type,
			     options = Options}, State) ->
    case get_dec_fun(Var, Type, Options, State) of
	{M, Fun, Args} ->
	    Mod = if M == undefined -> "";
		     true -> io_lib:format("~s:", [M])
		  end,
	    FArgs = [io_lib:format(", ~p", [A]) || A <- Args],
	    io_lib:format("~s~s(Value~s)", [Mod, Fun, FArgs]);
	undefined ->
	    "Value"
    end.

var_to_rec_field(Var, #state{prefix = [Prefix|T]} = State) ->
    Size = size(Prefix),
    case Var of
	<<(Prefix):Size/binary, Rest/binary>> ->
	    binary_to_atom(Rest, utf8);
	_ ->
	    var_to_rec_field(Var, State#state{prefix = T})
    end;
var_to_rec_field(Var, #state{prefix = []}) ->
    Var.

get_dec_fun(Var, Type, Options, State) ->
    case lists:keyfind(Var, 1, State#state.dec_mfas) of
	false when Type == 'list-multi'; Type == 'list-single' ->
	    if Options /= [] ->
		    Variants = [binary_to_atom(V, utf8)
				|| #xdata_option{value = V} <- Options],
		    {undefined, dec_enum, [Variants]};
	       true ->
		    undefined
	    end;
	false when Type == 'jid-multi'; Type == 'jid-single' ->
	    {jid, decode, []};
	false when Type == boolean ->
	    {undefined, dec_bool, []};
	false ->
	    undefined;
	{Var, {M, F, A}} ->
	    {M, F, A};
	{Var, {dec_bool, []}} ->
	    {undefined, dec_bool, []};
	{Var, {dec_ip, []}} ->
	    {undefined, dec_ip, []};
	{Var, {not_empty, []}} ->
	    {undefined, not_empty, []};
	{Var, {dec_enum, [Variants]}} ->
	    {undefined, dec_enum, [Variants]};
	{Var, {dec_int, Args}} ->
	    {undefined, dec_int, Args};
	{Var, {dec_enum_int, Args}} ->
	    {undefined, dec_enum_int, Args}
    end.

get_enc_fun(Var, Type, Options, State) ->
    case get_dec_fun(Var, Type, Options, State) of
	{undefined, dec_enum, _} ->
	    {undefined, enc_enum, []};
	{undefined, dec_bool, _} ->
	    {undefined, enc_bool, []};
	{undefined, dec_int, _} ->
	    {undefined, enc_int, []};
	{undefined, dec_enum_int, _} ->
	    {undefined, enc_enum_int, []};
	{undefined, dec_ip, _} ->
	    {undefined, enc_ip, []};
	{jid, decode, []} ->
	    {jid, encode, []};
	_ ->
	    case lists:keyfind(Var, 1, State#state.enc_mfas) of
		false ->
		    undefined;
		{Var, {jid, decode, []}} ->
		    {jid, encode, []};
		{Var, {M, F, A}} ->
		    {M, F, A};
		{Var, {enc_bool, []}} ->
		    {undefined, enc_bool, []};
		{Var, {dec_enum, _}} ->
		    {undefined, enc_enum, []};
		{Var, {enc_int, _}} ->
		    {undefined, enc_int, []};
		{Var, {dec_enum_int, _}} ->
		    {undefined, enc_enum_int, []};
		{Var, {dec_ip, _}} ->
		    {undefined, enc_ip, []}
	    end
    end.

mk_typespec(#xdata_field{type = Type, var = Var} = Field, State) ->
    Spec0 = get_typespec(Field, State),
    Spec1 = case is_complex_type(Spec0) of
		true ->
		    io_lib:format("'~s'()", [var_to_rec_field(Var, State)]);
		false ->
		    Spec0
	    end,
    if ?is_multi_type(Type) -> "[" ++ Spec1 ++ "]";
       true -> Spec1
    end.

get_typespec(#xdata_field{var = Var, type = Type, options = Options}, State) ->
    case lists:keyfind(Var, 1, State#state.specs) of
	false ->
	    case get_dec_fun(Var, Type, Options, State) of
		{undefined, dec_enum, Args} ->
		    enum_spec(Args);
		{undefined, dec_bool, _} ->
		    "boolean()";
		{undefined, dec_ip, _} ->
		    "inet:ip_address()";
		{jid, decode, _} ->
		    "jid:jid()";
		{undefined, dec_int, Args} ->
		    int_spec(Args);
		{undefined, dec_enum_int, [Variants|T]} ->
		    enum_spec([Variants]) ++ " | " ++ int_spec(T);
		_ ->
		    "binary()"
	    end;
	{Var, Spec} ->
	    Spec
    end.

-spec is_complex_type(string()) -> boolean().
is_complex_type(Spec) ->
    string:chr(Spec, $|) /= 0.

int_spec([]) ->
    "integer()";
int_spec([From, To]) ->
    if From /= infinity, To /= infinity ->
	    io_lib:format("~p..~p", [From, To]);
       From > 0 ->
	    "pos_integer()";
       From == 0 ->
	    "non_neg_integer()";
       true ->
	    "integer()"
    end.

enum_spec([Variants]) ->
    string:join([atom_to_list(V) || V <- Variants], " | ").

is_required(Var, State) ->
    lists:member(Var, State#state.required) orelse
	proplists:get_bool(Var, State#state.required).

normalize(#xmlel{name = Name, attrs = Attrs, children = Els}) ->
    #xmlel{name = Name,
	   attrs = [normalize(Attr) || Attr <- Attrs],
	   children = [normalize(El) || El <- Els]};
normalize({Key, Data}) ->
    {Key, normalize(Data)};
normalize(Txt) when is_binary(Txt) ->
    case re:split(Txt, "[\\s\\r\\n\\t]+", [trim, {return, list}]) of
	[""|T] ->
	    list_to_binary(string:join(T, " "));
	T ->
	    list_to_binary(string:join(T, " "))
    end.

default(#xdata_field{type = Type}, _) when ?is_multi_type(Type) ->
    [];
default(#xdata_field{var = Var, type = Type,
		     options = Options}, State) ->
    case get_dec_fun(Var, Type, Options, State) of
	undefined -> <<>>;
	_MFA -> undefined
    end.

codec_funs() ->
    [{dec_int, 3},
     {dec_int, 1},
     {dec_enum, 2},
     {dec_enum_int, 2},
     {dec_enum_int, 4},
     {enc_int, 1},
     {enc_enum, 1},
     {enc_enum_int, 1},
     {not_empty, 1},
     {dec_bool, 1},
     {enc_bool, 1},
     {dec_ip, 1},
     {enc_ip, 1}].
