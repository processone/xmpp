%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_roominfo.xdata
%% Form type: http://jabber.org/protocol/muc#roominfo
%% Document: XEP-0045

-module(muc_roominfo).

-compile({nowarn_unused_function,
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
           {enc_ip, 1}]}).

-compile(nowarn_unused_vars).

-dialyzer({nowarn_function, {dec_int, 3}}).

-export([encode/1, encode/2, encode/3]).

-export([decode/1,
         decode/2,
         decode/3,
         format_error/1,
         io_format_error/1]).

-include("xmpp_codec.hrl").

-include("muc_roominfo.hrl").

-export_type([property/0,
              result/0,
              form/0,
              error_reason/0]).

-define(T(S), <<S>>).

-spec format_error(error_reason()) -> binary().

-spec io_format_error(error_reason()) -> {binary(),
                                          [binary()]}.

-spec decode([xdata_field()]) -> result().

-spec decode([xdata_field()],
             [binary(), ...]) -> result().

-spec decode([xdata_field()], [binary(), ...],
             [binary()]) -> result().

-spec decode([xdata_field()], [binary(), ...],
             [binary()], result()) -> result().

-spec do_decode([xdata_field()], binary(), [binary()],
                result()) -> result().

-spec encode(form()) -> [xdata_field()].

-spec encode(form(), binary()) -> [xdata_field()].

-spec encode(form(), binary(),
             [maxhistoryfetch |
              allowinvites |
              allow_query_users |
              allowpm |
              contactjid |
              description |
              lang |
              ldapgroup |
              logs |
              roomname |
              occupants |
              subject |
              subjectmod |
              pubsub |
              changesubject |
              avatarhash]) -> [xdata_field()].

dec_int(Val) -> dec_int(Val, infinity, infinity).

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

dec_enum_int(Val, Enums) ->
    try dec_int(Val) catch _:_ -> dec_enum(Val, Enums) end.

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

not_empty(<<_, _/binary>> = Val) -> Val.

dec_ip(Val) ->
    {ok, Addr} = inet_parse:address(binary_to_list(Val)),
    Addr.

enc_ip({0, 0, 0, 0, 0, 65535, A, B}) ->
    enc_ip({(A bsr 8) band 255,
            A band 255,
            (B bsr 8) band 255,
            B band 255});
enc_ip(Addr) -> list_to_binary(inet_parse:ntoa(Addr)).

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

decode(Fs) ->
    decode(Fs,
           [<<"http://jabber.org/protocol/muc#roominfo">>],
           [],
           []).

decode(Fs, XMLNSList) -> decode(Fs, XMLNSList, [], []).

decode(Fs, XMLNSList, Required) ->
    decode(Fs, XMLNSList, Required, []).

decode(Fs, [_ | _] = XMLNSList, Required, Acc) ->
    case lists:keyfind(<<"FORM_TYPE">>,
                       #xdata_field.var,
                       Fs)
        of
        false -> do_decode(Fs, hd(XMLNSList), Required, Acc);
        #xdata_field{values = [XMLNS]} ->
            case lists:member(XMLNS, XMLNSList) of
                true -> do_decode(Fs, XMLNS, Required, Acc);
                false ->
                    erlang:error({?MODULE, {form_type_mismatch, XMLNS}})
            end
    end.

encode(Cfg) -> encode(Cfg, <<"en">>, []).

encode(Cfg, Lang) -> encode(Cfg, Lang, []).

