%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_roomconfig.xdata
%% Form type: http://jabber.org/protocol/muc#roomconfig
%% Document: XEP-0045

-module(muc_roomconfig).

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

-include("muc_roomconfig.hrl").

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
              allowpm |
              allow_private_messages |
              allow_private_messages_from_visitors |
              allow_visitor_status |
              allow_visitor_nickchange |
              allow_voice_requests |
              allow_subscription |
              voice_request_min_interval |
              captcha_protected |
              captcha_whitelist |
              allow_query_users |
              allowinvites |
              changesubject |
              enablelogging |
              getmemberlist |
              lang |
              pubsub |
              maxusers |
              membersonly |
              moderatedroom |
              members_by_default |
              passwordprotectedroom |
              persistentroom |
              presencebroadcast |
              publicroom |
              public_list |
              roomadmins |
              roomdesc |
              roomname |
              roomowners |
              roomsecret |
              whois |
              mam |
              enable_hats]) -> [xdata_field()].

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
           [<<"http://jabber.org/protocol/muc#roomconfig">>],
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
              {allow_private_messages, Val} ->
                  [encode_allow_private_messages(Val,
                                                 Lang,
                                                 lists:member(allow_private_messages,
                                                              Required))];
              {allow_private_messages_from_visitors, Val} ->
                  [encode_allow_private_messages_from_visitors(Val,
                                                               default,
                                                               Lang,
                                                               lists:member(allow_private_messages_from_visitors,
                                                                            Required))];
              {allow_private_messages_from_visitors, Val, Opts} ->
                  [encode_allow_private_messages_from_visitors(Val,
                                                               Opts,
                                                               Lang,
                                                               lists:member(allow_private_messages_from_visitors,
                                                                            Required))];
              {allow_visitor_status, Val} ->
                  [encode_allow_visitor_status(Val,
                                               Lang,
                                               lists:member(allow_visitor_status,
                                                            Required))];
              {allow_visitor_nickchange, Val} ->
                  [encode_allow_visitor_nickchange(Val,
                                                   Lang,
                                                   lists:member(allow_visitor_nickchange,
                                                                Required))];
              {allow_voice_requests, Val} ->
                  [encode_allow_voice_requests(Val,
                                               Lang,
                                               lists:member(allow_voice_requests,
                                                            Required))];
              {allow_subscription, Val} ->
                  [encode_allow_subscription(Val,
                                             Lang,
                                             lists:member(allow_subscription,
                                                          Required))];
              {voice_request_min_interval, Val} ->
                  [encode_voice_request_min_interval(Val,
                                                     Lang,
                                                     lists:member(voice_request_min_interval,
                                                                  Required))];
              {captcha_protected, Val} ->
                  [encode_captcha_protected(Val,
                                            Lang,
                                            lists:member(captcha_protected,
                                                         Required))];
              {captcha_whitelist, Val} ->
                  [encode_captcha_whitelist(Val,
                                            Lang,
                                            lists:member(captcha_whitelist,
                                                         Required))];
              {allow_query_users, Val} ->
                  [encode_allow_query_users(Val,
                                            Lang,
                                            lists:member(allow_query_users,
                                                         Required))];
              {allowinvites, Val} ->
                  [encode_allowinvites(Val,
                                       Lang,
                                       lists:member(allowinvites, Required))];
              {changesubject, Val} ->
                  [encode_changesubject(Val,
                                        Lang,
                                        lists:member(changesubject, Required))];
              {enablelogging, Val} ->
                  [encode_enablelogging(Val,
                                        Lang,
                                        lists:member(enablelogging, Required))];
              {getmemberlist, Val} ->
                  [encode_getmemberlist(Val,
                                        default,
                                        Lang,
                                        lists:member(getmemberlist, Required))];
              {getmemberlist, Val, Opts} ->
                  [encode_getmemberlist(Val,
                                        Opts,
                                        Lang,
                                        lists:member(getmemberlist, Required))];
              {lang, Val} ->
                  [encode_lang(Val, Lang, lists:member(lang, Required))];
              {pubsub, Val} ->
                  [encode_pubsub(Val,
                                 Lang,
                                 lists:member(pubsub, Required))];
              {maxusers, Val} ->
                  [encode_maxusers(Val,
                                   default,
                                   Lang,
                                   lists:member(maxusers, Required))];
              {maxusers, Val, Opts} ->
                  [encode_maxusers(Val,
                                   Opts,
                                   Lang,
                                   lists:member(maxusers, Required))];
              {membersonly, Val} ->
                  [encode_membersonly(Val,
                                      Lang,
                                      lists:member(membersonly, Required))];
              {moderatedroom, Val} ->
                  [encode_moderatedroom(Val,
                                        Lang,
                                        lists:member(moderatedroom, Required))];
              {members_by_default, Val} ->
                  [encode_members_by_default(Val,
                                             Lang,
                                             lists:member(members_by_default,
                                                          Required))];
              {passwordprotectedroom, Val} ->
                  [encode_passwordprotectedroom(Val,
                                                Lang,
                                                lists:member(passwordprotectedroom,
                                                             Required))];
              {persistentroom, Val} ->
                  [encode_persistentroom(Val,
                                         Lang,
                                         lists:member(persistentroom,
                                                      Required))];
              {presencebroadcast, Val} ->
                  [encode_presencebroadcast(Val,
                                            default,
                                            Lang,
                                            lists:member(presencebroadcast,
                                                         Required))];
              {presencebroadcast, Val, Opts} ->
                  [encode_presencebroadcast(Val,
                                            Opts,
                                            Lang,
                                            lists:member(presencebroadcast,
                                                         Required))];
              {publicroom, Val} ->
                  [encode_publicroom(Val,
                                     Lang,
                                     lists:member(publicroom, Required))];
              {public_list, Val} ->
                  [encode_public_list(Val,
                                      Lang,
                                      lists:member(public_list, Required))];
              {roomadmins, Val} ->
                  [encode_roomadmins(Val,
                                     Lang,
                                     lists:member(roomadmins, Required))];
              {roomdesc, Val} ->
                  [encode_roomdesc(Val,
                                   Lang,
                                   lists:member(roomdesc, Required))];
              {roomname, Val} ->
                  [encode_roomname(Val,
                                   Lang,
                                   lists:member(roomname, Required))];
              {roomowners, Val} ->
                  [encode_roomowners(Val,
                                     Lang,
                                     lists:member(roomowners, Required))];
              {roomsecret, Val} ->
                  [encode_roomsecret(Val,
                                     Lang,
                                     lists:member(roomsecret, Required))];
              {whois, Val} ->
                  [encode_whois(Val,
                                default,
                                Lang,
                                lists:member(whois, Required))];
              {whois, Val, Opts} ->
                  [encode_whois(Val,
                                Opts,
                                Lang,
                                lists:member(whois, Required))];
              {mam, Val} ->
                  [encode_mam(Val, Lang, lists:member(mam, Required))];
              {enable_hats, Val} ->
                  [encode_enable_hats(Val,
                                      Lang,
                                      lists:member(enable_hats, Required))];
              #xdata_field{} -> [Opt]
          end
          || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
                            type = hidden,
                            values =
                                [<<"http://jabber.org/protocol/muc#roomconfig">>]},
    [FormType | lists:flatten(Fs)].

