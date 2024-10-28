%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0388).

-compile(export_all).

do_decode(<<"abort">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_abort(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"next">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_next(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"task-data">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_task_data(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"task">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_task(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"tasks">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_tasks(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"continue">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_continue(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"text">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_text(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"failure">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_failure(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"authorization-identifier">>,
          <<"urn:xmpp:sasl:2">>, El, Opts) ->
    decode_sasl2_authorization_identifier(<<"urn:xmpp:sasl:2">>,
                                          Opts,
                                          El);
do_decode(<<"additional-data">>, <<"urn:xmpp:sasl:2">>,
          El, Opts) ->
    decode_sasl2_additional_data(<<"urn:xmpp:sasl:2">>,
                                 Opts,
                                 El);
do_decode(<<"success">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_success(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"response">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_response(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"challenge">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_challenge(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"device">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_user_agent_device(<<"urn:xmpp:sasl:2">>,
                                   Opts,
                                   El);
do_decode(<<"software">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_user_agent_software(<<"urn:xmpp:sasl:2">>,
                                     Opts,
                                     El);
do_decode(<<"user-agent">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_user_agent(<<"urn:xmpp:sasl:2">>,
                            Opts,
                            El);
do_decode(<<"initial-response">>, <<"urn:xmpp:sasl:2">>,
          El, Opts) ->
    decode_sasl2_initial_response(<<"urn:xmpp:sasl:2">>,
                                  Opts,
                                  El);
do_decode(<<"authenticate">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_authenticate(<<"urn:xmpp:sasl:2">>,
                              Opts,
                              El);
do_decode(<<"inline">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_inline(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"mechanism">>, <<"urn:xmpp:sasl:2">>, El,
          Opts) ->
    decode_sasl2_mechanism(<<"urn:xmpp:sasl:2">>, Opts, El);
do_decode(<<"authentication">>, <<"urn:xmpp:sasl:2">>,
          El, Opts) ->
    decode_sasl2_authentication(<<"urn:xmpp:sasl:2">>,
                                Opts,
                                El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"abort">>, <<"urn:xmpp:sasl:2">>},
     {<<"next">>, <<"urn:xmpp:sasl:2">>},
     {<<"task-data">>, <<"urn:xmpp:sasl:2">>},
     {<<"task">>, <<"urn:xmpp:sasl:2">>},
     {<<"tasks">>, <<"urn:xmpp:sasl:2">>},
     {<<"continue">>, <<"urn:xmpp:sasl:2">>},
     {<<"text">>, <<"urn:xmpp:sasl:2">>},
     {<<"failure">>, <<"urn:xmpp:sasl:2">>},
     {<<"authorization-identifier">>, <<"urn:xmpp:sasl:2">>},
     {<<"additional-data">>, <<"urn:xmpp:sasl:2">>},
     {<<"success">>, <<"urn:xmpp:sasl:2">>},
     {<<"response">>, <<"urn:xmpp:sasl:2">>},
     {<<"challenge">>, <<"urn:xmpp:sasl:2">>},
     {<<"device">>, <<"urn:xmpp:sasl:2">>},
     {<<"software">>, <<"urn:xmpp:sasl:2">>},
     {<<"user-agent">>, <<"urn:xmpp:sasl:2">>},
     {<<"initial-response">>, <<"urn:xmpp:sasl:2">>},
     {<<"authenticate">>, <<"urn:xmpp:sasl:2">>},
     {<<"inline">>, <<"urn:xmpp:sasl:2">>},
     {<<"mechanism">>, <<"urn:xmpp:sasl:2">>},
     {<<"authentication">>, <<"urn:xmpp:sasl:2">>}].

do_encode({sasl2_authenticaton, _, _, _} =
              Authentication,
          TopXMLNS) ->
    encode_sasl2_authentication(Authentication, TopXMLNS);
do_encode({sasl2_authenticate, _, _, _, _} =
              Authenticate,
          TopXMLNS) ->
    encode_sasl2_authenticate(Authenticate, TopXMLNS);
do_encode({sasl2_user_agent, _, _, _} = User_agent,
          TopXMLNS) ->
    encode_sasl2_user_agent(User_agent, TopXMLNS);
do_encode({sasl2_challenge, _} = Challenge, TopXMLNS) ->
    encode_sasl2_challenge(Challenge, TopXMLNS);
do_encode({sasl2_response, _} = Response, TopXMLNS) ->
    encode_sasl2_response(Response, TopXMLNS);
do_encode({sasl2_success, _, _, _} = Success,
          TopXMLNS) ->
    encode_sasl2_success(Success, TopXMLNS);
do_encode({sasl2_failure, _, _, _} = Failure,
          TopXMLNS) ->
    encode_sasl2_failure(Failure, TopXMLNS);
do_encode({sasl2_continue, _, _, _, _} = Continue,
          TopXMLNS) ->
    encode_sasl2_continue(Continue, TopXMLNS);
do_encode({sasl2_task_data, _} = Task_data, TopXMLNS) ->
    encode_sasl2_task_data(Task_data, TopXMLNS);
do_encode({sasl2_next, _, _} = Next, TopXMLNS) ->
    encode_sasl2_next(Next, TopXMLNS);
do_encode({sasl2_abort, _, _} = Abort, TopXMLNS) ->
    encode_sasl2_abort(Abort, TopXMLNS).

do_get_name({sasl2_abort, _, _}) -> <<"abort">>;
do_get_name({sasl2_authenticate, _, _, _, _}) ->
    <<"authenticate">>;
do_get_name({sasl2_authenticaton, _, _, _}) ->
    <<"authentication">>;
do_get_name({sasl2_challenge, _}) -> <<"challenge">>;
do_get_name({sasl2_continue, _, _, _, _}) ->
    <<"continue">>;
do_get_name({sasl2_failure, _, _, _}) -> <<"failure">>;
do_get_name({sasl2_next, _, _}) -> <<"next">>;
do_get_name({sasl2_response, _}) -> <<"response">>;
do_get_name({sasl2_success, _, _, _}) -> <<"success">>;
do_get_name({sasl2_task_data, _}) -> <<"task-data">>;
do_get_name({sasl2_user_agent, _, _, _}) ->
    <<"user-agent">>.

do_get_ns({sasl2_abort, _, _}) -> <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_authenticate, _, _, _, _}) ->
    <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_authenticaton, _, _, _}) ->
    <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_challenge, _}) ->
    <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_continue, _, _, _, _}) ->
    <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_failure, _, _, _}) ->
    <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_next, _, _}) -> <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_response, _}) -> <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_success, _, _, _}) ->
    <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_task_data, _}) ->
    <<"urn:xmpp:sasl:2">>;
do_get_ns({sasl2_user_agent, _, _, _}) ->
    <<"urn:xmpp:sasl:2">>.

get_els({sasl2_authenticaton,
         _mechanisms,
         _inline,
         _sub_els}) ->
    _sub_els;
get_els({sasl2_authenticate,
         _mechanism,
         _initial_response,
         _user_agent,
         _sub_els}) ->
    _sub_els;
get_els({sasl2_success,
         _jid,
         _additional_data,
         _sub_els}) ->
    _sub_els;
get_els({sasl2_failure, _reason, _text, _sub_els}) ->
    _sub_els;
