%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_roomconfig.xdata
%% Form type: http://jabber.org/protocol/muc#roomconfig
%% Document: XEP-0045

-type 'allowpm'() :: anyone | participants | moderators | none.
-type 'allow_private_messages_from_visitors'() :: nobody | moderators | anyone.
-type 'maxusers'() :: none | non_neg_integer().
-type 'presencebroadcast'() :: moderator | participant | visitor.
-type 'whois'() :: moderators | anyone.

-type property() :: {'maxhistoryfetch', binary()} |
                    {'allowpm', 'allowpm'()} |
                    {'allow_private_messages', boolean()} |
                    {'allow_private_messages_from_visitors', 'allow_private_messages_from_visitors'()} |
                    {'allow_visitor_status', boolean()} |
                    {'allow_visitor_nickchange', boolean()} |
                    {'allow_voice_requests', boolean()} |
                    {'allow_subscription', boolean()} |
                    {'voice_request_min_interval', non_neg_integer()} |
                    {'captcha_protected', boolean()} |
                    {'captcha_whitelist', [jid:jid()]} |
                    {'allow_query_users', boolean()} |
                    {'allowinvites', boolean()} |
                    {'changesubject', boolean()} |
                    {'enablelogging', boolean()} |
                    {'getmemberlist', [binary()]} |
                    {'lang', binary()} |
                    {'pubsub', binary()} |
                    {'maxusers', 'maxusers'()} |
                    {'membersonly', boolean()} |
                    {'moderatedroom', boolean()} |
                    {'members_by_default', boolean()} |
                    {'passwordprotectedroom', boolean()} |
                    {'persistentroom', boolean()} |
                    {'presencebroadcast', ['presencebroadcast'()]} |
                    {'publicroom', boolean()} |
                    {'public_list', boolean()} |
                    {'roomadmins', [jid:jid()]} |
                    {'roomdesc', binary()} |
                    {'roomname', binary()} |
                    {'roomowners', [jid:jid()]} |
                    {'roomsecret', binary()} |
                    {'whois', 'whois'()} |
                    {'mam', boolean()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type form_property() ::
      {'maxhistoryfetch', binary()} |
      {'allowpm', 'allowpm'() | undefined} |
      {'allowpm', 'allowpm'() | undefined, options('allowpm'())} |
      {'allow_private_messages', boolean() | undefined} |
      {'allow_private_messages_from_visitors', 'allow_private_messages_from_visitors'() | undefined} |
      {'allow_private_messages_from_visitors', 'allow_private_messages_from_visitors'() | undefined, options('allow_private_messages_from_visitors'())} |
      {'allow_visitor_status', boolean() | undefined} |
      {'allow_visitor_nickchange', boolean() | undefined} |
      {'allow_voice_requests', boolean() | undefined} |
      {'allow_subscription', boolean() | undefined} |
      {'voice_request_min_interval', non_neg_integer() | undefined} |
      {'captcha_protected', boolean() | undefined} |
      {'captcha_whitelist', [jid:jid()]} |
      {'allow_query_users', boolean() | undefined} |
      {'allowinvites', boolean() | undefined} |
      {'changesubject', boolean() | undefined} |
      {'enablelogging', boolean() | undefined} |
      {'getmemberlist', [binary()]} |
      {'getmemberlist', [binary()], options(binary())} |
      {'lang', binary() | undefined} |
      {'pubsub', binary() | undefined} |
      {'maxusers', 'maxusers'() | undefined} |
      {'maxusers', 'maxusers'() | undefined, options('maxusers'())} |
      {'membersonly', boolean() | undefined} |
      {'moderatedroom', boolean() | undefined} |
      {'members_by_default', boolean() | undefined} |
      {'passwordprotectedroom', boolean() | undefined} |
      {'persistentroom', boolean() | undefined} |
      {'presencebroadcast', ['presencebroadcast'()]} |
      {'presencebroadcast', ['presencebroadcast'()], options('presencebroadcast'())} |
      {'publicroom', boolean() | undefined} |
      {'public_list', boolean() | undefined} |
      {'roomadmins', [jid:jid()]} |
      {'roomdesc', binary()} |
      {'roomname', binary()} |
      {'roomowners', [jid:jid()]} |
      {'roomsecret', binary()} |
      {'whois', 'whois'() | undefined} |
      {'whois', 'whois'() | undefined, options('whois'())} |
      {'mam', boolean() | undefined}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
