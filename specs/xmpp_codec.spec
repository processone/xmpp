
-record(text, {lang = <<>> :: binary(),
               data = <<>> :: binary()}).
-type text() :: #text{}.

-xml(jidprep,
     #elem{name = <<"jid">>,
	   xmlns = <<"urn:xmpp:jidprep:0">>,
	   module = 'xep0328',
	   result = {jidprep, '$jid'},
	   cdata = #cdata{label = '$jid',
			  required = true,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}}}).

-xml(last,
     #elem{name = <<"query">>,
           xmlns = <<"jabber:iq:last">>,
	   module = 'xep0012',
           result = {last, '$seconds', '$status'},
           attrs = [#attr{name = <<"seconds">>,
                          enc = {enc_int, []},
                          dec = {dec_int, [0, infinity]}}],
           cdata = #cdata{default = <<"">>, label = '$status'}}).

-xml(version_name,
     #elem{name = <<"name">>,
           xmlns = <<"jabber:iq:version">>,
	   module = 'xep0092',
           result = '$cdata',
           cdata = #cdata{label = '$cdata', required = true}}).

-xml(version_ver,
     #elem{name = <<"version">>,
           xmlns = <<"jabber:iq:version">>,
	   module = 'xep0092',
           result = '$cdata',
           cdata = #cdata{label = '$cdata', required = true}}).

-xml(version_os,
     #elem{name = <<"os">>,
           xmlns = <<"jabber:iq:version">>,
	   module = 'xep0092',
           result = '$cdata',
           cdata = #cdata{label = '$cdata', required = true}}).

-xml(version,
     #elem{name = <<"query">>,
           xmlns = <<"jabber:iq:version">>,
	   module = 'xep0092',
           result = {version, '$name', '$ver', '$os'},
           refs = [#ref{name = version_name,
                        label = '$name',
                        min = 0, max = 1},
                   #ref{name = version_ver,
                        label = '$ver',
                        min = 0, max = 1},
                   #ref{name = version_os,
                        label = '$os',
                        min = 0, max = 1}]}).

-xml(roster_group,
     #elem{name = <<"group">>,
           xmlns = <<"jabber:iq:roster">>,
	   module = rfc6121,
           result = '$cdata',
           cdata = #cdata{required = true, label = '$cdata'}}).

-xml(roster_item,
     #elem{name = <<"item">>,
           xmlns = <<"jabber:iq:roster">>,
	   module = rfc6121,
           result = {roster_item, '$jid', '$name',
                     '$groups', '$subscription', '$ask', '$mix_channel'},
           attrs = [#attr{name = <<"jid">>,
                          required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"name">>,
			  default = <<"">>},
                    #attr{name = <<"subscription">>,
                          default = none,
                          always_encode = true,
                          enc = {enc_enum, []},
                          dec = {dec_enum, [[none,to,from,both,remove]]}},
                    #attr{name = <<"ask">>,
                          enc = {enc_enum, []},
                          dec = {dec_enum, [[subscribe]]}}],
           refs = [#ref{name = roster_group, label = '$groups'},
                   #ref{name = mix_roster_channel, label = '$mix_channel', min = 0, max = 1}]}).

-xml(roster_query,
     #elem{name = <<"query">>,
           xmlns = <<"jabber:iq:roster">>,
	   module = rfc6121,
           result = {roster_query, '$items', '$ver', '$mix_annotate'},
           attrs = [#attr{name = <<"ver">>, default = undefined}],
           refs = [#ref{name = roster_item, label = '$items'},
                   #ref{name = mix_roster_annotate, label = '$mix_annotate',
                        default = false, min = 0, max = 1}]}).

-xml(rosterver_feature,
     #elem{name = <<"ver">>,
	   xmlns = <<"urn:xmpp:features:rosterver">>,
	   module = rfc6121,
	   result = {rosterver_feature}}).

-xml(privacy_message,
     #elem{name = <<"message">>,
	   xmlns = <<"jabber:iq:privacy">>,
	   module = 'xep0016',
	   result = true}).
-xml(privacy_iq,
     #elem{name = <<"iq">>,
	   xmlns = <<"jabber:iq:privacy">>,
	   module = 'xep0016',
	   result = true}).
-xml(privacy_presence_in,
     #elem{name = <<"presence-in">>,
	   xmlns = <<"jabber:iq:privacy">>,
	   module = 'xep0016',
	   result = true}).
-xml(privacy_presence_out,
     #elem{name = <<"presence-out">>,
	   xmlns = <<"jabber:iq:privacy">>,
	   module = 'xep0016',
	   result = true}).

-xml(privacy_item,
     #elem{name = <<"item">>,
           xmlns = <<"jabber:iq:privacy">>,
	   module = 'xep0016',
           result = {privacy_item, '$order', '$action', '$type', '$value',
		     '$message', '$iq', '$presence_in', '$presence_out'},
           attrs = [#attr{name = <<"action">>,
                          required = true,
                          dec = {dec_enum, [[allow, deny]]},
                          enc = {enc_enum, []}},
                    #attr{name = <<"order">>,
                          required = true,
                          dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
                    #attr{name = <<"type">>,
                          dec = {dec_enum, [[group, jid, subscription]]},
                          enc = {enc_enum, []}},
                    #attr{name = <<"value">>}],
           refs = [#ref{name = privacy_message, default = false,
			min = 0, max = 1, label = '$message'},
                   #ref{name = privacy_iq, default = false,
			min = 0, max = 1, label = '$iq'},
                   #ref{name = privacy_presence_in, default = false,
			min = 0, max = 1, label = '$presence_in'},
                   #ref{name = privacy_presence_out, default = false,
                        min = 0, max = 1, label = '$presence_out'}]}).

-xml(privacy_list,
     #elem{name = <<"list">>,
           xmlns = <<"jabber:iq:privacy">>,
	   module = 'xep0016',
           result = {privacy_list, '$name', '$items'},
           attrs = [#attr{name = <<"name">>,
                          required = true}],
           refs = [#ref{name = privacy_item,
                        label = '$items'}]}).

-xml(privacy_default_list,
     #elem{name = <<"default">>,
           xmlns = <<"jabber:iq:privacy">>,
	   module = 'xep0016',
           result = '$name',
           attrs = [#attr{name = <<"name">>,
                          default = none}]}).

-xml(privacy_active_list,
     #elem{name = <<"active">>,
           xmlns = <<"jabber:iq:privacy">>,
	   module = 'xep0016',
           result = '$name',
           attrs = [#attr{name = <<"name">>,
                          default = none}]}).

-xml(privacy,
     #elem{name = <<"query">>,
           xmlns = <<"jabber:iq:privacy">>,
	   module = 'xep0016',
           result = {privacy_query, '$lists', '$default', '$active'},
           refs = [#ref{name = privacy_list,
                        label = '$lists'},
                   #ref{name = privacy_default_list,
                        min = 0, max = 1,
                        label = '$default'},
                   #ref{name = privacy_active_list,
                        min = 0, max = 1,
                        label = '$active'}]}).

-xml(block_item,
     #elem{name = <<"item">>,
           xmlns = <<"urn:xmpp:blocking">>,
	   module = 'xep0191',
           result = {block_item, '$jid', '$spam_report'},
           attrs = [#attr{name = <<"jid">>,
                          required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}],
           refs = [#ref{name = report,
                        label = '$spam_report',
                        min = 0, max = 1}]}).

-xml(block,
     #elem{name = <<"block">>,
           xmlns = <<"urn:xmpp:blocking">>,
	   module = 'xep0191',
           result = {block, '$items'},
           refs = [#ref{name = block_item,
                        label = '$items'}]}).

-xml(unblock,
     #elem{name = <<"unblock">>,
           xmlns = <<"urn:xmpp:blocking">>,
	   module = 'xep0191',
           result = {unblock, '$items'},
           refs = [#ref{name = block_item,
                        label = '$items'}]}).

-xml(block_list,
     #elem{name = <<"blocklist">>,
           xmlns = <<"urn:xmpp:blocking">>,
	   module = 'xep0191',
           result = {block_list, '$items'},
	   refs = [#ref{name = block_item,
                        label = '$items'}]}).

-xml(report_reason_abuse,
     #elem{name = <<"abuse">>,
	   xmlns = <<"urn:xmpp:reporting:0">>,
	   module = 'xep0377',
	   result = 'abuse'}).

-xml(report_reason_spam,
     #elem{name = <<"spam">>,
	   xmlns = <<"urn:xmpp:reporting:0">>,
	   module = 'xep0377',
	   result = 'spam'}).

-xml(report_text,
     #elem{name = <<"text">>,
	   xmlns = <<"urn:xmpp:reporting:0">>,
	   module = 'xep0377',
	   result = {text, '$lang', '$data'},
	   cdata = #cdata{label = '$data'},
	   attrs = [#attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
			  label = '$lang'}]}).

-xml(report,
     #elem{name = <<"report">>,
	   xmlns = <<"urn:xmpp:reporting:0">>,
	   module = 'xep0377',
	   result = {report, '$reason', '$text'},
	   refs = [#ref{name = report_reason_abuse,
			label = '$reason',
			min = 0, max = 1},
		   #ref{name = report_reason_spam,
			label = '$reason',
			min = 0, max = 1},
		   #ref{name = report_text,
			label = '$text'}]}).

-xml(disco_identity,
     #elem{name = <<"identity">>,
           xmlns = <<"http://jabber.org/protocol/disco#info">>,
	   module = 'xep0030',
           result = {identity, '$category', '$type', '$lang', '$name'},
           attrs = [#attr{name = <<"category">>,
                          required = true},
                    #attr{name = <<"type">>,
                          required = true},
                    #attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'},
                    #attr{name = <<"name">>}]}).

-xml(disco_feature,
     #elem{name = <<"feature">>,
           xmlns = <<"http://jabber.org/protocol/disco#info">>,
	   module = 'xep0030',
           result = '$var',
           attrs = [#attr{name = <<"var">>,
                          required = true}]}).

-xml(disco_info,
     #elem{name = <<"query">>,
           xmlns = <<"http://jabber.org/protocol/disco#info">>,
	   module = 'xep0030',
           result = {disco_info, '$node', '$identities', '$features', '$xdata'},
           attrs = [#attr{name = <<"node">>}],
           refs = [#ref{name = disco_identity,
                        label = '$identities'},
                   #ref{name = disco_feature,
                        label = '$features'},
                   #ref{name = xdata,
                        label = '$xdata'}]}).

-xml(disco_item,
     #elem{name = <<"item">>,
           xmlns = <<"http://jabber.org/protocol/disco#items">>,
	   module = 'xep0030',
           result = {disco_item, '$jid', '$name', '$node'},
           attrs = [#attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []},
                          required = true},
                    #attr{name = <<"name">>},
                    #attr{name = <<"node">>}]}).
-xml(disco_items,
     #elem{name = <<"query">>,
           xmlns = <<"http://jabber.org/protocol/disco#items">>,
	   module = 'xep0030',
           result = {disco_items, '$node', '$items', '$rsm'},
           attrs = [#attr{name = <<"node">>}],
           refs = [#ref{name = disco_item,
                        label = '$items'},
		   #ref{name = rsm_set, min = 0, max = 1,
			label = '$rsm'}]}).

-xml(private,
     #elem{name = <<"query">>,
           xmlns = <<"jabber:iq:private">>,
	   module = 'xep0049',
	   ignore_els = true,
           result = {private, '$_els'}}).

-xml(conference_nick,
     #elem{name = <<"nick">>,
           xmlns = <<"storage:bookmarks">>,
	   module = 'xep0048',
           result = '$cdata'}).

-xml(conference_password,
     #elem{name = <<"password">>,
           xmlns = <<"storage:bookmarks">>,
	   module = 'xep0048',
           result = '$cdata'}).

-xml(bookmark_conference,
     #elem{name = <<"conference">>,
           xmlns = <<"storage:bookmarks">>,
	   module = 'xep0048',
           result = {bookmark_conference, '$name', '$jid',
                     '$autojoin', '$nick', '$password'},
           attrs = [#attr{name = <<"name">>},
                    #attr{name = <<"jid">>,
                          required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"autojoin">>,
                          default = false,
                          dec = {dec_bool, []},
                          enc = {enc_bool, []}}],
           refs = [#ref{name = conference_nick,
                        label = '$nick',
                        min = 0, max = 1},
                   #ref{name = conference_password,
                        label = '$password',
                        min = 0, max = 1}]}).

-xml(bookmark_url,
     #elem{name = <<"url">>,
           xmlns = <<"storage:bookmarks">>,
	   module = 'xep0048',
           result = {bookmark_url, '$name', '$url'},
           attrs = [#attr{name = <<"name">>,
                          required = true},
                    #attr{name = <<"url">>,
                          required = true}]}).

-xml(bookmarks_storage,
     #elem{name = <<"storage">>,
           xmlns = <<"storage:bookmarks">>,
	   module = 'xep0048',
           result = {bookmark_storage, '$conference', '$url'},
           refs = [#ref{name = bookmark_conference,
                        label = '$conference'},
                   #ref{name = bookmark_url,
                        label = '$url'}]}).

-xml(stat_error,
     #elem{name = <<"error">>,
           xmlns = <<"http://jabber.org/protocol/stats">>,
	   module = 'xep0039',
           result = {stat_error, '$code', '$reason'},
	   cdata = #cdata{default = <<"">>, label = '$reason'},
           attrs = [#attr{name = <<"code">>,
                          required = true,
                          enc = {enc_int, []},
                          dec = {dec_int, []}}]}).

-xml(stat,
     #elem{name = <<"stat">>,
           xmlns = <<"http://jabber.org/protocol/stats">>,
	   module = 'xep0039',
           result = {stat, '$name', '$units', '$value', '$error'},
           attrs = [#attr{name = <<"name">>,
                          required = true},
                    #attr{name = <<"units">>, default = <<"">>},
                    #attr{name = <<"value">>, default = <<"">>}],
           refs = [#ref{name = stat_error, label = '$error',
			min = 0, max = 1}]}).

-xml(stats,
     #elem{name = <<"query">>,
           xmlns = <<"http://jabber.org/protocol/stats">>,
	   module = 'xep0039',
           result = {stats, '$list', '$node'},
	   attrs = [#attr{name = <<"node">>, default = <<"">>}],
           refs = [#ref{name = stat, label = '$list'}]}).

-type iq_type() :: get | set | result | error.
-type message_type() :: chat | error | groupchat | headline | normal.
-type presence_type() :: available | error | probe | subscribe |
			 subscribed | unavailable | unsubscribe |
			 unsubscribed.

-record(iq, {id = <<>> :: binary(),
             type :: iq_type(),
             lang = <<>> :: binary(),
             from :: undefined | jid:jid(),
             to :: undefined | jid:jid(),
             sub_els = [] :: [xmpp_element() | fxml:xmlel()],
	     meta = #{} :: map()}).
-type iq() :: #iq{}.

-xml(iq,
     #elem{name = <<"iq">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = {iq, '$id', '$type', '$lang', '$from', '$to', '$_els', '$_'},
           attrs = [#attr{name = <<"id">>,
                          required = true},
                    #attr{name = <<"type">>,
                          required = true,
                          enc = {enc_enum, []},
                          dec = {dec_enum, [[get, set, result, error]]}},
                    #attr{name = <<"from">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"to">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'}]}).

-xml(unified_push_register,
     #elem{name = <<"register">>,
           xmlns = <<"http://gultsch.de/xmpp/drafts/unified-push">>,
	   module = unifiedpush,
           result = {unified_push_register, '$application', '$instance'},
           attrs = [#attr{name = <<"application">>,
			  required = true,
			  label = '$application'},
                    #attr{name = <<"instance">>,
			  required = true,
			  label = '$instance'}]}).

-xml(unified_push_registered,
     #elem{name = <<"registered">>,
           xmlns = <<"http://gultsch.de/xmpp/drafts/unified-push">>,
	   module = unifiedpush,
           result = {unified_push_registered, '$expiration', '$endpoint'},
           attrs = [#attr{name = <<"expiration">>,
			  required = true,
			  label = '$expiration',
			  dec = {dec_utc, []},
			  enc = {enc_utc, []}},
                    #attr{name = <<"endpoint">>,
			  required = true,
			  label = '$endpoint'}]}).

-xml(unified_push_push,
     #elem{name = <<"push">>,
           xmlns = <<"http://gultsch.de/xmpp/drafts/unified-push">>,
	   module = unifiedpush,
           result = {unified_push_push, '$application', '$instance', '$data'},
           cdata = #cdata{label = '$data'},
           attrs = [#attr{name = <<"application">>,
			  required = true,
			  label = '$application'},
                    #attr{name = <<"instance">>,
			  required = true,
			  label = '$instance'}]}).

-xml(message_subject,
     #elem{name = <<"subject">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = {text, '$lang', '$data'},
           cdata = #cdata{label = '$data'},
           attrs = [#attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
			  label = '$lang'}]}).

-xml(message_body,
     #elem{name = <<"body">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = {text, '$lang', '$data'},
           cdata = #cdata{label = '$data'},
           attrs = [#attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
			  label = '$lang'}]}).

-xml(message_thread,
     #elem{name = <<"thread">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = {message_thread, '$parent', '$data'},
	   attrs = [#attr{name = <<"parent">>}],
	   cdata = #cdata{label = '$data'}}).

-record(message, {id = <<>> :: binary(),
                  type = normal :: message_type(),
                  lang = <<>> :: binary(),
                  from :: undefined | jid:jid(),
                  to :: undefined | jid:jid(),
                  subject = [] :: [#text{}],
                  body = [] :: [#text{}],
                  thread :: undefined | message_thread(),
                  sub_els = [] :: [xmpp_element() | fxml:xmlel()],
		  meta = #{} :: map()}).
-type message() :: #message{}.

-xml(message,
     #elem{name = <<"message">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = {message, '$id', '$type', '$lang', '$from', '$to',
                     '$subject', '$body', '$thread', '$_els', '$_'},
           attrs = [#attr{name = <<"id">>},
                    #attr{name = <<"type">>,
                          default = normal,
                          enc = {enc_enum, []},
                          dec = {dec_message_type, []}},
                    #attr{name = <<"from">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"to">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'}],
           refs = [#ref{name = message_subject, label = '$subject'},
                   #ref{name = message_thread, min = 0, max = 1, label = '$thread'},
                   #ref{name = message_body, label = '$body'}]}).

-xml(presence_show,
     #elem{name = <<"show">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = '$cdata',
           cdata = #cdata{enc = {enc_enum, []},
                          dec = {dec_enum, [[away, chat, dnd, xa]]}}}).

-xml(presence_status,
     #elem{name = <<"status">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = {text, '$lang', '$data'},
           cdata = #cdata{label = '$data'},
           attrs = [#attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'}]}).

-xml(presence_priority,
     #elem{name = <<"priority">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = '$cdata',
           cdata = #cdata{enc = {enc_int, []},
                          dec = {dec_int, []}}}).

-record(presence, {id = <<>> :: binary(),
                   type = available :: presence_type(),
                   lang = <<>> :: binary(),
                   from :: undefined | jid:jid(),
                   to :: undefined | jid:jid(),
                   show :: undefined | 'away' | 'chat' | 'dnd' | 'xa',
                   status = [] :: [#text{}],
                   priority :: undefined | integer(),
                   sub_els = [] :: [xmpp_element() | fxml:xmlel()],
		   meta = #{} :: map()}).
-type presence() :: #presence{}.

-xml(presence,
     #elem{name = <<"presence">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = {presence, '$id', '$type', '$lang', '$from', '$to',
                     '$show', '$status', '$priority', '$_els', '$_'},
           attrs = [#attr{name = <<"id">>},
                    #attr{name = <<"type">>,
			  default = available,
                          enc = {enc_enum, []},
                          dec = {dec_enum, [[unavailable, subscribe, subscribed,
                                             unsubscribe, unsubscribed,
                                             available, probe, error]]}},
                    #attr{name = <<"from">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"to">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'}],
           refs = [#ref{name = presence_show, min = 0, max = 1, label = '$show'},
                   #ref{name = presence_status, label = '$status'},
                   #ref{name = presence_priority, min = 0, max = 1,
                        label = '$priority'}]}).

-xml(error_bad_request,
     #elem{name = <<"bad-request">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'bad-request'}).
-xml(error_conflict,
     #elem{name = <<"conflict">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'conflict'}).
-xml(error_feature_not_implemented,
     #elem{name = <<"feature-not-implemented">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'feature-not-implemented'}).
-xml(error_forbidden,
     #elem{name = <<"forbidden">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'forbidden'}).
-xml(error_gone,
     #elem{name = <<"gone">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           cdata = #cdata{label = '$uri'},
           result = {'gone', '$uri'}}).
-xml(error_internal_server_error,
     #elem{name = <<"internal-server-error">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'internal-server-error'}).
-xml(error_item_not_found,
     #elem{name = <<"item-not-found">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'item-not-found'}).
-xml(error_jid_malformed,
     #elem{name = <<"jid-malformed">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'jid-malformed'}).
-xml(error_not_acceptable,
     #elem{name = <<"not-acceptable">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'not-acceptable'}).
-xml(error_not_allowed,
     #elem{name = <<"not-allowed">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'not-allowed'}).
-xml(error_not_authorized,
     #elem{name = <<"not-authorized">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'not-authorized'}).
-xml(error_payment_required,
     #elem{name = <<"payment-required">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'payment-required'}).
-xml(error_policy_violation,
     #elem{name = <<"policy-violation">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'policy-violation'}).
-xml(error_recipient_unavailable,
     #elem{name = <<"recipient-unavailable">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'recipient-unavailable'}).
-xml(error_redirect,
     #elem{name = <<"redirect">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           cdata = #cdata{label = '$uri'},
           result = {'redirect', '$uri'}}).
-xml(error_registration_required,
     #elem{name = <<"registration-required">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'registration-required'}).
-xml(error_remote_server_not_found,
     #elem{name = <<"remote-server-not-found">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'remote-server-not-found'}).
-xml(error_remote_server_timeout,
     #elem{name = <<"remote-server-timeout">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'remote-server-timeout'}).
-xml(error_resource_constraint,
     #elem{name = <<"resource-constraint">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'resource-constraint'}).
-xml(error_service_unavailable,
     #elem{name = <<"service-unavailable">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'service-unavailable'}).
-xml(error_subscription_required,
     #elem{name = <<"subscription-required">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'subscription-required'}).
-xml(error_undefined_condition,
     #elem{name = <<"undefined-condition">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'undefined-condition'}).
-xml(error_unexpected_request,
     #elem{name = <<"unexpected-request">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           result = 'unexpected-request'}).

-xml(error_text,
     #elem{name = <<"text">>,
           result = {text, '$lang', '$data'},
           cdata = #cdata{label = '$data'},
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
	   module = rfc6120,
           attrs = [#attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'}]}).

-xml(error,
     #elem{name = <<"error">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = {stanza_error, '$type', '$by', '$reason', '$text', '$_els'},
           attrs = [#attr{name = <<"type">>,
                          label = '$type',
                          required = true,
                          dec = {dec_enum, [[auth, cancel, continue,
                                             modify, wait]]},
                          enc = {enc_enum, []}},
                    #attr{name = <<"by">>,
			  label = '$by',
			  enc = {jid, encode, []},
			  dec = {jid, decode, []}}],
           refs = [#ref{name = error_text, label = '$text'},
                   #ref{name = error_bad_request,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_conflict,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_feature_not_implemented,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_forbidden,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_gone,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_internal_server_error,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_item_not_found,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_jid_malformed,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_not_acceptable,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_not_allowed,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_not_authorized,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = error_payment_required,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_policy_violation,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_recipient_unavailable,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_redirect,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_registration_required,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_remote_server_not_found,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_remote_server_timeout,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_resource_constraint,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_service_unavailable,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_subscription_required,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_undefined_condition,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_unexpected_request,
                        min = 0, max = 1, label = '$reason'}]}).

-xml(bind_jid,
     #elem{name = <<"jid">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-bind">>,
	   module = rfc6120,
           result = '$cdata',
           cdata = #cdata{dec = {jid, decode, []},
                          enc = {jid, encode, []}}}).

-xml(bind_resource,
     #elem{name = <<"resource">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-bind">>,
	   module = rfc6120,
           result = '$cdata',
           cdata = #cdata{dec = {check_resource, []},
                          enc = {check_resource, []}}}).

-xml(bind, #elem{name = <<"bind">>,
                 xmlns = <<"urn:ietf:params:xml:ns:xmpp-bind">>,
		 module = rfc6120,
                 result = {bind, '$jid', '$resource'},
                 refs = [#ref{name = bind_jid,
                              label = '$jid',
                              min = 0, max = 1},
                         #ref{name = bind_resource,
                              min = 0, max = 1,
			      default = <<"">>,
                              label = '$resource'}]}).

-xml(legacy_auth_username,
     #elem{name = <<"username">>,
	   xmlns = <<"jabber:iq:auth">>,
	   module = 'xep0078',
	   result = '$cdata'}).
-xml(legacy_auth_password,
     #elem{name = <<"password">>,
	   xmlns = <<"jabber:iq:auth">>,
	   module = 'xep0078',
	   result = '$cdata'}).
-xml(legacy_auth_digest,
     #elem{name = <<"digest">>,
	   xmlns = <<"jabber:iq:auth">>,
	   module = 'xep0078',
	   result = '$cdata'}).
-xml(legacy_auth_resource,
     #elem{name = <<"resource">>,
	   xmlns = <<"jabber:iq:auth">>,
	   module = 'xep0078',
	   result = '$cdata'}).

-xml(legacy_auth,
     #elem{name = <<"query">>,
	   xmlns = <<"jabber:iq:auth">>,
	   module = 'xep0078',
	   result = {legacy_auth, '$username', '$password',
		     '$digest', '$resource'},
	   refs = [#ref{name = legacy_auth_username, min = 0, max = 1,
			label = '$username'},
		   #ref{name = legacy_auth_password, min = 0, max = 1,
			label = '$password'},
		   #ref{name = legacy_auth_digest, min = 0, max = 1,
			label = '$digest'},
		   #ref{name = legacy_auth_resource, min = 0, max = 1,
			label = '$resource'}]}).

-xml(legacy_auth_feature,
     #elem{name = <<"auth">>,
	   xmlns = <<"http://jabber.org/features/iq-auth">>,
	   module = 'xep0078',
	   result = {legacy_auth_feature}}).

-xml(sasl_auth,
     #elem{name = <<"auth">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>,
	   module = rfc6120,
           cdata = #cdata{label = '$text',
                          dec = {base64, mime_decode, []},
                          enc = {base64, encode, []}},
           result = {sasl_auth, '$mechanism', '$text'},
           attrs = [#attr{name = <<"mechanism">>,
                          required = true}]}).

-xml(sasl_abort,
     #elem{name = <<"abort">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>,
	   module = rfc6120,
           result = {sasl_abort}}).

-xml(sasl_challenge,
     #elem{name = <<"challenge">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>,
	   module = rfc6120,
           cdata = #cdata{label = '$text',
                          dec = {base64, mime_decode, []},
                          enc = {base64, encode, []}},
           result = {sasl_challenge, '$text'}}).