get_els({sasl2_continue,
         _additional_data,
         _text,
         _tasks,
         _sub_els}) ->
    _sub_els;
get_els({sasl2_task_data, _sub_els}) -> _sub_els;
get_els({sasl2_next, _task, _sub_els}) -> _sub_els;
get_els({sasl2_abort, _text, _sub_els}) -> _sub_els.

set_els({sasl2_authenticaton, _mechanisms, _inline, _},
        _sub_els) ->
    {sasl2_authenticaton, _mechanisms, _inline, _sub_els};
set_els({sasl2_authenticate,
         _mechanism,
         _initial_response,
         _user_agent,
         _},
        _sub_els) ->
    {sasl2_authenticate,
     _mechanism,
     _initial_response,
     _user_agent,
     _sub_els};
set_els({sasl2_success, _jid, _additional_data, _},
        _sub_els) ->
    {sasl2_success, _jid, _additional_data, _sub_els};
set_els({sasl2_failure, _reason, _text, _}, _sub_els) ->
    {sasl2_failure, _reason, _text, _sub_els};
set_els({sasl2_continue,
         _additional_data,
         _text,
         _tasks,
         _},
        _sub_els) ->
    {sasl2_continue,
     _additional_data,
     _text,
     _tasks,
     _sub_els};
set_els({sasl2_task_data, _}, _sub_els) ->
    {sasl2_task_data, _sub_els};
set_els({sasl2_next, _task, _}, _sub_els) ->
    {sasl2_next, _task, _sub_els};
set_els({sasl2_abort, _text, _}, _sub_els) ->
    {sasl2_abort, _text, _sub_els}.

pp(sasl2_authenticaton, 3) ->
    [mechanisms, inline, sub_els];
pp(sasl2_authenticate, 4) ->
    [mechanism, initial_response, user_agent, sub_els];
pp(sasl2_user_agent, 3) -> [id, software, device];
pp(sasl2_challenge, 1) -> [text];
pp(sasl2_response, 1) -> [text];
pp(sasl2_success, 3) -> [jid, additional_data, sub_els];
pp(sasl2_failure, 3) -> [reason, text, sub_els];
pp(sasl2_continue, 4) ->
    [additional_data, text, tasks, sub_els];
pp(sasl2_task_data, 1) -> [sub_els];
pp(sasl2_next, 2) -> [task, sub_els];
pp(sasl2_abort, 2) -> [text, sub_els];
pp(_, _) -> no.

records() ->
    [{sasl2_authenticaton, 3},
     {sasl2_authenticate, 4},
     {sasl2_user_agent, 3},
     {sasl2_challenge, 1},
     {sasl2_response, 1},
     {sasl2_success, 3},
     {sasl2_failure, 3},
     {sasl2_continue, 4},
     {sasl2_task_data, 1},
     {sasl2_next, 2},
     {sasl2_abort, 2}].

decode_sasl2_abort(__TopXMLNS, __Opts,
                   {xmlel, <<"abort">>, _attrs, _els}) ->
    {Text, __Els} = decode_sasl2_abort_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           undefined,
                                           []),
    {sasl2_abort, Text, __Els}.

decode_sasl2_abort_els(__TopXMLNS, __Opts, [], Text,
                       __Els) ->
    {Text, lists:reverse(__Els)};
decode_sasl2_abort_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
                       __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_abort_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   decode_sasl2_text(<<"urn:xmpp:sasl:2">>,
                                                     __Opts,
                                                     _el),
                                   __Els);
        _ ->
            decode_sasl2_abort_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Text,
                                   [_el | __Els])
    end;
decode_sasl2_abort_els(__TopXMLNS, __Opts,
                       [{xmlel, _name, _attrs, _} = _el | _els], Text,
                       __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_sasl2_abort_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   Text,
                                   [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_sasl2_abort_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           Text,
                                           [_el | __Els]);
                Mod ->
                    decode_sasl2_abort_els(__TopXMLNS,
                                           __Opts,
                                           _els,
                                           Text,
                                           [Mod:do_decode(_name,
                                                          __XMLNS,
                                                          _el,
                                                          __Opts)
                                            | __Els])
            end
    end;
decode_sasl2_abort_els(__TopXMLNS, __Opts, [_ | _els],
                       Text, __Els) ->
    decode_sasl2_abort_els(__TopXMLNS,
                           __Opts,
                           _els,
                           Text,
                           __Els).

encode_sasl2_abort({sasl2_abort, Text, __Els},
                   __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_sasl2_abort_$text'(Text,
                                                        __NewTopXMLNS,
                                                        [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"abort">>, _attrs, _els}.

'encode_sasl2_abort_$text'(undefined, __TopXMLNS,
                           _acc) ->
    _acc;
'encode_sasl2_abort_$text'(Text, __TopXMLNS, _acc) ->
    [encode_sasl2_text(Text, __TopXMLNS) | _acc].

decode_sasl2_next(__TopXMLNS, __Opts,
                  {xmlel, <<"next">>, _attrs, _els}) ->
    __Els = decode_sasl2_next_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  []),
    Task = decode_sasl2_next_attrs(__TopXMLNS,
                                   _attrs,
                                   undefined),
    {sasl2_next, Task, __Els}.

decode_sasl2_next_els(__TopXMLNS, __Opts, [], __Els) ->
    lists:reverse(__Els);
decode_sasl2_next_els(__TopXMLNS, __Opts,
                      [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_sasl2_next_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_sasl2_next_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          [_el | __Els]);
                Mod ->
                    decode_sasl2_next_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          [Mod:do_decode(_name,
                                                         __XMLNS,
                                                         _el,
                                                         __Opts)
                                           | __Els])
            end
    end;
decode_sasl2_next_els(__TopXMLNS, __Opts, [_ | _els],
                      __Els) ->
    decode_sasl2_next_els(__TopXMLNS, __Opts, _els, __Els).

decode_sasl2_next_attrs(__TopXMLNS,
                        [{<<"task">>, _val} | _attrs], _Task) ->
    decode_sasl2_next_attrs(__TopXMLNS, _attrs, _val);
decode_sasl2_next_attrs(__TopXMLNS, [_ | _attrs],
                        Task) ->
    decode_sasl2_next_attrs(__TopXMLNS, _attrs, Task);
decode_sasl2_next_attrs(__TopXMLNS, [], Task) ->
    decode_sasl2_next_attr_task(__TopXMLNS, Task).

encode_sasl2_next({sasl2_next, Task, __Els},
                  __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = encode_sasl2_next_attr_task(Task,
                                         xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                    __TopXMLNS)),
    {xmlel, <<"next">>, _attrs, _els}.

decode_sasl2_next_attr_task(__TopXMLNS, undefined) ->
    <<>>;
decode_sasl2_next_attr_task(__TopXMLNS, _val) -> _val.

encode_sasl2_next_attr_task(<<>>, _acc) -> _acc;
encode_sasl2_next_attr_task(_val, _acc) ->
    [{<<"task">>, _val} | _acc].

decode_sasl2_task_data(__TopXMLNS, __Opts,
                       {xmlel, <<"task-data">>, _attrs, _els}) ->
    __Els = decode_sasl2_task_data_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       []),
    {sasl2_task_data, __Els}.