encode(List, Lang, Required) ->
    Fs = [case Opt of
              {maxhistoryfetch, Val} ->
                  [encode_maxhistoryfetch(Val,
                                          Lang,
                                          lists:member(maxhistoryfetch,
                                                       Required))];
              {allowinvites, Val} ->
                  [encode_allowinvites(Val,
                                       Lang,
                                       lists:member(allowinvites, Required))];
              {allow_query_users, Val} ->
                  [encode_allow_query_users(Val,
                                            Lang,
                                            lists:member(allow_query_users,
                                                         Required))];
              {allowpm, Val} ->
                  [encode_allowpm(Val,
                                  default,
                                  Lang,
                                  lists:member(allowpm, Required))];
              {allowpm, Val, Opts} ->
                  [encode_allowpm(Val,
                                  Opts,
                                  Lang,
                                  lists:member(allowpm, Required))];
              {contactjid, Val} ->
                  [encode_contactjid(Val,
                                     Lang,
                                     lists:member(contactjid, Required))];
              {description, Val} ->
                  [encode_description(Val,
                                      Lang,
                                      lists:member(description, Required))];
              {lang, Val} ->
                  [encode_lang(Val, Lang, lists:member(lang, Required))];
              {ldapgroup, Val} ->
                  [encode_ldapgroup(Val,
                                    Lang,
                                    lists:member(ldapgroup, Required))];
              {logs, Val} ->
                  [encode_logs(Val, Lang, lists:member(logs, Required))];
              {roomname, Val} ->
                  [encode_roomname(Val,
                                   Lang,
                                   lists:member(roomname, Required))];
              {occupants, Val} ->
                  [encode_occupants(Val,
                                    Lang,
                                    lists:member(occupants, Required))];
              {subject, Val} ->
                  [encode_subject(Val,
                                  Lang,
                                  lists:member(subject, Required))];
              {subjectmod, Val} ->
                  [encode_subjectmod(Val,
                                     Lang,
                                     lists:member(subjectmod, Required))];
              {pubsub, Val} ->
                  [encode_pubsub(Val,
                                 Lang,
                                 lists:member(pubsub, Required))];
              {changesubject, Val} ->
                  [encode_changesubject(Val,
                                        Lang,
                                        lists:member(changesubject, Required))];
              {avatarhash, Val} ->
                  [encode_avatarhash(Val,
                                     Lang,
                                     lists:member(avatarhash, Required))];
              #xdata_field{} -> [Opt]
          end
          || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
                            type = hidden,
                            values =
                                [<<"http://jabber.org/protocol/muc#roominfo">>]},
    [FormType | lists:flatten(Fs)].