-xml(sasl_response,
     #elem{name = <<"response">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>,
	   module = rfc6120,
           cdata = #cdata{label = '$text',
                          dec = {base64, mime_decode, []},
                          enc = {base64, encode, []}},
           result = {sasl_response, '$text'}}).

-xml(sasl_success,
     #elem{name = <<"success">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>,
	   module = rfc6120,
           cdata = #cdata{label = '$text',
                          dec = {base64, mime_decode, []},
                          enc = {base64, encode, []}},
           result = {sasl_success, '$text'}}).

-xml(sasl_failure_text,
     #elem{name = <<"text">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>,
	   module = rfc6120,
           result = {text, '$lang', '$data'},
           cdata = #cdata{label = '$data'},
           attrs = [#attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'}]}).

-xml(sasl_failure_aborted,
     #elem{name = <<"aborted">>,
           result = 'aborted',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_account_disabled,
     #elem{name = <<"account-disabled">>,
           result = 'account-disabled',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_credentials_expired,
     #elem{name = <<"credentials-expired">>,
           result = 'credentials-expired',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_encryption_required,
     #elem{name = <<"encryption-required">>,
           result = 'encryption-required',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_incorrect_encoding,
     #elem{name = <<"incorrect-encoding">>,
           result = 'incorrect-encoding',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_invalid_authzid,
     #elem{name = <<"invalid-authzid">>,
           result = 'invalid-authzid',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_invalid_mechanism,
     #elem{name = <<"invalid-mechanism">>,
           result = 'invalid-mechanism',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_malformed_request,
     #elem{name = <<"malformed-request">>,
           result = 'malformed-request',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_mechanism_too_weak,
     #elem{name = <<"mechanism-too-weak">>,
           result = 'mechanism-too-weak',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_not_authorized,
     #elem{name = <<"not-authorized">>,
           result = 'not-authorized',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_bad_protocol,
     #elem{name = <<"bad-protocol">>,
           result = 'bad-protocol',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).
-xml(sasl_failure_temporary_auth_failure,
     #elem{name = <<"temporary-auth-failure">>,
           result = 'temporary-auth-failure',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>}).

-xml(sasl_failure,
     #elem{name = <<"failure">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>,
	   module = rfc6120,
           result = {sasl_failure, '$reason', '$text'},
           refs = [#ref{name = sasl_failure_text,
                        label = '$text'},
                   #ref{name = sasl_failure_aborted,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_account_disabled,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_credentials_expired,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_encryption_required,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_incorrect_encoding,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_invalid_authzid,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_invalid_mechanism,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_malformed_request,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_mechanism_too_weak,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_not_authorized,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = sasl_failure_bad_protocol,
			min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_temporary_auth_failure,
                        min = 0, max = 1, label = '$reason'}]}).

-xml(sasl_mechanism,
     #elem{name = <<"mechanism">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>,
	   module = rfc6120,
           result = '$cdata'}).

-xml(sasl_mechanisms,
     #elem{name = <<"mechanisms">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-sasl">>,
	   module = rfc6120,
           result = {sasl_mechanisms, '$list'},
           refs = [#ref{name = sasl_mechanism,
                        label = '$list'}]}).

-xml(starttls_required,
     #elem{name = <<"required">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-tls">>,
	   module = rfc6120,
           result = true}).

-xml(starttls,
     #elem{name = <<"starttls">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-tls">>,
	   module = rfc6120,
           result = {starttls, '$required'},
           refs = [#ref{name = starttls_required,
                        label = '$required',
                        min = 0, max = 1,
                        default = false}]}).

-xml(starttls_proceed,
     #elem{name = <<"proceed">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-tls">>,
	   module = rfc6120,
           result = {starttls_proceed}}).

-xml(starttls_failure,
     #elem{name = <<"failure">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-tls">>,
	   module = rfc6120,
           result = {starttls_failure}}).

-xml(compress_failure_setup_failed,
     #elem{name = <<"setup-failed">>,
           xmlns = <<"http://jabber.org/protocol/compress">>,
	   module = 'xep0138',
           result = 'setup-failed'}).
-xml(compress_failure_processing_failed,
     #elem{name = <<"processing-failed">>,
           xmlns = <<"http://jabber.org/protocol/compress">>,
	   module = 'xep0138',
           result = 'processing-failed'}).
-xml(compress_failure_unsupported_method,
     #elem{name = <<"unsupported-method">>,
           xmlns = <<"http://jabber.org/protocol/compress">>,
	   module = 'xep0138',
           result = 'unsupported-method'}).

-xml(compress_failure,
     #elem{name = <<"failure">>,
           xmlns = <<"http://jabber.org/protocol/compress">>,
	   module = 'xep0138',
           result = {compress_failure, '$reason'},
           refs = [#ref{name = compress_failure_setup_failed,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = compress_failure_processing_failed,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = compress_failure_unsupported_method,
                        min = 0, max = 1, label = '$reason'}]}).

-xml(compress_method,
     #elem{name = <<"method">>,
           xmlns = <<"http://jabber.org/protocol/compress">>,
	   module = 'xep0138',
           result = '$cdata'}).

-xml(compress,
     #elem{name = <<"compress">>,
           xmlns = <<"http://jabber.org/protocol/compress">>,
	   module = 'xep0138',
           result = {compress, '$methods'},
           refs = [#ref{name = compress_method,
                        label = '$methods'}]}).

-xml(compressed,
     #elem{name = <<"compressed">>,
           xmlns = <<"http://jabber.org/protocol/compress">>,
	   module = 'xep0138',
           result = {compressed}}).

-xml(compression_method,
     #elem{name = <<"method">>,
           xmlns = <<"http://jabber.org/features/compress">>,
	   module = 'xep0138',
           result = '$cdata'}).

-xml(compression,
     #elem{name = <<"compression">>,
           xmlns = <<"http://jabber.org/features/compress">>,
	   module = 'xep0138',
           result = {compression, '$methods'},
           refs = [#ref{name = compression_method, label = '$methods'}]}).

-xml(stream_features,
     #elem{name = <<"stream:features">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>],
	   module = rfc6120,
           result = {stream_features, '$_els'}}).

-xml(caps,
     #elem{name = <<"c">>,
           xmlns = <<"http://jabber.org/protocol/caps">>,
	   module = 'xep0115',
           result = {caps, '$node', '$version', '$hash', '$exts'},
           attrs = [#attr{name = <<"hash">>},
                    #attr{name = <<"node">>},
		    #attr{name = <<"ext">>,
			  label = '$exts',
			  default = [],
			  dec = {re, split, ["\\h+"]},
			  enc = {join, [$ ]}},
                    #attr{name = <<"ver">>,
			  label = '$version'}]}).

-xml(feature_register,
     #elem{name = <<"register">>,
           xmlns = <<"http://jabber.org/features/iq-register">>,
	   module = 'xep0077',
           result = {feature_register}}).

-xml(register_registered,
     #elem{name = <<"registered">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = true}).
-xml(register_remove,
     #elem{name = <<"remove">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = true}).
-xml(register_instructions,
     #elem{name = <<"instructions">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_username,
     #elem{name = <<"username">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_nick,
     #elem{name = <<"nick">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_password,
     #elem{name = <<"password">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_name,
     #elem{name = <<"name">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_first,
     #elem{name = <<"first">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_last,
     #elem{name = <<"last">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_email,
     #elem{name = <<"email">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_address,
     #elem{name = <<"address">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_city,
     #elem{name = <<"city">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_state,
     #elem{name = <<"state">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_zip,
     #elem{name = <<"zip">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_phone,
     #elem{name = <<"phone">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_url,
     #elem{name = <<"url">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_date,
     #elem{name = <<"date">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_misc,
     #elem{name = <<"misc">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_text,
     #elem{name = <<"text">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).
-xml(register_key,
     #elem{name = <<"key">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = '$cdata'}).

-xml(register,
     #elem{name = <<"query">>,
           xmlns = <<"jabber:iq:register">>,
	   module = 'xep0077',
           result = {register, '$registered', '$remove', '$instructions',
                     '$username', '$nick', '$password', '$name',
                     '$first', '$last', '$email', '$address',
                     '$city', '$state', '$zip', '$phone', '$url',
                     '$date', '$misc', '$text', '$key', '$xdata', '$_els'},
           refs = [#ref{name = xdata, min = 0, max = 1,
			label = '$xdata'},
		   #ref{name = register_registered, min = 0, max = 1,
                        default = false, label = '$registered'},
                   #ref{name = register_remove, min = 0, max = 1,
                        default = false, label = '$remove'},
                   #ref{name = register_instructions, min = 0, max = 1,
                        label = '$instructions'},
                   #ref{name = register_username, min = 0, max = 1,
                        label = '$username'},
                   #ref{name = register_nick, min = 0, max = 1,
                        label = '$nick'},
                   #ref{name = register_password, min = 0, max = 1,
                        label = '$password'},
                   #ref{name = register_name, min = 0, max = 1,
                        label = '$name'},
                   #ref{name = register_first, min = 0, max = 1,
                        label = '$first'},
                   #ref{name = register_last, min = 0, max = 1,
                        label = '$last'},
                   #ref{name = register_email, min = 0, max = 1,
                        label = '$email'},
                   #ref{name = register_address, min = 0, max = 1,
                        label = '$address'},
                   #ref{name = register_city, min = 0, max = 1,
                        label = '$city'},
                   #ref{name = register_state, min = 0, max = 1,
                        label = '$state'},
                   #ref{name = register_zip, min = 0, max = 1,
                        label = '$zip'},
                   #ref{name = register_phone, min = 0, max = 1,
                        label = '$phone'},
                   #ref{name = register_url, min = 0, max = 1,
                        label = '$url'},
                   #ref{name = register_date, min = 0, max = 1,
                        label = '$date'},
                   #ref{name = register_misc, min = 0, max = 1,
                        label = '$misc'},
                   #ref{name = register_text, min = 0, max = 1,
                        label = '$text'},
                   #ref{name = register_key, min = 0, max = 1,
                        label = '$key'}]}).

-xml(session_optional,
     #elem{name = <<"optional">>,
	   xmlns = <<"urn:ietf:params:xml:ns:xmpp-session">>,
	   module = rfc3921,
           result = true}).

-xml(session,
     #elem{name = <<"session">>,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-session">>,
	   module = rfc3921,
           result = {xmpp_session, '$optional'},
	   refs = [#ref{name = session_optional,
			min = 0, max = 1, default = false,
			label = '$optional'}]}).

-xml(ping,
     #elem{name = <<"ping">>,
           xmlns = <<"urn:xmpp:ping">>,
	   module = 'xep0199',
           result = {ping}}).

-xml(time_utc,
     #elem{name = <<"utc">>,
           xmlns = <<"urn:xmpp:time">>,
	   module = 'xep0202',
           result = '$cdata',
           cdata = #cdata{dec = {dec_utc, []},
                          enc = {enc_utc, []}}}).

-xml(time_tzo,
     #elem{name = <<"tzo">>,
           xmlns = <<"urn:xmpp:time">>,
	   module = 'xep0202',
           result = '$cdata',
           cdata = #cdata{dec = {dec_tzo, []},
                          enc = {enc_tzo, []}}}).

-xml(time,
     #elem{name = <<"time">>,
           xmlns = <<"urn:xmpp:time">>,
	   module = 'xep0202',
           result = {time, '$tzo', '$utc'},
           refs = [#ref{name = time_tzo,
                        label = '$tzo',
                        min = 0, max = 1},
                   #ref{name = time_utc,
                        label = '$utc',
                        min = 0, max = 1}]}).

-xml(stream_error_text,
     #elem{name = <<"text">>,
           result = {text, '$lang', '$data'},
           cdata = #cdata{label = '$data'},
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>,
	   module = rfc6120,
           attrs = [#attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'}]}).

-xml(stream_error_bad_format,
     #elem{name = <<"bad-format">>,
           result = 'bad-format',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_bad_namespace_prefix,
     #elem{name = <<"bad-namespace-prefix">>,
           result = 'bad-namespace-prefix',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_conflict,
     #elem{name = <<"conflict">>,
           result = 'conflict',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_connection_timeout,
     #elem{name = <<"connection-timeout">>,
           result = 'connection-timeout',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_host_gone,
     #elem{name = <<"host-gone">>,
           result = 'host-gone',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_host_unknown,
     #elem{name = <<"host-unknown">>,
           result = 'host-unknown',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_improper_addressing,
     #elem{name = <<"improper-addressing">>,
           result = 'improper-addressing',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_internal_server_error,
     #elem{name = <<"internal-server-error">>,
           result = 'internal-server-error',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_invalid_from,
     #elem{name = <<"invalid-from">>,
           result = 'invalid-from',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_invalid_id,
     #elem{name = <<"invalid-id">>,
           result = 'invalid-id',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_invalid_namespace,
     #elem{name = <<"invalid-namespace">>,
           result = 'invalid-namespace',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_invalid_xml,
     #elem{name = <<"invalid-xml">>,
           result = 'invalid-xml',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_not_authorized,
     #elem{name = <<"not-authorized">>,
           result = 'not-authorized',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_not_well_formed,
     #elem{name = <<"not-well-formed">>,
           result = 'not-well-formed',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_policy_violation,
     #elem{name = <<"policy-violation">>,
           result = 'policy-violation',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_remote_connection_failed,
     #elem{name = <<"remote-connection-failed">>,
           result = 'remote-connection-failed',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_reset,
     #elem{name = <<"reset">>,
           result = 'reset',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_resource_constraint,
     #elem{name = <<"resource-constraint">>,
           result = 'resource-constraint',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_restricted_xml,
     #elem{name = <<"restricted-xml">>,
           result = 'restricted-xml',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_see_other_host,
     #elem{name = <<"see-other-host">>,
           cdata = #cdata{required = true, label = '$host',
			  dec = {dec_host_port, []},
			  enc = {enc_host_port, []}},
           result = {'see-other-host', '$host'},
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_system_shutdown,
     #elem{name = <<"system-shutdown">>,
           result = 'system-shutdown',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_undefined_condition,
     #elem{name = <<"undefined-condition">>,
           result = 'undefined-condition',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_unsupported_encoding,
     #elem{name = <<"unsupported-encoding">>,
           result = 'unsupported-encoding',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_unsupported_feature,
     #elem{name = <<"unsupported-feature">>,
           result = 'unsupported-feature',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_unsupported_stanza_type,
     #elem{name = <<"unsupported-stanza-type">>,
           result = 'unsupported-stanza-type',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).
-xml(stream_error_unsupported_version,
     #elem{name = <<"unsupported-version">>,
           result = 'unsupported-version',
	   module = rfc6120,
           xmlns = <<"urn:ietf:params:xml:ns:xmpp-streams">>}).

-xml(stream_error,
     #elem{name = <<"stream:error">>,
           xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
           result = {stream_error, '$reason', '$text'},
           refs = [#ref{name = stream_error_text, label = '$text'},
                   #ref{name = stream_error_bad_format,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_bad_namespace_prefix,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_conflict,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_connection_timeout,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_host_gone,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_host_unknown,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_improper_addressing,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_internal_server_error,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_invalid_from,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_invalid_id,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_invalid_namespace,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_invalid_xml,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_not_authorized,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_not_well_formed,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_policy_violation,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_remote_connection_failed,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_reset,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_resource_constraint,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_restricted_xml,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_see_other_host,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_system_shutdown,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_undefined_condition,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_unsupported_encoding,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = stream_error_unsupported_feature,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_unsupported_stanza_type,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = stream_error_unsupported_version,
                        min = 0, max = 1, label = '$reason'}
                  ]}).

-xml(vcard_HOME, #elem{name = <<"HOME">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = true}).
-xml(vcard_WORK, #elem{name = <<"WORK">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = true}).
-xml(vcard_VOICE, #elem{name = <<"VOICE">>, xmlns = <<"vcard-temp">>,
			module = 'xep0054', result = true}).
-xml(vcard_FAX, #elem{name = <<"FAX">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = true}).
-xml(vcard_PAGER, #elem{name = <<"PAGER">>, xmlns = <<"vcard-temp">>,
			module = 'xep0054', result = true}).
-xml(vcard_MSG, #elem{name = <<"MSG">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = true}).
-xml(vcard_CELL, #elem{name = <<"CELL">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = true}).
-xml(vcard_VIDEO, #elem{name = <<"VIDEO">>, xmlns = <<"vcard-temp">>,
			module = 'xep0054', result = true}).
-xml(vcard_BBS, #elem{name = <<"BBS">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = true}).
-xml(vcard_MODEM, #elem{name = <<"MODEM">>, xmlns = <<"vcard-temp">>,
			module = 'xep0054', result = true}).
-xml(vcard_ISDN, #elem{name = <<"ISDN">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = true}).
-xml(vcard_PCS, #elem{name = <<"PCS">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = true}).
-xml(vcard_POSTAL, #elem{name = <<"POSTAL">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = true}).
-xml(vcard_PARCEL, #elem{name = <<"PARCEL">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = true}).
-xml(vcard_DOM, #elem{name = <<"DOM">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = true}).
-xml(vcard_INTL, #elem{name = <<"INTL">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = true}).
-xml(vcard_PREF, #elem{name = <<"PREF">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = true}).
-xml(vcard_INTERNET, #elem{name = <<"INTERNET">>, xmlns = <<"vcard-temp">>,
			   module = 'xep0054', result = true}).
-xml(vcard_X400, #elem{name = <<"X400">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = true}).
-xml(vcard_FAMILY, #elem{name = <<"FAMILY">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_GIVEN, #elem{name = <<"GIVEN">>, xmlns = <<"vcard-temp">>,
			module = 'xep0054', result = '$cdata'}).
-xml(vcard_MIDDLE, #elem{name = <<"MIDDLE">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_PREFIX, #elem{name = <<"PREFIX">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_SUFFIX, #elem{name = <<"SUFFIX">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_POBOX, #elem{name = <<"POBOX">>, xmlns = <<"vcard-temp">>,
			module = 'xep0054', result = '$cdata'}).
-xml(vcard_EXTADD, #elem{name = <<"EXTADD">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_STREET, #elem{name = <<"STREET">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_LOCALITY, #elem{name = <<"LOCALITY">>, xmlns = <<"vcard-temp">>,
			   module = 'xep0054', result = '$cdata'}).
-xml(vcard_REGION, #elem{name = <<"REGION">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_PCODE, #elem{name = <<"PCODE">>, xmlns = <<"vcard-temp">>,
			module = 'xep0054', result = '$cdata'}).
-xml(vcard_CTRY, #elem{name = <<"CTRY">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = '$cdata'}).
-xml(vcard_LINE, #elem{name = <<"LINE">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = '$cdata'}).
-xml(vcard_NUMBER, #elem{name = <<"NUMBER">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_USERID, #elem{name = <<"USERID">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_LAT, #elem{name = <<"LAT">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = '$cdata'}).
-xml(vcard_LON, #elem{name = <<"LON">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = '$cdata'}).
-xml(vcard_ORGNAME, #elem{name = <<"ORGNAME">>, xmlns = <<"vcard-temp">>,
			  module = 'xep0054', result = '$cdata'}).
-xml(vcard_ORGUNIT, #elem{name = <<"ORGUNIT">>, xmlns = <<"vcard-temp">>,
			  module = 'xep0054', result = '$cdata'}).
-xml(vcard_PHONETIC, #elem{name = <<"PHONETIC">>, xmlns = <<"vcard-temp">>,
			   module = 'xep0054', result = '$cdata'}).
-xml(vcard_CRED, #elem{name = <<"CRED">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = '$cdata'}).
-xml(vcard_VERSION, #elem{name = <<"VERSION">>, xmlns = <<"vcard-temp">>,
			  module = 'xep0054', result = '$cdata'}).
-xml(vcard_FN, #elem{name = <<"FN">>, xmlns = <<"vcard-temp">>,
		     module = 'xep0054', result = '$cdata'}).
-xml(vcard_NICKNAME, #elem{name = <<"NICKNAME">>, xmlns = <<"vcard-temp">>,
			   module = 'xep0054', result = '$cdata'}).
-xml(vcard_BDAY, #elem{name = <<"BDAY">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = '$cdata'}).
-xml(vcard_JABBERID, #elem{name = <<"JABBERID">>, xmlns = <<"vcard-temp">>,
			   module = 'xep0054', result = '$cdata'}).
-xml(vcard_MAILER, #elem{name = <<"MAILER">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_TZ, #elem{name = <<"TZ">>, xmlns = <<"vcard-temp">>,
		     module = 'xep0054', result = '$cdata'}).
-xml(vcard_TITLE, #elem{name = <<"TITLE">>, xmlns = <<"vcard-temp">>,
			module = 'xep0054', result = '$cdata'}).
-xml(vcard_ROLE, #elem{name = <<"ROLE">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = '$cdata'}).
-xml(vcard_KEYWORD, #elem{name = <<"KEYWORD">>, xmlns = <<"vcard-temp">>,
			  module = 'xep0054', result = '$cdata'}).
-xml(vcard_NOTE, #elem{name = <<"NOTE">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = '$cdata'}).
-xml(vcard_PRODID, #elem{name = <<"PRODID">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_REV, #elem{name = <<"REV">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = '$cdata'}).
-xml(vcard_SORT_STRING, #elem{name = <<"SORT-STRING">>, xmlns = <<"vcard-temp">>,
			      module = 'xep0054', result = '$cdata'}).
-xml(vcard_UID, #elem{name = <<"UID">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = '$cdata'}).
-xml(vcard_URL, #elem{name = <<"URL">>, xmlns = <<"vcard-temp">>,
		      module = 'xep0054', result = '$cdata'}).
-xml(vcard_DESC, #elem{name = <<"DESC">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = '$cdata'}).
-xml(vcard_TYPE, #elem{name = <<"TYPE">>, xmlns = <<"vcard-temp">>,
		       module = 'xep0054', result = '$cdata'}).
-xml(vcard_EXTVAL, #elem{name = <<"EXTVAL">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = '$cdata'}).
-xml(vcard_PUBLIC, #elem{name = <<"PUBLIC">>, xmlns = <<"vcard-temp">>,
			 module = 'xep0054', result = public}).
-xml(vcard_PRIVATE, #elem{name = <<"PRIVATE">>, xmlns = <<"vcard-temp">>,
			  module = 'xep0054', result = private}).
-xml(vcard_CONFIDENTIAL, #elem{name = <<"CONFIDENTIAL">>, xmlns = <<"vcard-temp">>,
			       module = 'xep0054', result = confidential}).

-xml(vcard_N,
     #elem{name = <<"N">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_name, '$family', '$given', '$middle',
                     '$prefix', '$suffix'},
           refs = [#ref{name = vcard_FAMILY, min = 0, max = 1, label = '$family'},
                   #ref{name = vcard_GIVEN, min = 0, max = 1, label = '$given'},
                   #ref{name = vcard_MIDDLE, min = 0, max = 1, label = '$middle'},
                   #ref{name = vcard_PREFIX, min = 0, max = 1, label = '$prefix'},
                   #ref{name = vcard_SUFFIX, min = 0, max = 1, label = '$suffix'}]}).

-xml(vcard_ADR,
     #elem{name = <<"ADR">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_adr, '$home', '$work', '$postal', '$parcel',
                     '$dom', '$intl', '$pref', '$pobox', '$extadd', '$street',
                     '$locality', '$region', '$pcode', '$ctry'},
           refs = [#ref{name = vcard_HOME, default = false,
                        min = 0, max = 1, label = '$home'},
                   #ref{name = vcard_WORK, default = false,
                        min = 0, max = 1, label = '$work'},
                   #ref{name = vcard_POSTAL, default = false,
                        min = 0, max = 1, label = '$postal'},
                   #ref{name = vcard_PARCEL, default = false,
                        min = 0, max = 1, label = '$parcel'},
                   #ref{name = vcard_DOM, default = false,
                        min = 0, max = 1, label = '$dom'},
                   #ref{name = vcard_INTL, default = false,
                        min = 0, max = 1, label = '$intl'},
                   #ref{name = vcard_PREF, default = false,
                        min = 0, max = 1, label = '$pref'},
                   #ref{name = vcard_POBOX, min = 0, max = 1, label = '$pobox'},
                   #ref{name = vcard_EXTADD, min = 0, max = 1, label = '$extadd'},
                   #ref{name = vcard_STREET, min = 0, max = 1, label = '$street'},
                   #ref{name = vcard_LOCALITY, min = 0, max = 1, label = '$locality'},
                   #ref{name = vcard_REGION, min = 0, max = 1, label = '$region'},
                   #ref{name = vcard_PCODE, min = 0, max = 1, label = '$pcode'},
                   #ref{name = vcard_CTRY, min = 0, max = 1, label = '$ctry'}]}).