decode_sasl2_task_data_els(__TopXMLNS, __Opts, [],
                           __Els) ->
    lists:reverse(__Els);
decode_sasl2_task_data_els(__TopXMLNS, __Opts,
                           [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_sasl2_task_data_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_sasl2_task_data_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               [_el | __Els]);
                Mod ->
                    decode_sasl2_task_data_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               [Mod:do_decode(_name,
                                                              __XMLNS,
                                                              _el,
                                                              __Opts)
                                                | __Els])
            end
    end;
decode_sasl2_task_data_els(__TopXMLNS, __Opts,
                           [_ | _els], __Els) ->
    decode_sasl2_task_data_els(__TopXMLNS,
                               __Opts,
                               _els,
                               __Els).

encode_sasl2_task_data({sasl2_task_data, __Els},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"task-data">>, _attrs, _els}.

decode_sasl2_task(__TopXMLNS, __Opts,
                  {xmlel, <<"task">>, _attrs, _els}) ->
    Cdata = decode_sasl2_task_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<>>),
    Cdata.

decode_sasl2_task_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_sasl2_task_cdata(__TopXMLNS, Cdata);
decode_sasl2_task_els(__TopXMLNS, __Opts,
                      [{xmlcdata, _data} | _els], Cdata) ->
    decode_sasl2_task_els(__TopXMLNS,
                          __Opts,
                          _els,
                          <<Cdata/binary, _data/binary>>);
decode_sasl2_task_els(__TopXMLNS, __Opts, [_ | _els],
                      Cdata) ->
    decode_sasl2_task_els(__TopXMLNS, __Opts, _els, Cdata).

encode_sasl2_task(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_task_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"task">>, _attrs, _els}.

decode_sasl2_task_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl2_task_cdata(__TopXMLNS, _val) -> _val.

encode_sasl2_task_cdata(<<>>, _acc) -> _acc;
encode_sasl2_task_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_sasl2_tasks(__TopXMLNS, __Opts,
                   {xmlel, <<"tasks">>, _attrs, _els}) ->
    Task = decode_sasl2_tasks_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  []),
    Task.

decode_sasl2_tasks_els(__TopXMLNS, __Opts, [], Task) ->
    lists:reverse(Task);
decode_sasl2_tasks_els(__TopXMLNS, __Opts,
                       [{xmlel, <<"task">>, _attrs, _} = _el | _els], Task) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_tasks_els(__TopXMLNS,
                                   __Opts,
                                   _els,
                                   [decode_sasl2_task(<<"urn:xmpp:sasl:2">>,
                                                      __Opts,
                                                      _el)
                                    | Task]);
        _ ->
            decode_sasl2_tasks_els(__TopXMLNS, __Opts, _els, Task)
    end;
decode_sasl2_tasks_els(__TopXMLNS, __Opts, [_ | _els],
                       Task) ->
    decode_sasl2_tasks_els(__TopXMLNS, __Opts, _els, Task).

encode_sasl2_tasks(Task, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = lists:reverse('encode_sasl2_tasks_$task'(Task,
                                                    __NewTopXMLNS,
                                                    [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"tasks">>, _attrs, _els}.

'encode_sasl2_tasks_$task'([], __TopXMLNS, _acc) ->
    _acc;
'encode_sasl2_tasks_$task'([Task | _els], __TopXMLNS,
                           _acc) ->
    'encode_sasl2_tasks_$task'(_els,
                               __TopXMLNS,
                               [encode_sasl2_task(Task, __TopXMLNS) | _acc]).

decode_sasl2_continue(__TopXMLNS, __Opts,
                      {xmlel, <<"continue">>, _attrs, _els}) ->
    {Additional_data, Tasks, Text, __Els} =
        decode_sasl2_continue_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  undefined,
                                  undefined,
                                  undefined,
                                  []),
    {sasl2_continue, Additional_data, Text, Tasks, __Els}.

decode_sasl2_continue_els(__TopXMLNS, __Opts, [],
                          Additional_data, Tasks, Text, __Els) ->
    {Additional_data, Tasks, Text, lists:reverse(__Els)};
decode_sasl2_continue_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"additional-data">>, _attrs, _} = _el
                           | _els],
                          Additional_data, Tasks, Text, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_continue_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      decode_sasl2_additional_data(<<"urn:xmpp:sasl:2">>,
                                                                   __Opts,
                                                                   _el),
                                      Tasks,
                                      Text,
                                      __Els);
        _ ->
            decode_sasl2_continue_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Additional_data,
                                      Tasks,
                                      Text,
                                      [_el | __Els])
    end;
decode_sasl2_continue_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"text">>, _attrs, _} = _el | _els],
                          Additional_data, Tasks, Text, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_continue_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Additional_data,
                                      Tasks,
                                      decode_sasl2_text(<<"urn:xmpp:sasl:2">>,
                                                        __Opts,
                                                        _el),
                                      __Els);
        _ ->
            decode_sasl2_continue_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Additional_data,
                                      Tasks,
                                      Text,
                                      [_el | __Els])
    end;
decode_sasl2_continue_els(__TopXMLNS, __Opts,
                          [{xmlel, <<"tasks">>, _attrs, _} = _el | _els],
                          Additional_data, Tasks, Text, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_continue_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Additional_data,
                                      decode_sasl2_tasks(<<"urn:xmpp:sasl:2">>,
                                                         __Opts,
                                                         _el),
                                      Text,
                                      __Els);
        _ ->
            decode_sasl2_continue_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Additional_data,
                                      Tasks,
                                      Text,
                                      [_el | __Els])
    end;
decode_sasl2_continue_els(__TopXMLNS, __Opts,
                          [{xmlel, _name, _attrs, _} = _el | _els],
                          Additional_data, Tasks, Text, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_sasl2_continue_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Additional_data,
                                      Tasks,
                                      Text,
                                      [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_sasl2_continue_els(__TopXMLNS,
                                              __Opts,
                                              _els,
                                              Additional_data,
                                              Tasks,
                                              Text,
                                              [_el | __Els]);
                Mod ->
                    decode_sasl2_continue_els(__TopXMLNS,
                                              __Opts,
                                              _els,
                                              Additional_data,
                                              Tasks,
                                              Text,
                                              [Mod:do_decode(_name,
                                                             __XMLNS,
                                                             _el,
                                                             __Opts)
                                               | __Els])
            end
    end;
decode_sasl2_continue_els(__TopXMLNS, __Opts,
                          [_ | _els], Additional_data, Tasks, Text, __Els) ->
    decode_sasl2_continue_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Additional_data,
                              Tasks,
                              Text,
                              __Els).

encode_sasl2_continue({sasl2_continue,
                       Additional_data,
                       Text,
                       Tasks,
                       __Els},
                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_sasl2_continue_$additional_data'(Additional_data,
                                                                      __NewTopXMLNS,
                                                                      'encode_sasl2_continue_$tasks'(Tasks,
                                                                                                     __NewTopXMLNS,
                                                                                                     'encode_sasl2_continue_$text'(Text,
                                                                                                                                   __NewTopXMLNS,
                                                                                                                                   [])))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"continue">>, _attrs, _els}.

'encode_sasl2_continue_$additional_data'(undefined,
                                         __TopXMLNS, _acc) ->
    _acc;