do_decode([#xdata_field{var = <<"muc#maxhistoryfetch">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_int(Value, 0, infinity) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#maxhistoryfetch">>, Required),
                      [{maxhistoryfetch, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#maxhistoryfetch">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#maxhistoryfetch">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#maxhistoryfetch">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"muc#maxhistoryfetch">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#maxhistoryfetch">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_allowinvites">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_allowinvites">>,
                                   Required),
                      [{allowinvites, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_allowinvites">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_allowinvites">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_allowinvites">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_allowinvites">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_allowinvites">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_allow_query_users">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_allow_query_users">>,
                                   Required),
                      [{allow_query_users, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_allow_query_users">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_allow_query_users">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_allow_query_users">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_allow_query_users">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_allow_query_users">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_allowpm">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value,
                 [anyone, participants, moderators, none])
    of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_allowpm">>, Required),
                      [{allowpm, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roomconfig_allowpm">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_allowpm">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_allowpm">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_allowpm">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_allowpm">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roominfo_contactjid">>,
                        values = [<<>>]} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    %% Psi work-around
    do_decode([F#xdata_field{var =
                                 <<"muc#roominfo_contactjid">>,
                             values = []}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roominfo_contactjid">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [jid:decode(Value) || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_contactjid">>, Required),
                      [{contactjid, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roominfo_contactjid">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roominfo_description">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_description">>, Required),
                      [{description, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roominfo_description">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roominfo_description">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roominfo_description">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roominfo_description">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roominfo_description">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"muc#roominfo_lang">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try xmpp_lang:check(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_lang">>, Required),
                      [{lang, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roominfo_lang">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#roominfo_lang">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"muc#roominfo_lang">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"muc#roominfo_lang">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#roominfo_lang">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roominfo_ldapgroup">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_ldapgroup">>, Required),
                      [{ldapgroup, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roominfo_ldapgroup">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roominfo_ldapgroup">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roominfo_ldapgroup">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roominfo_ldapgroup">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roominfo_ldapgroup">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"muc#roominfo_logs">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_logs">>, Required),
                      [{logs, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roominfo_logs">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#roominfo_logs">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"muc#roominfo_logs">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"muc#roominfo_logs">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#roominfo_logs">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomname">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_roomname">>, Required),
                      [{roomname, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_roomname">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomname">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_roomname">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomname">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_roomname">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roominfo_occupants">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_int(Value, 0, infinity) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_occupants">>, Required),
                      [{occupants, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roominfo_occupants">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roominfo_occupants">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roominfo_occupants">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roominfo_occupants">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roominfo_occupants">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roominfo_subject">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_subject">>, Required),
                      [{subject, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roominfo_subject">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roominfo_subject">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roominfo_subject">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roominfo_subject">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#roominfo_subject">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roominfo_subjectmod">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_subjectmod">>, Required),
                      [{subjectmod, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roominfo_subjectmod">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roominfo_subjectmod">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roominfo_subjectmod">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roominfo_subjectmod">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roominfo_subjectmod">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"muc#roominfo_pubsub">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try xmpp_uri:check(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_pubsub">>, Required),
                      [{pubsub, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roominfo_pubsub">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#roominfo_pubsub">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roominfo_pubsub">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"muc#roominfo_pubsub">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#roominfo_pubsub">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_changesubject">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_changesubject">>,
                                   Required),
                      [{changesubject, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_changesubject">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_changesubject">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_changesubject">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_changesubject">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_changesubject">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roominfo_avatarhash">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [Value || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roominfo_avatarhash">>, Required),
                      [{avatarhash, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roominfo_avatarhash">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var = Var} | Fs], XMLNS,
          Required, Acc) ->
    if Var /= <<"FORM_TYPE">> ->
           erlang:error({?MODULE, {unknown_var, Var, XMLNS}});
       true -> do_decode(Fs, XMLNS, Required, Acc)
    end;
do_decode([], XMLNS, [Var | _], _) ->
    erlang:error({?MODULE,
                  {missing_required_var, Var, XMLNS}});
do_decode([], _, [], Acc) -> Acc.

-spec encode_maxhistoryfetch(non_neg_integer() |
                             undefined,
                             binary(), boolean()) -> xdata_field().

encode_maxhistoryfetch(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_int(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#maxhistoryfetch">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Maximum Number of History Messages Returned "
                                   "by Room"))}.

-spec encode_allowinvites(boolean() | undefined,
                          binary(), boolean()) -> xdata_field().

encode_allowinvites(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_allowinvites">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Occupants are allowed to invite others"))}.

-spec encode_allow_query_users(boolean() | undefined,
                               binary(), boolean()) -> xdata_field().

encode_allow_query_users(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var =
                     <<"muc#roomconfig_allow_query_users">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Occupants are allowed to query others"))}.

-spec encode_allowpm(allowpm() | undefined,
                     default | options(allowpm()), binary(),
                     boolean()) -> xdata_field().

encode_allowpm(Value, Options, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, ?T("Anyone")),
                                 value = <<"anyone">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang, ?T("Anyone with Voice")),
                                 value = <<"participants">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang, ?T("Moderators Only")),
                                 value = <<"moderators">>},
                   #xdata_option{label = xmpp_tr:tr(Lang, ?T("Nobody")),
                                 value = <<"none">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"muc#roomconfig_allowpm">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Roles that May Send Private Messages"))}.

-spec encode_contactjid([jid:jid()], binary(),
                        boolean()) -> xdata_field().

encode_contactjid(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [jid:encode(V) || V <- Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_contactjid">>,
                 values = Values, required = IsRequired,
                 type = 'jid-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Contact Addresses (normally, room owner "
                                   "or owners)"))}.

-spec encode_description(binary(), binary(),
                         boolean()) -> xdata_field().

encode_description(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_description">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Room description"))}.

-spec encode_lang(binary() | undefined, binary(),
                  boolean()) -> xdata_field().

encode_lang(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_lang">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Natural Language for Room Discussions"))}.

-spec encode_ldapgroup(binary(), binary(),
                       boolean()) -> xdata_field().

encode_ldapgroup(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_ldapgroup">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("An associated LDAP group that defines "
                                   "room membership; this should be an LDAP "
                                   "Distinguished Name according to an implementa"
                                   "tion-specific or deployment-specific "
                                   "definition of a group."))}.

-spec encode_logs(binary(), binary(),
                  boolean()) -> xdata_field().

encode_logs(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_logs">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("URL for Archived Discussion Logs"))}.

-spec encode_roomname(binary(), binary(),
                      boolean()) -> xdata_field().

encode_roomname(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomname">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Natural-Language Room Name"))}.

-spec encode_occupants(non_neg_integer() | undefined,
                       binary(), boolean()) -> xdata_field().

encode_occupants(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_int(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_occupants">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Number of occupants"))}.

-spec encode_subject(binary(), binary(),
                     boolean()) -> xdata_field().

encode_subject(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_subject">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Current Discussion Topic"))}.

-spec encode_subjectmod(boolean() | undefined, binary(),
                        boolean()) -> xdata_field().

encode_subjectmod(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_subjectmod">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("The room subject can be modified by "
                                   "participants"))}.

-spec encode_pubsub(binary() | undefined, binary(),
                    boolean()) -> xdata_field().

encode_pubsub(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_pubsub">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("XMPP URI of Associated Publish-Subscribe "
                                   "Node"))}.

-spec encode_changesubject(boolean() | undefined,
                           binary(), boolean()) -> xdata_field().

encode_changesubject(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_changesubject">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Occupants May Change the Subject"))}.

-spec encode_avatarhash([binary()], binary(),
                        boolean()) -> xdata_field().

encode_avatarhash(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> Value
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roominfo_avatarhash">>,
                 values = Values, required = IsRequired,
                 type = 'text-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Hash of the vCard-temp avatar of this "
                                   "room"))}.