-xml(vcard_LABEL,
     #elem{name = <<"LABEL">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_label, '$home', '$work', '$postal', '$parcel',
                     '$dom', '$intl', '$pref', '$line'},
           refs = [#ref{name = vcard_HOME, default = false,
                        min = 0, max = 1, label = '$home'},
                   #ref{name = vcard_WORK, default = false,
                        min = 0, max = 1, label = '$work'},
                   #ref{name = vcard_POSTAL, default = false,
                        min = 0, max = 1, label = '$postal'},
                   #ref{name = vcard_PARCEL, default = false,
                        min = 0, max = 1, label = '$parcel'},
                   #ref{name = vcard_DOM, default = false,
                        min = 0, max = 1, label = '$dom'},
                   #ref{name = vcard_INTL, default = false,
                        min = 0, max = 1, label = '$intl'},
                   #ref{name = vcard_PREF, default = false,
                        min = 0, max = 1, label = '$pref'},
                   #ref{name = vcard_LINE, label = '$line'}]}).

-xml(vcard_TEL,
     #elem{name = <<"TEL">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_tel, '$home', '$work', '$voice', '$fax',
                     '$pager', '$msg', '$cell', '$video', '$bbs',
                     '$modem', '$isdn', '$pcs', '$pref', '$number'},
           refs = [#ref{name = vcard_HOME, default = false,
                        min = 0, max = 1, label = '$home'},
                   #ref{name = vcard_WORK, default = false,
                        min = 0, max = 1, label = '$work'},
                   #ref{name = vcard_VOICE, default = false,
                        min = 0, max = 1, label = '$voice'},
                   #ref{name = vcard_FAX, default = false,
                        min = 0, max = 1, label = '$fax'},
                   #ref{name = vcard_PAGER, default = false,
                        min = 0, max = 1, label = '$pager'},
                   #ref{name = vcard_MSG, default = false,
                        min = 0, max = 1, label = '$msg'},
                   #ref{name = vcard_CELL, default = false,
                        min = 0, max = 1, label = '$cell'},
                   #ref{name = vcard_VIDEO, default = false,
                        min = 0, max = 1, label = '$video'},
                   #ref{name = vcard_BBS, default = false,
                        min = 0, max = 1, label = '$bbs'},
                   #ref{name = vcard_MODEM, default = false,
                        min = 0, max = 1, label = '$modem'},
                   #ref{name = vcard_ISDN, default = false,
                        min = 0, max = 1, label = '$isdn'},
                   #ref{name = vcard_PCS, default = false,
                        min = 0, max = 1, label = '$pcs'},
                   #ref{name = vcard_PREF, default = false,
                        min = 0, max = 1, label = '$pref'},
                   #ref{name = vcard_NUMBER,
                        min = 0, max = 1, label = '$number'}]}).

-xml(vcard_EMAIL,
     #elem{name = <<"EMAIL">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_email, '$home', '$work',
                     '$internet', '$pref', '$x400', '$userid'},
           refs = [#ref{name = vcard_HOME, default = false,
                        min = 0, max = 1, label = '$home'},
                   #ref{name = vcard_WORK, default = false,
                        min = 0, max = 1, label = '$work'},
                   #ref{name = vcard_INTERNET, default = false,
                        min = 0, max = 1, label = '$internet'},
                   #ref{name = vcard_PREF, default = false,
                        min = 0, max = 1, label = '$pref'},
                   #ref{name = vcard_X400, default = false,
                        min = 0, max = 1, label = '$x400'},
                   #ref{name = vcard_USERID,
                        min = 0, max = 1, label = '$userid'}]}).

-xml(vcard_GEO,
     #elem{name = <<"GEO">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_geo, '$lat', '$lon'},
           refs = [#ref{name = vcard_LAT, min = 0, max = 1, label = '$lat'},
                   #ref{name = vcard_LON, min = 0, max = 1, label = '$lon'}]}).

-xml(vcard_BINVAL,
     #elem{name = <<"BINVAL">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           cdata = #cdata{dec = {base64, decode, []},
                          enc = {base64, encode, []}},
           result = '$cdata'}).

-xml(vcard_LOGO,
     #elem{name = <<"LOGO">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_logo, '$type', '$binval', '$extval'},
           refs = [#ref{name = vcard_TYPE, min = 0, max = 1, label = '$type'},
                   #ref{name = vcard_BINVAL, min = 0, max = 1, label = '$binval'},
                   #ref{name = vcard_EXTVAL, min = 0, max = 1, label = '$extval'}]}).

-xml(vcard_PHOTO,
     #elem{name = <<"PHOTO">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_photo, '$type', '$binval', '$extval'},
           refs = [#ref{name = vcard_TYPE, min = 0, max = 1, label = '$type'},
                   #ref{name = vcard_BINVAL, min = 0, max = 1, label = '$binval'},
                   #ref{name = vcard_EXTVAL, min = 0, max = 1, label = '$extval'}]}).

-xml(vcard_ORG,
     #elem{name = <<"ORG">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_org, '$name', '$units'},
           refs = [#ref{name = vcard_ORGNAME,
                        label = '$name',
                        min = 0, max = 1},
                   #ref{name = vcard_ORGUNIT,
                        label = '$units'}]}).

-xml(vcard_SOUND,
     #elem{name = <<"SOUND">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_sound, '$phonetic', '$binval', '$extval'},
           refs = [#ref{name = vcard_BINVAL, min = 0, max = 1, label = '$binval'},
                   #ref{name = vcard_EXTVAL, min = 0, max = 1, label = '$extval'},
                   #ref{name = vcard_PHONETIC, min = 0, max = 1, label = '$phonetic'}]}).

-xml(vcard_KEY,
     #elem{name = <<"KEY">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_key, '$type', '$cred'},
           refs = [#ref{name = vcard_TYPE, min = 0, max = 1, label = '$type'},
                   #ref{name = vcard_CRED, min = 0, max = 1, label = '$cred'}]}).

-xml(vcard_CATEGORIES,
     #elem{name = <<"CATEGORIES">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = '$keywords',
           refs = [#ref{name = vcard_KEYWORD, label = '$keywords'}]}).

-xml(vcard_CLASS,
     #elem{name = <<"CLASS">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = '$class',
           refs = [#ref{name = vcard_PUBLIC, min = 0, max = 1, label = '$class'},
                   #ref{name = vcard_PRIVATE, min = 0, max = 1, label = '$class'},
                   #ref{name = vcard_CONFIDENTIAL, min = 0, max = 1, label = '$class'}]}).

%% {vcard_AGENT,
%%  #elem{name = <<"AGENT">>,
%%        xmlns = <<"vcard-temp">>,
%%        module = 'xep0054',
%%        result = {vcard_agent, '$vcard', '$extval'},
%%        refs = [#ref{name = vcard, min = 0, max = 1, label = '$vcard'},
%%                #ref{name = vcard_EXTVAL, min = 0, max = 1, label = '$extval'}]}).

-xml(vcard_temp,
     #elem{name = <<"vCard">>,
           xmlns = <<"vcard-temp">>,
	   module = 'xep0054',
           result = {vcard_temp, '$version', '$fn', '$n', '$nickname', '$photo',
                     '$bday', '$adr', '$label', '$tel', '$email', '$jabberid',
                     '$mailer', '$tz', '$geo', '$title', '$role', '$logo',
                     '$org', '$categories', '$note', '$prodid', %% '$agent',
                     '$rev', '$sort_string', '$sound', '$uid', '$url', '$class',
                     '$key', '$desc', '$_els'},
           refs = [#ref{name = vcard_N, min = 0, max = 1, label = '$n'},
                   #ref{name = vcard_ADR, label = '$adr'},
                   #ref{name = vcard_LABEL, label = '$label'},
                   #ref{name = vcard_TEL, label = '$tel'},
                   #ref{name = vcard_EMAIL, label = '$email'},
                   #ref{name = vcard_GEO, min = 0, max = 1, label = '$geo'},
                   #ref{name = vcard_LOGO, min = 0, max = 1, label = '$logo'},
                   #ref{name = vcard_PHOTO, min = 0, max = 1, label = '$photo'},
                   #ref{name = vcard_ORG, min = 0, max = 1, label = '$org'},
                   #ref{name = vcard_SOUND, min = 0, max = 1, label = '$sound'},
                   #ref{name = vcard_KEY, min = 0, max = 1, label = '$key'},
                   #ref{name = vcard_VERSION, min = 0, max = 1, label = '$version'},
                   #ref{name = vcard_FN, min = 0, max = 1, label = '$fn'},
                   #ref{name = vcard_NICKNAME, min = 0, max = 1, label = '$nickname'},
                   #ref{name = vcard_BDAY, min = 0, max = 1, label = '$bday'},
                   #ref{name = vcard_JABBERID, min = 0, max = 1, label = '$jabberid'},
                   #ref{name = vcard_MAILER, min = 0, max = 1, label = '$mailer'},
                   #ref{name = vcard_TZ, min = 0, max = 1, label = '$tz'},
                   #ref{name = vcard_TITLE, min = 0, max = 1, label = '$title'},
                   #ref{name = vcard_ROLE, min = 0, max = 1, label = '$role'},
                   #ref{name = vcard_NOTE, min = 0, max = 1, label = '$note'},
                   #ref{name = vcard_PRODID, min = 0, max = 1, label = '$prodid'},
                   #ref{name = vcard_REV, min = 0, max = 1, label = '$rev'},
                   %%#ref{name = vcard_AGENT, min = 0, max = 1, label = '$agent'},
                   #ref{name = vcard_SORT_STRING, min = 0, max = 1,
                        label = '$sort_string'},
                   #ref{name = vcard_UID, min = 0, max = 1, label = '$uid'},
                   #ref{name = vcard_URL, min = 0, max = 1, label = '$url'},
                   #ref{name = vcard_DESC, min = 0, max = 1, label = '$desc'},
                   #ref{name = vcard_CATEGORIES, default = [], min = 0, max = 1,
                        label = '$categories'},
                   #ref{name = vcard_CLASS, min = 0, max = 1, label = '$class'}]}).

-xml(vcard_xupdate_photo,
     #elem{name = <<"photo">>,
	   xmlns = <<"vcard-temp:x:update">>,
	   module = 'xep0153',
	   result = '$cdata'}).

-xml(vcard_xupdate,
     #elem{name = <<"x">>,
	   xmlns = <<"vcard-temp:x:update">>,
	   module = 'xep0153',
	   result = {vcard_xupdate, '$hash'},
	   refs = [#ref{name = vcard_xupdate_photo, min = 0, max = 1,
			label = '$hash'}]}).

-xml(xdata_field_required,
     #elem{name = <<"required">>,
           xmlns = <<"jabber:x:data">>,
	   module = 'xep0004',
           result = true}).

-xml(xdata_field_desc,
     #elem{name = <<"desc">>,
	   xmlns = <<"jabber:x:data">>,
	   module = 'xep0004',
	   result = '$cdata'}).

-xml(xdata_field_value,
     #elem{name = <<"value">>,
	   xmlns = <<"jabber:x:data">>,
	   module = 'xep0004',
	   result = '$cdata'}).

-xml(xdata_field_option,
     #elem{name = <<"option">>,
           xmlns = <<"jabber:x:data">>,
	   module = 'xep0004',
           result = {xdata_option, '$label', '$value'},
	   attrs = [#attr{name = <<"label">>}],
           refs = [#ref{name = xdata_field_value,
                        label = '$value',
                        min = 1, max = 1}]}).

-xml(xdata_field,
     #elem{name = <<"field">>,
           xmlns = <<"jabber:x:data">>,
	   module = 'xep0004',
           result = {xdata_field, '$label', '$type', '$var',
                     '$required', '$desc', '$values', '$options', '$_els'},
           attrs = [#attr{name = <<"label">>},
                    #attr{name = <<"type">>,
                          enc = {enc_enum, []},
                          dec = {dec_enum, [['boolean',
                                             'fixed',
                                             'hidden',
                                             'jid-multi',
                                             'jid-single',
                                             'list-multi',
                                             'list-single',
                                             'text-multi',
                                             'text-private',
                                             'text-single']]}},
                    #attr{name = <<"var">>}],
           refs = [#ref{name = xdata_field_required,
                        label = '$required',
                        default = false,
                        min = 0, max = 1},
                   #ref{name = xdata_field_desc,
			default = <<"">>,
                        label = '$desc',
                        min = 0, max = 1},
                   #ref{name = xdata_field_value,
                        label = '$values'},
                   #ref{name = xdata_field_option,
                        label = '$options'}]}).

-xml(xdata_instructions,  #elem{name = <<"instructions">>,
                                xmlns = <<"jabber:x:data">>,
				module = 'xep0004',
                                result = '$cdata'}).
-xml(xdata_title, #elem{name = <<"title">>,
                        xmlns = <<"jabber:x:data">>,
			module = 'xep0004',
                        result = '$cdata'}).
-xml(xdata_reported, #elem{name = <<"reported">>,
                           xmlns = <<"jabber:x:data">>,
			   module = 'xep0004',
                           result = '$fields',
                           refs = [#ref{name = xdata_field,
                                        label = '$fields'}]}).
-xml(xdata_item,  #elem{name = <<"item">>,
                        xmlns = <<"jabber:x:data">>,
			module = 'xep0004',
                        result = '$fields',
                        refs = [#ref{name = xdata_field,
                                     label = '$fields'}]}).

-xml(xdata,
     #elem{name = <<"x">>,
           xmlns = <<"jabber:x:data">>,
	   module = 'xep0004',
           result = {xdata, '$type', '$instructions', '$title',
                     '$reported', '$items', '$fields'},
           attrs = [#attr{name = <<"type">>,
                          required = true,
                          dec = {dec_enum, [[cancel, form, result, submit]]},
                          enc = {enc_enum, []}}],
           refs = [#ref{name = xdata_instructions,
                        label = '$instructions'},
                   #ref{name = xdata_title,
                        label = '$title',
                        min = 0, max = 1},
                   #ref{name = xdata_reported,
                        label = '$reported',
                        min = 0, max = 1},
                   #ref{name = xdata_item,
                        label = '$items'},
                   #ref{name = xdata_field,
                        label = '$fields'}]}).

-xml(pubsub_subscription,
     #elem{name = <<"subscription">>,
           xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#owner">>,
		    <<"http://jabber.org/protocol/pubsub#event">>],
	   module = 'xep0060',
	   result = {ps_subscription, '$xmlns', '$jid', '$type',
		     '$node', '$subid', '$expiry'},
	   attrs = [#attr{name = <<"xmlns">>},
		    #attr{name = <<"jid">>,
			  required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
		    #attr{name = <<"node">>},
                    #attr{name = <<"subid">>},
                    #attr{name = <<"subscription">>,
                          label = '$type',
                          dec = {dec_enum, [[none, pending, subscribed,
                                             unconfigured]]},
                          enc = {enc_enum, []}},
		    #attr{name = <<"expiry">>,
			  dec = {dec_utc, []},
			  enc = {enc_utc, []}}]}).

-record(ps_affiliation, {xmlns = <<>> :: binary(),
			 node = <<>> :: binary(),
			 type :: member | none | outcast |
				 owner | publisher | publish_only,
			 jid :: undefined | jid:jid()}).
-type ps_affiliation() :: #ps_affiliation{}.

-xml(pubsub_affiliation,
     #elem{name = <<"affiliation">>,
           xmlns = <<"http://jabber.org/protocol/pubsub">>,
	   module = 'xep0060',
           result = {ps_affiliation, '$xmlns', '$node', '$type', '$_'},
           attrs = [#attr{name = <<"node">>, required = true},
		    #attr{name = <<"xmlns">>},
                    #attr{name = <<"affiliation">>,
                          label = '$type',
                          required = true,
                          dec = {dec_ps_aff, []},
                          enc = {enc_ps_aff, []}}]}).

-xml(pubsub_owner_affiliation,
     #elem{name = <<"affiliation">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#owner">>,
	   module = 'xep0060',
           result = {ps_affiliation, '$xmlns', '$_', '$type', '$jid'},
           attrs = [#attr{name = <<"jid">>,
			  required = true,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}},
		    #attr{name = <<"xmlns">>},
                    #attr{name = <<"affiliation">>,
                          label = '$type',
                          required = true,
			  dec = {dec_ps_aff, []},
                          enc = {enc_ps_aff, []}}]}).

-xml(pubsub_event_configuration,
     #elem{name = <<"configuration">>,
	   xmlns = <<"http://jabber.org/protocol/pubsub#event">>,
	   module = 'xep0060',
	   result = {'$node', '$xdata'},
	   attrs = [#attr{name = <<"node">>, required = true}],
	   refs = [#ref{name = xdata, min = 0, max = 1}]}).

-xml(pubsub_event_retract,
     #elem{name = <<"retract">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#event">>,
	   module = 'xep0060',
           result = '$id',
           attrs = [#attr{name = <<"id">>, required = true}]}).

-xml(pubsub_item,
     #elem{name = <<"item">>,
           xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#event">>],
	   module = 'xep0060',
	   ignore_els = true,
           result = {ps_item, '$xmlns', '$id', '$_els', '$node', '$publisher'},
           attrs = [#attr{name = <<"id">>},
		    #attr{name = <<"xmlns">>},
                    #attr{name = <<"node">>},
                    #attr{name = <<"publisher">>}]}).

-xml(pubsub_items,
     #elem{name = <<"items">>,
           xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#event">>],
	   module = 'xep0060',
           result = {ps_items, '$xmlns', '$node', '$items', '$max_items',
                     '$subid', '$retract'},
           attrs = [#attr{name = <<"xmlns">>},
		    #attr{name = <<"max_items">>,
                          dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
                    #attr{name = <<"node">>,
                          required = true},
                    #attr{name = <<"subid">>}],
           refs = [#ref{name = pubsub_event_retract, label = '$retract',
			min = 0},
		   #ref{name = pubsub_item, label = '$items'}]}).

-xml(pubsub_event,
     #elem{name = <<"event">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#event">>,
	   module = 'xep0060',
           result = {ps_event, '$items', '$purge', '$subscription', '$delete',
		    '$create', '$configuration'},
           refs = [#ref{name = pubsub_items, label = '$items',
			min = 0, max = 1},
		   #ref{name = pubsub_subscription, min = 0, max = 1,
			label = '$subscription'},
		   #ref{name = pubsub_purge, min = 0, max = 1,
			label = '$purge'},
		   #ref{name = pubsub_delete, min = 0, max = 1,
			label = '$delete'},
		   #ref{name = pubsub_create, min = 0, max = 1,
			label = '$create'},
		   #ref{name = pubsub_event_configuration, min = 0, max = 1,
			label = '$configuration'}]}).

-xml(pubsub_subscriptions,
     #elem{name = <<"subscriptions">>,
           xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#owner">>],
	   module = 'xep0060',
           result = {'$node', '$subscriptions'},
           attrs = [#attr{name = <<"node">>}],
           refs = [#ref{name = pubsub_subscription, label = '$subscriptions'}]}).

-xml(pubsub_affiliations,
     #elem{name = <<"affiliations">>,
           xmlns = <<"http://jabber.org/protocol/pubsub">>,
	   module = 'xep0060',
           result = {'$node', '$affiliations'},
	   attrs = [#attr{name = <<"node">>}],
           refs = [#ref{name = pubsub_affiliation, label = '$affiliations'}]}).

-xml(pubsub_owner_affiliations,
     #elem{name = <<"affiliations">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#owner">>,
	   module = 'xep0060',
           result = {'$node', '$affiliations'},
	   attrs = [#attr{name = <<"node">>}],
           refs = [#ref{name = pubsub_owner_affiliation, label = '$affiliations'}]}).

-xml(pubsub_subscribe,
     #elem{name = <<"subscribe">>,
           xmlns = <<"http://jabber.org/protocol/pubsub">>,
	   module = 'xep0060',
           result = {ps_subscribe, '$node', '$jid'},
           attrs = [#attr{name = <<"node">>},
                    #attr{name = <<"jid">>,
                          required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}]}).

-xml(pubsub_unsubscribe,
     #elem{name = <<"unsubscribe">>,
           xmlns = <<"http://jabber.org/protocol/pubsub">>,
	   module = 'xep0060',
           result = {ps_unsubscribe, '$node', '$jid', '$subid'},
           attrs = [#attr{name = <<"node">>},
                    #attr{name = <<"subid">>},
                    #attr{name = <<"jid">>,
                          required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}]}).

-xml(pubsub_publish,
     #elem{name = <<"publish">>,
           xmlns = <<"http://jabber.org/protocol/pubsub">>,
	   module = 'xep0060',
           result = {ps_publish, '$node', '$items'},
           attrs = [#attr{name = <<"node">>,
                          required = true}],
           refs = [#ref{name = pubsub_item, label = '$items'}]}).

-xml(pubsub_options,
     #elem{name = <<"options">>,
           xmlns = <<"http://jabber.org/protocol/pubsub">>,
	   module = 'xep0060',
           result = {ps_options, '$node', '$jid', '$subid', '$xdata'},
           attrs = [#attr{name = <<"node">>},
                    #attr{name = <<"subid">>},
                    #attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}],
           refs = [#ref{name = xdata, min = 0, max = 1,
                        label = '$xdata'}]}).

-xml(pubsub_retract,
     #elem{name = <<"retract">>,
           xmlns = <<"http://jabber.org/protocol/pubsub">>,
	   module = 'xep0060',
           result = {ps_retract, '$node', '$notify', '$items'},
           attrs = [#attr{name = <<"node">>,
                          required = true},
                    #attr{name = <<"notify">>,
                          default = false,
                          dec = {dec_bool, []},
                          enc = {enc_bool, []}}],
           refs = [#ref{name = pubsub_item, label = '$items'}]}).

-xml(pubsub_create,
     #elem{name = <<"create">>,
	   xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#event">>],
	   module = 'xep0060',
	   result = '$node',
	   attrs = [#attr{name = <<"node">>}]}).

-xml(pubsub_configure,
     #elem{name = <<"configure">>,
	   xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#owner">>],
	   module = 'xep0060',
	   result = {'$node', '$xdata'},
	   attrs = [#attr{name = <<"node">>}],
	   refs = [#ref{name = xdata, min = 0, max = 1}]}).

-xml(pubsub_publish_options,
     #elem{name = <<"publish-options">>,
	   xmlns = <<"http://jabber.org/protocol/pubsub">>,
	   module = 'xep0060',
	   result = '$xdata',
	   refs = [#ref{name = xdata, min = 0, max = 1}]}).

-xml(pubsub_default,
     #elem{name = <<"default">>,
	   xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#owner">>],
	   module = 'xep0060',
	   result = {'$node', '$xdata'},
	   attrs = [#attr{name = <<"node">>}],
	   refs = [#ref{name = xdata, min = 0, max = 1}]}).

-xml(pubsub_redirect,
     #elem{name = <<"redirect">>,
	   xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#owner">>,
		    <<"http://jabber.org/protocol/pubsub#event">>],
	   module = 'xep0060',
	   result = '$uri',
	   attrs = [#attr{name = <<"uri">>, required = true}]}).

-xml(pubsub_delete,
     #elem{name = <<"delete">>,
	   xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#owner">>,
		    <<"http://jabber.org/protocol/pubsub#event">>],
	   module = 'xep0060',
	   result = {'$node', '$uri'},
	   attrs = [#attr{name = <<"node">>, required = true}],
	   refs = [#ref{name = pubsub_redirect, min = 0, max = 1,
			label = '$uri', default = <<>>}]}).

-xml(pubsub_purge,
     #elem{name = <<"purge">>,
	   xmlns = [<<"http://jabber.org/protocol/pubsub">>,
		    <<"http://jabber.org/protocol/pubsub#owner">>,
		    <<"http://jabber.org/protocol/pubsub#event">>],
	   module = 'xep0060',
	   result = '$node',
	   attrs = [#attr{name = <<"node">>, required = true}]}).

-xml(pubsub,
     #elem{name = <<"pubsub">>,
           xmlns = <<"http://jabber.org/protocol/pubsub">>,
	   module = 'xep0060',
           result = {pubsub, '$subscriptions', '$subscription',
		     '$affiliations', '$publish', '$publish_options',
		     '$subscribe', '$unsubscribe', '$options', '$items',
		     '$retract', '$create', '$configure', '$default', '$delete',
		     '$purge', '$rsm'},
           refs = [#ref{name = pubsub_subscriptions, label = '$subscriptions',
                        min = 0, max = 1},
                   #ref{name = pubsub_affiliations, label = '$affiliations',
                        min = 0, max = 1},
                   #ref{name = pubsub_subscribe, label = '$subscribe',
                        min = 0, max = 1},
                   #ref{name = pubsub_unsubscribe, label = '$unsubscribe',
                        min = 0, max = 1},
                   #ref{name = pubsub_options, label = '$options',
                        min = 0, max = 1},
                   #ref{name = pubsub_items, label = '$items',
                        min = 0, max = 1},
                   #ref{name = pubsub_retract, label = '$retract',
                        min = 0, max = 1},
		   #ref{name = pubsub_create, label = '$create',
			min = 0, max = 1},
		   #ref{name = pubsub_configure, label = '$configure',
			min = 0, max = 1},
		   #ref{name = pubsub_publish_options, min = 0, max = 1,
			label = '$publish_options'},
		   #ref{name = pubsub_default, label = '$default',
			min = 0, max = 1},
		   #ref{name = pubsub_delete, label = '$delete',
			min = 0, max = 1},
		   #ref{name = pubsub_purge, label = '$purge',
			min = 0, max = 1},
		   #ref{name = pubsub_subscription, label = '$subscription',
			min = 0, max = 1},
		   #ref{name = rsm_set, min = 0, max = 1, label = '$rsm'},
                   #ref{name = pubsub_publish, label = '$publish',
                        min = 0, max = 1}]}).

-xml(pubsub_owner,
     #elem{name = <<"pubsub">>,
	   xmlns = <<"http://jabber.org/protocol/pubsub#owner">>,
	   module = 'xep0060',
	   result = {pubsub_owner, '$affiliations', '$configure', '$default',
		     '$delete', '$purge', '$subscriptions'},
	   refs = [#ref{name = pubsub_owner_affiliations,
			label = '$affiliations', min = 0, max = 1},
		   #ref{name = pubsub_configure, label = '$configure',
			min = 0, max = 1},
		   #ref{name = pubsub_default, label = '$default',
			min = 0, max = 1},
		   #ref{name = pubsub_delete, label = '$delete',
			min = 0, max = 1},
		   #ref{name = pubsub_purge, label = '$purge',
			min = 0, max = 1},
		   #ref{name = pubsub_subscriptions,
			label = '$subscriptions', min = 0, max = 1}]}).

