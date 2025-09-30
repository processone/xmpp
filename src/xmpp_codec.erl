%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xmpp_codec).

-compile(export_all).

decode(El) -> decode(El, <<>>, []).

decode(El, Opts) -> decode(El, <<>>, Opts).

decode({xmlel, Name, Attrs, _} = El, TopXMLNS, Opts) ->
    XMLNS = get_attr(<<"xmlns">>, Attrs, TopXMLNS),
    case get_mod(Name, XMLNS) of
        undefined when XMLNS == <<>> ->
            erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
        undefined ->
            erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}});
        Mod -> Mod:do_decode(Name, XMLNS, El, Opts)
    end.

encode(El) -> encode(El, <<>>).

encode({xmlel, _, _, _} = El, _) -> El;
encode({xmlcdata, _} = CData, _) -> CData;
encode(El, TopXMLNS) ->
    Mod = get_mod(El),
    Mod:do_encode(El, TopXMLNS).


get_name(El) ->
    Mod = get_mod(El),
    Mod:do_get_name(El).

get_ns(El) ->
    Mod = get_mod(El),
    Mod:do_get_ns(El).

is_known_tag({xmlel, Name, Attrs, _}, TopXMLNS) ->
    XMLNS = get_attr(<<"xmlns">>, Attrs, TopXMLNS),
    get_mod(Name, XMLNS) /= undefined.

get_els(Term) ->
    Mod = get_mod(Term),
    Mod:get_els(Term).

set_els(Term, Els) ->
    Mod = get_mod(Term),
    Mod:set_els(Term, Els).

do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [].

register_module(Mod) ->
    register_module(Mod, xmpp_codec_external).

unregister_module(Mod) ->
    unregister_module(Mod, xmpp_codec_external).

format_error({bad_attr_value, Attr, Tag, XMLNS}) ->
    <<"Bad value of attribute '", Attr/binary, "' in tag <",
      Tag/binary, "/> qualified by namespace '", XMLNS/binary,
      "'">>;
format_error({bad_cdata_value, <<>>, Tag, XMLNS}) ->
    <<"Bad value of cdata in tag <", Tag/binary,
      "/> qualified by namespace '", XMLNS/binary, "'">>;
format_error({missing_tag, Tag, XMLNS}) ->
    <<"Missing tag <", Tag/binary,
      "/> qualified by namespace '", XMLNS/binary, "'">>;
format_error({missing_attr, Attr, Tag, XMLNS}) ->
    <<"Missing attribute '", Attr/binary, "' in tag <",
      Tag/binary, "/> qualified by namespace '", XMLNS/binary,
      "'">>;
format_error({missing_cdata, <<>>, Tag, XMLNS}) ->
    <<"Missing cdata in tag <", Tag/binary,
      "/> qualified by namespace '", XMLNS/binary, "'">>;
format_error({unknown_tag, Tag, XMLNS}) ->
    <<"Unknown tag <", Tag/binary,
      "/> qualified by namespace '", XMLNS/binary, "'">>;
format_error({missing_tag_xmlns, Tag}) ->
    <<"Missing namespace for tag <", Tag/binary, "/>">>.

io_format_error({bad_attr_value, Attr, Tag, XMLNS}) ->
    {<<"Bad value of attribute '~s' in tag <~s/> "
       "qualified by namespace '~s'">>,
     [Attr, Tag, XMLNS]};
io_format_error({bad_cdata_value, <<>>, Tag, XMLNS}) ->
    {<<"Bad value of cdata in tag <~s/> qualified "
       "by namespace '~s'">>,
     [Tag, XMLNS]};
io_format_error({missing_tag, Tag, XMLNS}) ->
    {<<"Missing tag <~s/> qualified by namespace "
       "'~s'">>,
     [Tag, XMLNS]};
io_format_error({missing_attr, Attr, Tag, XMLNS}) ->
    {<<"Missing attribute '~s' in tag <~s/> "
       "qualified by namespace '~s'">>,
     [Attr, Tag, XMLNS]};
io_format_error({missing_cdata, <<>>, Tag, XMLNS}) ->
    {<<"Missing cdata in tag <~s/> qualified "
       "by namespace '~s'">>,
     [Tag, XMLNS]};
io_format_error({unknown_tag, Tag, XMLNS}) ->
    {<<"Unknown tag <~s/> qualified by namespace "
       "'~s'">>,
     [Tag, XMLNS]};
io_format_error({missing_tag_xmlns, Tag}) ->
    {<<"Missing namespace for tag <~s/>">>, [Tag]}.

get_attr(Attr, Attrs, Default) ->
    case lists:keyfind(Attr, 1, Attrs) of
        {_, Val} -> Val;
        false -> Default
    end.

enc_xmlns_attrs(XMLNS, XMLNS) -> [];
enc_xmlns_attrs(XMLNS, _) -> [{<<"xmlns">>, XMLNS}].

choose_top_xmlns(<<>>, NSList, TopXMLNS) ->
    case lists:member(TopXMLNS, NSList) of
        true -> TopXMLNS;
        false -> hd(NSList)
    end;
choose_top_xmlns(XMLNS, _, _) -> XMLNS.

register_module(Mod, ResolverMod) ->
    MD5Sum = try Mod:module_info(md5) of
                 Val -> Val
             catch
                 error:badarg ->
                     {ok, {Mod, Val}} = beam_lib:md5(code:which(Mod)),
                     Val
             end,
    case orddict:find(Mod, ResolverMod:modules()) of
        {ok, MD5Sum} -> ok;
        _ ->
            Mods = orddict:store(Mod,
                                 MD5Sum,
                                 ResolverMod:modules()),
            recompile_resolver(Mods, ResolverMod)
    end.

unregister_module(Mod, ResolverMod) ->
    case orddict:find(Mod, ResolverMod:modules()) of
        {ok, _} ->
            Mods = orddict:erase(Mod, ResolverMod:modules()),
            recompile_resolver(Mods, ResolverMod);
        error -> ok
    end.

recompile_resolver(Mods, ResolverMod) ->
    Tags = lists:flatmap(fun (M) ->
                                 [{Name, XMLNS, M} || {Name, XMLNS} <- M:tags()]
                         end,
                         orddict:fetch_keys(Mods)),
    Records = lists:flatmap(fun (M) ->
                                    [{RecName, RecSize, M}
                                     || {RecName, RecSize} <- M:records()]
                            end,
                            orddict:fetch_keys(Mods)),
    Lookup1 = string:join(lists:map(fun ({RecName,
                                          RecSize,
                                          M}) ->
                                            io_lib:format("lookup({~s}) -> '~s'",
                                                          [string:join([io_lib:format("'~s'",
                                                                                      [RecName])
                                                                        | ["_"
                                                                           || _
                                                                                  <- lists:seq(1,
                                                                                               RecSize)]],
                                                                       ","),
                                                           M])
                                    end,
                                    Records)
                              ++
                              ["lookup(Term) -> erlang:error(badarg, "
                               "[Term])."],
                          ";" ++ io_lib:nl()),
    Lookup2 = string:join(lists:map(fun ({Name,
                                          XMLNS,
                                          M}) ->
                                            io_lib:format("lookup(~w, ~w) -> '~s'",
                                                          [Name, XMLNS, M])
                                    end,
                                    Tags)
                              ++ ["lookup(_, _) -> undefined."],
                          ";" ++ io_lib:nl()),
    Modules = io_lib:format("modules() -> [~s].",
                            [string:join([io_lib:format("{'~s', ~w}", [M, S])
                                          || {M, S} <- Mods],
                                         ",")]),
    Module = io_lib:format("-module(~s).", [ResolverMod]),
    Compile = "-compile(export_all).",
    Forms = lists:map(fun (Expr) ->
                              {ok, Tokens, _} =
                                  erl_scan:string(lists:flatten(Expr)),
                              {ok, Form} = erl_parse:parse_form(Tokens),
                              Form
                      end,
                      [Module, Compile, Modules, Lookup1, Lookup2]),
    {ok, Code} = case compile:forms(Forms, []) of
                     {ok, ResolverMod, Bin} -> {ok, Bin};
                     {ok, ResolverMod, Bin, _Warnings} -> {ok, Bin};
                     Error -> Error
                 end,
    {module, ResolverMod} = code:load_binary(ResolverMod,
                                             "nofile",
                                             Code),
    ok.

pp(xmlel, 3) -> [name, attrs, children];
pp(Name, Arity) ->
    try get_mod(erlang:make_tuple(Arity + 1,
                                  undefined,
                                  [{1, Name}]))
    of
        Mod -> Mod:pp(Name, Arity)
    catch
        error:badarg -> no
    end.

records() -> [].

get_mod(<<"status">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"priority">>,
        <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"failure">>,
        <<"urn:ietf:params:xml:ns:xmpp-tls">>) ->
    rfc6120;
get_mod(<<"max-items-exceeded">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"x">>, <<"jabber:x:conference">>) -> xep0249;
get_mod(<<"jid">>, <<"urn:xmpp:mam:1">>) -> xep0313;
get_mod(<<"never">>, <<"urn:xmpp:mam:0">>) -> xep0313;
get_mod(<<"tie-break">>,
        <<"urn:xmpp:jingle:errors:1">>) ->
    xep0166;