'encode_sasl2_continue_$additional_data'(Additional_data,
                                         __TopXMLNS, _acc) ->
    [encode_sasl2_additional_data(Additional_data,
                                  __TopXMLNS)
     | _acc].

'encode_sasl2_continue_$tasks'(undefined, __TopXMLNS,
                               _acc) ->
    _acc;
'encode_sasl2_continue_$tasks'(Tasks, __TopXMLNS,
                               _acc) ->
    [encode_sasl2_tasks(Tasks, __TopXMLNS) | _acc].

'encode_sasl2_continue_$text'(undefined, __TopXMLNS,
                              _acc) ->
    _acc;
'encode_sasl2_continue_$text'(Text, __TopXMLNS, _acc) ->
    [encode_sasl2_text(Text, __TopXMLNS) | _acc].

decode_sasl2_text(__TopXMLNS, __Opts,
                  {xmlel, <<"text">>, _attrs, _els}) ->
    Cdata = decode_sasl2_text_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  <<>>),
    Cdata.

decode_sasl2_text_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_sasl2_text_cdata(__TopXMLNS, Cdata);
decode_sasl2_text_els(__TopXMLNS, __Opts,
                      [{xmlcdata, _data} | _els], Cdata) ->
    decode_sasl2_text_els(__TopXMLNS,
                          __Opts,
                          _els,
                          <<Cdata/binary, _data/binary>>);
decode_sasl2_text_els(__TopXMLNS, __Opts, [_ | _els],
                      Cdata) ->
    decode_sasl2_text_els(__TopXMLNS, __Opts, _els, Cdata).

encode_sasl2_text(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_text_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"text">>, _attrs, _els}.

decode_sasl2_text_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl2_text_cdata(__TopXMLNS, _val) -> _val.

encode_sasl2_text_cdata(<<>>, _acc) -> _acc;
encode_sasl2_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_sasl2_failure(__TopXMLNS, __Opts,
                     {xmlel, <<"failure">>, _attrs, _els}) ->
    {Text, Reason, __Els} =
        decode_sasl2_failure_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 undefined,
                                 undefined,
                                 []),
    {sasl2_failure, Reason, Text, __Els}.