-type ps_error_type() :: 'closed-node' | 'configuration-required' |
			 'invalid-jid' | 'invalid-options' |
			 'invalid-payload' | 'invalid-subid' |
			 'item-forbidden' | 'item-required' | 'jid-required' |
			 'max-items-exceeded' | 'max-nodes-exceeded' |
			 'nodeid-required' | 'not-in-roster-group' |
			 'not-subscribed' | 'payload-too-big' |
			 'payload-required' | 'pending-subscription' |
			 'precondition-not-met' |
			 'presence-subscription-required' | 'subid-required' |
			 'too-many-subscriptions' | 'unsupported' |
			 'unsupported-access-model'.
-type ps_feature() :: 'access-authorize' | 'access-open' |
		      'access-presence' | 'access-roster' |
		      'access-whitelist' | 'auto-create' |
		      'auto-subscribe' | 'collections' | 'config-node' |
		      'create-and-configure' | 'create-nodes' |
		      'delete-items' | 'delete-nodes' |
		      'filtered-notifications' | 'get-pending' |
		      'instant-nodes' | 'item-ids' | 'last-published' |
		      'leased-subscription' | 'manage-subscriptions' |
		      'member-affiliation' | 'meta-data' |
		      'modify-affiliations' | 'multi-collection' |
		      'multi-subscribe' | 'outcast-affiliation' |
		      'persistent-items' | 'presence-notifications' |
		      'presence-subscribe' | 'publish' |
		      'publish-options' | 'publish-only-affiliation' |
		      'publisher-affiliation' | 'purge-nodes' |
		      'retract-items' | 'retrieve-affiliations' |
		      'retrieve-default' | 'retrieve-items' |
		      'retrieve-subscriptions' | 'subscribe' |
		      'subscription-options' | 'subscription-notifications' |
		      'multi-items' | undefined.
-record(ps_error, {type :: ps_error_type(), feature :: ps_feature()}).
-type ps_error() :: #ps_error{}.

-xml(pubsub_error_closed_node,
     #elem{name = <<"closed-node">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'closed-node', '$_'}}).
-xml(pubsub_error_configuration_required,
     #elem{name = <<"configuration-required">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'configuration-required', '$_'}}).
-xml(pubsub_error_invalid_jid,
     #elem{name = <<"invalid-jid">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'invalid-jid', '$_'}}).
-xml(pubsub_error_invalid_options,
     #elem{name = <<"invalid-options">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'invalid-options', '$_'}}).
-xml(pubsub_error_invalid_payload,
     #elem{name = <<"invalid-payload">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'invalid-payload', '$_'}}).
-xml(pubsub_error_invalid_subid,
     #elem{name = <<"invalid-subid">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'invalid-subid', '$_'}}).
-xml(pubsub_error_item_forbidden,
     #elem{name = <<"item-forbidden">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'item-forbidden', '$_'}}).
-xml(pubsub_error_item_required,
     #elem{name = <<"item-required">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'item-required', '$_'}}).
-xml(pubsub_error_jid_required,
     #elem{name = <<"jid-required">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'jid-required', '$_'}}).
-xml(pubsub_error_max_items_exceeded,
     #elem{name = <<"max-items-exceeded">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'max-items-exceeded', '$_'}}).
-xml(pubsub_error_max_nodes_exceeded,
     #elem{name = <<"max-nodes-exceeded">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'max-nodes-exceeded', '$_'}}).
-xml(pubsub_error_nodeid_required,
     #elem{name = <<"nodeid-required">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'nodeid-required', '$_'}}).
-xml(pubsub_error_not_in_roster_group,
     #elem{name = <<"not-in-roster-group">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'not-in-roster-group', '$_'}}).
-xml(pubsub_error_not_subscribed,
     #elem{name = <<"not-subscribed">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'not-subscribed', '$_'}}).
-xml(pubsub_error_payload_too_big,
     #elem{name = <<"payload-too-big">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'payload-too-big', '$_'}}).
-xml(pubsub_error_payload_required,
     #elem{name = <<"payload-required">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'payload-required', '$_'}}).
-xml(pubsub_error_pending_subscription,
     #elem{name = <<"pending-subscription">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'pending-subscription', '$_'}}).
-xml(pubsub_error_precondition_not_met,
     #elem{name = <<"precondition-not-met">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'precondition-not-met', '$_'}}).
-xml(pubsub_error_presence_subscription_required,
     #elem{name = <<"presence-subscription-required">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'presence-subscription-required', '$_'}}).
-xml(pubsub_error_subid_required,
     #elem{name = <<"subid-required">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'subid-required', '$_'}}).
-xml(pubsub_error_too_many_subscriptions,
     #elem{name = <<"too-many-subscriptions">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'too-many-subscriptions', '$_'}}).
-xml(pubsub_error_unsupported,
     #elem{name = <<"unsupported">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'unsupported', '$feature'},
	   attrs = [#attr{name = <<"feature">>, required = true,
			  dec = {dec_enum, [['access-authorize',
                                             'access-open',
                                             'access-presence',
                                             'access-roster',
                                             'access-whitelist',
                                             'auto-create',
                                             'auto-subscribe',
                                             'collections',
                                             'config-node',
                                             'create-and-configure',
                                             'create-nodes',
                                             'delete-items',
                                             'delete-nodes',
                                             'filtered-notifications',
                                             'get-pending',
                                             'instant-nodes',
                                             'item-ids',
                                             'last-published',
                                             'leased-subscription',
                                             'manage-subscriptions',
                                             'member-affiliation',
                                             'meta-data',
                                             'modify-affiliations',
                                             'multi-collection',
					     'multi-items',
                                             'multi-subscribe',
                                             'outcast-affiliation',
                                             'persistent-items',
                                             'presence-notifications',
                                             'presence-subscribe',
                                             'publish',
                                             'publish-options',
                                             'publish-only-affiliation',
                                             'publisher-affiliation',
                                             'purge-nodes',
                                             'retract-items',
                                             'retrieve-affiliations',
                                             'retrieve-default',
                                             'retrieve-items',
                                             'retrieve-subscriptions',
                                             'subscribe',
                                             'subscription-options',
                                             'subscription-notifications']]},
			  enc = {enc_enum, []}}]}).
-xml(pubsub_error_unsupported_access_model,
     #elem{name = <<"unsupported-access-model">>,
           xmlns = <<"http://jabber.org/protocol/pubsub#errors">>,
	   module = 'xep0060',
           result = {ps_error, 'unsupported-access-model', '$_'}}).

-xml(shim_header,
     #elem{name = <<"header">>,
           xmlns = <<"http://jabber.org/protocol/shim">>,
	   module = 'xep0131',
           result = {'$name', '$cdata'},
           attrs = [#attr{name = <<"name">>,
                          required = true}]}).

-xml(shim_headers,
     #elem{name = <<"headers">>,
           xmlns = <<"http://jabber.org/protocol/shim">>,
	   module = 'xep0131',
           result = {shim, '$headers'},
           refs = [#ref{name = shim_header, label = '$headers'}]}).

-record(chatstate, {type :: active | composing | gone | inactive | paused}).
-type chatstate() :: #chatstate{}.

-xml(chatstate_active,
     #elem{name = <<"active">>,
           xmlns = <<"http://jabber.org/protocol/chatstates">>,
	   module = 'xep0085',
           result = {chatstate, active}}).

-xml(chatstate_composing,
     #elem{name = <<"composing">>,
           xmlns = <<"http://jabber.org/protocol/chatstates">>,
	   module = 'xep0085',
           result = {chatstate, composing}}).

-xml(chatstate_gone,
     #elem{name = <<"gone">>,
           xmlns = <<"http://jabber.org/protocol/chatstates">>,
	   module = 'xep0085',
           result = {chatstate, gone}}).

-xml(chatstate_inactive,
     #elem{name = <<"inactive">>,
           xmlns = <<"http://jabber.org/protocol/chatstates">>,
	   module = 'xep0085',
           result = {chatstate, inactive}}).

-xml(chatstate_paused,
     #elem{name = <<"paused">>,
           xmlns = <<"http://jabber.org/protocol/chatstates">>,
	   module = 'xep0085',
           result = {chatstate, paused}}).

-xml(delay,
     #elem{name = <<"delay">>,
           xmlns = <<"urn:xmpp:delay">>,
	   module = 'xep0203',
           result = {delay, '$stamp', '$from', '$desc'},
	   cdata = #cdata{label = '$desc', default = <<"">>},
           attrs = [#attr{name = <<"stamp">>,
                          required = true,
                          dec = {dec_utc, []},
                          enc = {enc_utc, []}},
                    #attr{name = <<"from">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}]}).

-xml(bytestreams_streamhost,
     #elem{name = <<"streamhost">>,
           xmlns = <<"http://jabber.org/protocol/bytestreams">>,
	   module = 'xep0065',
           result = {streamhost, '$jid', '$host', '$port'},
           attrs = [#attr{name = <<"jid">>,
                          required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"host">>,
                          required = true},
                    #attr{name = <<"port">>,
                          default = 1080,
                          dec = {dec_int, [0, 65535]},
                          enc = {enc_int, []}}]}).

-xml(bytestreams_streamhost_used,
     #elem{name = <<"streamhost-used">>,
           xmlns = <<"http://jabber.org/protocol/bytestreams">>,
	   module = 'xep0065',
           result = '$jid',
           attrs = [#attr{name = <<"jid">>,
                          required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}]}).

-xml(bytestreams_activate,
     #elem{name = <<"activate">>,
           xmlns = <<"http://jabber.org/protocol/bytestreams">>,
	   module = 'xep0065',
           cdata = #cdata{enc = {jid, encode, []}, dec = {jid, decode, []}},
           result = '$cdata'}).

-xml(bytestreams,
     #elem{name = <<"query">>,
           xmlns = <<"http://jabber.org/protocol/bytestreams">>,
	   module = 'xep0065',
           result = {bytestreams, '$hosts', '$used', '$activate',
                     '$dstaddr', '$mode', '$sid'},
           attrs = [#attr{name = <<"dstaddr">>},
                    #attr{name = <<"sid">>},
                    #attr{name = <<"mode">>,
                          default = tcp,
                          dec = {dec_enum, [[tcp, udp]]},
                          enc = {enc_enum, []}}],
           refs = [#ref{name = bytestreams_streamhost, label = '$hosts'},
                   #ref{name = bytestreams_streamhost_used,
                        min = 0, max = 1, label = '$used'},
                   #ref{name = bytestreams_activate,
                        min = 0, max = 1, label = '$activate'}]}).

-xml(muc_history,
     #elem{name = <<"history">>,
           xmlns = <<"http://jabber.org/protocol/muc">>,
	   module = 'xep0045',
           result = {muc_history, '$maxchars', '$maxstanzas',
                     '$seconds', '$since'},
           attrs = [#attr{name = <<"maxchars">>,
                          dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
                    #attr{name = <<"maxstanzas">>,
                          dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
                    #attr{name = <<"seconds">>,
                          dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
                    #attr{name = <<"since">>,
                          dec = {dec_utc, []},
                          enc = {enc_utc, []}}]}).

-xml(muc_reason,
     #elem{name = <<"reason">>,
           xmlns = [<<"http://jabber.org/protocol/muc#user">>,
		    <<"http://jabber.org/protocol/muc#admin">>,
		    <<"http://jabber.org/protocol/muc#owner">>],
	   module = 'xep0045',
           result = '$cdata'}).

-xml(muc_user_decline,
     #elem{name = <<"decline">>,
           xmlns = <<"http://jabber.org/protocol/muc#user">>,
	   module = 'xep0045',
           result = {muc_decline, '$reason', '$from', '$to'},
           attrs = [#attr{name = <<"to">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"from">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}],
           refs = [#ref{name = muc_reason, min = 0,
			default = <<"">>,
                        max = 1, label = '$reason'}]}).

-xml(muc_destroy,
     #elem{name = <<"destroy">>,
	   xmlns = [<<"http://jabber.org/protocol/muc#user">>,
		    <<"http://jabber.org/protocol/muc#owner">>],
	   module = 'xep0045',
	   result = {muc_destroy, '$xmlns', '$jid', '$reason', '$password'},
	   attrs = [#attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
		    #attr{name = <<"xmlns">>}],
	   refs = [#ref{name = muc_reason, min = 0,
			default = <<"">>,
                        max = 1, label = '$reason'},
		   #ref{name = muc_password, min = 0, max = 1,
			label = '$password'}]}).

-xml(muc_user_invite,
     #elem{name = <<"invite">>,
           xmlns = <<"http://jabber.org/protocol/muc#user">>,
	   module = 'xep0045',
           result = {muc_invite, '$reason', '$from', '$to', '$continue'},
           attrs = [#attr{name = <<"to">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"from">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}],
           refs = [#ref{name = muc_reason, min = 0, default = <<"">>,
                        max = 1, label = '$reason'},
		   #ref{name = muc_user_continue, min = 0, max = 1,
			label = '$continue'}]}).

-xml(muc_user_actor,
     #elem{name = <<"actor">>,
           xmlns = <<"http://jabber.org/protocol/muc#user">>,
	   module = 'xep0045',
           result = {muc_actor, '$jid', '$nick'},
           attrs = [#attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"nick">>}]}).

-xml(muc_user_continue,
     #elem{name = <<"continue">>,
           xmlns = <<"http://jabber.org/protocol/muc#user">>,
	   module = 'xep0045',
           result = '$thread',
           attrs = [#attr{name = <<"thread">>}]}).

-xml(muc_user_status,
     #elem{name = <<"status">>,
           xmlns = <<"http://jabber.org/protocol/muc#user">>,
	   module = 'xep0045',
           result = '$code',
           attrs = [#attr{name = <<"code">>,
                          dec = {dec_int, [100, 999]},
                          enc = {enc_int, []}}]}).

-xml(muc_user_item,
     #elem{name = <<"item">>,
           xmlns = <<"http://jabber.org/protocol/muc#user">>,
	   module = 'xep0045',
           result = {muc_item, '$actor', '$continue', '$reason',
                     '$affiliation', '$role', '$jid', '$nick'},
           refs = [#ref{name = muc_user_actor,
                        min = 0, max = 1, label = '$actor'},
                   #ref{name = muc_user_continue,
                        min = 0, max = 1, label = '$continue'},
                   #ref{name = muc_reason, default = <<"">>,
                        min = 0, max = 1, label = '$reason'}],
           attrs = [#attr{name = <<"affiliation">>,
                          dec = {dec_enum, [[admin, member, none,
                                             outcast, owner]]},
                          enc = {enc_enum, []}},
                    #attr{name = <<"role">>,
                          dec = {dec_enum, [[moderator, none,
                                             participant, visitor]]},
                          enc = {enc_enum, []}},
                    #attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"nick">>}]}).

-xml(muc_user,
     #elem{name = <<"x">>,
           xmlns = <<"http://jabber.org/protocol/muc#user">>,
	   module = 'xep0045',
           result = {muc_user, '$decline', '$destroy', '$invites',
                     '$items', '$status_codes', '$password'},
           refs = [#ref{name = muc_user_decline, min = 0,
                        max = 1, label = '$decline'},
                   #ref{name = muc_destroy, min = 0, max = 1,
                        label = '$destroy'},
		   #ref{name = muc_password, min = 0, max = 1,
			label = '$password'},
                   #ref{name = muc_user_invite, label = '$invites'},
                   #ref{name = muc_user_item, label = '$items'},
                   #ref{name = muc_user_status, label = '$status_codes'}]}).

-xml(muc_password,
     #elem{name = <<"password">>,
           xmlns = [<<"http://jabber.org/protocol/muc#owner">>,
		    <<"http://jabber.org/protocol/muc#user">>,
		    <<"http://jabber.org/protocol/muc">>],
	   module = 'xep0045',
           result = '$cdata'}).

-xml(muc_owner,
     #elem{name = <<"query">>,
           xmlns = <<"http://jabber.org/protocol/muc#owner">>,
	   module = 'xep0045',
           result = {muc_owner, '$destroy', '$config', '$items'},
           refs = [#ref{name = muc_destroy, min = 0, max = 1,
			label = '$destroy'},
                   #ref{name = xdata, min = 0, max = 1,
			label = '$config'},
		   #ref{name = muc_owner_item, label = '$items'}]}).

-xml(muc_owner_item,
     #elem{name = <<"item">>,
           xmlns = <<"http://jabber.org/protocol/muc#owner">>,
	   module = 'xep0045',
           result = {muc_item, '$actor', '$continue', '$reason',
                     '$affiliation', '$role', '$jid', '$nick'},
           refs = [#ref{name = muc_admin_actor,
                        min = 0, max = 1, label = '$actor'},
                   #ref{name = muc_admin_continue,
                        min = 0, max = 1, label = '$continue'},
                   #ref{name = muc_reason, default = <<"">>,
                        min = 0, max = 1, label = '$reason'}],
           attrs = [#attr{name = <<"affiliation">>,
                          dec = {dec_enum, [[admin, member, none,
                                             outcast, owner]]},
                          enc = {enc_enum, []}},
                    #attr{name = <<"role">>,
                          dec = {dec_enum, [[moderator, none,
                                             participant, visitor]]},
                          enc = {enc_enum, []}},
                    #attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"nick">>}]}).

-xml(muc_admin_item,
     #elem{name = <<"item">>,
           xmlns = <<"http://jabber.org/protocol/muc#admin">>,
	   module = 'xep0045',
           result = {muc_item, '$actor', '$continue', '$reason',
                     '$affiliation', '$role', '$jid', '$nick'},
           refs = [#ref{name = muc_admin_actor,
                        min = 0, max = 1, label = '$actor'},
                   #ref{name = muc_admin_continue,
                        min = 0, max = 1, label = '$continue'},
                   #ref{name = muc_reason, default = <<"">>,
                        min = 0, max = 1, label = '$reason'}],
           attrs = [#attr{name = <<"affiliation">>,
                          dec = {dec_enum, [[admin, member, none,
                                             outcast, owner]]},
                          enc = {enc_enum, []}},
                    #attr{name = <<"role">>,
                          dec = {dec_enum, [[moderator, none,
                                             participant, visitor]]},
                          enc = {enc_enum, []}},
                    #attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"nick">>}]}).

-xml(muc_admin_actor,
     #elem{name = <<"actor">>,
           xmlns = <<"http://jabber.org/protocol/muc#admin">>,
	   module = 'xep0045',
           result = {muc_actor, '$jid', '$nick'},
           attrs = [#attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
                    #attr{name = <<"nick">>}]}).

-xml(muc_admin_continue,
     #elem{name = <<"continue">>,
           xmlns = <<"http://jabber.org/protocol/muc#admin">>,
	   module = 'xep0045',
           result = '$thread',
           attrs = [#attr{name = <<"thread">>}]}).

-xml(muc_admin,
     #elem{name = <<"query">>,
	   xmlns = <<"http://jabber.org/protocol/muc#admin">>,
	   module = 'xep0045',
	   result = {muc_admin, '$items'},
	   refs = [#ref{name = muc_admin_item, label = '$items'}]}).

-xml(muc,
     #elem{name = <<"x">>,
           xmlns = <<"http://jabber.org/protocol/muc">>,
	   module = 'xep0045',
           result = {muc, '$history', '$password'},
           refs = [#ref{name = muc_history, min = 0, max = 1,
                        label = '$history'},
		   #ref{name = muc_password, min = 0, max = 1,
			label = '$password'}]}).

-xml(muc_unique,
     #elem{name = <<"unique">>,
	   xmlns = <<"http://jabber.org/protocol/muc#unique">>,
	   module = 'xep0045',
	   result = {muc_unique, '$name'},
	   cdata = #cdata{default = <<"">>,
			  label = '$name'}}).

-xml(x_conference,
     #elem{name = <<"x">>,
	   xmlns = <<"jabber:x:conference">>,
	   module = 'xep0249',
	   result = {x_conference, '$jid', '$password', '$reason',
		     '$continue', '$thread'},
	   attrs = [#attr{name = <<"jid">>,
			  required = true,
			  dec = {jid, decode, []},
                          enc = {jid, encode, []}},
		    #attr{name = <<"password">>, default = <<"">>},
		    #attr{name = <<"reason">>, default = <<"">>},
		    #attr{name = <<"thread">>, default = <<"">>},
		    #attr{name = <<"continue">>,
			  dec = {dec_bool, []},
			  enc = {enc_bool, []}}]}).