get_mod(<<"x509-challenge">>, <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"unsupported-version">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"stream:error">>, <<"jabber:client">>) ->
    rfc6120;
get_mod(<<"SORT-STRING">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"actor">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"last">>,
        <<"http://jabber.org/protocol/rsm">>) ->
    xep0059;
get_mod(<<"success">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"message">>, <<"jabber:iq:privacy">>) ->
    xep0016;
get_mod(<<"configuration-required">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"bidi">>, <<"urn:xmpp:features:bidi">>) ->
    xep0288;
get_mod(<<"gone">>, <<"urn:xmpp:jingle:1">>) -> xep0166;
get_mod(<<"error">>, <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"password">>, <<"jabber:iq:auth">>) ->
    xep0078;
get_mod(<<"TZ">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"content">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"nick">>, <<"storage:bookmarks">>) -> xep0048;
get_mod(<<"setup-failed">>,
        <<"http://jabber.org/protocol/compress">>) ->
    xep0138;
get_mod(<<"security-required">>,
        <<"urn:xmpp:jingle:errors:1">>) ->
    xep0166;
get_mod(<<"authentication">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"TYPE">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"query">>,
        <<"http://jabber.org/protocol/disco#items">>) ->
    xep0030;
get_mod(<<"channel">>, <<"urn:xmpp:mix:roster:0">>) ->
    xep0405;
get_mod(<<"KEYWORD">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"create">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"data">>,
        <<"http://jabber.org/protocol/ibb">>) ->
    xep0047;
get_mod(<<"query">>, <<"jabber:iq:roster">>) -> rfc6121;
get_mod(<<"NUMBER">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"notification">>, <<"urn:xmpp:push:0">>) ->
    xep0357;
get_mod(<<"retracted">>,
        <<"urn:xmpp:message-retract:0">>) ->
    xep0424;
get_mod(<<"gone">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"response">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"create">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"offline">>,
        <<"http://jabber.org/protocol/offline">>) ->
    xep0013;
get_mod(<<"actions">>,
        <<"http://jabber.org/protocol/commands">>) ->
    xep0050;
get_mod(<<"continue">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"mechanisms">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"query">>,
        <<"http://jabber.org/protocol/bytestreams">>) ->
    xep0065;
get_mod(<<"displayed">>, <<"jabber:x:event">>) ->
    xep0022;
get_mod(<<"start">>, <<"urn:xmpp:mam:tmp">>) -> xep0313;
get_mod(<<"general-error">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"external">>, <<"urn:xmpp:fasten:0">>) ->
    xep0422;
get_mod(<<"x">>, <<"vcard-temp:x:update">>) -> xep0153;
get_mod(<<"purge">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"with">>, <<"urn:xmpp:mam:tmp">>) -> xep0313;
get_mod(<<"address">>, <<"urn:xmpp:sic:0">>) -> xep0279;
get_mod(<<"mechanism">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"failure">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"PRIVATE">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"pubsub">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"tzo">>, <<"urn:xmpp:time">>) -> xep0202;
get_mod(<<"unsupported-info">>,
        <<"urn:xmpp:jingle:errors:1">>) ->
    xep0166;
get_mod(<<"query">>, <<"jabber:iq:version">>) ->
    xep0092;
get_mod(<<"archived">>, <<"urn:xmpp:mam:tmp">>) ->
    xep0313;
get_mod(<<"nick">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"next">>,
        <<"http://jabber.org/protocol/commands">>) ->
    xep0050;
get_mod(<<"x509-signature">>, <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"retract">>,
        <<"urn:xmpp:message-retract:1">>) ->
    xep0424;
get_mod(<<"subscription">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"subscriptions">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"prefs">>, <<"urn:xmpp:mam:1">>) -> xep0313;
get_mod(<<"sm">>, <<"urn:xmpp:sm:2">>) -> xep0198;
get_mod(<<"item">>, <<"jabber:iq:privacy">>) -> xep0016;
get_mod(<<"feature-not-implemented">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"subscription-required">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"resource">>,
        <<"urn:ietf:params:xml:ns:xmpp-bind">>) ->
    rfc6120;
get_mod(<<"compressed">>,
        <<"http://jabber.org/protocol/compress">>) ->
    xep0138;
get_mod(<<"instructions">>, <<"jabber:x:data">>) ->
    xep0004;
get_mod(<<"idle">>, <<"urn:xmpp:idle:1">>) -> xep0319;
get_mod(<<"retract">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"subscriptions">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"max-nodes-exceeded">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"delay">>, <<"urn:xmpp:delay">>) -> xep0203;
get_mod(<<"client-join">>, <<"urn:xmpp:mix:pam:0">>) ->
    xep0405;
get_mod(<<"first">>, <<"jabber:iq:search">>) -> xep0055;
get_mod(<<"request">>, <<"urn:xmpp:http:upload:0">>) ->
    xep0363;
get_mod(<<"authenticate">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"serverinfo">>,
        <<"urn:xmpp:serverinfo:0">>) ->
    xep0485;
get_mod(<<"conflict">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"password">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"city">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"remote-domain">>,
        <<"urn:xmpp:serverinfo:0">>) ->
    xep0485;
get_mod(<<"jid">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"query">>, <<"urn:xmpp:delegation:1">>) ->
    xep0355;
get_mod(<<"hash">>, <<"urn:xmpp:hashes:2">>) -> xep0300;
get_mod(<<"invalid-options">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"event">>, <<"urn:xmpp:mucsub:0">>) ->
    p1_mucsub;
get_mod(<<"query">>, <<"jabber:iq:search">>) -> xep0055;
get_mod(<<"content-type">>,
        <<"urn:xmpp:http:upload">>) ->
    xep0363;
get_mod(<<"stream:error">>, <<"jabber:server">>) ->
    rfc6120;
get_mod(<<"field">>, <<"jabber:x:data">>) -> xep0004;
get_mod(<<"unsubscribe">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"presence">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"configure">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"item">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"x">>, <<"jabber:x:oob">>) -> xep0066;
get_mod(<<"displayed">>,
        <<"urn:xmpp:chat-markers:0">>) ->
    xep0333;
get_mod(<<"delegate">>, <<"urn:xmpp:delegation:1">>) ->
    xep0355;
get_mod(<<"nick">>, <<"urn:xmpp:bookmarks:1">>) ->
    xep0402;
get_mod(<<"priority">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"configuration">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"create">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"enable">>, <<"urn:xmpp:sm:2">>) -> xep0198;
get_mod(<<"no-permanent-storage">>,
        <<"urn:xmpp:hints">>) ->
    xep0334;
get_mod(<<"unsupported-applications">>,
        <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"credentials-expired">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"not-authorized">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"processing-failed">>,
        <<"http://jabber.org/protocol/compress">>) ->
    xep0138;
get_mod(<<"address">>,
        <<"http://jabber.org/protocol/address">>) ->
    xep0033;
get_mod(<<"acknowledged">>,
        <<"urn:xmpp:chat-markers:0">>) ->
    xep0333;
get_mod(<<"unsupported-transports">>,
        <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"file-not-available">>,
        <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>) ->
    xep0234;
get_mod(<<"moderated">>,
        <<"urn:xmpp:message-moderate:1">>) ->
    xep0425;
get_mod(<<"c">>,
        <<"http://jabber.org/protocol/caps">>) ->
    xep0115;
get_mod(<<"resume">>, <<"urn:xmpp:sm:2">>) -> xep0198;
get_mod(<<"size">>, <<"urn:xmpp:http:upload">>) ->
    xep0363;
get_mod(<<"slot">>,
        <<"eu:siacs:conversations:http:upload">>) ->
    xep0363;
get_mod(<<"get">>, <<"urn:xmpp:http:upload:0">>) ->
    xep0363;
get_mod(<<"service">>, <<"urn:xmpp:extdisco:2">>) ->
    xep0215;
get_mod(<<"pointer">>,
        <<"urn:xmpp:avatar:metadata">>) ->
    xep0084;
get_mod(<<"not-authorized">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"compression">>,
        <<"http://jabber.org/features/compress">>) ->
    xep0138;
get_mod(<<"remove">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"active">>,
        <<"http://jabber.org/protocol/chatstates">>) ->
    xep0085;
get_mod(<<"invite">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"setnick">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"no-storage">>, <<"urn:xmpp:hints">>) ->
    xep0334;
get_mod(<<"stream:stream">>, <<"jabber:client">>) ->
    rfc6120;
get_mod(<<"data">>, <<"urn:xmpp:bob">>) -> xep0231;
get_mod(<<"success">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"bound">>, <<"urn:xmpp:bind:0">>) -> xep0386;
get_mod(<<"method">>,
        <<"http://jabber.org/protocol/compress">>) ->
    xep0138;
get_mod(<<"x">>, <<"jabber:x:data">>) -> xep0004;
get_mod(<<"jid">>, <<"urn:xmpp:mix:presence:0">>) ->
    xep0369;
get_mod(<<"transport">>,
        <<"urn:xmpp:jingle:transports:s5b:1">>) ->
    xep0260;
get_mod(<<"CONFIDENTIAL">>, <<"vcard-temp">>) ->
    xep0054;
get_mod(<<"subscribe">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"media-type">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"stream:features">>, <<"jabber:client">>) ->
    rfc6120;
