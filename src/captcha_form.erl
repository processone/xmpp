%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: captcha_form.xdata
%% Form type: urn:xmpp:captcha
%% Document: XEP-0158

-module(captcha_form).

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

-include("captcha_form.hrl").

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
             [answers |
              audio_recog |
              challenge |
              from |
              ocr |
              picture_q |
              picture_recog |
              qa |
              'SHA-256' |
              sid |
              speech_q |
              speech_recog |
              video_q |
              video_recog |
              'captcha-fallback-text' |
              'captcha-fallback-url']) -> [xdata_field()].

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
    decode(Fs, [<<"urn:xmpp:captcha">>], [], []).

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
              {answers, Val} ->
                  [encode_answers(Val,
                                  Lang,
                                  lists:member(answers, Required))];
              {audio_recog, Val} ->
                  [encode_audio_recog(Val,
                                      Lang,
                                      lists:member(audio_recog, Required))];
              {challenge, Val} ->
                  [encode_challenge(Val,
                                    Lang,
                                    lists:member(challenge, Required))];
              {from, Val} ->
                  [encode_from(Val, Lang, lists:member(from, Required))];
              {ocr, Val} ->
                  [encode_ocr(Val, Lang, lists:member(ocr, Required))];
              {picture_q, Val} ->
                  [encode_picture_q(Val,
                                    Lang,
                                    lists:member(picture_q, Required))];
              {picture_recog, Val} ->
                  [encode_picture_recog(Val,
                                        Lang,
                                        lists:member(picture_recog, Required))];
              {qa, Val} ->
                  [encode_qa(Val, Lang, lists:member(qa, Required))];
              {'SHA-256', Val} ->
                  ['encode_SHA-256'(Val,
                                    Lang,
                                    lists:member('SHA-256', Required))];
              {sid, Val} ->
                  [encode_sid(Val, Lang, lists:member(sid, Required))];
              {speech_q, Val} ->
                  [encode_speech_q(Val,
                                   Lang,
                                   lists:member(speech_q, Required))];
              {speech_recog, Val} ->
                  [encode_speech_recog(Val,
                                       Lang,
                                       lists:member(speech_recog, Required))];
              {video_q, Val} ->
                  [encode_video_q(Val,
                                  Lang,
                                  lists:member(video_q, Required))];
              {video_recog, Val} ->
                  [encode_video_recog(Val,
                                      Lang,
                                      lists:member(video_recog, Required))];
              {'captcha-fallback-text', Val} ->
                  ['encode_captcha-fallback-text'(Val,
                                                  Lang,
                                                  lists:member('captcha-fallback-text',
                                                               Required))];
              {'captcha-fallback-url', Val} ->
                  ['encode_captcha-fallback-url'(Val,
                                                 Lang,
                                                 lists:member('captcha-fallback-url',
                                                              Required))];
              #xdata_field{} -> [Opt]
          end
          || Opt <- List],
    FormType = #xdata_field{var = <<"FORM_TYPE">>,
                            type = hidden, values = [<<"urn:xmpp:captcha">>]},
    [FormType | lists:flatten(Fs)].