-xml(muc_subscription,
     #elem{name = <<"subscription">>,
	   xmlns = <<"urn:xmpp:mucsub:0">>,
	   module = p1_mucsub,
	   result = {muc_subscription, '$jid', '$nick', '$events'},
	   attrs = [#attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}},
		    #attr{name = <<"nick">>}],
	   refs = [#ref{name = muc_subscribe_event, label = '$events'}]}).

-xml(muc_subscriptions,
     #elem{name = <<"subscriptions">>,
	   xmlns = <<"urn:xmpp:mucsub:0">>,
	   module = p1_mucsub,
	   result = {muc_subscriptions, '$list'},
	   refs = [#ref{name = muc_subscription, label = '$list'}]}).

-xml(muc_subscribe_event,
     #elem{name = <<"event">>,
	   xmlns = <<"urn:xmpp:mucsub:0">>,
	   module = p1_mucsub,
	   result = '$node',
	   attrs = [#attr{name = <<"node">>, required = true}]}).

-xml(muc_subscribe,
     #elem{name = <<"subscribe">>,
	   xmlns = <<"urn:xmpp:mucsub:0">>,
	   module = p1_mucsub,
	   result = {muc_subscribe, '$nick', '$password', '$jid', '$events'},
	   attrs = [#attr{name = <<"nick">>, required = true}, #attr{name = <<"password">>},
		    #attr{name = <<"jid">>,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}],
	   refs = [#ref{name = muc_subscribe_event, label = '$events'}]}).

-xml(muc_unsubscribe,
     #elem{name = <<"unsubscribe">>,
	   xmlns = <<"urn:xmpp:mucsub:0">>,
	   module = p1_mucsub,
	   attrs = [#attr{name = <<"nick">>},
	        #attr{name = <<"jid">>,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}}],
	   result = {muc_unsubscribe, '$nick', '$jid'}}).

-xml(rsm_after,
     #elem{name = <<"after">>,
           xmlns = <<"http://jabber.org/protocol/rsm">>,
	   module = 'xep0059',
	   cdata = #cdata{required = true},
           result = '$cdata'}).

-xml(rsm_before,
     #elem{name = <<"before">>,
           xmlns = <<"http://jabber.org/protocol/rsm">>,
	   module = 'xep0059',
	   cdata = #cdata{default = <<"">>},
           result = '$cdata'}).

-xml(rsm_last,
     #elem{name = <<"last">>,
           xmlns = <<"http://jabber.org/protocol/rsm">>,
	   module = 'xep0059',
           result = '$cdata'}).

-xml(rsm_count,
     #elem{name = <<"count">>, result = '$cdata',
           xmlns = <<"http://jabber.org/protocol/rsm">>,
	   module = 'xep0059',
           cdata = #cdata{dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}}}).

-xml(rsm_index,
     #elem{name = <<"index">>, result = '$cdata',
           xmlns = <<"http://jabber.org/protocol/rsm">>,
	   module = 'xep0059',
           cdata = #cdata{dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}}}).

-xml(rsm_max,
     #elem{name = <<"max">>, result = '$cdata',
           xmlns = <<"http://jabber.org/protocol/rsm">>,
	   module = 'xep0059',
           cdata = #cdata{dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}}}).

-xml(rsm_first,
     #elem{name = <<"first">>,
           xmlns = <<"http://jabber.org/protocol/rsm">>,
	   module = 'xep0059',
           result = {rsm_first, '$index', '$data'},
           cdata = #cdata{label = '$data'},
           attrs = [#attr{name = <<"index">>,
                          dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}}]}).

-xml(rsm_set,
     #elem{name = <<"set">>,
           xmlns = <<"http://jabber.org/protocol/rsm">>,
	   module = 'xep0059',
           result = {rsm_set, '$after', '$before', '$count',
                     '$first', '$index', '$last', '$max'},
           refs = [#ref{name = rsm_after, label = '$after', min = 0, max = 1},
                   #ref{name = rsm_before, label = '$before', min = 0, max = 1},
                   #ref{name = rsm_count, label = '$count', min = 0, max = 1},
                   #ref{name = rsm_first, label = '$first', min = 0, max = 1},
                   #ref{name = rsm_index, label = '$index', min = 0, max = 1},
                   #ref{name = rsm_last, label = '$last', min = 0, max = 1},
                   #ref{name = rsm_max, label = '$max', min = 0, max = 1}]}).

-xml(mam_start,
     #elem{name = <<"start">>,
           xmlns = <<"urn:xmpp:mam:tmp">>,
	   module = 'xep0313',
           result = '$cdata',
           cdata = #cdata{required = true,
                          dec = {dec_utc, []},
                          enc = {enc_utc, []}}}).

-xml(mam_end,
     #elem{name = <<"end">>,
           xmlns = <<"urn:xmpp:mam:tmp">>,
	   module = 'xep0313',
           result = '$cdata',
           cdata = #cdata{required = true,
                          dec = {dec_utc, []},
                          enc = {enc_utc, []}}}).

-xml(mam_with,
     #elem{name = <<"with">>,
           xmlns = <<"urn:xmpp:mam:tmp">>,
	   module = 'xep0313',
           result = '$cdata',
           cdata = #cdata{required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}}).

-xml(mam_withtext,
     #elem{name = <<"withtext">>,
	   xmlns = <<"urn:xmpp:mam:tmp">>,
	   module = 'xep0313',
	   result = '$cdata',
	   cdata = #cdata{required = true}}).

-xml(mam_flip_page,
     #elem{name = <<"flip-page">>,
	   xmlns = <<"urn:xmpp:mam:2">>,
	   module = 'xep0313',
	   result = 'true'}).

-xml(mam_query,
     #elem{name = <<"query">>,
           xmlns = [<<"urn:xmpp:mam:0">>, <<"urn:xmpp:mam:1">>,
		    <<"urn:xmpp:mam:2">>, <<"urn:xmpp:mam:tmp">>],
	   module = 'xep0313',
           result = {mam_query, '$xmlns', '$id', '$start', '$end', '$with',
		     '$withtext', '$rsm', '$flippage', '$xdata'},
           attrs = [#attr{name = <<"queryid">>, label = '$id'},
		    #attr{name = <<"xmlns">>}],
           refs = [#ref{name = mam_start, min = 0, max = 1, label = '$start'},
                   #ref{name = mam_end, min = 0, max = 1, label = '$end'},
                   #ref{name = mam_with, min = 0, max = 1, label = '$with'},
		   #ref{name = mam_withtext, min = 0, max = 1, label = '$withtext'},
                   #ref{name = rsm_set, min = 0, max = 1, label = '$rsm'},
                   #ref{name = mam_flip_page, min = 0, max = 1,
                        label = '$flippage', default = false},
		   #ref{name = xdata, min = 0, max = 1, label = '$xdata'}]}).

-xml(mam_archived,
     #elem{name = <<"archived">>,
           xmlns = <<"urn:xmpp:mam:tmp">>,
	   module = 'xep0313',
           result = {mam_archived, '$by', '$id'},
           attrs = [#attr{name = <<"id">>},
                    #attr{name = <<"by">>,
                          required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}]}).

-xml(mam_result,
     #elem{name = <<"result">>,
           xmlns = [<<"urn:xmpp:mam:0">>, <<"urn:xmpp:mam:1">>,
		    <<"urn:xmpp:mam:2">>, <<"urn:xmpp:mam:tmp">>],
	   module = 'xep0313',
           result = {mam_result, '$xmlns', '$queryid', '$id', '$_els'},
           attrs = [#attr{name = <<"queryid">>},
		    #attr{name = <<"xmlns">>},
                    #attr{name = <<"id">>}]}).

-xml(mam_jid,
     #elem{name = <<"jid">>,
           xmlns = [<<"urn:xmpp:mam:0">>, <<"urn:xmpp:mam:1">>,
		    <<"urn:xmpp:mam:2">>, <<"urn:xmpp:mam:tmp">>],
	   module = 'xep0313',
           result = '$cdata',
           cdata = #cdata{required = true,
                          dec = {jid, decode, []},
                          enc = {jid, encode, []}}}).

-xml(mam_never,
     #elem{name = <<"never">>,
           xmlns = [<<"urn:xmpp:mam:0">>, <<"urn:xmpp:mam:1">>,
		    <<"urn:xmpp:mam:2">>, <<"urn:xmpp:mam:tmp">>],
	   module = 'xep0313',
           result = '$jids',
           refs = [#ref{name = mam_jid, label = '$jids'}]}).

-xml(mam_always,
     #elem{name = <<"always">>,
           xmlns = [<<"urn:xmpp:mam:0">>, <<"urn:xmpp:mam:1">>,
		    <<"urn:xmpp:mam:2">>, <<"urn:xmpp:mam:tmp">>],
	   module = 'xep0313',
           result = '$jids',
           refs = [#ref{name = mam_jid, label = '$jids'}]}).

-xml(mam_prefs,
     #elem{name = <<"prefs">>,
           xmlns = [<<"urn:xmpp:mam:0">>, <<"urn:xmpp:mam:1">>,
		    <<"urn:xmpp:mam:2">>, <<"urn:xmpp:mam:tmp">>],
	   module = 'xep0313',
           result = {mam_prefs, '$xmlns', '$default', '$always', '$never'},
           attrs = [#attr{name = <<"default">>,
                          dec = {dec_enum, [[always, never, roster]]},
                          enc = {enc_enum, []}},
		    #attr{name = <<"xmlns">>}],
           refs = [#ref{name = mam_always, label = '$always',
                        min = 0, max = 1},
                   #ref{name = mam_never, label = '$never',
                        min = 0, max = 1}]}).

-xml(mam_fin,
     #elem{name = <<"fin">>,
	   xmlns = [<<"urn:xmpp:mam:0">>, <<"urn:xmpp:mam:1">>, <<"urn:xmpp:mam:2">>],
	   module = 'xep0313',
	   result = {mam_fin, '$xmlns', '$id', '$rsm', '$stable', '$complete'},
	   attrs = [#attr{name = <<"queryid">>, label = '$id'},
		    #attr{name = <<"xmlns">>},
		    #attr{name = <<"stable">>, label = '$stable',
			  dec = {dec_bool, []},
			  enc = {enc_bool, []}},
		    #attr{name = <<"complete">>, label = '$complete',
			  dec = {dec_bool, []},
			  enc = {enc_bool, []}}],
	   refs = [#ref{name = rsm_set, min = 0, max = 1, label = '$rsm'}]}).

-xml(forwarded,
     #elem{name = <<"forwarded">>,
           xmlns = <<"urn:xmpp:forward:0">>,
	   module = 'xep0297',
	   ignore_els = true,
           result = {forwarded, '$delay', '$_els'},
           refs = [#ref{name = delay, min = 0,
                        max = 1, label = '$delay'}]}).

-xml(carbons_disable,
     #elem{name = <<"disable">>,
           xmlns = <<"urn:xmpp:carbons:2">>,
	   module = 'xep0280',
           result = {carbons_disable}}).

-xml(carbons_enable,
     #elem{name = <<"enable">>,
	   xmlns = <<"urn:xmpp:carbons:2">>,
	   module = 'xep0280',
	   result = {carbons_enable}}).

-xml(carbons_private,
     #elem{name = <<"private">>,
	   xmlns = <<"urn:xmpp:carbons:2">>,
	   module = 'xep0280',
	   result = {carbons_private}}).

-xml(carbons_received,
     #elem{name = <<"received">>,
	   xmlns = <<"urn:xmpp:carbons:2">>,
	   module = 'xep0280',
	   result = {carbons_received, '$forwarded'},
	   refs = [#ref{name = forwarded, min = 1,
                        max = 1, label = '$forwarded'}]}).

-xml(carbons_sent,
     #elem{name = <<"sent">>,
	   xmlns = <<"urn:xmpp:carbons:2">>,
	   module = 'xep0280',
	   result = {carbons_sent, '$forwarded'},
	   refs = [#ref{name = forwarded, min = 1,
                        max = 1, label = '$forwarded'}]}).

-xml(inbox_query,
     #elem{name = <<"inbox">>,
	   xmlns = <<"urn:xmpp:inbox:1">>,
	   module = 'xep0430',
	   result = {inbox_query, '$rsm'},
	   refs = [#ref{name = rsm_set, min = 0, max = 1, label = '$rsm'}]}).

-xml(inbox_entry,
     #elem{name = <<"entry">>,
	   xmlns = <<"urn:xmpp:inbox:1">>,
	   module = 'xep0430',
	   result = {inbox_entry, '$unread', '$jid', '$id'},
	   attrs = [#attr{name = <<"unread">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"jid">>,
			  label = '$jid',
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}},
		    #attr{name = <<"id">>}]}).

-xml(inbox_fin,
     #elem{name = <<"fin">>,
	   xmlns = <<"urn:xmpp:inbox:1">>,
	   module = 'xep0430',
	   result = {inbox_fin, '$total', '$unread', '$all_unread', '$rsm'},
	   attrs = [#attr{name = <<"total">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"unread">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"all-unread">>, label = '$all_unread',
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}}],
	   refs = [#ref{name = rsm_set, min = 0, max = 1, label = '$rsm'}]}).

-xml(feature_csi,
     #elem{name = <<"csi">>,
	   xmlns = <<"urn:xmpp:csi:0">>,
	   module = 'xep0352',
	   result = {feature_csi}}).

-record(csi, {type :: active | inactive}).
-type csi() :: #csi{}.

-xml(csi_active,
     #elem{name = <<"active">>,
	   xmlns = <<"urn:xmpp:csi:0">>,
	   module = 'xep0352',
	   result = {csi, active}}).

-xml(csi_inactive,
     #elem{name = <<"inactive">>,
	   xmlns = <<"urn:xmpp:csi:0">>,
	   module = 'xep0352',
	   result = {csi, inactive}}).

-xml(feature_sm,
     #elem{name = <<"sm">>,
	   xmlns = [<<"urn:xmpp:sm:2">>, <<"urn:xmpp:sm:3">>],
	   module = 'xep0198',
	   result = {feature_sm, '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}]}).

-xml(sm_enable,
     #elem{name = <<"enable">>,
	   xmlns = [<<"urn:xmpp:sm:2">>, <<"urn:xmpp:sm:3">>],
	   module = 'xep0198',
	   result = {sm_enable, '$max', '$resume', '$xmlns'},
	   attrs = [#attr{name = <<"max">>,
			  dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
		    #attr{name = <<"xmlns">>},
		    #attr{name = <<"resume">>,
			  default = false,
			  dec = {dec_bool, []},
                          enc = {enc_bool, []}}]}).

-xml(sm_enabled,
     #elem{name = <<"enabled">>,
	   xmlns = [<<"urn:xmpp:sm:2">>, <<"urn:xmpp:sm:3">>],
	   module = 'xep0198',
	   result = {sm_enabled, '$id', '$location', '$max', '$resume', '$xmlns'},
	   attrs = [#attr{name = <<"id">>},
		    #attr{name = <<"location">>},
		    #attr{name = <<"xmlns">>},
		    #attr{name = <<"max">>,
			  dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
		    #attr{name = <<"resume">>,
			  default = false,
			  dec = {dec_bool, []},
                          enc = {enc_bool, []}}]}).

-xml(sm_resume,
     #elem{name = <<"resume">>,
	   xmlns = [<<"urn:xmpp:sm:2">>, <<"urn:xmpp:sm:3">>],
	   module = 'xep0198',
	   result = {sm_resume, '$h', '$previd', '$xmlns'},
	   attrs = [#attr{name = <<"h">>,
			  required = true,
			  dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
		    #attr{name = <<"xmlns">>},
		    #attr{name = <<"previd">>,
			  required = true}]}).

-xml(sm_resumed,
     #elem{name = <<"resumed">>,
	   xmlns = [<<"urn:xmpp:sm:2">>, <<"urn:xmpp:sm:3">>],
	   module = 'xep0198',
	   result = {sm_resumed, '$h', '$previd', '$xmlns'},
	   attrs = [#attr{name = <<"h">>,
			  required = true,
			  dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
		    #attr{name = <<"xmlns">>},
		    #attr{name = <<"previd">>,
			  required = true}]}).

-xml(sm_r,
     #elem{name = <<"r">>,
	   xmlns = [<<"urn:xmpp:sm:2">>, <<"urn:xmpp:sm:3">>],
	   module = 'xep0198',
	   result = {sm_r, '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}]}).

-xml(sm_a,
     #elem{name = <<"a">>,
	   xmlns = [<<"urn:xmpp:sm:2">>, <<"urn:xmpp:sm:3">>],
	   module = 'xep0198',
	   result = {sm_a, '$h', '$xmlns'},
	   attrs = [#attr{name = <<"h">>,
			  required = true,
			  dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
		    #attr{name = <<"xmlns">>}]}).

-xml(sm_failed,
     #elem{name = <<"failed">>,
	   xmlns = [<<"urn:xmpp:sm:2">>, <<"urn:xmpp:sm:3">>],
	   module = 'xep0198',
	   result = {sm_failed, '$reason', '$text', '$h', '$xmlns'},
	   attrs = [#attr{name = <<"h">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"xmlns">>}],
	   refs = [#ref{name = error_text, label = '$text'},
		   #ref{name = error_bad_request,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_conflict,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_feature_not_implemented,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_forbidden,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_gone,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_internal_server_error,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_item_not_found,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_jid_malformed,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_not_acceptable,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_not_allowed,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_not_authorized,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_policy_violation,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_recipient_unavailable,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_redirect,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_registration_required,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_remote_server_not_found,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_remote_server_timeout,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_resource_constraint,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_service_unavailable,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_subscription_required,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_undefined_condition,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = error_unexpected_request,
                        min = 0, max = 1, label = '$reason'}]}).

-xml(offline_purge,
     #elem{name = <<"purge">>,
	   xmlns = <<"http://jabber.org/protocol/offline">>,
	   module = 'xep0013',
	   result = true}).

-xml(offline_fetch,
     #elem{name = <<"fetch">>,
	   xmlns = <<"http://jabber.org/protocol/offline">>,
	   module = 'xep0013',
	   result = true}).

-xml(offline_item,
     #elem{name = <<"item">>,
	   xmlns = <<"http://jabber.org/protocol/offline">>,
	   module = 'xep0013',
	   result = {offline_item, '$node', '$action'},
	   attrs = [#attr{name = <<"node">>},
		    #attr{name = <<"action">>,
			  dec = {dec_enum, [[view, remove]]},
                          enc = {enc_enum, []}}]}).

-xml(offline,
     #elem{name = <<"offline">>,
	   xmlns = <<"http://jabber.org/protocol/offline">>,
	   module = 'xep0013',
	   result = {offline, '$items', '$purge', '$fetch'},
	   refs = [#ref{name = offline_purge, min = 0, max = 1,
			label = '$purge', default = false},
		   #ref{name = offline_fetch, min = 0, max = 1,
			label = '$fetch', default = false},
		   #ref{name = offline_item, min = 0, label = '$items'}]}).

-xml(mix_subscribe,
     #elem{name = <<"subscribe">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>],
	   module = 'xep0369',
	   result = '$node',
	   attrs = [#attr{name = <<"node">>,
			  required = true,
			  label = '$node'}]}).

-xml(mix_unsubscribe,
     #elem{name = <<"unsubscribe">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>],
	   module = 'xep0369',
	   result = '$node',
	   attrs = [#attr{name = <<"node">>,
			  required = true,
			  label = '$node'}]}).

-xml(mix_nick,
     #elem{name = <<"nick">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>, <<"urn:xmpp:mix:presence:0">>],
	   module = 'xep0369',
	   result = '$cdata',
	   cdata = #cdata{required = true}}).

-xml(mix_jid,
     #elem{name = <<"jid">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>, <<"urn:xmpp:mix:presence:0">>],
	   module = 'xep0369',
	   result = '$cdata',
	   cdata = #cdata{required = true,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}}}).

-xml(mix_submission_id,
     #elem{name = <<"submission-id">>,
	   xmlns = <<"urn:xmpp:mix:core:0">>,
	   module = 'xep0369',
	   result = '$cdata',
	   cdata = #cdata{required = true}}).

-xml(mix_setnick,
     #elem{name = <<"setnick">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>],
	   module = 'xep0369',
	   result = {mix_setnick, '$nick', '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}],
	   refs = [#ref{name = mix_nick, min = 1, max = 1,
			label = '$nick'}]}).

-xml(mix_update_subscription,
     #elem{name = <<"update-subscription">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>],
	   module = 'xep0369',
	   result = {mix_update_subscription, '$xmlns', '$jid', '$subscribe', '$unsubscribe'},
	   attrs = [#attr{name = <<"xmlns">>},
		    #attr{name = <<"jid">>, label = '$jid',
			  dec = {jid, decode, []}, enc = {jid, encode, []}}],
	   refs = [#ref{name = mix_subscribe, min = 0, label = '$subscribe'},
		   #ref{name = mix_unsubscribe, min = 0, label = '$unsubscribe'}]}).

-xml(mix_join,
     #elem{name = <<"join">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>],
	   module = 'xep0369',
	   result = {mix_join, '$id', '$jid', '$nick', '$subscribe', '$xmlns'},
	   attrs = [#attr{name = <<"id">>},
		    #attr{name = <<"jid">>,
			  label = '$jid',
			  dec = {jid, decode, []},
                          enc = {jid, encode, []}},
		    #attr{name = <<"xmlns">>}],
	   refs = [#ref{name = mix_subscribe, min = 0, label = '$subscribe'},
		   #ref{name = mix_nick,
			default = <<"">>,
			min = 0, max = 1,
			label = '$nick'}]}).

-xml(mix_client_join,
     #elem{name = <<"client-join">>,
	   xmlns = [<<"urn:xmpp:mix:pam:0">>, <<"urn:xmpp:mix:pam:2">>],
	   module = 'xep0405',
	   result = {mix_client_join, '$channel', '$join', '$xmlns'},
	   attrs = [#attr{name = <<"channel">>,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}},
		    #attr{name = <<"xmlns">>}],
	   refs = [#ref{name = mix_join, min = 1, max = 1, label = '$join'}]}).

-xml(mix_leave,
     #elem{name = <<"leave">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>],
	   module = 'xep0369',
	   result = {mix_leave, '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}]}).

-xml(mix_client_leave,
     #elem{name = <<"client-leave">>,
	   xmlns = [<<"urn:xmpp:mix:pam:0">>, <<"urn:xmpp:mix:pam:2">>],
	   module = 'xep0405',
	   result = {mix_client_leave, '$channel', '$leave', '$xmlns'},
	   attrs = [#attr{name = <<"channel">>,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}},
		    #attr{name = <<"xmlns">>}],
	   refs = [#ref{name = mix_leave, min = 1, max = 1, label = '$leave'}]}).

-xml(mix_participant,
     #elem{name = <<"participant">>,
	   xmlns = <<"urn:xmpp:mix:core:1">>,
	   module = 'xep0369',
	   result = {mix_participant, '$jid', '$nick'},
           refs = [#ref{name = mix_jid, min = 0, max = 1, label = '$jid'},
                   #ref{name = mix_nick, min = 0, max = 1, label = '$nick'}]}).

-xml(mix_create,
     #elem{name = <<"create">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>],
	   module = 'xep0369',
	   result = {mix_create, '$channel', '$xmlns'},
	   attrs = [#attr{name = <<"channel">>,
			  default = <<"">>,
			  dec = {nodeprep, []}},
		    #attr{name = <<"xmlns">>}]}).

-xml(mix_destroy,
     #elem{name = <<"destroy">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>],
	   module = 'xep0369',
	   result = {mix_destroy, '$channel', '$xmlns'},
	   attrs = [#attr{name = <<"channel">>,
			  dec = {nodeprep, []},
			  required = true},
		    #attr{name = <<"xmlns">>}]}).

-xml(mix,
     #elem{name = <<"mix">>,
	   xmlns = [<<"urn:xmpp:mix:core:0">>, <<"urn:xmpp:mix:core:1">>],
	   module = 'xep0369',
	   result = {mix, '$submission_id', '$jid', '$nick', '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}],
	   refs = [#ref{name = mix_submission_id, default = <<"">>,
			min = 0, max = 1, label = '$submission_id'},
		   #ref{name = mix_jid,	min = 0, max = 1, label = '$jid'},
		   #ref{name = mix_nick, min = 0, max = 1,
			label = '$nick', default = <<"">>}]}).

-xml(mix_roster_channel,
     #elem{name = <<"channel">>,
           xmlns = <<"urn:xmpp:mix:roster:0">>,
           module = 'xep0405',
           result = {mix_roster_channel, '$participant_id'},
           attrs = [#attr{name = <<"participant-id">>, label = '$participant_id',
                          required = true}]}).

-xml(mix_roster_annotate,
     #elem{name  = <<"annotate">>,
           xmlns = <<"urn:xmpp:mix:roster:0">>,
           module = 'xep0405',
           result = true}).

-xml(mix_presence,
     #elem{name = <<"mix">>,
	   xmlns = [<<"urn:xmpp:mix:presence:0">>],
	   module = 'xep0403',
	   result = {mix_presence, '$xmlns', '$jid', '$nick'},
	   attrs = [#attr{name = <<"xmlns">>}],
	   refs = [#ref{name = mix_jid,	min = 0, max = 1, label = '$jid'},
		   #ref{name = mix_nick, min = 0, max = 1, label = '$nick',
			default = <<"">>}]}).

-record(hint, {type :: 'no-copy' | 'no-store' | 'no-storage' | 'store' |
		       'no-permanent-store' | 'no-permanent-storage'}).
-type hint() :: #hint{}.

-xml(hint_no_copy,
     #elem{name = <<"no-copy">>,
	   xmlns = <<"urn:xmpp:hints">>,
	   module = 'xep0334',
	   result = {hint, 'no-copy'}}).

-xml(hint_no_store,
     #elem{name = <<"no-store">>,
	   xmlns = <<"urn:xmpp:hints">>,
	   module = 'xep0334',
	   result = {hint, 'no-store'}}).

-xml(hint_no_storage,
     #elem{name = <<"no-storage">>,
	   xmlns = <<"urn:xmpp:hints">>,
	   module = 'xep0334',
	   result = {hint, 'no-storage'}}).

-xml(hint_store,
     #elem{name = <<"store">>,
	   xmlns = <<"urn:xmpp:hints">>,
	   module = 'xep0334',
	   result = {hint, 'store'}}).

-xml(hint_no_permanent_store,
     #elem{name = <<"no-permanent-store">>,
	   xmlns = <<"urn:xmpp:hints">>,
	   module = 'xep0334',
	   result = {hint, 'no-permanent-store'}}).

-xml(hint_no_permanent_storage,
     #elem{name = <<"no-permanent-storage">>,
	   xmlns = <<"urn:xmpp:hints">>,
	   module = 'xep0334',
	   result = {hint, 'no-permanent-storage'}}).

-xml(search_instructions,
     #elem{name = <<"instructions">>,
           xmlns = <<"jabber:iq:search">>,
	   module = 'xep0055',
           result = '$cdata'}).

-xml(search_first,
     #elem{name = <<"first">>,
	   xmlns = <<"jabber:iq:search">>,
	   module = 'xep0055',
	   cdata = #cdata{default = <<"">>},
           result = '$cdata'}).
-xml(search_last,
     #elem{name = <<"last">>,
           xmlns = <<"jabber:iq:search">>,
	   module = 'xep0055',
           cdata = #cdata{default = <<"">>},
           result = '$cdata'}).