get_mod(<<"fin">>, <<"urn:xmpp:mam:1">>) -> xep0313;
get_mod(<<"enabled">>, <<"urn:xmpp:sm:3">>) -> xep0198;
get_mod(<<"max-file-size">>,
        <<"eu:siacs:conversations:http:upload">>) ->
    xep0363;
get_mod(<<"x509-register">>, <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"resource-constraint">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"BBS">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"always">>, <<"urn:xmpp:mam:1">>) -> xep0313;
get_mod(<<"errors">>,
        <<"urn:xmpp:features:dialback">>) ->
    xep0220;
get_mod(<<"media-error">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"name">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"description">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"checksum">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"host-gone">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"photo">>, <<"vcard-temp:x:update">>) ->
    xep0153;
get_mod(<<"handshake">>,
        <<"jabber:component:accept">>) ->
    xep0114;
get_mod(<<"not-subscribed">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"size">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"hash">>, <<"urn:xmpp:scram-upgrade:0">>) ->
    xep0480;
get_mod(<<"fast">>, <<"urn:xmpp:fast:0">>) -> xep0484;
get_mod(<<"query">>,
        <<"http://jabber.org/protocol/stats">>) ->
    xep0039;
get_mod(<<"push">>,
        <<"http://gultsch.de/xmpp/drafts/unified-push">>) ->
    unifiedpush;
get_mod(<<"body">>, <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"payment-required">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"system-shutdown">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"items">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"query">>, <<"urn:xmpp:mam:2">>) -> xep0313;
get_mod(<<"prev">>,
        <<"http://jabber.org/protocol/commands">>) ->
    xep0050;
get_mod(<<"presence-in">>, <<"jabber:iq:privacy">>) ->
    xep0016;
get_mod(<<"item">>, <<"urn:xmpp:blocking">>) -> xep0191;
get_mod(<<"NICKNAME">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"MAILER">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"EXTVAL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"streamhost">>,
        <<"http://jabber.org/protocol/bytestreams">>) ->
    xep0065;
get_mod(<<"client-leave">>, <<"urn:xmpp:mix:pam:0">>) ->
    xep0405;
get_mod(<<"mix">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"no-store">>, <<"urn:xmpp:hints">>) ->
    xep0334;
get_mod(<<"nick">>,
        <<"http://jabber.org/protocol/nick">>) ->
    xep0172;
get_mod(<<"moderate">>,
        <<"urn:xmpp:message-moderate:0">>) ->
    xep0425;
get_mod(<<"item">>, <<"jabber:iq:roster">>) -> rfc6121;
get_mod(<<"redirect">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"a">>, <<"urn:xmpp:sm:3">>) -> xep0198;
get_mod(<<"update-subscription">>,
        <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"info">>, <<"urn:xmpp:avatar:metadata">>) ->
    xep0084;