do_decode([#xdata_field{var = <<"answers">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try dec_int(Value, 0, infinity) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"answers">>, Required),
                      [{answers, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"answers">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"answers">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"answers">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"answers">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"answers">>, XMLNS}});
do_decode([#xdata_field{var = <<"audio_recog">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"audio_recog">>, Required),
                      [{audio_recog, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"audio_recog">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"audio_recog">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"audio_recog">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"audio_recog">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"audio_recog">>, XMLNS}});
do_decode([#xdata_field{var = <<"challenge">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"challenge">>, Required),
                      [{challenge, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"challenge">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"challenge">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"challenge">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"challenge">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"challenge">>, XMLNS}});
do_decode([#xdata_field{var = <<"from">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try jid:decode(Value) of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"from">>, Required),
                      [{from, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"from">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"from">>, values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"from">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"from">>} | _], XMLNS,
          _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"from">>, XMLNS}});
do_decode([#xdata_field{var = <<"ocr">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"ocr">>, Required),
                      [{ocr, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"ocr">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"ocr">>, values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"ocr">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"ocr">>} | _], XMLNS, _,
          _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"ocr">>, XMLNS}});
do_decode([#xdata_field{var = <<"picture_q">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"picture_q">>, Required),
                      [{picture_q, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"picture_q">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"picture_q">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"picture_q">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"picture_q">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"picture_q">>, XMLNS}});
do_decode([#xdata_field{var = <<"picture_recog">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"picture_recog">>, Required),
                      [{picture_recog, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"picture_recog">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"picture_recog">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"picture_recog">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"picture_recog">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"picture_recog">>, XMLNS}});
do_decode([#xdata_field{var = <<"qa">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"qa">>, Required),
                      [{qa, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"qa">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"qa">>, values = []} = F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"qa">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"qa">>} | _], XMLNS, _,
          _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"qa">>, XMLNS}});
do_decode([#xdata_field{var = <<"SHA-256">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"SHA-256">>, Required),
                      [{'SHA-256', Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"SHA-256">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"SHA-256">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"SHA-256">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"SHA-256">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"SHA-256">>, XMLNS}});
do_decode([#xdata_field{var = <<"sid">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"sid">>, Required),
                      [{sid, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"sid">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"sid">>, values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"sid">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"sid">>} | _], XMLNS, _,
          _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"sid">>, XMLNS}});
do_decode([#xdata_field{var = <<"speech_q">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"speech_q">>, Required),
                      [{speech_q, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"speech_q">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"speech_q">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"speech_q">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"speech_q">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"speech_q">>, XMLNS}});
do_decode([#xdata_field{var = <<"speech_recog">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"speech_recog">>, Required),
                      [{speech_recog, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"speech_recog">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"speech_recog">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"speech_recog">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"speech_recog">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"speech_recog">>, XMLNS}});
do_decode([#xdata_field{var = <<"video_q">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"video_q">>, Required),
                      [{video_q, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"video_q">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"video_q">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"video_q">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"video_q">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"video_q">>, XMLNS}});
do_decode([#xdata_field{var = <<"video_recog">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"video_recog">>, Required),
                      [{video_recog, Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"video_recog">>, XMLNS}})
    end;
do_decode([#xdata_field{var = <<"video_recog">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var = <<"video_recog">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var = <<"video_recog">>} | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"video_recog">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"captcha-fallback-text">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"captcha-fallback-text">>, Required),
                      [{'captcha-fallback-text', Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"captcha-fallback-text">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"captcha-fallback-text">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"captcha-fallback-text">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"captcha-fallback-text">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"captcha-fallback-text">>, XMLNS}});
do_decode([#xdata_field{var =
                            <<"captcha-fallback-url">>,
                        values = [Value]}
           | Fs],
          XMLNS, Required, Acc) ->
    try Value of
        Result ->
            do_decode(Fs,
                      XMLNS,
                      lists:delete(<<"captcha-fallback-url">>, Required),
                      [{'captcha-fallback-url', Result} | Acc])
    catch
        _:_ ->
            erlang:error({?MODULE,
                          {bad_var_value, <<"captcha-fallback-url">>, XMLNS}})
    end;
do_decode([#xdata_field{var =
                            <<"captcha-fallback-url">>,
                        values = []} =
               F
           | Fs],
          XMLNS, Required, Acc) ->
    do_decode([F#xdata_field{var =
                                 <<"captcha-fallback-url">>,
                             values = [<<>>]}
               | Fs],
              XMLNS,
              Required,
              Acc);
do_decode([#xdata_field{var =
                            <<"captcha-fallback-url">>}
           | _],
          XMLNS, _, _) ->
    erlang:error({?MODULE,
                  {too_many_values, <<"captcha-fallback-url">>, XMLNS}});
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

-spec encode_answers(non_neg_integer() | undefined,
                     binary(), boolean()) -> xdata_field().

encode_answers(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [enc_int(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"answers">>, values = Values,
                 required = IsRequired, type = hidden, options = Opts,
                 desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Number of answers required"))}.

-spec encode_audio_recog(binary(), binary(),
                         boolean()) -> xdata_field().

encode_audio_recog(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"audio_recog">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Text associated with a sound"))}.

-spec encode_challenge(binary(), binary(),
                       boolean()) -> xdata_field().

encode_challenge(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"challenge">>, values = Values,
                 required = IsRequired, type = hidden, options = Opts,
                 desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Challenge ID"))}.

-spec encode_from(jid:jid() | undefined, binary(),
                  boolean()) -> xdata_field().

encode_from(Value, Lang, IsRequired) ->
    Values = case Value of
                 undefined -> [];
                 Value -> [jid:encode(Value)]
             end,
    Opts = [],
    #xdata_field{var = <<"from">>, values = Values,
                 required = IsRequired, type = hidden, options = Opts,
                 desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Attribute 'to' of stanza that triggered "
                                   "challenge"))}.

-spec encode_ocr(binary(), binary(),
                 boolean()) -> xdata_field().

encode_ocr(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"ocr">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Enter the text you see"))}.

-spec encode_picture_q(binary(), binary(),
                       boolean()) -> xdata_field().

encode_picture_q(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"picture_q">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Answer associated with a picture"))}.

-spec encode_picture_recog(binary(), binary(),
                           boolean()) -> xdata_field().

encode_picture_recog(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"picture_recog">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Text associated with a picture"))}.

-spec encode_qa(binary(), binary(),
                boolean()) -> xdata_field().

encode_qa(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"qa">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("Answer to a question"))}.

-spec 'encode_SHA-256'(binary(), binary(),
                       boolean()) -> xdata_field().

'encode_SHA-256'(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"SHA-256">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang,
                                ?T("Least significant bits of SHA-256 hash "
                                   "of text should equal hexadecimal label"))}.

-spec encode_sid(binary(), binary(),
                 boolean()) -> xdata_field().

encode_sid(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"sid">>, values = Values,
                 required = IsRequired, type = hidden, options = Opts,
                 desc = <<>>, label = xmpp_tr:tr(Lang, ?T("Stanza ID"))}.

-spec encode_speech_q(binary(), binary(),
                      boolean()) -> xdata_field().

encode_speech_q(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"speech_q">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Answer associated with speech"))}.

-spec encode_speech_recog(binary(), binary(),
                          boolean()) -> xdata_field().

encode_speech_recog(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"speech_recog">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Text associated with speech"))}.

-spec encode_video_q(binary(), binary(),
                     boolean()) -> xdata_field().

encode_video_q(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"video_q">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Answer associated with a video"))}.

-spec encode_video_recog(binary(), binary(),
                         boolean()) -> xdata_field().

encode_video_recog(Value, Lang, IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"video_recog">>, values = Values,
                 required = IsRequired, type = 'text-single',
                 options = Opts, desc = <<>>,
                 label =
                     xmpp_tr:tr(Lang, ?T("Text associated with a video"))}.

-spec 'encode_captcha-fallback-text'(binary(), binary(),
                                     boolean()) -> xdata_field().

'encode_captcha-fallback-text'(Value, Lang,
                               IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"captcha-fallback-text">>,
                 values = Values, required = IsRequired, type = fixed,
                 options = Opts, desc = <<>>, label = <<>>}.

-spec 'encode_captcha-fallback-url'(binary(), binary(),
                                    boolean()) -> xdata_field().

'encode_captcha-fallback-url'(Value, Lang,
                              IsRequired) ->
    Values = case Value of
                 <<>> -> [];
                 Value -> [Value]
             end,
    Opts = [],
    #xdata_field{var = <<"captcha-fallback-url">>,
                 values = Values, required = IsRequired,
                 type = 'text-single', options = Opts, desc = <<>>,
                 label = xmpp_tr:tr(Lang, ?T("CAPTCHA web page"))}.