-xml(search_nick,
     #elem{name = <<"nick">>,
           xmlns = <<"jabber:iq:search">>,
	   module = 'xep0055',
           cdata = #cdata{default = <<"">>},
           result = '$cdata'}).
-xml(search_email,
     #elem{name = <<"email">>,
           xmlns = <<"jabber:iq:search">>,
	   module = 'xep0055',
           cdata = #cdata{default = <<"">>},
           result = '$cdata'}).

-xml(search_item,
     #elem{name = <<"item">>,
	   xmlns = <<"jabber:iq:search">>,
	   module = 'xep0055',
	   result = {search_item, '$jid', '$first', '$last', '$nick', '$email'},
	   attrs = [#attr{name = <<"jid">>,
			  required = true,
			  enc = {jid, encode, []},
			  dec = {jid, decode, []}}],
	   refs = [#ref{name = search_first, min = 0, max = 1,
			label = '$first'},
		   #ref{name = search_last, min = 0, max = 1,
			label = '$last'},
		   #ref{name = search_nick, min = 0, max = 1,
			label = '$nick'},
		   #ref{name = search_email, min = 0, max = 1,
			label = '$email'}]}).

-xml(search,
     #elem{name = <<"query">>,
	   xmlns = <<"jabber:iq:search">>,
	   module = 'xep0055',
	   result = {search, '$instructions', '$first', '$last',
		     '$nick', '$email', '$items', '$xdata'},
	   refs = [#ref{name = search_instructions, min = 0, max = 1,
                        label = '$instructions'},
		   #ref{name = search_first, min = 0, max = 1,
			label = '$first'},
		   #ref{name = search_last, min = 0, max = 1,
			label = '$last'},
		   #ref{name = search_nick, min = 0, max = 1,
			label = '$nick'},
		   #ref{name = search_email, min = 0, max = 1,
			label = '$email'},
		   #ref{name = search_item, label = '$items'},
		   #ref{name = xdata, min = 0, max = 1,
			label = '$xdata'}]}).

-xml(xevent_offline,
     #elem{name = <<"offline">>,
	   xmlns = <<"jabber:x:event">>,
	   module = 'xep0022',
	   result = true}).
-xml(xevent_delivered,
     #elem{name = <<"delivered">>,
	   xmlns = <<"jabber:x:event">>,
	   module = 'xep0022',
	   result = true}).
-xml(xevent_displayed,
     #elem{name = <<"displayed">>,
	   xmlns = <<"jabber:x:event">>,
	   module = 'xep0022',
	   result = true}).
-xml(xevent_composing,
     #elem{name = <<"composing">>,
	   xmlns = <<"jabber:x:event">>,
	   module = 'xep0022',
	   result = true}).
-xml(xevent_id,
     #elem{name = <<"id">>,
	   xmlns = <<"jabber:x:event">>,
	   module = 'xep0022',
	   cdata = #cdata{},
           result = '$cdata'}).

-xml(xevent,
     #elem{name = <<"x">>,
	   xmlns = <<"jabber:x:event">>,
	   module = 'xep0022',
	   result = {xevent, '$offline', '$delivered', '$displayed',
		     '$composing', '$id'},
	   refs = [#ref{name = xevent_offline, min = 0, max = 1,
			label = '$offline', default = false},
		   #ref{name = xevent_delivered, min = 0, max = 1,
			label = '$delivered', default = false},
		   #ref{name = xevent_displayed, min = 0, max = 1,
			label = '$displayed', default = false},
		   #ref{name = xevent_composing, min = 0, max = 1,
			label = '$composing', default = false},
		   #ref{name = xevent_id, min = 0, max = 1,
			label = '$id'}]}).

-xml(expire,
     #elem{name = <<"x">>,
	   xmlns = <<"jabber:x:expire">>,
	   module = 'xep0023',
	   result = {expire, '$seconds', '$stored'},
	   attrs = [#attr{name = <<"seconds">>,
			  required = true,
			  dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}},
		    #attr{name = <<"stored">>,
			  dec = {dec_int, [0, infinity]},
                          enc = {enc_int, []}}]}).

-xml(nick,
     #elem{name = <<"nick">>,
	   xmlns = <<"http://jabber.org/protocol/nick">>,
	   module = 'xep0172',
	   result = {nick, '$name'},
	   cdata = #cdata{label = '$name',
			  required = true}}).

-xml(address,
     #elem{name = <<"address">>,
	   xmlns = <<"http://jabber.org/protocol/address">>,
	   module = 'xep0033',
	   result = {address, '$type', '$jid', '$desc', '$node', '$delivered', '$_els'},
	   attrs = [#attr{name = <<"type">>,
			  required = true,
			  dec = {dec_enum, [[bcc, cc, noreply, ofrom,
					     replyroom, replyto, to]]},
			  enc = {enc_enum, []}},
		    #attr{name = <<"jid">>,
			  enc = {jid, encode, []},
			  dec = {jid, decode, []}},
		    #attr{name = <<"desc">>},
		    #attr{name = <<"node">>},
		    #attr{name = <<"delivered">>,
			  enc = {enc_bool, []},
			  dec = {dec_bool, []}}]}).

-xml(addresses,
     #elem{name = <<"addresses">>,
	   xmlns = <<"http://jabber.org/protocol/address">>,
	   module = 'xep0033',
	   result = {addresses, '$list'},
	   %% TODO: 'min' should be '1', but this is not implemented
	   refs = [#ref{name = address, label = '$list'}]}).

-xml(stanza_id,
     #elem{name = <<"stanza-id">>,
	   xmlns = <<"urn:xmpp:sid:0">>,
	   module = 'xep0359',
	   result = {stanza_id, '$by', '$id'},
	   attrs = [#attr{name = <<"id">>, required = true},
		    #attr{name = <<"by">>, required = true,
			  enc = {jid, encode, []},
			  dec = {jid, decode, []}}]}).

-xml(origin_id,
     #elem{name = <<"origin-id">>,
	   xmlns = <<"urn:xmpp:sid:0">>,
	   module = 'xep0359',
	   result = {origin_id, '$id'},
	   attrs = [#attr{name = <<"id">>, required = true}]}).

-xml(adhoc_command_prev,
     #elem{name = <<"prev">>,
	   xmlns = <<"http://jabber.org/protocol/commands">>,
	   module = 'xep0050',
	   result = true}).
-xml(adhoc_command_next,
     #elem{name = <<"next">>,
	   xmlns = <<"http://jabber.org/protocol/commands">>,
	   module = 'xep0050',
	   result = true}).
-xml(adhoc_command_complete,
     #elem{name = <<"complete">>,
	   xmlns = <<"http://jabber.org/protocol/commands">>,
	   module = 'xep0050',
	   result = true}).

-xml(adhoc_command_actions,
     #elem{name = <<"actions">>,
	   xmlns = <<"http://jabber.org/protocol/commands">>,
	   module = 'xep0050',
	   result = {adhoc_actions, '$execute', '$prev', '$next', '$complete'},
	   attrs = [#attr{name = <<"execute">>,
			  dec = {dec_enum, [[complete, next, prev]]},
			  enc = {enc_enum, []}}],
	   refs = [#ref{name = adhoc_command_prev, min = 0, max = 1,
			default = false, label = '$prev'},
		   #ref{name = adhoc_command_next, min = 0, max = 1,
			default = false, label = '$next'},
		   #ref{name = adhoc_command_complete, min = 0, max = 1,
			default = false, label = '$complete'}]}).

-xml(adhoc_command_notes,
     #elem{name = <<"note">>,
	   xmlns = <<"http://jabber.org/protocol/commands">>,
	   module = 'xep0050',
	   result = {adhoc_note, '$type', '$data'},
	   attrs = [#attr{name = <<"type">>, default = info,
			  dec = {dec_enum, [[info, warn, error]]},
			  enc = {enc_enum, []}}],
	   cdata = #cdata{default = <<"">>, label = '$data'}}).

-xml(adhoc_command,
     #elem{name = <<"command">>,
	   xmlns = <<"http://jabber.org/protocol/commands">>,
	   module = 'xep0050',
	   result = {adhoc_command, '$node', '$action', '$sid',
		     '$status', '$lang', '$actions', '$notes', '$xdata'},
	   attrs = [#attr{name = <<"node">>, required = true},
		    #attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []}, label = '$lang'},
		    #attr{name = <<"sessionid">>, label = '$sid'},
		    #attr{name = <<"status">>,
			  dec = {dec_enum, [[canceled, completed, executing]]},
			  enc = {enc_enum, []}},
		    #attr{name = <<"action">>, default = execute,
			  dec = {dec_enum, [[cancel, complete,
					     execute, next, prev]]},
			  enc = {enc_enum, []}}],
	   refs = [#ref{name = adhoc_command_actions, min = 0, max = 1,
			label = '$actions'},
		   #ref{name = xdata, min = 0, max = 1},
		   #ref{name = adhoc_command_notes, label = '$notes'}]}).

-xml(db_result,
     #elem{name = <<"db:result">>,
	   xmlns = <<"jabber:server">>,
	   module = 'xep0220',
	   result = {db_result, '$from', '$to', '$type', '$key', '$_els'},
	   cdata = #cdata{default = <<"">>, label = '$key'},
	   attrs = [#attr{name = <<"from">>, required = true,
			  dec = {nameprep, []}, enc = {nameprep, []}},
		    #attr{name = <<"to">>, required = true,
			  dec = {nameprep, []}, enc = {nameprep, []}},
		    #attr{name = <<"type">>,
			  dec = {dec_enum, [[valid, invalid, error]]},
			  enc = {enc_enum, []}}]}).

-xml(db_verify,
     #elem{name = <<"db:verify">>,
	   xmlns = <<"jabber:server">>,
	   module = 'xep0220',
	   result = {db_verify, '$from', '$to', '$id', '$type', '$key', '$_els'},
	   cdata = #cdata{default = <<"">>, label = '$key'},
	   attrs = [#attr{name = <<"from">>, required = true,
			  dec = {nameprep, []}, enc = {nameprep, []}},
		    #attr{name = <<"to">>, required = true,
			  dec = {nameprep, []}, enc = {nameprep, []}},
		    #attr{name = <<"id">>, required = true},
		    #attr{name = <<"type">>,
			  dec = {dec_enum, [[valid, invalid, error]]},
			  enc = {enc_enum, []}}]}).

-xml(db_errors,
     #elem{name = <<"errors">>,
	   xmlns = <<"urn:xmpp:features:dialback">>,
	   module = 'xep0220',
	   result = true}).

-xml(db_feature,
     #elem{name = <<"dialback">>,
	   xmlns = <<"urn:xmpp:features:dialback">>,
	   module = 'xep0220',
	   result = {db_feature, '$errors'},
	   refs = [#ref{name = db_errors, min = 0, max = 1,
			default = false, label = '$errors'}]}).

-xml(handshake,
     #elem{name = <<"handshake">>,
	   xmlns = <<"jabber:component:accept">>,
	   module = 'xep0114',
	   result = {handshake, '$data'},
	   cdata = #cdata{default = <<"">>, label = '$data'}}).

-xml(stream_start,
     #elem{name = <<"stream:stream">>,
	   xmlns = [<<"jabber:client">>, <<"jabber:server">>,
		    <<"jabber:component:accept">>],
	   module = rfc6120,
	   result = {stream_start, '$from', '$to', '$id',
		     '$version', '$xmlns', '$stream_xmlns',
		     '$db_xmlns', '$lang'},
	   attrs = [#attr{name = <<"from">>,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}},
		    #attr{name = <<"to">>,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}},
		    #attr{name = <<"xmlns">>},
		    #attr{name = <<"xmlns:stream">>,
			  label = '$stream_xmlns',
			  default = <<"">>},
		    #attr{name = <<"xmlns:db">>,
			  label = '$db_xmlns',
			  default = <<"">>},
		    #attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
			  label = '$lang',
			  default = <<"">>},
		    #attr{name = <<"version">>,
			  dec = {dec_version, []},
			  enc = {enc_version, []}},
		    #attr{name = <<"id">>, default = <<"">>}]}).

-xml(bob_data,
     #elem{name = <<"data">>,
	   xmlns = <<"urn:xmpp:bob">>,
	   module = 'xep0231',
	   result = {bob_data, '$cid', '$max-age', '$type', '$data'},
	   attrs = [#attr{name = <<"cid">>, required = true},
		    #attr{name = <<"max-age">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"type">>}],
	   cdata = #cdata{label = '$data', default = <<"">>,
			  dec = {base64, decode, []},
			  enc = {base64, encode, []}}}).

-xml(captcha,
     #elem{name = <<"captcha">>,
	   xmlns = <<"urn:xmpp:captcha">>,
	   module = 'xep0158',
	   result = {xcaptcha, '$xdata'},
	   refs = [#ref{name = xdata, min = 1, max = 1}]}).

-xml(media_uri,
     #elem{name = <<"uri">>,
	   xmlns = <<"urn:xmpp:media-element">>,
	   module = 'xep0221',
	   result = {media_uri, '$type', '$uri'},
	   attrs = [#attr{name = <<"type">>, required = true}],
	   cdata = #cdata{label = '$uri', default = <<"">>}}).

-xml(media,
     #elem{name = <<"media">>,
	   xmlns = <<"urn:xmpp:media-element">>,
	   module = 'xep0221',
	   result = {media, '$height', '$width', '$uri'},
	   attrs = [#attr{name = <<"height">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"width">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}}],
	   refs = [#ref{name = media_uri, label = '$uri'}]}).

-xml(oob_url,
     #elem{name = <<"url">>,
	   xmlns = <<"jabber:x:oob">>,
	   module = 'xep0066',
	   result = '$cdata',
	   cdata = #cdata{required = true}}).

-xml(oob_desc,
     #elem{name = <<"desc">>,
	   xmlns = <<"jabber:x:oob">>,
	   module = 'xep0066',
	   result = '$cdata',
	   cdata = #cdata{default = <<"">>}}).

-xml(oob_x,
     #elem{name = <<"x">>,
	   xmlns = <<"jabber:x:oob">>,
	   module = 'xep0066',
	   result = {oob_x, '$url', '$desc', '$sid', '$_els'},
	   attrs = [#attr{name = <<"sid">>, default = <<"">>}],
	   refs = [#ref{name = oob_url, min = 1, max = 1,
			label = '$url'},
		   #ref{name = oob_desc, default = <<"">>,
			min = 0, max = 1, label = '$desc'}]}).

-xml(receipt_request,
     #elem{name = <<"request">>,
	   xmlns = <<"urn:xmpp:receipts">>,
	   module = 'xep0184',
	   result = {receipt_request}}).

-xml(receipt_response,
     #elem{name = <<"received">>,
	   xmlns = <<"urn:xmpp:receipts">>,
	   module = 'xep0184',
	   result = {receipt_response, '$id'},
	   attrs = [#attr{name = <<"id">>}]}).

-xml(mark_markable,
     #elem{name = <<"markable">>,
	   xmlns = <<"urn:xmpp:chat-markers:0">>,
	   module = 'xep0333',
	   result = {markable}}).

-xml(mark_received,
     #elem{name = <<"received">>,
	   xmlns = <<"urn:xmpp:chat-markers:0">>,
	   module = 'xep0333',
	   result = {mark_received, '$id'},
	   attrs = [#attr{name = <<"id">>, required = true}]}).

-xml(mark_displayed,
     #elem{name = <<"displayed">>,
	   xmlns = <<"urn:xmpp:chat-markers:0">>,
	   module = 'xep0333',
	   result = {mark_displayed, '$id'},
	   attrs = [#attr{name = <<"id">>, required = true}]}).

-xml(mark_acknowledged,
     #elem{name = <<"acknowledged">>,
	   xmlns = <<"urn:xmpp:chat-markers:0">>,
	   module = 'xep0333',
	   result = {mark_acknowledged, '$id'},
	   attrs = [#attr{name = <<"id">>, required = true}]}).

-xml(sic_ip,
     #elem{name = <<"ip">>,
	   xmlns = [<<"urn:xmpp:sic:0">>, <<"urn:xmpp:sic:1">>],
	   module = 'xep0279',
	   result = '$cdata',
	   cdata = #cdata{required = true,
			  dec = {dec_ip, []},
			  enc = {enc_ip, []}}}).

-xml(sic_port,
     #elem{name = <<"port">>,
	   xmlns = <<"urn:xmpp:sic:1">>,
	   module = 'xep0279',
	   result = '$cdata',
	   cdata = #cdata{required = true,
			  dec = {dec_int, [0, 65535]},
			  enc = {enc_int, []}}}).

-xml(sic,
     #elem{name = <<"address">>,
	   xmlns = [<<"urn:xmpp:sic:0">>, <<"urn:xmpp:sic:1">>],
	   module = 'xep0279',
	   result = {sic, '$ip', '$port', '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}],
	   refs = [#ref{name = sic_ip, min = 0, max = 1, label = '$ip'},
		   #ref{name = sic_port, min = 0, max = 1, label = '$port'}]}).

-xml(upload_filename,
     #elem{name = <<"filename">>,
	   xmlns = [<<"urn:xmpp:http:upload">>,
		    <<"eu:siacs:conversations:http:upload">>],
	   module = 'xep0363',
	   result = '$cdata',
	   cdata = #cdata{required = true}}).

-xml(upload_size,
     #elem{name = <<"size">>,
	   xmlns = [<<"urn:xmpp:http:upload">>,
		    <<"eu:siacs:conversations:http:upload">>],
	   module = 'xep0363',
	   result = '$cdata',
	   cdata = #cdata{required = true,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}}}).

-xml(upload_content_type,
     #elem{name = <<"content-type">>,
	   xmlns = [<<"urn:xmpp:http:upload">>,
		    <<"eu:siacs:conversations:http:upload">>],
	   module = 'xep0363',
	   result = '$cdata',
	   cdata = #cdata{default = <<"">>}}).

-xml(upload_request,
     #elem{name = <<"request">>,
	   xmlns = [<<"urn:xmpp:http:upload">>,
		    <<"eu:siacs:conversations:http:upload">>],
	   module = 'xep0363',
	   result = {upload_request, '$filename', '$size',
		     '$content-type', '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}],
	   refs = [#ref{name = upload_filename, label = '$filename',
			min = 1, max = 1},
		   #ref{name = upload_size, label = '$size', min = 1, max = 1},
		   #ref{name = upload_content_type, label = '$content-type',
			min = 0, max = 1, default = <<"">>}]}).

-xml(upload_get,
     #elem{name = <<"get">>,
	   xmlns = [<<"urn:xmpp:http:upload">>,
		    <<"eu:siacs:conversations:http:upload">>],
	   module = 'xep0363',
	   result = '$cdata',
	   cdata = #cdata{required = true}}).

-xml(upload_put,
     #elem{name = <<"put">>,
	   xmlns = [<<"urn:xmpp:http:upload">>,
		    <<"eu:siacs:conversations:http:upload">>],
	   module = 'xep0363',
	   result = '$cdata',
	   cdata = #cdata{required = true}}).

-xml(upload_slot,
     #elem{name = <<"slot">>,
	   xmlns = [<<"urn:xmpp:http:upload">>,
		    <<"eu:siacs:conversations:http:upload">>],
	   module = 'xep0363',
	   result = {upload_slot, '$get', '$put', '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}],
	   refs = [#ref{name = upload_get, min = 0, max = 1, label = '$get'},
		   #ref{name = upload_put, min = 0, max = 1, label = '$put'}]}).

-xml(upload_request_0,
     #elem{name = <<"request">>,
	   xmlns = <<"urn:xmpp:http:upload:0">>,
	   module = 'xep0363',
	   result = {upload_request_0, '$filename', '$size', '$content-type',
		     '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>},
		    #attr{name = <<"filename">>,
			  required = true},
		    #attr{name = <<"size">>,
			  dec = {dec_int, [1, infinity]},
			  enc = {enc_int, []},
			  required = true},
		    #attr{name = <<"content-type">>}]}).

-xml(upload_get_0,
     #elem{name = <<"get">>,
	   xmlns = <<"urn:xmpp:http:upload:0">>,
	   module = 'xep0363',
	   result = '$url',
           attrs = [#attr{name = <<"url">>,
			  required = true}]}).

-xml(upload_put_0,
     #elem{name = <<"put">>,
	   xmlns = <<"urn:xmpp:http:upload:0">>,
	   module = 'xep0363',
	   result = '$url',
           attrs = [#attr{name = <<"url">>,
			  required = true}]}).

-xml(upload_slot_0,
     #elem{name = <<"slot">>,
	   xmlns = <<"urn:xmpp:http:upload:0">>,
	   module = 'xep0363',
	   result = {upload_slot_0, '$get', '$put', '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}],
	   refs = [#ref{name = upload_get_0, label = '$get',
			min = 1, max = 1},
		   #ref{name = upload_put_0, label = '$put',
			min = 1, max = 1}]}).

-xml(upload_max_file_size,
     #elem{name = <<"max-file-size">>,
	   xmlns = [<<"urn:xmpp:http:upload:0">>,
		    <<"urn:xmpp:http:upload">>,
		    <<"eu:siacs:conversations:http:upload">>],
	   module = 'xep0363',
	   result = '$cdata',
	   cdata = #cdata{required = true,
			  enc = {enc_int, []},
			  dec = {dec_int, []}}}).

-xml(upload_file_too_large,
     #elem{name = <<"file-too-large">>,
	   xmlns = [<<"urn:xmpp:http:upload:0">>,
		    <<"urn:xmpp:http:upload">>,
		    <<"eu:siacs:conversations:http:upload">>],
	   module = 'xep0363',
	   result = {upload_file_too_large, '$max-file-size', '$xmlns'},
	   attrs = [#attr{name = <<"xmlns">>}],
	   refs = [#ref{name = upload_max_file_size,
			label = '$max-file-size',
			min = 0, max = 1}]}).

-xml(upload_retry,
     #elem{name = <<"retry">>,
	   xmlns = <<"urn:xmpp:http:upload:0">>,
	   module = 'xep0363',
	   result = {upload_retry, '$stamp'},
	   attrs = [#attr{name = <<"stamp">>,
			  dec = {dec_utc, []},
			  enc = {enc_utc, []}}]}).

-xml(push_enable,
     #elem{name = <<"enable">>,
	   xmlns = <<"urn:xmpp:push:0">>,
	   module = 'xep0357',
	   result = {push_enable, '$jid', '$node', '$xdata'},
	   attrs = [#attr{name = <<"jid">>,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []},
			  required = true},
		    #attr{name = <<"node">>}],
	   refs = [#ref{name = xdata, min = 0, max = 1}]}).

-xml(push_disable,
     #elem{name = <<"disable">>,
	   xmlns = <<"urn:xmpp:push:0">>,
	   module = 'xep0357',
	   result = {push_disable, '$jid', '$node'},
	   attrs = [#attr{name = <<"jid">>,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []},
			  required = true},
		    #attr{name = <<"node">>}]}).

-xml(push_notification,
     #elem{name = <<"notification">>,
	   xmlns = <<"urn:xmpp:push:0">>,
	   module = 'xep0357',
	   result = {push_notification, '$xdata'},
	   refs = [#ref{name = xdata, min = 0, max = 1}]}).

-xml(thumbnail,
     #elem{name = <<"thumbnail">>,
	   xmlns = <<"urn:xmpp:thumbs:1">>,
	   module = 'xep0264',
	   result = {thumbnail, '$uri', '$media-type', '$width', '$height'},
	   attrs = [#attr{name = <<"uri">>, required = true},
		    #attr{name = <<"media-type">>, default = <<"">>},
		    #attr{name = <<"width">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"height">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}}]}).

-xml(privilege_namespace,
     #elem{name = <<"namespace">>,
	   xmlns = <<"urn:xmpp:privilege:2">>,
	   module = 'xep0356',
	   result = {privilege_namespace, '$ns', '$type'},
	   attrs = [#attr{name = <<"ns">>,
			  required = true},
		    #attr{name = <<"type">>,
			  required = true,
			  dec = {dec_enum, [[none, get, set, both]]},
			  enc = {enc_enum, []}}]}).

-xml(privilege_perm,
     #elem{name = <<"perm">>,
	   xmlns = <<"urn:xmpp:privilege:2">>,
	   module = 'xep0356',
	   result = {privilege_perm, '$access', '$type', '$push', '$namespaces'},
	   attrs = [#attr{name = <<"access">>,
			  required = true,
			  dec = {dec_enum, [[iq, roster, message, presence]]},
			  enc = {enc_enum, []}},
		    #attr{name = <<"type">>,
			  dec = {dec_enum, [[none, get, set, both,
					     outgoing, roster,
					     managed_entity]]},
			  enc = {enc_enum, []}},
		    #attr{name = <<"push">>,
			  default = true,
                          dec = {dec_bool, []},
			  enc = {enc_bool, []}}],
	   refs = [#ref{name = privilege_namespace, label = '$namespaces'}]}).

-xml(privilege,
     #elem{name = <<"privilege">>,
	   xmlns = <<"urn:xmpp:privilege:2">>,
	   module = 'xep0356',
	   result = {privilege, '$perms', '$forwarded'},
	   refs = [#ref{name = privilege_perm, label = '$perms'},
		   #ref{name = forwarded, min = 0,
                        max = 1, label = '$forwarded'}]}).

-xml(privileged_iq,
     #elem{name = <<"privileged_iq">>,
	   xmlns = <<"urn:xmpp:privilege:2">>,
	   module = 'xep0356',
	   result = {privileged_iq, '$iq'},
	   refs = [#ref{name = iq, min = 0,
                        max = 1, label = '$iq'}]}).

-xml(delegated_attribute,
     #elem{name = <<"attribute">>,
	   xmlns = <<"urn:xmpp:delegation:1">>,
	   module = 'xep0355',
	   result = '$name',
	   attrs = [#attr{name = <<"name">>,
			  required = true}]}).

-xml(delegated,
     #elem{name = <<"delegated">>,
	   xmlns = <<"urn:xmpp:delegation:1">>,
	   module = 'xep0355',
	   result = {delegated, '$ns', '$attrs'},
	   attrs = [#attr{name = <<"namespace">>,
			  label = '$ns',
			  required = true}],
	   refs = [#ref{name = delegated_attribute,
			label = '$attrs'}]}).

-xml(delegation,
     #elem{name = <<"delegation">>,
	   xmlns = <<"urn:xmpp:delegation:1">>,
	   module = 'xep0355',
	   result = {delegation, '$delegated', '$forwarded'},
	   refs = [#ref{name = delegated, label = '$delegated'},
		   #ref{name = forwarded, min = 0,
			max = 1, label = '$forwarded'}]}).