get_mod(<<"date">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"not-allowed">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"BINVAL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"nodeid-required">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"email">>, <<"jabber:iq:search">>) -> xep0055;
get_mod(<<"filename">>,
        <<"eu:siacs:conversations:http:upload">>) ->
    xep0363;
get_mod(<<"put">>, <<"urn:xmpp:http:upload:0">>) ->
    xep0363;
get_mod(<<"file-too-large">>,
        <<"eu:siacs:conversations:http:upload">>) ->
    xep0363;
get_mod(<<"received">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"JABBERID">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"subscription">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"inbox">>, <<"urn:xmpp:inbox:1">>) -> xep0430;
get_mod(<<"decline">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"connection">>,
        <<"urn:xmpp:serverinfo:0">>) ->
    xep0485;
get_mod(<<"key">>, <<"jabber:iq:register">>) -> xep0077;
get_mod(<<"unsupported">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"unsupported-access-model">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"ip">>, <<"urn:xmpp:sic:1">>) -> xep0279;
get_mod(<<"attribute">>, <<"urn:xmpp:delegation:1">>) ->
    xep0355;
get_mod(<<"status">>, <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"query">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"CLASS">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"result">>, <<"urn:xmpp:mam:2">>) -> xep0313;
get_mod(<<"purge">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"header">>,
        <<"http://jabber.org/protocol/shim">>) ->
    xep0131;
get_mod(<<"failed">>, <<"urn:xmpp:sm:3">>) -> xep0198;
get_mod(<<"x">>, <<"jabber:x:expire">>) -> xep0023;
get_mod(<<"max-file-size">>,
        <<"urn:xmpp:http:upload">>) ->
    xep0363;
get_mod(<<"unknown-session">>,
        <<"urn:xmpp:jingle:errors:1">>) ->
    xep0166;
get_mod(<<"candidate-used">>,
        <<"urn:xmpp:jingle:transports:s5b:1">>) ->
    xep0260;
get_mod(<<"not-well-formed">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"annotate">>, <<"urn:xmpp:mix:roster:0">>) ->
    xep0405;
get_mod(<<"content-type">>,
        <<"eu:siacs:conversations:http:upload">>) ->
    xep0363;
get_mod(<<"close">>,
        <<"http://jabber.org/protocol/ibb">>) ->
    xep0047;
get_mod(<<"x509-csr">>, <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"report">>, <<"urn:xmpp:reporting:1">>) ->
    xep0377;
get_mod(<<"internal-server-error">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"service-unavailable">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"password">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"jid">>, <<"urn:xmpp:mam:2">>) -> xep0313;
get_mod(<<"never">>, <<"urn:xmpp:mam:1">>) -> xep0313;
get_mod(<<"metadata">>,
        <<"urn:xmpp:avatar:metadata">>) ->
    xep0084;
get_mod(<<"x509-cert">>, <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"hat">>, <<"urn:xmpp:hats:0">>) -> xep0317;
get_mod(<<"jid">>, <<"urn:xmpp:jidprep:0">>) -> xep0328;
get_mod(<<"password">>,
        <<"http://jabber.org/protocol/muc#owner">>) ->
    xep0045;
get_mod(<<"services">>, <<"urn:xmpp:extdisco:2">>) ->
    xep0215;
get_mod(<<"method">>,
        <<"http://jabber.org/features/compress">>) ->
    xep0138;
get_mod(<<"invalid-jid">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"message">>,
        <<"urn:xmpp:http:upload:purpose:0">>) ->
    xep0363;
get_mod(<<"reason">>,
        <<"urn:xmpp:message-moderate:1">>) ->
    xep0425;
get_mod(<<"tag">>, <<"urn:xmpp:bind:0">>) -> xep0386;
get_mod(<<"iq">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"LOCALITY">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"inactive">>,
        <<"http://jabber.org/protocol/chatstates">>) ->
    xep0085;
get_mod(<<"affiliations">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"first">>,
        <<"http://jabber.org/protocol/rsm">>) ->
    xep0059;
get_mod(<<"get">>,
        <<"eu:siacs:conversations:http:upload">>) ->
    xep0363;
get_mod(<<"failed-application">>,
        <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"priority">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"redirect">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"encryption-required">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"stanza-id">>, <<"urn:xmpp:sid:0">>) ->
    xep0359;
get_mod(<<"complete">>,
        <<"http://jabber.org/protocol/commands">>) ->
    xep0050;
get_mod(<<"enable">>, <<"urn:xmpp:push:0">>) -> xep0357;
get_mod(<<"time">>, <<"urn:xmpp:time">>) -> xep0202;
get_mod(<<"invalid-namespace">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"PREFIX">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"affiliations">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"credentials">>, <<"urn:xmpp:extdisco:2">>) ->
    xep0215;
get_mod(<<"desc">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"aborted">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"address">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"LOGO">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"retract">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"destroy">>,
        <<"http://jabber.org/protocol/muc#owner">>) ->
    xep0045;
get_mod(<<"subscribe">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"compress">>,
        <<"http://jabber.org/protocol/compress">>) ->
    xep0138;
get_mod(<<"ADR">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"continue">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"subscription">>, <<"urn:xmpp:mucsub:0">>) ->
    p1_mucsub;
get_mod(<<"item">>, <<"jabber:iq:search">>) -> xep0055;
get_mod(<<"stream:stream">>, <<"jabber:server">>) ->
    rfc6120;
get_mod(<<"proceed">>,
        <<"urn:ietf:params:xml:ns:xmpp-tls">>) ->
    rfc6120;
get_mod(<<"instructions">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"undefined-condition">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"DESC">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"subscriptions">>, <<"urn:xmpp:mucsub:0">>) ->
    p1_mucsub;
get_mod(<<"resumed">>, <<"urn:xmpp:sm:2">>) -> xep0198;
get_mod(<<"slot">>, <<"urn:xmpp:http:upload:0">>) ->
    xep0363;
get_mod(<<"open">>,
        <<"http://jabber.org/protocol/ibb">>) ->
    xep0047;
get_mod(<<"connectivity-error">>,
        <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"retracted">>,
        <<"urn:xmpp:message-retract:1">>) ->
    xep0424;
get_mod(<<"stream:features">>, <<"jabber:server">>) ->
    rfc6120;
get_mod(<<"request">>,
        <<"eu:siacs:conversations:http:upload">>) ->
    xep0363;
get_mod(<<"file">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"query">>, <<"jabber:iq:auth">>) -> xep0078;
get_mod(<<"CELL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"stream:stream">>,
        <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"token">>, <<"urn:xmpp:fast:0">>) -> xep0484;
get_mod(<<"email">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"event">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"file-too-large">>,
        <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>) ->
    xep0234;
get_mod(<<"active">>, <<"jabber:iq:privacy">>) ->
    xep0016;
get_mod(<<"payload-required">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"destroy">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"address">>, <<"urn:xmpp:sic:1">>) -> xep0279;
get_mod(<<"error">>,
        <<"http://jabber.org/protocol/stats">>) ->
    xep0039;
get_mod(<<"name">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"PCS">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"url">>, <<"jabber:x:oob">>) -> xep0066;
get_mod(<<"disable">>, <<"urn:xmpp:push:0">>) ->
    xep0357;
get_mod(<<"delegated">>, <<"urn:xmpp:delegation:1">>) ->
    xep0355;
get_mod(<<"hash-used">>, <<"urn:xmpp:hashes:2">>) ->
    xep0300;
get_mod(<<"presence">>,
        <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"URL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"tasks">>, <<"urn:xmpp:sasl:2">>) -> xep0388;
get_mod(<<"jid-malformed">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"register">>,
        <<"http://jabber.org/features/iq-register">>) ->
    xep0077;
get_mod(<<"optional">>,
        <<"urn:ietf:params:xml:ns:xmpp-session">>) ->
    rfc3921;
get_mod(<<"offline">>, <<"jabber:x:event">>) -> xep0022;
get_mod(<<"sasl-channel-binding">>,
        <<"urn:xmpp:sasl-cb:0">>) ->
    xep0440;
get_mod(<<"default">>, <<"jabber:iq:privacy">>) ->
    xep0016;
get_mod(<<"bind">>,
        <<"urn:ietf:params:xml:ns:xmpp-bind">>) ->
    rfc6120;
get_mod(<<"enable">>, <<"urn:xmpp:carbons:2">>) ->
    xep0280;
get_mod(<<"feature">>, <<"urn:xmpp:bind:0">>) ->
    xep0386;
get_mod(<<"block">>, <<"urn:xmpp:blocking">>) ->
    xep0191;
get_mod(<<"delete">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"prefs">>, <<"urn:xmpp:mam:2">>) -> xep0313;
get_mod(<<"entry">>, <<"urn:xmpp:inbox:1">>) -> xep0430;
get_mod(<<"sm">>, <<"urn:xmpp:sm:3">>) -> xep0198;
get_mod(<<"fetch">>,
        <<"http://jabber.org/protocol/offline">>) ->
    xep0013;
get_mod(<<"failed-transport">>,
        <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"state">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"utc">>, <<"urn:xmpp:time">>) -> xep0202;
get_mod(<<"additional-data">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"DOM">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"default">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"show">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"FAX">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"subscribe">>, <<"urn:xmpp:mucsub:0">>) ->
    p1_mucsub;
get_mod(<<"index">>,
        <<"http://jabber.org/protocol/rsm">>) ->
    xep0059;
get_mod(<<"csi">>, <<"urn:xmpp:csi:0">>) -> xep0352;
get_mod(<<"instructions">>, <<"jabber:iq:search">>) ->
    xep0055;
get_mod(<<"salt">>, <<"urn:xmpp:scram-upgrade:0">>) ->
    xep0480;
get_mod(<<"invalid-authzid">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"invalid-id">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"PUBLIC">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"precondition-not-met">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"item">>,
        <<"http://jabber.org/protocol/offline">>) ->
    xep0013;
get_mod(<<"received">>,
        <<"urn:xmpp:chat-markers:0">>) ->
    xep0333;
get_mod(<<"get">>, <<"urn:xmpp:http:upload">>) ->
    xep0363;
get_mod(<<"query">>,
        <<"http://jabber.org/protocol/disco#info">>) ->
    xep0030;
get_mod(<<"last">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"thread">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"streamhost-used">>,
        <<"http://jabber.org/protocol/bytestreams">>) ->
    xep0065;
get_mod(<<"query">>, <<"urn:xmpp:mam:0">>) -> xep0313;
get_mod(<<"unsubscribe">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"privileged_iq">>,
        <<"urn:xmpp:privilege:2">>) ->
    xep0356;
get_mod(<<"device">>, <<"urn:xmpp:sasl:2">>) -> xep0388;
get_mod(<<"challenge">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"recipient-unavailable">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"ISDN">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"GEO">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"delivered">>, <<"jabber:x:event">>) ->
    xep0022;
get_mod(<<"x509-cert-chain">>, <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"abort">>, <<"urn:xmpp:sasl:2">>) -> xep0388;
get_mod(<<"iq">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"message">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"resource">>, <<"jabber:iq:auth">>) ->
    xep0078;
get_mod(<<"success">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"item">>, <<"jabber:x:data">>) -> xep0004;
get_mod(<<"store">>, <<"urn:xmpp:hints">>) -> xep0334;
get_mod(<<"unblock">>, <<"urn:xmpp:blocking">>) ->
    xep0191;
get_mod(<<"query">>, <<"jabber:iq:private">>) ->
    xep0049;
get_mod(<<"invalid-xml">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"PCODE">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"LAT">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"never">>, <<"urn:xmpp:mam:tmp">>) -> xep0313;
get_mod(<<"enable">>, <<"urn:xmpp:sm:3">>) -> xep0198;
get_mod(<<"size">>,
        <<"eu:siacs:conversations:http:upload">>) ->
    xep0363;
get_mod(<<"text">>, <<"urn:xmpp:reporting:1">>) ->
    xep0377;
get_mod(<<"registration-required">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"remote-connection-failed">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"pending-subscription">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"misc">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"policy-violation">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"USERID">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"resume">>, <<"urn:xmpp:sm:3">>) -> xep0198;
get_mod(<<"purge">>,
        <<"http://jabber.org/protocol/offline">>) ->
    xep0013;
get_mod(<<"response">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"authorization-identifier">>,
        <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"bind">>, <<"urn:xmpp:bind:0">>) -> xep0386;
get_mod(<<"bidi">>, <<"urn:xmpp:bidi">>) -> xep0288;
get_mod(<<"MODEM">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"ORGUNIT">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"UID">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"required">>, <<"jabber:x:data">>) -> xep0004;
get_mod(<<"result">>, <<"urn:xmpp:mam:0">>) -> xep0313;
get_mod(<<"x509-challenge-failed">>,
        <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"TEL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"prefs">>, <<"urn:xmpp:mam:tmp">>) -> xep0313;
get_mod(<<"captcha">>, <<"urn:xmpp:captcha">>) ->
    xep0158;
get_mod(<<"mechanism">>, <<"urn:xmpp:fast:0">>) ->
    xep0484;
get_mod(<<"identity">>,
        <<"http://jabber.org/protocol/disco#info">>) ->
    xep0030;
get_mod(<<"text">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"private">>, <<"urn:xmpp:carbons:2">>) ->
    xep0280;
get_mod(<<"show">>, <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"PAGER">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"MSG">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"PHONETIC">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"jid">>, <<"urn:xmpp:mam:0">>) -> xep0313;
get_mod(<<"fin">>, <<"urn:xmpp:mam:2">>) -> xep0313;
get_mod(<<"ver">>, <<"urn:xmpp:features:rosterver">>) ->
    rfc6121;
get_mod(<<"body">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"always">>, <<"urn:xmpp:mam:2">>) -> xep0313;
get_mod(<<"join">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"composing">>, <<"jabber:x:event">>) ->
    xep0022;
get_mod(<<"reset">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"FN">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"BDAY">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"ROLE">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"composing">>,
        <<"http://jabber.org/protocol/chatstates">>) ->
    xep0085;
get_mod(<<"unique">>,
        <<"http://jabber.org/protocol/muc#unique">>) ->
    xep0045;
get_mod(<<"after">>,
        <<"http://jabber.org/protocol/rsm">>) ->
    xep0059;
get_mod(<<"query">>, <<"urn:xmpp:mam:tmp">>) -> xep0313;
get_mod(<<"x509-revoke">>, <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"inline">>, <<"urn:xmpp:sasl:2">>) -> xep0388;
get_mod(<<"account-disabled">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"EMAIL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"jid-required">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"subid-required">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"value">>, <<"jabber:x:data">>) -> xep0004;
get_mod(<<"invalid-subid">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"not-in-roster-group">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"request-token">>, <<"urn:xmpp:fast:0">>) ->
    xep0484;
get_mod(<<"unsupported-encoding">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"stream:error">>,
        <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"mix">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"moderate">>,
        <<"urn:xmpp:message-moderate:1">>) ->
    xep0425;
get_mod(<<"subject">>, <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"text">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"LON">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"update-subscription">>,
        <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"name">>, <<"jabber:iq:version">>) -> xep0092;
get_mod(<<"blocklist">>, <<"urn:xmpp:blocking">>) ->
    xep0191;
get_mod(<<"see-other-host">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"WORK">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"presence-subscription-required">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"continue">>,
        <<"http://jabber.org/protocol/muc#admin">>) ->
    xep0045;
get_mod(<<"undefined-condition">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"error">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"SOUND">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"actor">>,
        <<"http://jabber.org/protocol/muc#admin">>) ->
    xep0045;
get_mod(<<"withtext">>, <<"urn:xmpp:mam:tmp">>) ->
    xep0313;
get_mod(<<"username">>, <<"jabber:iq:auth">>) ->
    xep0078;
get_mod(<<"required">>,
        <<"urn:ietf:params:xml:ns:xmpp-tls">>) ->
    rfc6120;
get_mod(<<"phone">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"reported">>, <<"jabber:x:data">>) -> xep0004;
get_mod(<<"create">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"subject">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"date">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"transport">>,
        <<"urn:xmpp:jingle:transports:ibb:1">>) ->
    xep0261;
get_mod(<<"auth">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"challenge">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"text">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"POBOX">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"invalid-payload">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"leave">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"last">>, <<"jabber:iq:search">>) -> xep0055;
get_mod(<<"query">>, <<"jabber:iq:last">>) -> xep0012;
get_mod(<<"show">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"configure">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"reason">>,
        <<"http://jabber.org/protocol/muc#owner">>) ->
    xep0045;
get_mod(<<"namespace">>, <<"urn:xmpp:privilege:2">>) ->
    xep0356;
get_mod(<<"perm">>, <<"urn:xmpp:privilege:2">>) ->
    xep0356;
get_mod(<<"candidate-error">>,
        <<"urn:xmpp:jingle:transports:s5b:1">>) ->
    xep0260;
get_mod(<<"password">>, <<"storage:bookmarks">>) ->
    xep0048;
get_mod(<<"message">>, <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"jid">>,
        <<"urn:ietf:params:xml:ns:xmpp-bind">>) ->
    rfc6120;
get_mod(<<"PARCEL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"PREF">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"reason">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"never">>, <<"urn:xmpp:mam:2">>) -> xep0313;
get_mod(<<"proxy-error">>,
        <<"urn:xmpp:jingle:transports:s5b:1">>) ->
    xep0260;
get_mod(<<"stat">>,
        <<"http://jabber.org/protocol/stats">>) ->
    xep0039;
get_mod(<<"always">>, <<"urn:xmpp:mam:tmp">>) ->
    xep0313;
get_mod(<<"desc">>, <<"jabber:x:oob">>) -> xep0066;
get_mod(<<"reason">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"x509-request">>, <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"thread">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"host-unknown">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"unsupported-stanza-type">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"INTERNET">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"title">>, <<"jabber:x:data">>) -> xep0004;
get_mod(<<"no-copy">>, <<"urn:xmpp:hints">>) -> xep0334;
get_mod(<<"subscription">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"addresses">>,
        <<"http://jabber.org/protocol/address">>) ->
    xep0033;
get_mod(<<"origin-id">>, <<"urn:xmpp:sid:0">>) ->
    xep0359;
get_mod(<<"note">>,
        <<"http://jabber.org/protocol/commands">>) ->
    xep0050;
get_mod(<<"ephemeral">>,
        <<"urn:xmpp:http:upload:purpose:0">>) ->
    xep0363;
get_mod(<<"message">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"MIDDLE">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"activate">>,
        <<"http://jabber.org/protocol/bytestreams">>) ->
    xep0065;
get_mod(<<"password">>,
        <<"http://jabber.org/protocol/muc">>) ->
    xep0045;
get_mod(<<"r">>, <<"urn:xmpp:sm:2">>) -> xep0198;
get_mod(<<"uri">>, <<"urn:xmpp:media-element">>) ->
    xep0221;
get_mod(<<"initial-response">>,
        <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"connection-timeout">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"CRED">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"KEY">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"nick">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"retract">>,
        <<"urn:xmpp:message-retract:0">>) ->
    xep0424;
get_mod(<<"password">>, <<"urn:xmpp:bookmarks:1">>) ->
    xep0402;
get_mod(<<"LABEL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"purge">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"jid">>, <<"urn:xmpp:mam:tmp">>) -> xep0313;
get_mod(<<"prefs">>, <<"urn:xmpp:mam:0">>) -> xep0313;
get_mod(<<"forwarded">>, <<"urn:xmpp:forward:0">>) ->
    xep0297;
get_mod(<<"delegation">>,
        <<"urn:xmpp:delegation:1">>) ->
    xep0355;
get_mod(<<"expired">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"hats">>, <<"urn:xmpp:hats:0">>) -> xep0317;
get_mod(<<"user-agent">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"bad-request">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"N">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"PHOTO">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"ORG">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"option">>, <<"jabber:x:data">>) -> xep0004;
get_mod(<<"sent">>, <<"urn:xmpp:carbons:2">>) ->
    xep0280;
get_mod(<<"db:result">>, <<"jabber:server">>) ->
    xep0220;
get_mod(<<"busy">>, <<"urn:xmpp:jingle:1">>) -> xep0166;
get_mod(<<"text">>, <<"urn:xmpp:jingle:1">>) -> xep0166;
get_mod(<<"group">>, <<"jabber:iq:roster">>) -> rfc6121;
get_mod(<<"incorrect-encoding">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"before">>,
        <<"http://jabber.org/protocol/rsm">>) ->
    xep0059;
get_mod(<<"set">>,
        <<"http://jabber.org/protocol/rsm">>) ->
    xep0059;
get_mod(<<"upgrade">>, <<"urn:xmpp:sasl:upgrade:0">>) ->
    xep0480;
get_mod(<<"status">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"item">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"resumed">>, <<"urn:xmpp:sm:3">>) -> xep0198;
get_mod(<<"jid">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"activated">>,
        <<"urn:xmpp:jingle:transports:s5b:1">>) ->
    xep0260;
get_mod(<<"conference">>, <<"storage:bookmarks">>) ->
    xep0048;
get_mod(<<"registered">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"session">>,
        <<"urn:ietf:params:xml:ns:xmpp-session">>) ->
    rfc3921;
get_mod(<<"closed-node">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"command">>,
        <<"http://jabber.org/protocol/commands">>) ->
    xep0050;
get_mod(<<"x509-ca-list">>, <<"urn:xmpp:x509:0">>) ->
    xep0417;
get_mod(<<"body">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"restricted-xml">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"HOME">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"end">>, <<"urn:xmpp:mam:tmp">>) -> xep0313;
get_mod(<<"retry">>, <<"urn:xmpp:http:upload:0">>) ->
    xep0363;
get_mod(<<"iq">>, <<"jabber:iq:privacy">>) -> xep0016;
get_mod(<<"list">>, <<"jabber:iq:privacy">>) -> xep0016;
get_mod(<<"CATEGORIES">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"delete">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"fin">>, <<"urn:xmpp:inbox:1">>) -> xep0430;
get_mod(<<"nick">>, <<"jabber:iq:search">>) -> xep0055;
get_mod(<<"port">>, <<"urn:xmpp:sic:1">>) -> xep0279;
get_mod(<<"registered">>,
        <<"http://gultsch.de/xmpp/drafts/unified-push">>) ->
    unifiedpush;
get_mod(<<"desc">>, <<"jabber:x:data">>) -> xep0004;
get_mod(<<"destroy">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"no-permanent-store">>,
        <<"urn:xmpp:hints">>) ->
    xep0334;
get_mod(<<"filename">>, <<"urn:xmpp:http:upload">>) ->
    xep0363;
get_mod(<<"file-too-large">>,
        <<"urn:xmpp:http:upload">>) ->
    xep0363;
get_mod(<<"conference">>, <<"urn:xmpp:bookmarks:1">>) ->
    xep0402;
get_mod(<<"storage">>, <<"storage:bookmarks">>) ->
    xep0048;
get_mod(<<"LINE">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"PRODID">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"publish-options">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"reason">>,
        <<"http://jabber.org/protocol/muc#admin">>) ->
    xep0045;
get_mod(<<"policy-violation">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"mechanism">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"default">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"alternative-session">>,
        <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"moderated">>,
        <<"urn:xmpp:message-moderate:0">>) ->
    xep0425;
get_mod(<<"remote-server-timeout">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"invalid-from">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"items">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"next">>, <<"urn:xmpp:sasl:2">>) -> xep0388;
get_mod(<<"bad-format">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"STREET">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"status">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"setnick">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"error">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"VIDEO">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"redirect">>,
        <<"http://jabber.org/protocol/pubsub#event">>) ->
    xep0060;
get_mod(<<"destroy">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"participant">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"id">>, <<"jabber:x:event">>) -> xep0022;
get_mod(<<"occupant-id">>,
        <<"urn:xmpp:occupant-id:0">>) ->
    xep0421;
get_mod(<<"not-acceptable">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"SUFFIX">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"redirect">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"incompatible-parameters">>,
        <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"candidate">>,
        <<"urn:xmpp:jingle:transports:s5b:1">>) ->
    xep0260;
get_mod(<<"subject">>, <<"jabber:server">>) -> rfc6120;
get_mod(<<"bad-namespace-prefix">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"EXTADD">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"affiliation">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"fin">>, <<"urn:xmpp:mam:0">>) -> xep0313;
get_mod(<<"enabled">>, <<"urn:xmpp:sm:2">>) -> xep0198;
get_mod(<<"client-join">>, <<"urn:xmpp:mix:pam:2">>) ->
    xep0405;
get_mod(<<"channel-binding">>,
        <<"urn:xmpp:sasl-cb:0">>) ->
    xep0440;
get_mod(<<"TITLE">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"too-many-subscriptions">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"item">>,
        <<"http://jabber.org/protocol/muc#owner">>) ->
    xep0045;
get_mod(<<"always">>, <<"urn:xmpp:mam:0">>) -> xep0313;
get_mod(<<"file-too-large">>,
        <<"urn:xmpp:http:upload:0">>) ->
    xep0363;
get_mod(<<"jingle">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"extensions">>, <<"urn:xmpp:bookmarks:1">>) ->
    xep0402;
get_mod(<<"register">>,
        <<"http://gultsch.de/xmpp/drafts/unified-push">>) ->
    unifiedpush;
get_mod(<<"conflict">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"X400">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"affiliation">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"data">>, <<"urn:xmpp:avatar:data">>) ->
    xep0084;
get_mod(<<"task">>, <<"urn:xmpp:sasl:2">>) -> xep0388;
get_mod(<<"item">>,
        <<"http://jabber.org/protocol/disco#items">>) ->
    xep0030;
get_mod(<<"VOICE">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"vCard">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"gone">>,
        <<"http://jabber.org/protocol/chatstates">>) ->
    xep0085;
get_mod(<<"query">>,
        <<"http://jabber.org/protocol/muc#owner">>) ->
    xep0045;
get_mod(<<"os">>, <<"jabber:iq:version">>) -> xep0092;
get_mod(<<"feature">>,
        <<"http://jabber.org/protocol/disco#info">>) ->
    xep0030;
get_mod(<<"ORGNAME">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"NOTE">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"REV">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"query">>, <<"urn:xmpp:mam:1">>) -> xep0313;
get_mod(<<"unsubscribe">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"remote-server-not-found">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"invalid-mechanism">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"starttls">>,
        <<"urn:ietf:params:xml:ns:xmpp-tls">>) ->
    rfc6120;
get_mod(<<"unsupported-feature">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"request">>, <<"urn:xmpp:receipts">>) ->
    xep0184;
get_mod(<<"markable">>,
        <<"urn:xmpp:chat-markers:0">>) ->
    xep0333;
get_mod(<<"permanent">>,
        <<"urn:xmpp:http:upload:purpose:0">>) ->
    xep0363;
get_mod(<<"domain">>, <<"urn:xmpp:serverinfo:0">>) ->
    xep0485;
get_mod(<<"url">>, <<"storage:bookmarks">>) -> xep0048;
get_mod(<<"unexpected-request">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"zip">>, <<"jabber:iq:register">>) -> xep0077;
get_mod(<<"delete">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"a">>, <<"urn:xmpp:sm:2">>) -> xep0198;
get_mod(<<"dialback">>,
        <<"urn:xmpp:features:dialback">>) ->
    xep0220;
get_mod(<<"put">>, <<"urn:xmpp:http:upload">>) ->
    xep0363;
get_mod(<<"failure">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"query">>, <<"jabber:iq:privacy">>) ->
    xep0016;
get_mod(<<"forbidden">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"auth">>,
        <<"http://jabber.org/features/iq-auth">>) ->
    xep0078;
get_mod(<<"malformed-request">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"username">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"paused">>,
        <<"http://jabber.org/protocol/chatstates">>) ->
    xep0085;
get_mod(<<"version">>, <<"jabber:iq:version">>) ->
    xep0092;
get_mod(<<"publish">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"count">>,
        <<"http://jabber.org/protocol/rsm">>) ->
    xep0059;
get_mod(<<"ip">>, <<"urn:xmpp:sic:0">>) -> xep0279;
get_mod(<<"text">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"temporary-auth-failure">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"ping">>, <<"urn:xmpp:ping">>) -> xep0199;
get_mod(<<"CTRY">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"pubsub">>,
        <<"http://jabber.org/protocol/pubsub#owner">>) ->
    xep0060;
get_mod(<<"item-required">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"max">>,
        <<"http://jabber.org/protocol/rsm">>) ->
    xep0059;
get_mod(<<"result">>, <<"urn:xmpp:mam:1">>) -> xep0313;
get_mod(<<"max-file-size">>,
        <<"urn:xmpp:http:upload:0">>) ->
    xep0363;
get_mod(<<"cancel">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"not-authorized">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"unsubscribe">>, <<"urn:xmpp:mucsub:0">>) ->
    p1_mucsub;
get_mod(<<"failed">>, <<"urn:xmpp:sm:2">>) -> xep0198;
get_mod(<<"db:verify">>, <<"jabber:server">>) ->
    xep0220;
get_mod(<<"security-error">>,
        <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"abort">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"FAMILY">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"headers">>,
        <<"http://jabber.org/protocol/shim">>) ->
    xep0131;
get_mod(<<"flip-page">>, <<"urn:xmpp:mam:2">>) ->
    xep0313;
get_mod(<<"received">>, <<"urn:xmpp:receipts">>) ->
    xep0184;
get_mod(<<"privilege">>, <<"urn:xmpp:privilege:2">>) ->
    xep0356;
get_mod(<<"software">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"task-data">>, <<"urn:xmpp:sasl:2">>) ->
    xep0388;
get_mod(<<"inline">>, <<"urn:xmpp:bind:0">>) -> xep0386;
get_mod(<<"item-not-found">>,
        <<"urn:ietf:params:xml:ns:xmpp-stanzas">>) ->
    rfc6120;
get_mod(<<"item">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"decline">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"x">>,
        <<"http://jabber.org/protocol/muc#user">>) ->
    xep0045;
get_mod(<<"join">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"failure">>,
        <<"http://jabber.org/protocol/compress">>) ->
    xep0138;
get_mod(<<"resource-constraint">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"VERSION">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"item-forbidden">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"history">>,
        <<"http://jabber.org/protocol/muc">>) ->
    xep0045;
get_mod(<<"inactive">>, <<"urn:xmpp:csi:0">>) ->
    xep0352;
get_mod(<<"reason">>,
        <<"urn:xmpp:message-moderate:0">>) ->
    xep0425;
get_mod(<<"presence">>, <<"jabber:client">>) -> rfc6120;
get_mod(<<"profile">>,
        <<"urn:xmpp:http:upload:purpose:0">>) ->
    xep0363;
get_mod(<<"INTL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"item">>,
        <<"http://jabber.org/protocol/muc#admin">>) ->
    xep0045;
get_mod(<<"range">>,
        <<"urn:xmpp:jingle:apps:file-transfer:5">>) ->
    xep0234;
get_mod(<<"client-leave">>, <<"urn:xmpp:mix:pam:2">>) ->
    xep0405;
get_mod(<<"request">>, <<"urn:xmpp:http:upload">>) ->
    xep0363;
get_mod(<<"timeout">>, <<"urn:xmpp:jingle:1">>) ->
    xep0166;
get_mod(<<"iq">>, <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"query">>,
        <<"http://jabber.org/protocol/muc#admin">>) ->
    xep0045;
get_mod(<<"thumbnail">>, <<"urn:xmpp:thumbs:1">>) ->
    xep0264;
get_mod(<<"url">>, <<"jabber:iq:register">>) -> xep0077;
get_mod(<<"GIVEN">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"subscribe">>, <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"federation">>,
        <<"urn:xmpp:serverinfo:0">>) ->
    xep0485;
get_mod(<<"first">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"x">>,
        <<"http://jabber.org/protocol/muc">>) ->
    xep0045;
get_mod(<<"media">>, <<"urn:xmpp:media-element">>) ->
    xep0221;
get_mod(<<"out-of-order">>,
        <<"urn:xmpp:jingle:errors:1">>) ->
    xep0166;
get_mod(<<"result">>, <<"urn:xmpp:mam:tmp">>) ->
    xep0313;
get_mod(<<"active">>, <<"urn:xmpp:csi:0">>) -> xep0352;
get_mod(<<"slot">>, <<"urn:xmpp:http:upload">>) ->
    xep0363;
get_mod(<<"digest">>, <<"jabber:iq:auth">>) -> xep0078;
get_mod(<<"REGION">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"nick">>, <<"urn:xmpp:mix:presence:0">>) ->
    xep0369;
get_mod(<<"leave">>, <<"urn:xmpp:mix:core:1">>) ->
    xep0369;
get_mod(<<"thread">>, <<"jabber:component:accept">>) ->
    rfc6120;
get_mod(<<"bad-protocol">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"apply-to">>, <<"urn:xmpp:fasten:0">>) ->
    xep0422;
get_mod(<<"received">>, <<"urn:xmpp:carbons:2">>) ->
    xep0280;
get_mod(<<"x">>, <<"jabber:x:event">>) -> xep0022;
get_mod(<<"nick">>, <<"jabber:iq:register">>) ->
    xep0077;
get_mod(<<"internal-server-error">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"put">>,
        <<"eu:siacs:conversations:http:upload">>) ->
    xep0363;
get_mod(<<"options">>,
        <<"http://jabber.org/protocol/pubsub">>) ->
    xep0060;
get_mod(<<"disable">>, <<"urn:xmpp:carbons:2">>) ->
    xep0280;
get_mod(<<"mix">>, <<"urn:xmpp:mix:presence:0">>) ->
    xep0403;
get_mod(<<"unsupported-method">>,
        <<"http://jabber.org/protocol/compress">>) ->
    xep0138;
get_mod(<<"POSTAL">>, <<"vcard-temp">>) -> xep0054;
get_mod(<<"payload-too-big">>,
        <<"http://jabber.org/protocol/pubsub#errors">>) ->
    xep0060;
get_mod(<<"presence-out">>, <<"jabber:iq:privacy">>) ->
    xep0016;
get_mod(<<"mechanism-too-weak">>,
        <<"urn:ietf:params:xml:ns:xmpp-sasl">>) ->
    rfc6120;
get_mod(<<"improper-addressing">>,
        <<"urn:ietf:params:xml:ns:xmpp-streams">>) ->
    rfc6120;
get_mod(<<"r">>, <<"urn:xmpp:sm:3">>) -> xep0198;
get_mod(<<"submission-id">>,
        <<"urn:xmpp:mix:core:0">>) ->
    xep0369;
get_mod(<<"text">>, <<"urn:xmpp:sasl:2">>) -> xep0388;
get_mod(Name, XMLNS) ->
    xmpp_codec_external:lookup(Name, XMLNS).

get_mod({rosterver_feature}) -> rfc6121;
get_mod({legacy_auth_feature}) -> xep0078;
get_mod({carbons_disable}) -> xep0280;
get_mod({last, _, _}) -> xep0012;
get_mod({sasl2_next, _, _}) -> xep0388;
get_mod({sasl2_abort, _, _}) -> xep0388;
get_mod({compression, _}) -> xep0138;
get_mod({mam_prefs, _, _, _, _}) -> xep0313;
get_mod({upload_file_too_large, _, _}) -> xep0363;
get_mod({privilege_namespace, _, _}) -> xep0356;
get_mod({jingle_ft_description, _}) -> xep0234;
get_mod({x509_revoke, _, _}) -> xep0417;
get_mod({muc_user, _, _, _, _, _, _}) -> xep0045;
get_mod({jidprep, _}) -> xep0328;
get_mod({bytestreams, _, _, _, _, _, _}) -> xep0065;
get_mod({address, _, _, _, _, _, _}) -> xep0033;
get_mod({sasl_auth, _, _}) -> rfc6120;
get_mod({vcard_logo, _, _, _}) -> xep0054;
get_mod({ps_item, _, _, _, _, _}) -> xep0060;
get_mod({mam_fin, _, _, _, _, _}) -> xep0313;
get_mod({jingle_ft_error, _}) -> xep0234;
get_mod({legacy_auth, _, _, _, _}) -> xep0078;
get_mod({stream_features, _}) -> rfc6120;
get_mod({muc_item, _, _, _, _, _, _, _}) -> xep0045;
get_mod({muc_hats, _}) -> xep0317;
get_mod({block_list, _}) -> xep0191;
get_mod({carbons_received, _}) -> xep0280;
get_mod({carbons_sent, _}) -> xep0280;
get_mod({origin_id, _}) -> xep0359;
get_mod({upload_request_0, _, _, _, _, _}) -> xep0363;
get_mod({hash_used, _}) -> xep0300;
get_mod({x509_ca_list, _}) -> xep0417;
get_mod({occupant_id, _}) -> xep0421;
get_mod({bind2_bound, _}) -> xep0386;
get_mod({disco_items, _, _, _}) -> xep0030;
get_mod({vcard_xupdate, _}) -> xep0153;
get_mod({sasl2_challenge, _}) -> xep0388;
get_mod({bind2_feature, _}) -> xep0386;
get_mod({block_item, _, _}) -> xep0191;
get_mod({message, _, _, _, _, _, _, _, _, _, _}) ->
    rfc6120;
get_mod({presence, _, _, _, _, _, _, _, _, _, _}) ->
    rfc6120;
get_mod({streamhost, _, _, _}) -> xep0065;
get_mod({iq, _, _, _, _, _, _, _}) -> rfc6120;
get_mod({xdata_option, _, _}) -> xep0004;
get_mod({mix_presence, _, _, _}) -> xep0403;
get_mod({x509_cert_chain, _, _}) -> xep0417;
get_mod({sasl2_failure, _, _, _}) -> xep0388;
get_mod({vcard_geo, _, _}) -> xep0054;
get_mod({xevent, _, _, _, _, _}) -> xep0022;
get_mod({jingle_content, _, _, _, _, _}) -> xep0166;
get_mod({feature_register}) -> xep0077;
get_mod({pubsub,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _}) ->
    xep0060;
get_mod({x_conference, _, _, _, _, _}) -> xep0249;
get_mod({inbox_query, _}) -> xep0430;
get_mod({disco_info, _, _, _, _}) -> xep0030;
get_mod({message_moderate_21, _, _}) -> xep0425;
get_mod({vcard_label, _, _, _, _, _, _, _, _}) ->
    xep0054;
get_mod({x509_challenge_failed}) -> xep0417;
get_mod({stats, _, _}) -> xep0039;
get_mod({muc, _, _}) -> xep0045;
get_mod({carbons_enable}) -> xep0280;
get_mod({carbons_private}) -> xep0280;
get_mod({mix_roster_channel, _}) -> xep0405;
get_mod({fasten_external, _}) -> xep0422;
get_mod({s2s_bidi_feature}) -> xep0288;
get_mod({shim, _}) -> xep0131;
get_mod({mam_archived, _, _}) -> xep0313;
get_mod({mix_participant, _, _}) -> xep0369;
get_mod({delegated, _, _}) -> xep0355;
get_mod({text, _, _}) -> xep0234;
get_mod({scram_upgrade_salt, _, _}) -> xep0480;
get_mod({xmpp_session, _}) -> rfc3921;
get_mod({ping}) -> xep0199;
get_mod({time, _, _}) -> xep0202;
get_mod({ps_subscribe, _, _}) -> xep0060;
get_mod({adhoc_actions, _, _, _, _}) -> xep0050;
get_mod({push_disable, _, _}) -> xep0357;
get_mod({push_notification, _}) -> xep0357;
get_mod({fast_request_token, _}) -> xep0484;
get_mod({disco_item, _, _, _}) -> xep0030;
get_mod({register,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _}) ->
    xep0077;
get_mod({service, _, _, _, _, _, _, _, _, _, _, _}) ->
    xep0215;
get_mod({fast, _, _, _, _}) -> xep0484;
get_mod({pubsub_serverinfo, _}) -> xep0485;
get_mod({version, _, _, _}) -> xep0092;
get_mod({muc_subscription, _, _, _}) -> p1_mucsub;
get_mod({sasl2_authenticaton, _, _, _}) -> xep0388;
get_mod({sasl2_authenticate, _, _, _, _}) -> xep0388;
get_mod({sasl2_continue, _, _, _, _}) -> xep0388;
get_mod({s2s_bidi}) -> xep0288;
get_mod({vcard_photo, _, _, _}) -> xep0054;
get_mod({ps_publish, _, _}) -> xep0060;
get_mod({xcaptcha, _}) -> xep0158;
get_mod({avatar_data, _}) -> xep0084;
get_mod({fasten_apply_to, _, _, _}) -> xep0422;
get_mod({mix_destroy, _, _}) -> xep0369;
get_mod({media_uri, _, _}) -> xep0221;
get_mod({jingle_error, _}) -> xep0166;
get_mod({sasl_success, _}) -> rfc6120;
get_mod({compress, _}) -> xep0138;
get_mod({xdata_field, _, _, _, _, _, _, _, _}) ->
    xep0004;
get_mod({muc_subscriptions, _}) -> p1_mucsub;
get_mod({mix, _, _, _, _}) -> xep0369;
get_mod({addresses, _}) -> xep0033;
get_mod({adhoc_command, _, _, _, _, _, _, _, _}) ->
    xep0050;
get_mod({media, _, _, _}) -> xep0221;
get_mod({oob_x, _, _, _, _}) -> xep0066;
get_mod({ibb_data, _, _, _}) -> xep0047;
get_mod({identity, _, _, _, _}) -> xep0030;
get_mod({redirect, _}) -> rfc6120;
get_mod({muc_history, _, _, _, _}) -> xep0045;
get_mod({muc_owner, _, _, _}) -> xep0045;
get_mod({mix_setnick, _, _}) -> xep0369;
get_mod({mark_received, _}) -> xep0333;
get_mod({mark_displayed, _}) -> xep0333;
get_mod({mark_acknowledged, _}) -> xep0333;
get_mod({jingle_ft_file, _, _, _, _, _, _, _, _}) ->
    xep0234;
get_mod({bookmark_url, _, _}) -> xep0048;
get_mod({gone, _}) -> rfc6120;
get_mod({sasl_response, _}) -> rfc6120;
get_mod({vcard_temp,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _}) ->
    xep0054;
get_mod({chatstate, _}) -> xep0085;
get_mod({muc_unique, _}) -> xep0045;
get_mod({mix_leave, _}) -> xep0369;
get_mod({receipt_response, _}) -> xep0184;
get_mod({sic, _, _, _}) -> xep0279;
get_mod({idle, _}) -> xep0319;
get_mod({sasl2_response, _}) -> xep0388;
get_mod({sasl2_success, _, _, _}) -> xep0388;
get_mod({sasl_upgrade, _}) -> xep0480;
get_mod({stanza_error, _, _, _, _, _}) -> rfc6120;
get_mod({sm_resumed, _, _, _}) -> xep0198;
get_mod({offline_item, _, _}) -> xep0013;
get_mod({db_verify, _, _, _, _, _, _}) -> xep0220;
get_mod({upload_slot, _, _, _}) -> xep0363;
get_mod({jingle_ibb_transport, _, _, _}) -> xep0261;
get_mod({muc_hat, _, _, _}) -> xep0317;
get_mod({message_moderated, _, _, _}) -> xep0425;
get_mod({muc_decline, _, _, _}) -> xep0045;
get_mod({sm_enable, _, _, _}) -> xep0198;
get_mod({offline, _, _, _}) -> xep0013;
get_mod({mix_client_leave, _, _, _}) -> xep0405;
get_mod({thumbnail, _, _, _, _}) -> xep0264;
get_mod({delegation, _, _}) -> xep0355;
get_mod({x509_challenge, _, _, _}) -> xep0417;
get_mod({fast_token, _, _}) -> xep0484;
get_mod({pubsub_serverinfo_domain, _, _}) -> xep0485;
get_mod({pubsub_serverinfo_remote_domain, _, _}) ->
    xep0485;
get_mod({sm_enabled, _, _, _, _, _}) -> xep0198;
get_mod({privilege_perm, _, _, _, _}) -> xep0356;
get_mod({message_retracted, _, _, _, _, _}) -> xep0424;
get_mod({vcard_email, _, _, _, _, _, _}) -> xep0054;
get_mod({ps_affiliation, _, _, _, _}) -> xep0060;
get_mod({mix_update_subscription, _, _, _, _}) ->
    xep0369;
get_mod({upload_retry, _}) -> xep0363;
get_mod({x509_register}) -> xep0417;
get_mod({roster_item, _, _, _, _, _, _}) -> rfc6121;
get_mod({unified_push_push, _, _, _}) -> unifiedpush;
get_mod({rsm_set, _, _, _, _, _, _, _}) -> xep0059;
get_mod({avatar_meta, _, _}) -> xep0084;
get_mod({roster_query, _, _, _}) -> rfc6121;
get_mod({unblock, _}) -> xep0191;
get_mod({stat_error, _, _}) -> xep0039;
get_mod({unified_push_register, _, _}) -> unifiedpush;
get_mod({sasl_abort}) -> rfc6120;
get_mod({starttls_proceed}) -> rfc6120;
get_mod({compressed}) -> xep0138;
get_mod({stream_error, _, _}) -> rfc6120;
get_mod({inbox_entry, _, _, _}) -> xep0430;
get_mod({receipt_request}) -> xep0184;
get_mod({message_retracted_30, _, _, _, _}) -> xep0424;
get_mod({privacy_item, _, _, _, _, _, _, _, _}) ->
    xep0016;
get_mod({starttls_failure}) -> rfc6120;
get_mod({bob_data, _, _, _, _}) -> xep0231;
get_mod({markable}) -> xep0333;
get_mod({message_moderated_21, _, _, _, _}) -> xep0425;
get_mod({bind, _, _}) -> rfc6120;
get_mod({rsm_first, _, _}) -> xep0059;
get_mod({caps, _, _, _, _}) -> xep0115;
get_mod({xdata, _, _, _, _, _, _}) -> xep0004;
get_mod({ps_options, _, _, _, _}) -> xep0060;
get_mod({muc_admin, _}) -> xep0045;
get_mod({muc_unsubscribe, _, _}) -> p1_mucsub;
get_mod({mix_create, _, _}) -> xep0369;
get_mod({search, _, _, _, _, _, _, _}) -> xep0055;
get_mod({expire, _, _}) -> xep0023;
get_mod({privilege, _, _}) -> xep0356;
get_mod({avatar_pointer, _, _, _, _, _, _}) -> xep0084;
get_mod({muc_invite, _, _, _, _}) -> xep0045;
get_mod({mix_client_join, _, _, _}) -> xep0405;
get_mod({jingle_reason, _, _, _}) -> xep0166;
get_mod({ps_event, _, _, _, _, _, _}) -> xep0060;
get_mod({privileged_iq, _}) -> xep0356;
get_mod({sasl_mechanisms, _}) -> rfc6120;
get_mod({starttls, _}) -> rfc6120;
get_mod({stream_start, _, _, _, _, _, _, _, _}) ->
    rfc6120;
get_mod({credentials, _}) -> xep0215;
get_mod({'see-other-host', _}) -> rfc6120;
get_mod({muc_destroy, _, _, _, _}) -> xep0045;
get_mod({hint, _}) -> xep0334;
get_mod({private, _}) -> xep0049;
get_mod({sasl_challenge, _}) -> rfc6120;
get_mod({compress_failure, _}) -> xep0138;
get_mod({db_feature, _}) -> xep0220;
get_mod({handshake, _}) -> xep0114;
get_mod({ibb_close, _}) -> xep0047;
get_mod({vcard_sound, _, _, _}) -> xep0054;
get_mod({ps_retract, _, _, _}) -> xep0060;
get_mod({message_retract, _, _, _}) -> xep0424;
get_mod({sasl2_user_agent, _, _, _}) -> xep0388;
get_mod({bind2_bind, _, _, _}) -> xep0386;
get_mod({vcard_adr,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _}) ->
    xep0054;
get_mod({ps_unsubscribe, _, _, _}) -> xep0060;
get_mod({sm_resume, _, _, _}) -> xep0198;
get_mod({push_enable, _, _, _}) -> xep0357;
get_mod({jingle_ft_range, _, _, _}) -> xep0234;
get_mod({message_retract_30}) -> xep0424;
get_mod({message_moderate, _, _, _}) -> xep0425;
get_mod({sasl_channel_binding, _}) -> xep0440;
get_mod({db_result, _, _, _, _, _}) -> xep0220;
get_mod({scram_upgrade_hash, _}) -> xep0480;
get_mod({bookmark_conference, _, _, _, _, _}) ->
    xep0048;
get_mod({vcard_name, _, _, _, _, _}) -> xep0054;
get_mod({inbox_fin, _, _, _, _}) -> xep0430;
get_mod({csi, _}) -> xep0352;
get_mod({pep_bookmarks_conference, _, _, _, _, _}) ->
    xep0402;
get_mod({sm_a, _, _}) -> xep0198;
get_mod({jingle_s5b_transport, _, _, _, _, _, _, _}) ->
    xep0260;
get_mod({privacy_query, _, _, _}) -> xep0016;
get_mod({block, _}) -> xep0191;
get_mod({ps_subscription, _, _, _, _, _, _}) -> xep0060;
get_mod({ps_error, _, _}) -> xep0060;
get_mod({delay, _, _, _}) -> xep0203;
get_mod({muc_actor, _, _}) -> xep0045;
get_mod({nick, _}) -> xep0172;
get_mod({jingle, _, _, _, _, _, _, _}) -> xep0166;
get_mod({x509_csr, _, _}) -> xep0417;
get_mod({services, _, _}) -> xep0215;
get_mod({avatar_info, _, _, _, _, _, _}) -> xep0084;
get_mod({privacy_list, _, _}) -> xep0016;
get_mod({report, _, _}) -> xep0377;
get_mod({unified_push_registered, _, _}) -> unifiedpush;
get_mod({message_thread, _, _}) -> rfc6120;
get_mod({forwarded, _, _}) -> xep0297;
get_mod({feature_sm, _}) -> xep0198;
get_mod({stanza_id, _, _}) -> xep0359;
get_mod({jingle_ft_received, _, _}) -> xep0234;
get_mod({bookmark_storage, _, _}) -> xep0048;
get_mod({sasl_failure, _, _}) -> rfc6120;
get_mod({adhoc_note, _, _}) -> xep0050;
get_mod({stat, _, _, _, _}) -> xep0039;
get_mod({pubsub_owner, _, _, _, _, _, _}) -> xep0060;
get_mod({mam_result, _, _, _, _}) -> xep0313;
get_mod({sm_failed, _, _, _, _}) -> xep0198;
get_mod({upload_request, _, _, _, _}) -> xep0363;
get_mod({jingle_ft_checksum, _, _, _}) -> xep0234;
get_mod({x509_request, _, _, _, _}) -> xep0417;
get_mod({vcard_org, _, _}) -> xep0054;
get_mod({ps_items, _, _, _, _, _, _}) -> xep0060;
get_mod({muc_subscribe, _, _, _, _}) -> p1_mucsub;
get_mod({feature_csi}) -> xep0352;
get_mod({ibb_open, _, _, _}) -> xep0047;
get_mod({vcard_tel,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _,
         _}) ->
    xep0054;
get_mod({mam_query, _, _, _, _, _, _, _, _, _}) ->
    xep0313;
get_mod({search_item, _, _, _, _, _}) -> xep0055;
get_mod({hash, _, _}) -> xep0300;
get_mod({sasl2_task_data, _}) -> xep0388;
get_mod({vcard_key, _, _}) -> xep0054;
get_mod({sm_r, _}) -> xep0198;
get_mod({mix_join, _, _, _, _, _}) -> xep0369;
get_mod({upload_slot_0, _, _, _}) -> xep0363;
get_mod({delegation_query, _, _}) -> xep0355;
get_mod({jingle_s5b_candidate, _, _, _, _, _, _}) ->
    xep0260;
get_mod(Record) -> xmpp_codec_external:lookup(Record).