decode_sasl2_failure_els(__TopXMLNS, __Opts, [], Text,
                         Reason, __Els) ->
    {Text, Reason, lists:reverse(__Els)};
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     decode_sasl2_text(<<"urn:xmpp:sasl:2">>,
                                                       __Opts,
                                                       _el),
                                     Reason,
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"aborted">>, _attrs, _} = _el | _els], Text,
                         Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_aborted(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                         __Opts,
                                                                         _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"account-disabled">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_account_disabled(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                  __Opts,
                                                                                  _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"credentials-expired">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_credentials_expired(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                     __Opts,
                                                                                     _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"encryption-required">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_encryption_required(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                     __Opts,
                                                                                     _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"incorrect-encoding">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_incorrect_encoding(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                    __Opts,
                                                                                    _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"invalid-authzid">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_invalid_authzid(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                 __Opts,
                                                                                 _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"invalid-mechanism">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_invalid_mechanism(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                   __Opts,
                                                                                   _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"malformed-request">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_malformed_request(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                   __Opts,
                                                                                   _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"mechanism-too-weak">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_mechanism_too_weak(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                    __Opts,
                                                                                    _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"not-authorized">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                __Opts,
                                                                                _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"bad-protocol">>, _attrs, _} = _el | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_bad_protocol(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                              __Opts,
                                                                              _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"temporary-auth-failure">>, _attrs, _} = _el
                          | _els],
                         Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     rfc6120:decode_sasl_failure_temporary_auth_failure(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
                                                                                        __Opts,
                                                                                        _el),
                                     __Els);
        _ ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els])
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts,
                         [{xmlel, _name, _attrs, _} = _el | _els], Text, Reason,
                         __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_sasl2_failure_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text,
                                     Reason,
                                     [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_sasl2_failure_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             Text,
                                             Reason,
                                             [_el | __Els]);
                Mod ->
                    decode_sasl2_failure_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             Text,
                                             Reason,
                                             [Mod:do_decode(_name,
                                                            __XMLNS,
                                                            _el,
                                                            __Opts)
                                              | __Els])
            end
    end;
decode_sasl2_failure_els(__TopXMLNS, __Opts, [_ | _els],
                         Text, Reason, __Els) ->
    decode_sasl2_failure_els(__TopXMLNS,
                             __Opts,
                             _els,
                             Text,
                             Reason,
                             __Els).

encode_sasl2_failure({sasl2_failure,
                      Reason,
                      Text,
                      __Els},
                     __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_sasl2_failure_$text'(Text,
                                                          __NewTopXMLNS,
                                                          'encode_sasl2_failure_$reason'(Reason,
                                                                                         __NewTopXMLNS,
                                                                                         []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"failure">>, _attrs, _els}.

'encode_sasl2_failure_$text'(undefined, __TopXMLNS,
                             _acc) ->
    _acc;
'encode_sasl2_failure_$text'(Text, __TopXMLNS, _acc) ->
    [encode_sasl2_text(Text, __TopXMLNS) | _acc].

'encode_sasl2_failure_$reason'(undefined, __TopXMLNS,
                               _acc) ->
    _acc;
'encode_sasl2_failure_$reason'(aborted = Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_aborted(Reason, __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('account-disabled' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_account_disabled(Reason,
                                                  __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('credentials-expired' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_credentials_expired(Reason,
                                                     __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('encryption-required' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_encryption_required(Reason,
                                                     __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('incorrect-encoding' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_incorrect_encoding(Reason,
                                                    __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('invalid-authzid' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_invalid_authzid(Reason,
                                                 __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('invalid-mechanism' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_invalid_mechanism(Reason,
                                                   __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('malformed-request' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_malformed_request(Reason,
                                                   __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('mechanism-too-weak' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_mechanism_too_weak(Reason,
                                                    __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('not-authorized' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_not_authorized(Reason,
                                                __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('bad-protocol' = Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_bad_protocol(Reason,
                                              __TopXMLNS)
     | _acc];
'encode_sasl2_failure_$reason'('temporary-auth-failure' =
                                   Reason,
                               __TopXMLNS, _acc) ->
    [rfc6120:encode_sasl_failure_temporary_auth_failure(Reason,
                                                        __TopXMLNS)
     | _acc].

decode_sasl2_authorization_identifier(__TopXMLNS,
                                      __Opts,
                                      {xmlel,
                                       <<"authorization-identifier">>,
                                       _attrs,
                                       _els}) ->
    Jid =
        decode_sasl2_authorization_identifier_els(__TopXMLNS,
                                                  __Opts,
                                                  _els,
                                                  <<>>),
    Jid.

decode_sasl2_authorization_identifier_els(__TopXMLNS,
                                          __Opts, [], Jid) ->
    decode_sasl2_authorization_identifier_cdata(__TopXMLNS,
                                                Jid);
decode_sasl2_authorization_identifier_els(__TopXMLNS,
                                          __Opts, [{xmlcdata, _data} | _els],
                                          Jid) ->
    decode_sasl2_authorization_identifier_els(__TopXMLNS,
                                              __Opts,
                                              _els,
                                              <<Jid/binary, _data/binary>>);
decode_sasl2_authorization_identifier_els(__TopXMLNS,
                                          __Opts, [_ | _els], Jid) ->
    decode_sasl2_authorization_identifier_els(__TopXMLNS,
                                              __Opts,
                                              _els,
                                              Jid).

encode_sasl2_authorization_identifier(Jid,
                                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_authorization_identifier_cdata(Jid,
                                                       []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"authorization-identifier">>, _attrs, _els}.

decode_sasl2_authorization_identifier_cdata(__TopXMLNS,
                                            <<>>) ->
    erlang:error({xmpp_codec,
                  {missing_cdata,
                   <<>>,
                   <<"authorization-identifier">>,
                   __TopXMLNS}});
decode_sasl2_authorization_identifier_cdata(__TopXMLNS,
                                            _val) ->
    case catch jid:decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value,
                           <<>>,
                           <<"authorization-identifier">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_sasl2_authorization_identifier_cdata(_val,
                                            _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].

decode_sasl2_additional_data(__TopXMLNS, __Opts,
                             {xmlel, <<"additional-data">>, _attrs, _els}) ->
    Text = decode_sasl2_additional_data_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            <<>>),
    Text.

decode_sasl2_additional_data_els(__TopXMLNS, __Opts, [],
                                 Text) ->
    decode_sasl2_additional_data_cdata(__TopXMLNS, Text);
decode_sasl2_additional_data_els(__TopXMLNS, __Opts,
                                 [{xmlcdata, _data} | _els], Text) ->
    decode_sasl2_additional_data_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     <<Text/binary, _data/binary>>);
decode_sasl2_additional_data_els(__TopXMLNS, __Opts,
                                 [_ | _els], Text) ->
    decode_sasl2_additional_data_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Text).

encode_sasl2_additional_data(Text, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_additional_data_cdata(Text, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"additional-data">>, _attrs, _els}.

decode_sasl2_additional_data_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_sasl2_additional_data_cdata(__TopXMLNS, _val) ->
    case catch base64:mime_decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value,
                           <<>>,
                           <<"additional-data">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_sasl2_additional_data_cdata(<<>>, _acc) -> _acc;
encode_sasl2_additional_data_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_sasl2_success(__TopXMLNS, __Opts,
                     {xmlel, <<"success">>, _attrs, _els}) ->
    {Additional_data, Jid, __Els} =
        decode_sasl2_success_els(__TopXMLNS,
                                 __Opts,
                                 _els,
                                 undefined,
                                 error,
                                 []),
    {sasl2_success, Jid, Additional_data, __Els}.

decode_sasl2_success_els(__TopXMLNS, __Opts, [],
                         Additional_data, Jid, __Els) ->
    {Additional_data,
     case Jid of
         error ->
             erlang:error({xmpp_codec,
                           {missing_tag,
                            <<"authorization-identifier">>,
                            __TopXMLNS}});
         {value, Jid1} -> Jid1
     end,
     lists:reverse(__Els)};
decode_sasl2_success_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"additional-data">>, _attrs, _} = _el
                          | _els],
                         Additional_data, Jid, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_success_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     decode_sasl2_additional_data(<<"urn:xmpp:sasl:2">>,
                                                                  __Opts,
                                                                  _el),
                                     Jid,
                                     __Els);
        _ ->
            decode_sasl2_success_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Additional_data,
                                     Jid,
                                     [_el | __Els])
    end;
decode_sasl2_success_els(__TopXMLNS, __Opts,
                         [{xmlel, <<"authorization-identifier">>, _attrs, _} =
                              _el
                          | _els],
                         Additional_data, Jid, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_success_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Additional_data,
                                     {value,
                                      decode_sasl2_authorization_identifier(<<"urn:xmpp:sasl:2">>,
                                                                            __Opts,
                                                                            _el)},
                                     __Els);
        _ ->
            decode_sasl2_success_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Additional_data,
                                     Jid,
                                     [_el | __Els])
    end;
decode_sasl2_success_els(__TopXMLNS, __Opts,
                         [{xmlel, _name, _attrs, _} = _el | _els],
                         Additional_data, Jid, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_sasl2_success_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     Additional_data,
                                     Jid,
                                     [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_sasl2_success_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             Additional_data,
                                             Jid,
                                             [_el | __Els]);
                Mod ->
                    decode_sasl2_success_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             Additional_data,
                                             Jid,
                                             [Mod:do_decode(_name,
                                                            __XMLNS,
                                                            _el,
                                                            __Opts)
                                              | __Els])
            end
    end;
decode_sasl2_success_els(__TopXMLNS, __Opts, [_ | _els],
                         Additional_data, Jid, __Els) ->
    decode_sasl2_success_els(__TopXMLNS,
                             __Opts,
                             _els,
                             Additional_data,
                             Jid,
                             __Els).

encode_sasl2_success({sasl2_success,
                      Jid,
                      Additional_data,
                      __Els},
                     __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_sasl2_success_$additional_data'(Additional_data,
                                                                     __NewTopXMLNS,
                                                                     'encode_sasl2_success_$jid'(Jid,
                                                                                                 __NewTopXMLNS,
                                                                                                 []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"success">>, _attrs, _els}.

'encode_sasl2_success_$additional_data'(undefined,
                                        __TopXMLNS, _acc) ->
    _acc;
'encode_sasl2_success_$additional_data'(Additional_data,
                                        __TopXMLNS, _acc) ->
    [encode_sasl2_additional_data(Additional_data,
                                  __TopXMLNS)
     | _acc].

'encode_sasl2_success_$jid'(Jid, __TopXMLNS, _acc) ->
    [encode_sasl2_authorization_identifier(Jid, __TopXMLNS)
     | _acc].

decode_sasl2_response(__TopXMLNS, __Opts,
                      {xmlel, <<"response">>, _attrs, _els}) ->
    Text = decode_sasl2_response_els(__TopXMLNS,
                                     __Opts,
                                     _els,
                                     <<>>),
    {sasl2_response, Text}.

decode_sasl2_response_els(__TopXMLNS, __Opts, [],
                          Text) ->
    decode_sasl2_response_cdata(__TopXMLNS, Text);
decode_sasl2_response_els(__TopXMLNS, __Opts,
                          [{xmlcdata, _data} | _els], Text) ->
    decode_sasl2_response_els(__TopXMLNS,
                              __Opts,
                              _els,
                              <<Text/binary, _data/binary>>);
decode_sasl2_response_els(__TopXMLNS, __Opts,
                          [_ | _els], Text) ->
    decode_sasl2_response_els(__TopXMLNS,
                              __Opts,
                              _els,
                              Text).

encode_sasl2_response({sasl2_response, Text},
                      __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_response_cdata(Text, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"response">>, _attrs, _els}.

decode_sasl2_response_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl2_response_cdata(__TopXMLNS, _val) ->
    case catch base64:mime_decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value, <<>>, <<"response">>, __TopXMLNS}});
        _res -> _res
    end.

encode_sasl2_response_cdata(<<>>, _acc) -> _acc;
encode_sasl2_response_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_sasl2_challenge(__TopXMLNS, __Opts,
                       {xmlel, <<"challenge">>, _attrs, _els}) ->
    Text = decode_sasl2_challenge_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      <<>>),
    {sasl2_challenge, Text}.

decode_sasl2_challenge_els(__TopXMLNS, __Opts, [],
                           Text) ->
    decode_sasl2_challenge_cdata(__TopXMLNS, Text);
decode_sasl2_challenge_els(__TopXMLNS, __Opts,
                           [{xmlcdata, _data} | _els], Text) ->
    decode_sasl2_challenge_els(__TopXMLNS,
                               __Opts,
                               _els,
                               <<Text/binary, _data/binary>>);
decode_sasl2_challenge_els(__TopXMLNS, __Opts,
                           [_ | _els], Text) ->
    decode_sasl2_challenge_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Text).

encode_sasl2_challenge({sasl2_challenge, Text},
                       __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_challenge_cdata(Text, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"challenge">>, _attrs, _els}.

decode_sasl2_challenge_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl2_challenge_cdata(__TopXMLNS, _val) ->
    case catch base64:mime_decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value,
                           <<>>,
                           <<"challenge">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_sasl2_challenge_cdata(<<>>, _acc) -> _acc;
encode_sasl2_challenge_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_sasl2_user_agent_device(__TopXMLNS, __Opts,
                               {xmlel, <<"device">>, _attrs, _els}) ->
    Cdata = decode_sasl2_user_agent_device_els(__TopXMLNS,
                                               __Opts,
                                               _els,
                                               <<>>),
    Cdata.

decode_sasl2_user_agent_device_els(__TopXMLNS, __Opts,
                                   [], Cdata) ->
    decode_sasl2_user_agent_device_cdata(__TopXMLNS, Cdata);
decode_sasl2_user_agent_device_els(__TopXMLNS, __Opts,
                                   [{xmlcdata, _data} | _els], Cdata) ->
    decode_sasl2_user_agent_device_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       <<Cdata/binary, _data/binary>>);
decode_sasl2_user_agent_device_els(__TopXMLNS, __Opts,
                                   [_ | _els], Cdata) ->
    decode_sasl2_user_agent_device_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       Cdata).

encode_sasl2_user_agent_device(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_user_agent_device_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"device">>, _attrs, _els}.

decode_sasl2_user_agent_device_cdata(__TopXMLNS,
                                     <<>>) ->
    <<>>;
decode_sasl2_user_agent_device_cdata(__TopXMLNS,
                                     _val) ->
    _val.

encode_sasl2_user_agent_device_cdata(<<>>, _acc) ->
    _acc;
encode_sasl2_user_agent_device_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_sasl2_user_agent_software(__TopXMLNS, __Opts,
                                 {xmlel, <<"software">>, _attrs, _els}) ->
    Cdata = decode_sasl2_user_agent_software_els(__TopXMLNS,
                                                 __Opts,
                                                 _els,
                                                 <<>>),
    Cdata.

decode_sasl2_user_agent_software_els(__TopXMLNS, __Opts,
                                     [], Cdata) ->
    decode_sasl2_user_agent_software_cdata(__TopXMLNS,
                                           Cdata);
decode_sasl2_user_agent_software_els(__TopXMLNS, __Opts,
                                     [{xmlcdata, _data} | _els], Cdata) ->
    decode_sasl2_user_agent_software_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         <<Cdata/binary, _data/binary>>);
decode_sasl2_user_agent_software_els(__TopXMLNS, __Opts,
                                     [_ | _els], Cdata) ->
    decode_sasl2_user_agent_software_els(__TopXMLNS,
                                         __Opts,
                                         _els,
                                         Cdata).

encode_sasl2_user_agent_software(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_user_agent_software_cdata(Cdata,
                                                  []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"software">>, _attrs, _els}.

decode_sasl2_user_agent_software_cdata(__TopXMLNS,
                                       <<>>) ->
    <<>>;
decode_sasl2_user_agent_software_cdata(__TopXMLNS,
                                       _val) ->
    _val.

encode_sasl2_user_agent_software_cdata(<<>>, _acc) ->
    _acc;
encode_sasl2_user_agent_software_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_sasl2_user_agent(__TopXMLNS, __Opts,
                        {xmlel, <<"user-agent">>, _attrs, _els}) ->
    {Device, Software} =
        decode_sasl2_user_agent_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    undefined,
                                    undefined),
    Id = decode_sasl2_user_agent_attrs(__TopXMLNS,
                                       _attrs,
                                       undefined),
    {sasl2_user_agent, Id, Software, Device}.

decode_sasl2_user_agent_els(__TopXMLNS, __Opts, [],
                            Device, Software) ->
    {Device, Software};
decode_sasl2_user_agent_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"software">>, _attrs, _} = _el | _els],
                            Device, Software) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_user_agent_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Device,
                                        decode_sasl2_user_agent_software(<<"urn:xmpp:sasl:2">>,
                                                                         __Opts,
                                                                         _el));
        _ ->
            decode_sasl2_user_agent_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Device,
                                        Software)
    end;
decode_sasl2_user_agent_els(__TopXMLNS, __Opts,
                            [{xmlel, <<"device">>, _attrs, _} = _el | _els],
                            Device, Software) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_user_agent_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        decode_sasl2_user_agent_device(<<"urn:xmpp:sasl:2">>,
                                                                       __Opts,
                                                                       _el),
                                        Software);
        _ ->
            decode_sasl2_user_agent_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        Device,
                                        Software)
    end;
decode_sasl2_user_agent_els(__TopXMLNS, __Opts,
                            [_ | _els], Device, Software) ->
    decode_sasl2_user_agent_els(__TopXMLNS,
                                __Opts,
                                _els,
                                Device,
                                Software).

decode_sasl2_user_agent_attrs(__TopXMLNS,
                              [{<<"id">>, _val} | _attrs], _Id) ->
    decode_sasl2_user_agent_attrs(__TopXMLNS, _attrs, _val);
decode_sasl2_user_agent_attrs(__TopXMLNS, [_ | _attrs],
                              Id) ->
    decode_sasl2_user_agent_attrs(__TopXMLNS, _attrs, Id);
decode_sasl2_user_agent_attrs(__TopXMLNS, [], Id) ->
    decode_sasl2_user_agent_attr_id(__TopXMLNS, Id).

encode_sasl2_user_agent({sasl2_user_agent,
                         Id,
                         Software,
                         Device},
                        __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els =
        lists:reverse('encode_sasl2_user_agent_$device'(Device,
                                                        __NewTopXMLNS,
                                                        'encode_sasl2_user_agent_$software'(Software,
                                                                                            __NewTopXMLNS,
                                                                                            []))),
    _attrs = encode_sasl2_user_agent_attr_id(Id,
                                             xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                        __TopXMLNS)),
    {xmlel, <<"user-agent">>, _attrs, _els}.

'encode_sasl2_user_agent_$device'(undefined, __TopXMLNS,
                                  _acc) ->
    _acc;
'encode_sasl2_user_agent_$device'(Device, __TopXMLNS,
                                  _acc) ->
    [encode_sasl2_user_agent_device(Device, __TopXMLNS)
     | _acc].

'encode_sasl2_user_agent_$software'(undefined,
                                    __TopXMLNS, _acc) ->
    _acc;
'encode_sasl2_user_agent_$software'(Software,
                                    __TopXMLNS, _acc) ->
    [encode_sasl2_user_agent_software(Software, __TopXMLNS)
     | _acc].

decode_sasl2_user_agent_attr_id(__TopXMLNS,
                                undefined) ->
    <<>>;
decode_sasl2_user_agent_attr_id(__TopXMLNS, _val) ->
    _val.

encode_sasl2_user_agent_attr_id(<<>>, _acc) -> _acc;
encode_sasl2_user_agent_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_sasl2_initial_response(__TopXMLNS, __Opts,
                              {xmlel, <<"initial-response">>, _attrs, _els}) ->
    Text = decode_sasl2_initial_response_els(__TopXMLNS,
                                             __Opts,
                                             _els,
                                             <<>>),
    Text.

decode_sasl2_initial_response_els(__TopXMLNS, __Opts,
                                  [], Text) ->
    decode_sasl2_initial_response_cdata(__TopXMLNS, Text);
decode_sasl2_initial_response_els(__TopXMLNS, __Opts,
                                  [{xmlcdata, _data} | _els], Text) ->
    decode_sasl2_initial_response_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      <<Text/binary, _data/binary>>);
decode_sasl2_initial_response_els(__TopXMLNS, __Opts,
                                  [_ | _els], Text) ->
    decode_sasl2_initial_response_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      Text).

encode_sasl2_initial_response(Text, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_initial_response_cdata(Text, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"initial-response">>, _attrs, _els}.

decode_sasl2_initial_response_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_sasl2_initial_response_cdata(__TopXMLNS, _val) ->
    case catch base64:mime_decode(_val) of
        {'EXIT', _} ->
            erlang:error({xmpp_codec,
                          {bad_cdata_value,
                           <<>>,
                           <<"initial-response">>,
                           __TopXMLNS}});
        _res -> _res
    end.

encode_sasl2_initial_response_cdata(<<>>, _acc) -> _acc;
encode_sasl2_initial_response_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_sasl2_authenticate(__TopXMLNS, __Opts,
                          {xmlel, <<"authenticate">>, _attrs, _els}) ->
    {User_agent, Initial_response, __Els} =
        decode_sasl2_authenticate_els(__TopXMLNS,
                                      __Opts,
                                      _els,
                                      undefined,
                                      undefined,
                                      []),
    Mechanism = decode_sasl2_authenticate_attrs(__TopXMLNS,
                                                _attrs,
                                                undefined),
    {sasl2_authenticate,
     Mechanism,
     Initial_response,
     User_agent,
     __Els}.

decode_sasl2_authenticate_els(__TopXMLNS, __Opts, [],
                              User_agent, Initial_response, __Els) ->
    {User_agent, Initial_response, lists:reverse(__Els)};
decode_sasl2_authenticate_els(__TopXMLNS, __Opts,
                              [{xmlel, <<"initial-response">>, _attrs, _} = _el
                               | _els],
                              User_agent, Initial_response, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_authenticate_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          User_agent,
                                          decode_sasl2_initial_response(<<"urn:xmpp:sasl:2">>,
                                                                        __Opts,
                                                                        _el),
                                          __Els);
        _ ->
            decode_sasl2_authenticate_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          User_agent,
                                          Initial_response,
                                          [_el | __Els])
    end;
decode_sasl2_authenticate_els(__TopXMLNS, __Opts,
                              [{xmlel, <<"user-agent">>, _attrs, _} = _el
                               | _els],
                              User_agent, Initial_response, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_authenticate_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          decode_sasl2_user_agent(<<"urn:xmpp:sasl:2">>,
                                                                  __Opts,
                                                                  _el),
                                          Initial_response,
                                          __Els);
        _ ->
            decode_sasl2_authenticate_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          User_agent,
                                          Initial_response,
                                          [_el | __Els])
    end;
decode_sasl2_authenticate_els(__TopXMLNS, __Opts,
                              [{xmlel, _name, _attrs, _} = _el | _els],
                              User_agent, Initial_response, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_sasl2_authenticate_els(__TopXMLNS,
                                          __Opts,
                                          _els,
                                          User_agent,
                                          Initial_response,
                                          [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_sasl2_authenticate_els(__TopXMLNS,
                                                  __Opts,
                                                  _els,
                                                  User_agent,
                                                  Initial_response,
                                                  [_el | __Els]);
                Mod ->
                    decode_sasl2_authenticate_els(__TopXMLNS,
                                                  __Opts,
                                                  _els,
                                                  User_agent,
                                                  Initial_response,
                                                  [Mod:do_decode(_name,
                                                                 __XMLNS,
                                                                 _el,
                                                                 __Opts)
                                                   | __Els])
            end
    end;
decode_sasl2_authenticate_els(__TopXMLNS, __Opts,
                              [_ | _els], User_agent, Initial_response,
                              __Els) ->
    decode_sasl2_authenticate_els(__TopXMLNS,
                                  __Opts,
                                  _els,
                                  User_agent,
                                  Initial_response,
                                  __Els).

decode_sasl2_authenticate_attrs(__TopXMLNS,
                                [{<<"mechanism">>, _val} | _attrs],
                                _Mechanism) ->
    decode_sasl2_authenticate_attrs(__TopXMLNS,
                                    _attrs,
                                    _val);
decode_sasl2_authenticate_attrs(__TopXMLNS,
                                [_ | _attrs], Mechanism) ->
    decode_sasl2_authenticate_attrs(__TopXMLNS,
                                    _attrs,
                                    Mechanism);
decode_sasl2_authenticate_attrs(__TopXMLNS, [],
                                Mechanism) ->
    decode_sasl2_authenticate_attr_mechanism(__TopXMLNS,
                                             Mechanism).

encode_sasl2_authenticate({sasl2_authenticate,
                           Mechanism,
                           Initial_response,
                           User_agent,
                           __Els},
                          __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_sasl2_authenticate_$user_agent'(User_agent,
                                                                     __NewTopXMLNS,
                                                                     'encode_sasl2_authenticate_$initial_response'(Initial_response,
                                                                                                                   __NewTopXMLNS,
                                                                                                                   []))),
    _attrs =
        encode_sasl2_authenticate_attr_mechanism(Mechanism,
                                                 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                            __TopXMLNS)),
    {xmlel, <<"authenticate">>, _attrs, _els}.

'encode_sasl2_authenticate_$user_agent'(undefined,
                                        __TopXMLNS, _acc) ->
    _acc;
'encode_sasl2_authenticate_$user_agent'(User_agent,
                                        __TopXMLNS, _acc) ->
    [encode_sasl2_user_agent(User_agent, __TopXMLNS)
     | _acc].

'encode_sasl2_authenticate_$initial_response'(undefined,
                                              __TopXMLNS, _acc) ->
    _acc;
'encode_sasl2_authenticate_$initial_response'(Initial_response,
                                              __TopXMLNS, _acc) ->
    [encode_sasl2_initial_response(Initial_response,
                                   __TopXMLNS)
     | _acc].

decode_sasl2_authenticate_attr_mechanism(__TopXMLNS,
                                         undefined) ->
    erlang:error({xmpp_codec,
                  {missing_attr,
                   <<"mechanism">>,
                   <<"authenticate">>,
                   __TopXMLNS}});
decode_sasl2_authenticate_attr_mechanism(__TopXMLNS,
                                         _val) ->
    _val.

encode_sasl2_authenticate_attr_mechanism(_val, _acc) ->
    [{<<"mechanism">>, _val} | _acc].

decode_sasl2_inline(__TopXMLNS, __Opts,
                    {xmlel, <<"inline">>, _attrs, _els}) ->
    __Els = decode_sasl2_inline_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    []),
    __Els.

decode_sasl2_inline_els(__TopXMLNS, __Opts, [],
                        __Els) ->
    lists:reverse(__Els);
decode_sasl2_inline_els(__TopXMLNS, __Opts,
                        [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_sasl2_inline_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_sasl2_inline_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            [_el | __Els]);
                Mod ->
                    decode_sasl2_inline_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            [Mod:do_decode(_name,
                                                           __XMLNS,
                                                           _el,
                                                           __Opts)
                                             | __Els])
            end
    end;
decode_sasl2_inline_els(__TopXMLNS, __Opts, [_ | _els],
                        __Els) ->
    decode_sasl2_inline_els(__TopXMLNS,
                            __Opts,
                            _els,
                            __Els).

encode_sasl2_inline(__Els, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"inline">>, _attrs, _els}.

decode_sasl2_mechanism(__TopXMLNS, __Opts,
                       {xmlel, <<"mechanism">>, _attrs, _els}) ->
    Cdata = decode_sasl2_mechanism_els(__TopXMLNS,
                                       __Opts,
                                       _els,
                                       <<>>),
    Cdata.

decode_sasl2_mechanism_els(__TopXMLNS, __Opts, [],
                           Cdata) ->
    decode_sasl2_mechanism_cdata(__TopXMLNS, Cdata);
decode_sasl2_mechanism_els(__TopXMLNS, __Opts,
                           [{xmlcdata, _data} | _els], Cdata) ->
    decode_sasl2_mechanism_els(__TopXMLNS,
                               __Opts,
                               _els,
                               <<Cdata/binary, _data/binary>>);
decode_sasl2_mechanism_els(__TopXMLNS, __Opts,
                           [_ | _els], Cdata) ->
    decode_sasl2_mechanism_els(__TopXMLNS,
                               __Opts,
                               _els,
                               Cdata).

encode_sasl2_mechanism(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = encode_sasl2_mechanism_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"mechanism">>, _attrs, _els}.

decode_sasl2_mechanism_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl2_mechanism_cdata(__TopXMLNS, _val) -> _val.

encode_sasl2_mechanism_cdata(<<>>, _acc) -> _acc;
encode_sasl2_mechanism_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_sasl2_authentication(__TopXMLNS, __Opts,
                            {xmlel, <<"authentication">>, _attrs, _els}) ->
    {Mechanisms, Inline, __Els} =
        decode_sasl2_authentication_els(__TopXMLNS,
                                        __Opts,
                                        _els,
                                        [],
                                        undefined,
                                        []),
    {sasl2_authenticaton, Mechanisms, Inline, __Els}.

decode_sasl2_authentication_els(__TopXMLNS, __Opts, [],
                                Mechanisms, Inline, __Els) ->
    {lists:reverse(Mechanisms),
     Inline,
     lists:reverse(__Els)};
decode_sasl2_authentication_els(__TopXMLNS, __Opts,
                                [{xmlel, <<"mechanism">>, _attrs, _} = _el
                                 | _els],
                                Mechanisms, Inline, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_authentication_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            [decode_sasl2_mechanism(<<"urn:xmpp:sasl:2">>,
                                                                    __Opts,
                                                                    _el)
                                             | Mechanisms],
                                            Inline,
                                            __Els);
        _ ->
            decode_sasl2_authentication_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Mechanisms,
                                            Inline,
                                            [_el | __Els])
    end;
decode_sasl2_authentication_els(__TopXMLNS, __Opts,
                                [{xmlel, <<"inline">>, _attrs, _} = _el | _els],
                                Mechanisms, Inline, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>,
                             _attrs,
                             __TopXMLNS)
        of
        <<"urn:xmpp:sasl:2">> ->
            decode_sasl2_authentication_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Mechanisms,
                                            decode_sasl2_inline(<<"urn:xmpp:sasl:2">>,
                                                                __Opts,
                                                                _el),
                                            __Els);
        _ ->
            decode_sasl2_authentication_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Mechanisms,
                                            Inline,
                                            [_el | __Els])
    end;