do_decode([#xdata_field{var = <<"muc#maxhistoryfetch">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
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
                            <<"allow_private_messages">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"allow_private_messages">>, Required),
                      [{allow_private_messages, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"allow_private_messages">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"allow_private_messages">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"allow_private_messages">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"allow_private_messages">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"allow_private_messages">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"allow_private_messages_from_visitors">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, [nobody, moderators, anyone]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"allow_private_messages_from_visitors">>,
                                   Required),
                      [{allow_private_messages_from_visitors, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"allow_private_messages_from_visitors">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"allow_private_messages_from_visitors">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"allow_private_messages_from_visitors">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"allow_private_messages_from_visitors">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"allow_private_messages_from_visitors">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"allow_visitor_status">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"allow_visitor_status">>, Required),
                      [{allow_visitor_status, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"allow_visitor_status">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"allow_visitor_status">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"allow_visitor_status">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"allow_visitor_status">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"allow_visitor_status">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"allow_visitor_nickchange">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"allow_visitor_nickchange">>, Required),
                      [{allow_visitor_nickchange, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"allow_visitor_nickchange">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"allow_visitor_nickchange">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"allow_visitor_nickchange">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"allow_visitor_nickchange">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"allow_visitor_nickchange">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"allow_voice_requests">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"allow_voice_requests">>, Required),
                      [{allow_voice_requests, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"allow_voice_requests">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"allow_voice_requests">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"allow_voice_requests">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"allow_voice_requests">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"allow_voice_requests">>, XMLNS}});
do_decode([#xdata_field{var = <<"allow_subscription">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"allow_subscription">>, Required),
                      [{allow_subscription, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"allow_subscription">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"allow_subscription">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"allow_subscription">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"allow_subscription">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"allow_subscription">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"voice_request_min_interval">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_int(Value, 0, infinity) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"voice_request_min_interval">>,
                                   Required),
                      [{voice_request_min_interval, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"voice_request_min_interval">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"voice_request_min_interval">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"voice_request_min_interval">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"voice_request_min_interval">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"voice_request_min_interval">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"captcha_protected">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"captcha_protected">>, Required),
                      [{captcha_protected, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"captcha_protected">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"captcha_protected">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"captcha_protected">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"captcha_protected">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"captcha_protected">>, XMLNS}});
do_decode([#xdata_field{var = <<"captcha_whitelist">>,
                        values = [<<>>]} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    %% Psi work-around
    do_decode([F#xdata_field{var = <<"captcha_whitelist">>,
                             values = []}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"captcha_whitelist">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [jid:decode(Value) || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"captcha_whitelist">>, Required),
                      [{captcha_whitelist, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"captcha_whitelist">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"allow_query_users">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"allow_query_users">>, Required),
                      [{allow_query_users, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"allow_query_users">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"allow_query_users">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"allow_query_users">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"allow_query_users">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"allow_query_users">>, XMLNS}});
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
                            <<"muc#roomconfig_enablelogging">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_enablelogging">>,
                                   Required),
                      [{enablelogging, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_enablelogging">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_enablelogging">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_enablelogging">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_enablelogging">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_enablelogging">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_getmemberlist">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [Value || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_getmemberlist">>,
                                   Required),
                      [{getmemberlist, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_getmemberlist">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#roomconfig_lang">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try xmpp_lang:check(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_lang">>, Required),
                      [{lang, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roomconfig_lang">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"muc#roomconfig_lang">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_lang">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"muc#roomconfig_lang">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#roomconfig_lang">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_pubsub">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try xmpp_uri:check(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_pubsub">>, Required),
                      [{pubsub, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roomconfig_pubsub">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_pubsub">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_pubsub">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_pubsub">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#roomconfig_pubsub">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_maxusers">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum_int(Value, [none], 0, infinity) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_maxusers">>, Required),
                      [{maxusers, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_maxusers">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_maxusers">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_maxusers">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_maxusers">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_maxusers">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_membersonly">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_membersonly">>,
                                   Required),
                      [{membersonly, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_membersonly">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_membersonly">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_membersonly">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_membersonly">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_membersonly">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_moderatedroom">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_moderatedroom">>,
                                   Required),
                      [{moderatedroom, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_moderatedroom">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_moderatedroom">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_moderatedroom">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_moderatedroom">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_moderatedroom">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"members_by_default">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"members_by_default">>, Required),
                      [{members_by_default, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"members_by_default">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"members_by_default">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"members_by_default">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"members_by_default">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"members_by_default">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_passwordprotectedroom">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_passwordprotectedroom">>,
                                   Required),
                      [{passwordprotectedroom, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_passwordprotectedroom">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_passwordprotectedroom">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_passwordprotectedroom">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_passwordprotectedroom">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_passwordprotectedroom">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_persistentroom">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_persistentroom">>,
                                   Required),
                      [{persistentroom, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_persistentroom">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_persistentroom">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_persistentroom">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_persistentroom">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_persistentroom">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_presencebroadcast">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [dec_enum(Value, [moderator, participant, visitor])
         || Value <- Values]
    of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_presencebroadcast">>,
                                   Required),
                      [{presencebroadcast, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_presencebroadcast">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_publicroom">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_publicroom">>, Required),
                      [{publicroom, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_publicroom">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_publicroom">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_publicroom">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_publicroom">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_publicroom">>,
                   XMLNS}});
do_decode([#xdata_field{var = <<"public_list">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"public_list">>, Required),
                      [{public_list, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"public_list">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"public_list">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"public_list">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"public_list">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"public_list">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomadmins">>,
                        values = [<<>>]} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    %% Psi work-around
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_roomadmins">>,
                             values = []}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomadmins">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [jid:decode(Value) || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_roomadmins">>, Required),
                      [{roomadmins, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_roomadmins">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomdesc">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_roomdesc">>, Required),
                      [{roomdesc, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_roomdesc">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomdesc">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_roomdesc">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomdesc">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_roomdesc">>,
                   XMLNS}});
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
                            <<"muc#roomconfig_roomowners">>,
                        values = [<<>>]} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    %% Psi work-around
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_roomowners">>,
                             values = []}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomowners">>,
                        values = Values}
           | Fs],
          XMLNS, Required, Acc) ->
    try [jid:decode(Value) || Value <- Values] of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_roomowners">>, Required),
                      [{roomowners, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_roomowners">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomsecret">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_roomsecret">>, Required),
                      [{roomsecret, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value,
                           <<"muc#roomconfig_roomsecret">>,
                           XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomsecret">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_roomsecret">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_roomsecret">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values,
                   <<"muc#roomconfig_roomsecret">>,
                   XMLNS}});
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_whois">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_enum(Value, [moderators, anyone]) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"muc#roomconfig_whois">>, Required),
                      [{whois, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"muc#roomconfig_whois">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_whois">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"muc#roomconfig_whois">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"muc#roomconfig_whois">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"muc#roomconfig_whois">>, XMLNS}});
do_decode([#xdata_field{var = <<"mam">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"mam">>, Required),
                      [{mam, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"mam">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"mam">>, values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"mam">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"mam">>} | _], XMLNS, _,
          _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"mam">>, XMLNS}});
do_decode([#xdata_field{var = <<"enable_hats">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_bool(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"enable_hats">>, Required),
                      [{enable_hats, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"enable_hats">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"enable_hats">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"enable_hats">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"enable_hats">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"enable_hats">>, XMLNS}});
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

-spec encode_maxhistoryfetch(binary(), binary(),
                             boolean()) -> xdata_field().

encode_maxhistoryfetch(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#maxhistoryfetch">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Maximum Number of History Messages Returned "
                                   "by Room"))}.

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

-spec encode_allow_private_messages(boolean() |
                                    undefined,
                                    binary(), boolean()) -> xdata_field().

encode_allow_private_messages(Value, Lang,
                              IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"allow_private_messages">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Allow users to send private messages"))}.

-spec
     encode_allow_private_messages_from_visitors(allow_private_messages_from_visitors() |
                                                 undefined,
                                                 default |
                                                 options(allow_private_messages_from_visitors()),
                                                 binary(),
                                                 boolean()) -> xdata_field().

encode_allow_private_messages_from_visitors(Value,
                                            Options, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, ?T("Nobody")),
                                 value = <<"nobody">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang, ?T("Moderators Only")),
                                 value = <<"moderators">>},
                   #xdata_option{label = xmpp_tr:tr(Lang, ?T("Anyone")),
                                 value = <<"anyone">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var =
                     <<"allow_private_messages_from_visitors">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Allow visitors to send private messages to"))}.

-spec encode_allow_visitor_status(boolean() | undefined,
                                  binary(), boolean()) -> xdata_field().

encode_allow_visitor_status(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"allow_visitor_status">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Allow visitors to send status text in "
                                   "presence updates"))}.

-spec encode_allow_visitor_nickchange(boolean() |
                                      undefined,
                                      binary(), boolean()) -> xdata_field().

encode_allow_visitor_nickchange(Value, Lang,
                                IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"allow_visitor_nickchange">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Allow visitors to change nickname"))}.

-spec encode_allow_voice_requests(boolean() | undefined,
                                  binary(), boolean()) -> xdata_field().

encode_allow_voice_requests(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"allow_voice_requests">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Allow visitors to send voice requests"))}.

-spec encode_allow_subscription(boolean() | undefined,
                                binary(), boolean()) -> xdata_field().

encode_allow_subscription(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"allow_subscription">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Allow subscription"))}.

-spec
     encode_voice_request_min_interval(non_neg_integer() |
                                       undefined,
                                       binary(), boolean()) -> xdata_field().

encode_voice_request_min_interval(Value, Lang,
                                  IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_int(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"voice_request_min_interval">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Minimum interval between voice requests "
                                   "(in seconds)"))}.

-spec encode_captcha_protected(boolean() | undefined,
                               binary(), boolean()) -> xdata_field().

encode_captcha_protected(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"captcha_protected">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Make room CAPTCHA protected"))}.

-spec encode_captcha_whitelist([jid:jid()], binary(),
                               boolean()) -> xdata_field().

encode_captcha_whitelist(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [jid:encode(V) || V <- Value]
             end,
    Opts = [],
    #xdata_field{var = <<"captcha_whitelist">>,
                 values = Values, required = IsRequired,
                 type = 'jid-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Exclude Jabber IDs from CAPTCHA challenge"))}.

-spec encode_allow_query_users(boolean() | undefined,
                               binary(), boolean()) -> xdata_field().

encode_allow_query_users(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"allow_query_users">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Allow users to query other users"))}.

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
                     xmpp_tr:tr(Lang, ?T("Allow users to send invites"))}.

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
                                ?T("Allow users to change the subject"))}.

-spec encode_enablelogging(boolean() | undefined,
                           binary(), boolean()) -> xdata_field().

encode_enablelogging(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_enablelogging">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Enable logging"))}.

-spec encode_getmemberlist([binary()],
                           default | options(binary()), binary(),
                           boolean()) -> xdata_field().

encode_getmemberlist(Value, Options, Lang,
                     IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> Value
             end,
    Opts = if Options == default -> [];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L), value = V}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"muc#roomconfig_getmemberlist">>,
                 values = Values, required = IsRequired,
                 type = 'list-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Roles and Affiliations that May Retrieve "
                                   "Member List"))}.

-spec encode_lang(binary() | undefined, binary(),
                  boolean()) -> xdata_field().

encode_lang(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_lang">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Natural Language for Room Discussions"))}.

-spec encode_pubsub(binary() | undefined, binary(),
                    boolean()) -> xdata_field().

encode_pubsub(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_pubsub">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("XMPP URI of Associated Publish-Subscribe "
                                   "Node"))}.

-spec encode_maxusers(maxusers() | undefined,
                      default | options(maxusers()), binary(),
                      boolean()) -> xdata_field().

encode_maxusers(Value, Options, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum_int(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, ?T("No limit")),
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
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Maximum Number of Occupants"))}.

-spec encode_membersonly(boolean() | undefined,
                         binary(), boolean()) -> xdata_field().

encode_membersonly(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_membersonly">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Make room members-only"))}.

-spec encode_moderatedroom(boolean() | undefined,
                           binary(), boolean()) -> xdata_field().

encode_moderatedroom(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_moderatedroom">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Make room moderated"))}.

-spec encode_members_by_default(boolean() | undefined,
                                binary(), boolean()) -> xdata_field().

encode_members_by_default(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"members_by_default">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Default users as participants"))}.

-spec encode_passwordprotectedroom(boolean() |
                                   undefined,
                                   binary(), boolean()) -> xdata_field().

encode_passwordprotectedroom(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var =
                     <<"muc#roomconfig_passwordprotectedroom">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Make room password protected"))}.

-spec encode_persistentroom(boolean() | undefined,
                            binary(), boolean()) -> xdata_field().

encode_persistentroom(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_persistentroom">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Make room persistent"))}.

-spec encode_presencebroadcast([presencebroadcast()],
                               default | options(presencebroadcast()), binary(),
                               boolean()) -> xdata_field().

encode_presencebroadcast(Value, Options, Lang,
                         IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [enc_enum(V) || V <- Value]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang, ?T("Moderator")),
                                 value = <<"moderator">>},
                   #xdata_option{label =
                                     xmpp_tr:tr(Lang, ?T("Participant")),
                                 value = <<"participant">>},
                   #xdata_option{label = xmpp_tr:tr(Lang, ?T("Visitor")),
                                 value = <<"visitor">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var =
                     <<"muc#roomconfig_presencebroadcast">>,
                 values = Values, required = IsRequired,
                 type = 'list-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Roles for which Presence is Broadcasted"))}.

-spec encode_publicroom(boolean() | undefined, binary(),
                        boolean()) -> xdata_field().

encode_publicroom(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_publicroom">>,
                 values = Values, required = IsRequired, type = boolean,
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Make room public searchable"))}.

-spec encode_public_list(boolean() | undefined,
                         binary(), boolean()) -> xdata_field().

encode_public_list(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"public_list">>, values = Values,
                 required = IsRequired, type = boolean, options = Opts,
                 desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Make participants list public"))}.

-spec encode_roomadmins([jid:jid()], binary(),
                        boolean()) -> xdata_field().

encode_roomadmins(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [jid:encode(V) || V <- Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomadmins">>,
                 values = Values, required = IsRequired,
                 type = 'jid-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Full List of Room Admins"))}.

-spec encode_roomdesc(binary(), binary(),
                      boolean()) -> xdata_field().

encode_roomdesc(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomdesc">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Room description"))}.

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
                 label = xmpp_tr:tr(Lang, ?T("Room title"))}.

-spec encode_roomowners([jid:jid()], binary(),
                        boolean()) -> xdata_field().

encode_roomowners(Value, Lang, IsRequired) ->
    Values = case Value of
                 [] -> [];
                 Value -> [jid:encode(V) || V <- Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomowners">>,
                 values = Values, required = IsRequired,
                 type = 'jid-multi', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Full List of Room Owners"))}.

-spec encode_roomsecret(binary(), binary(),
                        boolean()) -> xdata_field().

encode_roomsecret(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"muc#roomconfig_roomsecret">>,
                 values = Values, required = IsRequired,
                 type = 'text-private', options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Password"))}.

-spec encode_whois(whois() | undefined,
                   default | options(whois()), binary(),
                   boolean()) -> xdata_field().

encode_whois(Value, Options, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_enum(Value)]
             end,
    Opts = if Options == default ->
                  [#xdata_option{label =
                                     xmpp_tr:tr(Lang, ?T("Moderators Only")),
                                 value = <<"moderators">>},
                   #xdata_option{label = xmpp_tr:tr(Lang, ?T("Anyone")),
                                 value = <<"anyone">>}];
              true ->
                  [#xdata_option{label = xmpp_tr:tr(Lang, L),
                                 value = enc_enum(V)}
                   || {L, V} <- Options]
           end,
    #xdata_field{var = <<"muc#roomconfig_whois">>,
                 values = Values, required = IsRequired,
                 type = 'list-single', options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Present real Jabber IDs to"))}.

-spec encode_mam(boolean() | undefined, binary(),
                 boolean()) -> xdata_field().

encode_mam(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"mam">>, values = Values,
                 required = IsRequired, type = boolean, options = Opts,
                 desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Enable message archiving"))}.

-spec encode_enable_hats(boolean() | undefined,
                         binary(), boolean()) -> xdata_field().

encode_enable_hats(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_bool(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"enable_hats">>, values = Values,
                 required = IsRequired, type = boolean, options = Opts,
                 desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Enable hats"))}.