-xml(delegate,
     #elem{name = <<"delegate">>,
	   xmlns = <<"urn:xmpp:delegation:1">>,
	   module = 'xep0355',
	   result = '$namespace',
	   attrs = [#attr{name = <<"namespace">>,
			  required = true}]}).

-xml(delegation_query,
     #elem{name = <<"query">>,
	   xmlns = <<"urn:xmpp:delegation:1">>,
	   module = 'xep0355',
	   result = {delegation_query, '$to', '$delegate'},
	   attrs = [#attr{name = <<"to">>,
			  required = true,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}}],
	   refs = [#ref{name = delegate, label = '$delegate'}]}).

-xml(service,
     #elem{name = <<"service">>,
	   xmlns = <<"urn:xmpp:extdisco:2">>,
	   module = 'xep0215',
	   result = {service, '$action', '$expires', '$host', '$name',
		     '$password', '$port', '$restricted', '$transport', '$type',
		     '$username', '$xdata'},
	   attrs = [#attr{name = <<"action">>,
			  dec = {dec_enum, [[add, remove, modify]]},
			  enc = {enc_enum, []}},
		    #attr{name = <<"expires">>,
			  dec = {dec_utc, []},
			  enc = {enc_utc, []}},
		    #attr{name = <<"host">>,
			  required = true,
			  dec = {dec_host, []},
			  enc = {enc_host, []}},
		    #attr{name = <<"name">>},
		    #attr{name = <<"password">>},
		    #attr{name = <<"port">>,
			  dec = {dec_int, [0, 65535]},
			  enc = {enc_int, []}},
		    #attr{name = <<"restricted">>,
			  dec = {dec_bool, []},
			  enc = {enc_bool, []}},
		    #attr{name = <<"transport">>,
			  dec = {dec_enum, [[tcp, udp]]},
			  enc = {enc_enum, []}},
		    #attr{name = <<"type">>,
			  required = true,
			  dec = {dec_enum, [[stun, turn, stuns, turns]]},
			  enc = {enc_enum, []}},
		    #attr{name = <<"username">>}],
	   refs = [#ref{name = xdata, min = 0, max = 1}]}).

-xml(services,
     #elem{name = <<"services">>,
	   xmlns = <<"urn:xmpp:extdisco:2">>,
	   module = 'xep0215',
	   result = {services, '$type', '$list'},
	   attrs = [#attr{name = <<"type">>,
			  dec = {dec_enum, [[stun, turn, stuns, turns]]},
			  enc = {enc_enum, []}}],
	   refs = [#ref{name = service, label = '$list'}]}).

-xml(credentials,
     #elem{name = <<"credentials">>,
	   xmlns = <<"urn:xmpp:extdisco:2">>,
	   module = 'xep0215',
	   result = {credentials, '$services'},
	   refs = [#ref{name = service, label = '$services'}]}).

-xml(avatar_data,
     #elem{name = <<"data">>,
	   xmlns = <<"urn:xmpp:avatar:data">>,
	   module = 'xep0084',
	   result = {avatar_data, '$data'},
	   cdata = #cdata{label = '$data',
			  required = true,
			  dec = {base64, decode, []},
			  enc = {base64, encode, []}}}).

-xml(avatar_info,
     #elem{name = <<"info">>,
	   xmlns = <<"urn:xmpp:avatar:metadata">>,
	   module = 'xep0084',
	   result = {avatar_info, '$bytes', '$id', '$type',
		     '$height', '$width', '$url'},
	   attrs = [#attr{name = <<"bytes">>,
			  required = true,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"id">>, required = true},
		    #attr{name = <<"type">>, required = true},
		    #attr{name = <<"url">>},
		    #attr{name = <<"height">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"width">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}}]}).

-xml(avatar_pointer,
     #elem{name = <<"pointer">>,
	   xmlns = <<"urn:xmpp:avatar:metadata">>,
	   module = 'xep0084',
	   ignore_els = true,
	   result = {avatar_pointer, '$bytes', '$id', '$type',
		     '$height', '$width', '$_els'},
	   attrs = [#attr{name = <<"bytes">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"id">>},
		    #attr{name = <<"type">>},
		    #attr{name = <<"height">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"width">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}}]}).

-xml(avatar_meta,
     #elem{name = <<"metadata">>,
	   xmlns = <<"urn:xmpp:avatar:metadata">>,
	   module = 'xep0084',
	   result = {avatar_meta, '$info', '$pointer'},
	   refs = [#ref{name = avatar_info, label = '$info'},
		   #ref{name = avatar_pointer, label = '$pointer',
			min = 0, max = 1}]}).

-xml(hash,
     #elem{name = <<"hash">>,
	   xmlns = <<"urn:xmpp:hashes:2">>,
	   module = 'xep0300',
	   result = {hash, '$algo', '$data'},
	   attrs = [#attr{name = <<"algo">>,
			  required = true}],
	   cdata = #cdata{label = '$data',
			  enc = {base64, encode, []},
			  dec = {base64, decode, []}}}).

-xml(hash_used,
     #elem{name = <<"hash-used">>,
	   xmlns = <<"urn:xmpp:hashes:2">>,
	   module = 'xep0300',
	   result = {hash_used, '$algo'},
	   attrs = [#attr{name = <<"algo">>,
			  required = true}]}).

-xml(ibb_open,
     #elem{name = <<"open">>,
	   xmlns = <<"http://jabber.org/protocol/ibb">>,
	   module = 'xep0047',
	   result = {ibb_open, '$sid', '$block-size', '$stanza'},
	   attrs = [#attr{name = <<"sid">>, required = true},
		    #attr{name = <<"block-size">>, required = true,
			  enc = {enc_int, []},
			  dec = {dec_int, [0, infinity]}},
		    #attr{name = <<"stanza">>,
			  default = iq,
			  enc = {enc_enum, []},
			  dec = {dec_enum, [[iq, message]]}}]}).

-xml(ibb_data,
     #elem{name = <<"data">>,
	   xmlns = <<"http://jabber.org/protocol/ibb">>,
	   module = 'xep0047',
	   result = {ibb_data, '$sid', '$seq', '$data'},
	   attrs = [#attr{name = <<"sid">>, required = true},
		    #attr{name = <<"seq">>, required = true,
			  enc = {enc_int, []},
			  dec = {dec_int, [0, infinity]}}],
	   cdata = #cdata{label = '$data',
			  enc = {base64, encode, []},
			  dec = {base64, decode, []}}}).

-xml(ibb_close,
     #elem{name = <<"close">>,
	   xmlns = <<"http://jabber.org/protocol/ibb">>,
	   module = 'xep0047',
	   result = {ibb_close, '$sid'},
	   attrs = [#attr{name = <<"sid">>, required = true}]}).

-xml(idle,
     #elem{name = <<"idle">>,
	   xmlns = <<"urn:xmpp:idle:1">>,
	   module = 'xep0319',
	   result = {idle, '$since'},
	   attrs = [#attr{name = <<"since">>, required = true,
			  enc = {enc_utc, []}, dec = {dec_utc, []}}]}).

-record(jingle_error, {reason :: 'out-of-order' | 'tie-break' |
				 'unknown-session' | 'unsupported-info' |
				 'security-required'}).
-type jingle_error() :: #jingle_error{}.

-xml(jingle_error_out_of_order,
     #elem{name = <<"out-of-order">>,
	   xmlns = <<"urn:xmpp:jingle:errors:1">>,
	   module = 'xep0166',
	   result = {jingle_error, 'out-of-order'}}).
-xml(jingle_error_tie_break,
     #elem{name = <<"tie-break">>,
	   xmlns = <<"urn:xmpp:jingle:errors:1">>,
	   module = 'xep0166',
	   result = {jingle_error, 'tie-break'}}).
-xml(jingle_error_unknown_session,
     #elem{name = <<"unknown-session">>,
	   xmlns = <<"urn:xmpp:jingle:errors:1">>,
	   module = 'xep0166',
	   result = {jingle_error, 'unknown-session'}}).
-xml(jingle_error_unsupported_info,
     #elem{name = <<"unsupported-info">>,
	   xmlns = <<"urn:xmpp:jingle:errors:1">>,
	   module = 'xep0166',
	   result = {jingle_error, 'unsupported-info'}}).
-xml(jingle_error_security_required,
     #elem{name = <<"security-required">>,
	   xmlns = <<"urn:xmpp:jingle:errors:1">>,
	   module = 'xep0166',
	   result = {jingle_error, 'security-required'}}).

-xml(jingle_reason_alternative_session,
     #elem{name = <<"alternative-session">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'alternative-session'}).
-xml(jingle_reason_busy,
     #elem{name = <<"busy">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'busy'}).
-xml(jingle_reason_cancel,
     #elem{name = <<"cancel">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'cancel'}).
-xml(jingle_reason_connectivity_error,
     #elem{name = <<"connectivity-error">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'connectivity-error'}).
-xml(jingle_reason_decline,
     #elem{name = <<"decline">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'decline'}).
-xml(jingle_reason_expired,
     #elem{name = <<"expired">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'expired'}).
-xml(jingle_reason_failed_application,
     #elem{name = <<"failed-application">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'failed-application'}).
-xml(jingle_reason_failed_transport,
     #elem{name = <<"failed-transport">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'failed-transport'}).
-xml(jingle_reason_general_error,
     #elem{name = <<"general-error">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'general-error'}).
-xml(jingle_reason_gone,
     #elem{name = <<"gone">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'gone'}).
-xml(jingle_reason_incompatible_parameters,
     #elem{name = <<"incompatible-parameters">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'incompatible-parameters'}).
-xml(jingle_reason_media_error,
     #elem{name = <<"media-error">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'media-error'}).
-xml(jingle_reason_security_error,
     #elem{name = <<"security-error">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'security-error'}).
-xml(jingle_reason_success,
     #elem{name = <<"success">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'success'}).
-xml(jingle_reason_timeout,
     #elem{name = <<"timeout">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'timeout'}).
-xml(jingle_reason_unsupported_applications,
     #elem{name = <<"unsupported-applications">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'unsupported-applications'}).
-xml(jingle_reason_unsupported_transports,
     #elem{name = <<"unsupported-transports">>,
           xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
           result = 'unsupported-transports'}).

-xml(jingle_reason_text,
     #elem{name = <<"text">>,
	   xmlns = <<"urn:xmpp:jingle:1">>,
	   module = 'xep0166',
	   result = {text, '$lang', '$data'},
           cdata = #cdata{label = '$data'},
           attrs = [#attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'}]}).

-xml(jingle_reason,
     #elem{name = <<"reason">>,
	   xmlns = <<"urn:xmpp:jingle:1">>,
	   module = 'xep0166',
	   result = {jingle_reason, '$reason', '$text', '$_els'},
           refs = [#ref{name = jingle_reason_text, label = '$text'},
                   #ref{name = jingle_reason_alternative_session,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = jingle_reason_busy,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_cancel,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_connectivity_error,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_decline,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_expired,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_failed_application,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_failed_transport,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_general_error,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_gone,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_incompatible_parameters,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_media_error,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_security_error,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_success,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_timeout,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_unsupported_applications,
                        min = 0, max = 1, label = '$reason'},
		   #ref{name = jingle_reason_unsupported_transports,
                        min = 0, max = 1, label = '$reason'}]}).

-xml(jingle_content,
     #elem{name = <<"content">>,
	   xmlns = <<"urn:xmpp:jingle:1">>,
           module = 'xep0166',
	   result = {jingle_content, '$creator', '$disposition',
		     '$name', '$senders', '$_els'},
	   attrs = [#attr{name = <<"creator">>,
			  required = true,
			  enc = {enc_enum, []},
			  dec = {dec_enum, [[initiator, responder]]}},
		    #attr{name = <<"disposition">>},
		    #attr{name = <<"name">>,
			  required = true},
		    #attr{name = <<"senders">>,
			  enc = {enc_enum, []},
			  dec = {dec_enum, [[both, initiator,
					     none, responder]]},
			  default = both}]}).

-xml(jingle,
     #elem{name = <<"jingle">>,
	   xmlns = <<"urn:xmpp:jingle:1">>,
	   module = 'xep0166',
	   result = {jingle, '$action', '$sid', '$initiator', '$responder',
		     '$content', '$reason', '$_els'},
	   attrs = [#attr{name = <<"action">>,
			  required = true,
			  enc = {enc_enum, []},
			  dec = {dec_enum,
				 [['content-accept',
				   'content-add',
				   'content-modify',
				   'content-reject',
				   'content-remove',
				   'description-info',
				   'security-info',
				   'session-accept',
				   'session-info',
				   'session-initiate',
				   'session-terminate',
				   'transport-accept',
				   'transport-info',
				   'transport-reject',
				   'transport-replace']]}},
		    #attr{name = <<"sid">>,
			  required = true},
		    #attr{name = <<"initiator">>,
			  enc = {jid, encode, []},
			  dec = {jid, decode, []}},
		    #attr{name = <<"responder">>,
			  enc = {jid, encode, []},
			  dec = {jid, decode, []}}],
	   refs = [#ref{name = jingle_content, label = '$content'},
		   #ref{name = jingle_reason, label = '$reason',
			min = 0, max = 1}]}).

-xml(jingle_ft_date,
     #elem{name = <<"date">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   cdata = #cdata{required = true,
			  enc = {enc_utc, []},
			  dec = {dec_utc, []}},
	   result = '$cdata'}).

-xml(jingle_ft_desc,
     #elem{name = <<"desc">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   result = {text, '$lang', '$data'},
           cdata = #cdata{label = '$data'},
           attrs = [#attr{name = <<"xml:lang">>,
			  dec = {xmpp_lang, check, []},
                          label = '$lang'}]}).

-xml(jingle_ft_media_type,
     #elem{name = <<"media-type">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   cdata = #cdata{required = true},
	   result = '$cdata'}).

-xml(jingle_ft_name,
     #elem{name = <<"name">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   cdata = #cdata{required = true},
	   result = '$cdata'}).

-xml(jingle_ft_size,
     #elem{name = <<"size">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   cdata = #cdata{required = true,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
	   result = '$cdata'}).

-xml(jingle_ft_range,
     #elem{name = <<"range">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   result = {jingle_ft_range, '$offset', '$length', '$hash'},
	   attrs = [#attr{name = <<"offset">>,
			  default = 0,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}},
		    #attr{name = <<"length">>,
			  dec = {dec_int, [0, infinity]},
			  enc = {enc_int, []}}],
	   refs = [#ref{name = hash, label = '$hash'}]}).

-xml(jingle_ft_file,
     #elem{name = <<"file">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   result = {jingle_ft_file, '$date', '$desc', '$hash', '$hash-used',
		     '$media-type', '$name', '$size', '$range'},
	   refs = [#ref{name = jingle_ft_date, label = '$date', max = 1},
		   #ref{name = jingle_ft_desc, label = '$desc'},
		   #ref{name = hash, label = '$hash'},
		   #ref{name = hash_used, label = '$hash-used', max = 1},
		   #ref{name = jingle_ft_media_type, label = '$media-type', max = 1},
		   #ref{name = jingle_ft_name, label = '$name', max = 1},
		   #ref{name = jingle_ft_size, label = '$size', max = 1},
		   #ref{name = jingle_ft_range, label = '$range', max = 1}]}).

-xml(jingle_ft_description,
     #elem{name = <<"description">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   result = {jingle_ft_description, '$file'},
	   refs = [#ref{name = jingle_ft_file, label = '$file',
			min = 0, max = 1}]}).

-xml(jingle_ft_received,
     #elem{name = <<"received">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   result = {jingle_ft_received, '$creator', '$name'},
	   attrs = [#attr{name = <<"creator">>,
			  enc = {enc_enum, []},
			  dec = {dec_enum, [[initiator, responder]]}},
		    #attr{name = <<"name">>}]}).

-xml(jingle_ft_checksum,
     #elem{name = <<"checksum">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:5">>,
	   module = 'xep0234',
	   result = {jingle_ft_checksum, '$creator', '$name', '$file'},
	   attrs = [#attr{name = <<"creator">>,
			  enc = {enc_enum, []},
			  dec = {dec_enum, [[initiator, responder]]}},
		    #attr{name = <<"name">>}],
	   refs = [#ref{name = jingle_ft_file, label = '$file',
			min = 1, max = 1}]}).

-record(jingle_ft_error, {reason :: 'file-not-available' | 'file-too-large'}).
-type jingle_ft_error() :: #jingle_ft_error{}.

-xml(jingle_ft_error_file_not_available,
     #elem{name = <<"file-not-available">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>,
	   module = 'xep0234',
	   result = {jingle_ft_error, 'file-not-available'}}).

-xml(jingle_ft_error_file_too_large,
     #elem{name = <<"file-too-large">>,
	   xmlns = <<"urn:xmpp:jingle:apps:file-transfer:errors:0">>,
	   module = 'xep0234',
	   result = {jingle_ft_error, 'file-too-large'}}).

-xml(jingle_s5b_candidate_used,
     #elem{name = <<"candidate-used">>,
	   xmlns = <<"urn:xmpp:jingle:transports:s5b:1">>,
	   module = 'xep0260',
	   result = '$cid',
	   attrs = [#attr{name = <<"cid">>, required = true}]}).

-xml(jingle_s5b_candidate,
     #elem{name = <<"candidate">>,
	   xmlns = <<"urn:xmpp:jingle:transports:s5b:1">>,
	   module = 'xep0260',
	   result = {jingle_s5b_candidate, '$cid', '$host', '$port',
		     '$jid', '$type', '$priority'},
	   attrs = [#attr{name = <<"cid">>, required = true},
		    #attr{name = <<"host">>, required = true,
			  enc = {enc_ip, []}, dec = {dec_ip, []}},
		    #attr{name = <<"jid">>, required = true,
			  enc = {jid, encode, []},
			  dec = {jid, decode, []}},
		    #attr{name = <<"port">>,
			  enc = {enc_int, []},
			  dec = {dec_int, [0, 65535]}},
		    #attr{name = <<"priority">>,
			  required = true,
			  enc = {enc_int, []},
			  dec = {dec_int, [0, infinity]}},
		    #attr{name = <<"type">>,
			  default = direct,
			  enc = {enc_enum, []},
			  dec = {dec_enum, [[assisted, direct, proxy, tunnel]]}}]}).

-xml(jingle_s5b_activated,
     #elem{name = <<"activated">>,
	   xmlns = <<"urn:xmpp:jingle:transports:s5b:1">>,
	   module = 'xep0260',
	   result = '$cid',
	   attrs = [#attr{name = <<"cid">>, required = true}]}).

-xml(jingle_s5b_candidate_error,
     #elem{name = <<"candidate-error">>,
	   xmlns = <<"urn:xmpp:jingle:transports:s5b:1">>,
	   module = 'xep0260',
	   result = 'candidate-error'}).

-xml(jingle_s5b_proxy_error,
     #elem{name = <<"proxy-error">>,
	   xmlns = <<"urn:xmpp:jingle:transports:s5b:1">>,
	   module = 'xep0260',
	   result = 'proxy-error'}).

-xml(jingle_s5b_transport,
     #elem{name = <<"transport">>,
	   xmlns = <<"urn:xmpp:jingle:transports:s5b:1">>,
	   module = 'xep0260',
	   result = {jingle_s5b_transport, '$sid', '$dstaddr', '$mode',
		     '$candidates', '$candidate-used', '$activated', '$error'},
	   attrs = [#attr{name = <<"sid">>, required = true},
		    #attr{name = <<"dstaddr">>},
		    #attr{name = <<"mode">>,
			  default = tcp,
			  enc = {enc_enum, []},
			  dec = {dec_enum, [[tcp, udp]]}}],
	   refs = [#ref{name = jingle_s5b_candidate, label = '$candidates'},
		   #ref{name = jingle_s5b_candidate_used,
			label = '$candidate-used', max = 1},
		   #ref{name = jingle_s5b_activated,
			label = '$activated', max = 1},
		   #ref{name = jingle_s5b_candidate_error,
			label = '$error', max = 1},
		   #ref{name = jingle_s5b_proxy_error,
			label = '$error', max = 1}]}).

-xml(jingle_ibb_transport,
     #elem{name = <<"transport">>,
	   xmlns = <<"urn:xmpp:jingle:transports:ibb:1">>,
	   module = 'xep0261',
	   result = {jingle_ibb_transport, '$sid', '$block-size', '$stanza'},
	   attrs = [#attr{name = <<"sid">>, required = true},
		    #attr{name = <<"block-size">>, required = true,
			  enc = {enc_int, []},
			  dec = {dec_int, [0, infinity]}},
		    #attr{name = <<"stanza">>,
			  default = iq,
			  enc = {enc_enum, []},
			  dec = {dec_enum, [[iq, message]]}}]}).

-xml(x509_cert,
     #elem{name = <<"x509-cert">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = '$cdata',
	   cdata = #cdata{required = true,
			  enc = {base64, encode, []},
			  dec = {base64, decode, []}}}).

-xml(x509_csr,
     #elem{name = <<"x509-csr">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = {x509_csr, '$name', '$der'},
	   attrs = [#attr{name = <<"name">>}],
	   cdata = #cdata{required = true,
			  label = '$der',
			  enc = {base64, encode, []},
			  dec = {base64, decode, []}}}).

-xml(x509_cert_chain,
     #elem{name = <<"x509-cert-chain">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = {x509_cert_chain, '$name', '$certs'},
	   attrs = [#attr{name = <<"name">>}],
	   refs = [#ref{name = x509_cert,
			label = '$certs'}]}).

-xml(x509_ca_list,
     #elem{name = <<"x509-ca-list">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = {x509_ca_list, '$certs'},
	   refs = [#ref{name = x509_cert,
			label = '$certs'}]}).

-xml(x509_signature,
     #elem{name = <<"x509-signature">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = '$cdata',
	   cdata = #cdata{required = true,
			  enc = {base64, encode, []},
			  dec = {base64, decode, []}}}).

-xml(x509_request,
     #elem{name = <<"x509-request">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = {x509_request, '$transaction', '$csr', '$cert', '$signature'},
	   attrs = [#attr{name = <<"transaction">>, required = true}],
	   refs = [#ref{name = x509_csr, label = '$csr', min = 1, max = 1},
		   #ref{name = x509_cert, label = '$cert', max = 1},
		   #ref{name = x509_signature, label = '$signature', max = 1}]}).

-xml(x509_revoke,
     #elem{name = <<"x509-revoke">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = {x509_revoke, '$cert', '$signature'},
	   refs = [#ref{name = x509_cert, label = '$cert',
			min = 1, max = 1},
		   #ref{name = x509_signature, label = '$signature',
			min = 1, max = 1}]}).

-xml(x509_challenge,
     #elem{name = <<"x509-challenge">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = {x509_challenge, '$transaction', '$uri', '$signature'},
	   attrs = [#attr{name = <<"transaction">>, required = true},
		    #attr{name = <<"uri">>, required = true}],
	   refs = [#ref{name = x509_signature,
			label = '$signature',
			min = 1, max = 1}]}).

-xml(x509_challenge_failed,
     #elem{name = <<"x509-challenge-failed">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = {x509_challenge_failed}}).

-xml(x509_register,
     #elem{name = <<"x509-register">>,
	   xmlns = <<"urn:xmpp:x509:0">>,
	   module = 'xep0417',
	   result = {x509_register}}).

-xml(muc_hats,
     #elem{name = <<"hats">>,
	   xmlns = <<"urn:xmpp:hats:0">>,
	   module = 'xep0317',
	   result = {muc_hats, '$hats'},
	   refs = [#ref{name = muc_hat, label = '$hats'}]}).

-xml(muc_hat,
     #elem{name = <<"hat">>,
	   xmlns = <<"urn:xmpp:hats:0">>,
	   module = 'xep0317',
	   result = {muc_hat, '$title', '$uri'},
           attrs = [#attr{name = <<"title">>,
                          required = true},
                    #attr{name = <<"uri">>,
                          required = true}]}).