decode_sasl2_authentication_els(__TopXMLNS, __Opts,
                                [{xmlel, _name, _attrs, _} = _el | _els],
                                Mechanisms, Inline, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
        true ->
            decode_sasl2_authentication_els(__TopXMLNS,
                                            __Opts,
                                            _els,
                                            Mechanisms,
                                            Inline,
                                            [_el | __Els]);
        false ->
            __XMLNS = xmpp_codec:get_attr(<<"xmlns">>,
                                          _attrs,
                                          __TopXMLNS),
            case xmpp_codec:get_mod(_name, __XMLNS) of
                undefined ->
                    decode_sasl2_authentication_els(__TopXMLNS,
                                                    __Opts,
                                                    _els,
                                                    Mechanisms,
                                                    Inline,
                                                    [_el | __Els]);
                Mod ->
                    decode_sasl2_authentication_els(__TopXMLNS,
                                                    __Opts,
                                                    _els,
                                                    Mechanisms,
                                                    Inline,
                                                    [Mod:do_decode(_name,
                                                                   __XMLNS,
                                                                   _el,
                                                                   __Opts)
                                                     | __Els])
            end
    end;
decode_sasl2_authentication_els(__TopXMLNS, __Opts,
                                [_ | _els], Mechanisms, Inline, __Els) ->
    decode_sasl2_authentication_els(__TopXMLNS,
                                    __Opts,
                                    _els,
                                    Mechanisms,
                                    Inline,
                                    __Els).

encode_sasl2_authentication({sasl2_authenticaton,
                             Mechanisms,
                             Inline,
                             __Els},
                            __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"urn:xmpp:sasl:2">>,
                                    [],
                                    __TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
            || _el <- __Els]
               ++
               lists:reverse('encode_sasl2_authentication_$mechanisms'(Mechanisms,
                                                                       __NewTopXMLNS,
                                                                       'encode_sasl2_authentication_$inline'(Inline,
                                                                                                             __NewTopXMLNS,
                                                                                                             []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                        __TopXMLNS),
    {xmlel, <<"authentication">>, _attrs, _els}.

'encode_sasl2_authentication_$mechanisms'([],
                                          __TopXMLNS, _acc) ->
    _acc;
'encode_sasl2_authentication_$mechanisms'([Mechanisms
                                           | _els],
                                          __TopXMLNS, _acc) ->
    'encode_sasl2_authentication_$mechanisms'(_els,
                                              __TopXMLNS,
                                              [encode_sasl2_mechanism(Mechanisms,
                                                                      __TopXMLNS)
                                               | _acc]).

'encode_sasl2_authentication_$inline'(undefined,
                                      __TopXMLNS, _acc) ->
    _acc;
'encode_sasl2_authentication_$inline'(Inline,
                                      __TopXMLNS, _acc) ->
    [encode_sasl2_inline(Inline, __TopXMLNS) | _acc].