-xml(occupant_id,
     #elem{name = <<"occupant-id">>,
	   xmlns = <<"urn:xmpp:occupant-id:0">>,
	   module = 'xep0421',
	   result = {occupant_id, '$id'},
	   attrs = [#attr{name = <<"id">>,
	                  required = true}]}).

-xml(fasten_apply_to,
     #elem{name = <<"apply-to">>,
	   xmlns = <<"urn:xmpp:fasten:0">>,
	   module = 'xep0422',
	   result = {fasten_apply_to, '$id', '$external', '$_els'},
	   attrs = [#attr{name = <<"id">>,
	                  required = true}],
	   refs = [#ref{name = fasten_external, min = 0, max = 1,
	                label = '$external'}]}).

-xml(fasten_external,
     #elem{name = <<"external">>,
	   xmlns = <<"urn:xmpp:fasten:0">>,
	   module = 'xep0422',
	   result = {fasten_external, '$name'},
           attrs = [#attr{name = <<"name">>,
                          required = true}]}).

-xml(message_retract,
     #elem{name = <<"retract">>,
	   xmlns = <<"urn:xmpp:message-retract:1">>,
	   module = 'xep0424',
	   result = {message_retract, '$id', '$reason', '$moderated'},
	   attrs = [#attr{name = <<"id">>}],
	   refs = [#ref{name = message_moderate_reason, min = 0, max = 1,
	                label = '$reason'},
	           #ref{name = message_moderated, min = 0, max = 1,
	                label = '$moderated'}]}).

-xml(message_retracted,
     #elem{name = <<"retracted">>,
	   xmlns = <<"urn:xmpp:message-retract:1">>,
	   module = 'xep0424',
	   result = {message_retracted, '$id', '$by', '$from', '$stamp', '$_els'},
           attrs = [#attr{name = <<"id">>,
	                  required = true},
                    #attr{name = <<"by">>,
                          enc = {jid, encode, []},
                          dec = {jid, decode, []}},
                    #attr{name = <<"from">>},
                    #attr{name = <<"stamp">>,
                          dec = {dec_utc, []},
                          enc = {enc_utc, []}}]}).

-xml(message_retract_30,
     #elem{name = <<"retract">>,
	   xmlns = <<"urn:xmpp:message-retract:0">>,
	   module = 'xep0424',
	   result = {message_retract_30}}).

-xml(message_retracted_30,
     #elem{name = <<"retracted">>,
	   xmlns = <<"urn:xmpp:message-retract:0">>,
	   module = 'xep0424',
	   result = {message_retracted_30, '$by', '$from', '$stamp', '$_els'},
           attrs = [#attr{name = <<"by">>,
                          enc = {jid, encode, []},
                          dec = {jid, decode, []}},
                    #attr{name = <<"from">>},
                    #attr{name = <<"stamp">>,
                          dec = {dec_utc, []},
                          enc = {enc_utc, []}}]}).

-xml(message_moderate,
     #elem{name = <<"moderate">>,
	   xmlns = <<"urn:xmpp:message-moderate:1">>,
	   module = 'xep0425',
	   result = {message_moderate, '$id', '$reason', '$retract'},
           attrs = [#attr{name = <<"id">>,
	                  required = true}],
	   refs = [#ref{name = message_moderate_reason, min = 0, max = 1,
	                label = '$reason'},
	           #ref{name = message_retract, min = 0, max = 1,
	                label = '$retract'}]}).

-xml(message_moderated,
     #elem{name = <<"moderated">>,
	   xmlns = <<"urn:xmpp:message-moderate:1">>,
	   module = 'xep0425',
	   result = {message_moderated, '$by', '$_els', '$occupant_id'},
           attrs = [#attr{name = <<"by">>,
                          enc = {jid, encode, []},
                          dec = {jid, decode, []}}],
	   refs = [#ref{name = occupant_id, min = 0, max = 1,
                       label = '$occupant_id'}]}).

-xml(message_moderate_21,
     #elem{name = <<"moderate">>,
	   xmlns = <<"urn:xmpp:message-moderate:0">>,
	   module = 'xep0425',
	   result = {message_moderate_21, '$reason', '$retract'},
	   refs = [#ref{name = message_moderate_reason_21, min = 0, max = 1,
	                label = '$reason'},
	           #ref{name = message_retract, min = 0, max = 1,
	                label = '$retract'}]}).

-xml(message_moderated_21,
     #elem{name = <<"moderated">>,
	   xmlns = <<"urn:xmpp:message-moderate:0">>,
	   module = 'xep0425',
	   result = {message_moderated_21, '$by', '$reason', '$_els', '$occupant_id'},
       attrs = [#attr{name = <<"by">>,
                      enc = {jid, encode, []},
                      dec = {jid, decode, []}}],
	   refs = [#ref{name = message_moderate_reason_21, min = 0, max = 1,
                    label = '$reason'},
               #ref{name = occupant_id, min = 0, max = 1,
                    label = '$occupant_id'}]}).

-xml(message_moderate_reason,
     #elem{name = <<"reason">>,
	   xmlns = <<"urn:xmpp:message-moderate:1">>,
	   module = 'xep0425',
	   result = '$cdata'}).

-xml(message_moderate_reason_21,
     #elem{name = <<"reason">>,
	   xmlns = <<"urn:xmpp:message-moderate:0">>,
	   module = 'xep0425',
	   result = '$cdata'}).

-xml(pep_conference_nick,
     #elem{name = <<"nick">>,
           xmlns = <<"urn:xmpp:bookmarks:1">>,
	   module = 'xep0402',
	   cdata = #cdata{required = true},
           result = '$cdata'}).

-xml(pep_conference_password,
     #elem{name = <<"password">>,
           xmlns = <<"urn:xmpp:bookmarks:1">>,
	   module = 'xep0402',
           result = '$cdata'}).

-xml(pep_conference_extensions,
     #elem{name = <<"extensions">>,
           xmlns = <<"urn:xmpp:bookmarks:1">>,
	   module = 'xep0402',
           ignore_els = true,
           result = '$_els'}).

-xml(pep_bookmarks_conference,
     #elem{name = <<"conference">>,
           xmlns = <<"urn:xmpp:bookmarks:1">>,
	   module = 'xep0402',
           result = {pep_bookmarks_conference, '$name',
                     '$autojoin', '$nick', '$password', '$extensions'},
           attrs = [#attr{name = <<"name">>},
                    #attr{name = <<"autojoin">>,
                          default = false,
                          dec = {dec_bool, []},
                          enc = {enc_bool, []}}],
           refs = [#ref{name = pep_conference_nick,
                        label = '$nick',
                        min = 0, max = 1},
                   #ref{name = pep_conference_password,
                        label = '$password',
                        min = 0, max = 1},
                   #ref{name = pep_conference_extensions,
                        label = '$extensions',
                        min = 0, max = 1}]}).

-xml(sasl_channel_binding,
     #elem{name = <<"sasl-channel-binding">>,
           xmlns = <<"urn:xmpp:sasl-cb:0">>,
	   module = 'xep0440',
           result = {sasl_channel_binding, '$bindings'},
           refs = [#ref{name = sasl_channel_binding_element,
                        label = '$bindings',
                        min = 0}]}).

-xml(sasl_channel_binding_element,
     #elem{name = <<"channel-binding">>,
           xmlns = <<"urn:xmpp:sasl-cb:0">>,
	   module = 'xep0440',
           attrs = [#attr{name = <<"type">>, required = true}],
           result = '$type'}).

-xml(sasl2_authentication,
     #elem{name = <<"authentication">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
	   refs = [#ref{name = sasl2_mechanism,
                        label = '$mechanisms',
                        min = 0},
		   #ref{name = sasl2_inline,
		        label = '$inline',
		        min = 0, max = 1}],
           result = {sasl2_authenticaton, '$mechanisms', '$inline', '$_els'}}).

-xml(sasl2_mechanism,
     #elem{name = <<"mechanism">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           result = '$cdata'}).

-xml(sasl2_inline,
     #elem{name = <<"inline">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           result = '$_els'}).

-xml(sasl2_authenticate,
     #elem{name = <<"authenticate">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           attrs = [#attr{name = <<"mechanism">>, required = true}],
	   refs = [#ref{name = sasl2_initial_response,
                        label = '$initial_response',
                        min = 0, max = 1},
		   #ref{name = sasl2_user_agent,
		        label = '$user_agent',
		        min = 0, max = 1}],
           result = {sasl2_authenticate, '$mechanism', '$initial_response', '$user_agent', '$_els'}}).

-xml(sasl2_initial_response,
     #elem{name = <<"initial-response">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           cdata = #cdata{label = '$text',
                          dec = {base64, mime_decode, []},
                          enc = {base64, encode, []}},
           result = '$text'}).

-xml(sasl2_user_agent,
     #elem{name = <<"user-agent">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           attrs = [#attr{name = <<"id">>}],
	   refs = [#ref{name = sasl2_user_agent_software,
                        label = '$software',
                        min = 0, max = 1},
		   #ref{name = sasl2_user_agent_device,
		        label = '$device',
		        min = 0, max = 1}],
           result = {sasl2_user_agent, '$id', '$software', '$device'}}).

-xml(sasl2_user_agent_software,
     #elem{name = <<"software">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           result = '$cdata'}).

-xml(sasl2_user_agent_device,
     #elem{name = <<"device">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           result = '$cdata'}).

-xml(sasl2_challenge,
     #elem{name = <<"challenge">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           cdata = #cdata{label = '$text',
                          dec = {base64, mime_decode, []},
                          enc = {base64, encode, []}},
           result = {sasl2_challenge, '$text'}}).

-xml(sasl2_response,
     #elem{name = <<"response">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           cdata = #cdata{label = '$text',
                          dec = {base64, mime_decode, []},
                          enc = {base64, encode, []}},
           result = {sasl2_response, '$text'}}).

-xml(sasl2_success,
     #elem{name = <<"success">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
	   refs = [#ref{name = sasl2_additional_data,
                        label = '$additional_data',
                        min = 0, max = 1},
		   #ref{name = sasl2_authorization_identifier,
		        label = '$jid',
		        min = 1, max = 1}],
           result = {sasl2_success, '$jid', '$additional_data', '$_els'}}).

-xml(sasl2_additional_data,
     #elem{name = <<"additional-data">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           cdata = #cdata{label = '$text',
                          dec = {base64, mime_decode, []},
                          enc = {base64, encode, []}},
           result = '$text'}).

-xml(sasl2_authorization_identifier,
     #elem{name = <<"authorization-identifier">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
	   cdata = #cdata{label = '$jid',
	                  required = true,
			  dec = {jid, decode, []},
			  enc = {jid, encode, []}},
           result = '$jid'}).

-xml(sasl2_failure,
     #elem{name = <<"failure">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
	   refs = [#ref{name = sasl2_text,
                        label = '$text',
                        min = 0, max = 1},
                   #ref{name = sasl_failure_aborted,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_account_disabled,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_credentials_expired,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_encryption_required,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_incorrect_encoding,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_invalid_authzid,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_invalid_mechanism,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_malformed_request,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_mechanism_too_weak,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_not_authorized,
                        min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_bad_protocol,
			min = 0, max = 1, label = '$reason'},
                   #ref{name = sasl_failure_temporary_auth_failure,
                        min = 0, max = 1, label = '$reason'}],
           result = {sasl2_failure, '$reason', '$text', '$_els'}}).

-xml(sasl2_text,
     #elem{name = <<"text">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
           result = '$cdata'}).

-xml(sasl2_continue,
     #elem{name = <<"continue">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
	   refs = [#ref{name = sasl2_additional_data,
	                label = '$additional_data',
	                min = 0, max = 1},
                   #ref{name = sasl2_text,
                        label = '$text',
                        min = 0, max = 1},
                   #ref{name = sasl2_tasks,
                        label = '$tasks',
                        min = 0, max = 1}],
           result = {sasl2_continue, '$additional_data', '$text', '$tasks', '$_els'}}).

-xml(sasl2_tasks,
     #elem{name = <<"tasks">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
	   refs = [#ref{name = sasl2_task,
	                label = '$task',
	                min = 0}],
           result = '$task'}).

-xml(sasl2_task,
     #elem{name = <<"task">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	       module = 'xep0388',
           result = '$cdata'}).

-xml(sasl2_task_data,
     #elem{name = <<"task-data">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	       module = 'xep0388',
           result = {sasl2_task_data, '$_els'}}).

-xml(sasl2_next,
     #elem{name = <<"next">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
           attrs = [#attr{name = <<"task">>}],
	       module = 'xep0388',
           result = {sasl2_next, '$task', '$_els'}}).

-xml(sasl2_abort,
     #elem{name = <<"abort">>,
           xmlns = <<"urn:xmpp:sasl:2">>,
	   module = 'xep0388',
	   refs = [#ref{name = sasl2_text,
                        label = '$text',
                        min = 0, max = 1}],
           result = {sasl2_abort, '$text', '$_els'}}).

-xml(bind2_bind,
     #elem{name = <<"bind">>,
           xmlns = <<"urn:xmpp:bind:0">>,
	   module = 'xep0386',
	   refs = [#ref{name = bind2_inline,
	                label = '$inline',
	                min = 0, max = 1},
                   #ref{name = bind2_tag,
                        label = '$tag',
                        min = 0, max = 1}],
           result = {bind2_bind, '$tag', '$inline', '$_els'}}).

-xml(bind2_inline,
     #elem{name = <<"inline">>,
           xmlns = <<"urn:xmpp:bind:0">>,
	   module = 'xep0386',
           result = '$_els'}).

-xml(bind2_tag,
     #elem{name = <<"tag">>,
           xmlns = <<"urn:xmpp:bind:0">>,
	   module = 'xep0386',
	   cdata = #cdata{label = '$tag',
	                  required = true},
           result = '$tag'}).

-xml(bind2_bound,
     #elem{name = <<"bound">>,
           xmlns = <<"urn:xmpp:bind:0">>,
	   module = 'xep0386',
           result = {bind2_bound, '$_els'}}).

-xml(bind2_feature,
     #elem{name = <<"feature">>,
           xmlns = <<"urn:xmpp:bind:0">>,
	   module = 'xep0386',
	   attrs = [#attr{name = <<"var">>,
	                  label = '$var',
			  required = true}],
           result = {bind2_feature, '$var'}}).

-xml(s2s_bidi,
     #elem{name = <<"bidi">>,
           xmlns = <<"urn:xmpp:bidi">>,
	   module = 'xep0288',
           result = {s2s_bidi}}).

-xml(s2s_bidi_feature,
     #elem{name = <<"bidi">>,
           xmlns = <<"urn:xmpp:features:bidi">>,
	   module = 'xep0288',
           result = {s2s_bidi_feature}}).

-xml(sasl_upgrade,
     #elem{name = <<"upgrade">>,
           xmlns = <<"urn:xmpp:sasl:upgrade:0">>,
           module = 'xep0480',
           cdata = #cdata{label = '$cdata',
                          required = true},
           result = {sasl_upgrade, '$cdata'}}).

-xml(scram_upgrade_salt,
     #elem{name = <<"salt">>,
           xmlns = <<"urn:xmpp:scram-upgrade:0">>,
           module = 'xep0480',
           attrs = [#attr{name = <<"iterations">>,
                          label = '$iterations',
                          enc = {enc_int, []},
                          dec = {dec_int, [1, infinity]},
                          required = true}],
           cdata = #cdata{label = '$cdata',
                          required = true,
                          enc = {base64, encode, []},
                          dec = {base64, decode, []}},
           result = {scram_upgrade_salt, '$iterations', '$cdata'}}).

-xml(scram_upgrade_hash,
     #elem{name = <<"hash">>,
           xmlns = <<"urn:xmpp:scram-upgrade:0">>,
           module = 'xep0480',
           cdata = #cdata{label = '$data',
                          required = true,
                          enc = {base64, encode, []},
                          dec = {base64, decode, []}},
           result = {scram_upgrade_hash, '$data'}}).

-xml(fast,
     #elem{name = <<"fast">>,
           xmlns = <<"urn:xmpp:fast:0">>,
           module = 'xep0484',
           attrs = [#attr{name = <<"tls-0rtt">>,
                          label = '$zero_rtt',
                          enc = {enc_bool, []},
                          dec = {dec_bool, []}},
                    #attr{name = <<"count">>,
                          label = '$count',
                          enc = {enc_int, []},
                          dec = {dec_int, []}},
                    #attr{name = <<"invalidate">>,
                          label = '$invalidate',
                          enc = {enc_bool, []},
                          dec = {dec_bool, []}}],
           refs = [#ref{name = fast_mech,
                       label = '$mechs',
                       min = 0}],
           result = {fast, '$zero_rtt', '$count', '$invalidate', '$mechs'}}).

-xml(fast_mech,
     #elem{name = <<"mechanism">>,
           xmlns = <<"urn:xmpp:fast:0">>,
           module = 'xep0484',
           result = '$cdata'}).

-xml(fast_request_token,
     #elem{name = <<"request-token">>,
           xmlns = <<"urn:xmpp:fast:0">>,
           module = 'xep0484',
           attrs = [#attr{name = <<"mechanism">>,
                          label = '$mech',
						  required = true}],
		   result = {fast_request_token, '$mech'}
		}).

-xml(fast_token,
     #elem{name = <<"token">>,
           xmlns = <<"urn:xmpp:fast:0">>,
           module = 'xep0484',
           attrs = [#attr{name = <<"expiry">>,
                          label = '$expiry',
						  enc = {enc_utc, []},
						  dec = {dec_utc, []}},
                    #attr{name = <<"token">>,
                          label = '$token'}],
		   result = {fast_token, '$expiry', '$token'}
		}).

-xml(pubsub_serverinfo,
     #elem{name = <<"serverinfo">>,
		   xmlns = <<"urn:xmpp:serverinfo:0">>,
		   module = 'xep0485',
		   result = {pubsub_serverinfo, '$domain'},
		   refs = [#ref{name = pubsub_serverinfo_domain,
		                label = '$domain',
		                min = 0}]}).

-xml(pubsub_serverinfo_domain,
     #elem{name = <<"domain">>,
		   xmlns = <<"urn:xmpp:serverinfo:0">>,
		   module = 'xep0485',
		   result = {pubsub_serverinfo_domain, '$name', '$remote_domain'},
		   attrs = [#attr{name = <<"name">>,
		                  label = '$name',
		                  required = true}],
		   refs = [#ref{name = pubsub_serverinfo_federation,
		                label = '$remote_domain',
		                min = 0, max = 1}]}).

-xml(pubsub_serverinfo_federation,
     #elem{name = <<"federation">>,
		   xmlns = <<"urn:xmpp:serverinfo:0">>,
		   module = 'xep0485',
		   result = '$remote_domain',
		   refs = [#ref{name = pubsub_serverinfo_remote_domain,
		                label = '$remote_domain',
		                min = 0}]}).

-xml(pubsub_serverinfo_remote_domain,
     #elem{name = <<"remote-domain">>,
		   xmlns = <<"urn:xmpp:serverinfo:0">>,
		   module = 'xep0485',
		   result = {pubsub_serverinfo_remote_domain, '$name', '$type'},
		   attrs = [#attr{name = <<"name">>,
		                  label = '$name',
		                  required = true}],
		   refs = [#ref{name = pubsub_serverinfo_connection,
		                label = '$type',
		                min = 0}]}).

-xml(pubsub_serverinfo_connection,
     #elem{name = <<"connection">>,
		   xmlns = <<"urn:xmpp:serverinfo:0">>,
		   module = 'xep0485',
		   result = '$type',
		   attrs = [#attr{name = <<"type">>,
		                  label = '$type',
		                  required = true,
		                  enc = {enc_enum, []},
		                  dec = {dec_enum, [[incoming, outgoing, bidi]]}}]}).

-spec dec_tzo(_) -> {integer(), integer()}.
dec_tzo(Val) ->
    [H1, M1] = binary:split(Val, <<":">>),
    H = binary_to_integer(H1),
    M = binary_to_integer(M1),
    if H >= -12, H =< 12, M >= 0, M < 60  ->
            {H, M}
    end.

enc_tzo({H, M}) ->
    Sign = if H >= 0 ->
                   <<"+">>;
              true ->
                   <<"-">>
           end,
    list_to_binary([Sign, io_lib:format("~2..0w:~2..0w", [abs(H), M])]).

-spec dec_utc(_) -> erlang:timestamp().
dec_utc(Val) ->
    xmpp_util:decode_timestamp(Val).

enc_utc(Val) ->
    xmpp_util:encode_timestamp(Val).

-spec jid:decode(_) -> jid:jid().

-spec check_resource(_) -> binary().
check_resource(R) ->
    case jid:resourceprep(R) of
        error ->
            erlang:error(badarg);
        _ ->
	    R
    end.

-spec nameprep(_) -> binary().
nameprep(S) ->
    case jid:nameprep(S) of
	error ->
	    erlang:error(badarg);
	S1 ->
	    S1
    end.

-spec nodeprep(_) -> binary().
nodeprep(S) ->
    case jid:nodeprep(S) of
	error ->
	    erlang:error(badarg);
	S1 ->
	    S1
    end.

-spec dec_bool(_) -> boolean().
dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

join([], _Sep) -> <<>>;
join([H | T], Sep) ->
    <<H/binary, (<< <<Sep, X/binary>> || X <- T >>)/binary>>.

-spec dec_ip(_) -> inet:ip_address().
dec_ip(S) ->
    {ok, Addr} = inet_parse:address(binary_to_list(S)),
    Addr.

enc_ip({0,0,0,0,0,16#ffff,A,B}) ->
    enc_ip({(A bsr 8) band 16#ff, A band 16#ff,
	    (B bsr 8) band 16#ff, B band 16#ff});
enc_ip(Addr) ->
    list_to_binary(inet_parse:ntoa(Addr)).

-spec re:split(_, _) -> [binary()].
-spec base64:decode(_) -> binary().
-spec base64:mime_decode(_) -> binary().
-spec xmpp_lang:check(_) -> binary().

-type xmpp_host() :: binary() | inet:ip_address() |
		     {binary() | inet:ip_address(), inet:port_number()}.

-spec dec_host(_) -> binary() | inet:ip_address().
dec_host(S) ->
    try dec_ip(S) catch _:_ -> S end.

enc_host(Addr) when is_tuple(Addr) ->
    enc_ip(Addr);
enc_host(Host) ->
    Host.

-spec dec_host_port(_) -> binary() | inet:ip_address() |
			  {binary() | inet:ip_address(), inet:port_number()}.
dec_host_port(<<$[, T/binary>>) ->
    [IP, <<$:, Port/binary>>] = binary:split(T, <<$]>>),
    {dec_ip(IP), dec_int(Port, 0, 65535)};
dec_host_port(S) ->
    case binary:split(S, <<$:>>) of
	[S] ->
	    dec_host(S);
	[S, P] ->
	    {dec_host(S), dec_int(P, 0, 65535)}
    end.

enc_host_port(Host) when is_binary(Host) ->
    Host;
enc_host_port({Addr, Port}) when is_tuple(Addr) ->
    enc_host_port({enc_host_port(Addr), Port});
enc_host_port({Host, Port}) ->
    <<Host/binary, $:, (integer_to_binary(Port))/binary>>;
enc_host_port({_,_,_,_} = IPv4) ->
    enc_ip(IPv4);
enc_host_port({0,0,0,0,0,16#ffff,_,_} = IP) ->
    enc_ip(IP);
enc_host_port({_,_,_,_,_,_,_,_} = IPv6) ->
    <<$[, (enc_ip(IPv6))/binary, $]>>.

-spec dec_version(_) -> {non_neg_integer(), non_neg_integer()}.
dec_version(S) ->
    [Major, Minor] = binary:split(S, <<$.>>),
    {binary_to_integer(Major), binary_to_integer(Minor)}.

enc_version({Maj, Min}) ->
    <<(integer_to_binary(Maj))/binary, $., (integer_to_binary(Min))/binary>>.

-spec dec_ps_aff(_) -> member | none | outcast |
		       owner | publisher | publish_only.
dec_ps_aff(<<"member">>) -> member;
dec_ps_aff(<<"none">>) -> none;
dec_ps_aff(<<"outcast">>) -> outcast;
dec_ps_aff(<<"owner">>) -> owner;
dec_ps_aff(<<"publisher">>) -> publisher;
dec_ps_aff(<<"publish-only">>) -> publish_only.

enc_ps_aff(member) -> <<"member">>;
enc_ps_aff(none) -> <<"none">>;
enc_ps_aff(outcast) -> <<"outcast">>;
enc_ps_aff(owner) -> <<"owner">>;
enc_ps_aff(publisher) -> <<"publisher">>;
enc_ps_aff(publish_only) -> <<"publish-only">>.

-spec dec_message_type(_) -> chat | groupchat | headline | error | normal.
dec_message_type(<<"chat">>) -> chat;
dec_message_type(<<"groupchat">>) -> groupchat;
dec_message_type(<<"headline">>) -> headline;
dec_message_type(<<"error">>) -> error;
dec_message_type(_) -> normal.

%% Local Variables:
%% mode: erlang
%% End:
%% vim: set filetype=erlang tabstop=8:
