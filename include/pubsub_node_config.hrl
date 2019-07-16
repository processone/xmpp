%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_node_config.xdata
%% Form type: http://jabber.org/protocol/pubsub#node_config
%% Document: XEP-0060

-type 'access_model'() :: authorize | open | presence | roster | whitelist.
-type 'children_association_policy'() :: all | owners | whitelist.
-type 'itemreply'() :: owner | publisher | none.
-type 'node_type'() :: leaf | collection.
-type 'notification_type'() :: normal | headline.
-type 'publish_model'() :: publishers | subscribers | open.
-type 'send_last_published_item'() :: never | on_sub | on_sub_and_presence.

-type property() :: {'access_model', 'access_model'()} |
                    {'body_xslt', binary()} |
                    {'children_association_policy', 'children_association_policy'()} |
                    {'children_association_whitelist', [jid:jid()]} |
                    {'children', [binary()]} |
                    {'children_max', binary()} |
                    {'collection', [binary()]} |
                    {'contact', [jid:jid()]} |
                    {'dataform_xslt', binary()} |
                    {'deliver_notifications', boolean()} |
                    {'deliver_payloads', boolean()} |
                    {'description', binary()} |
                    {'item_expire', binary()} |
                    {'itemreply', 'itemreply'()} |
                    {'language', binary()} |
                    {'max_items', non_neg_integer()} |
                    {'max_payload_size', non_neg_integer()} |
                    {'node_type', 'node_type'()} |
                    {'notification_type', 'notification_type'()} |
                    {'notify_config', boolean()} |
                    {'notify_delete', boolean()} |
                    {'notify_retract', boolean()} |
                    {'notify_sub', boolean()} |
                    {'persist_items', boolean()} |
                    {'presence_based_delivery', boolean()} |
                    {'publish_model', 'publish_model'()} |
                    {'purge_offline', boolean()} |
                    {'roster_groups_allowed', [binary()]} |
                    {'send_last_published_item', 'send_last_published_item'()} |
                    {'tempsub', boolean()} |
                    {'subscribe', boolean()} |
                    {'title', binary()} |
                    {'type', binary()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type form_property() ::
      {'access_model', 'access_model'() | undefined} |
      {'access_model', 'access_model'() | undefined, options('access_model'())} |
      {'body_xslt', binary()} |
      {'children_association_policy', 'children_association_policy'() | undefined} |
      {'children_association_policy', 'children_association_policy'() | undefined, options('children_association_policy'())} |
      {'children_association_whitelist', [jid:jid()]} |
      {'children', [binary()]} |
      {'children_max', binary()} |
      {'collection', [binary()]} |
      {'contact', [jid:jid()]} |
      {'dataform_xslt', binary()} |
      {'deliver_notifications', boolean() | undefined} |
      {'deliver_payloads', boolean() | undefined} |
      {'description', binary()} |
      {'item_expire', binary()} |
      {'itemreply', 'itemreply'() | undefined} |
      {'itemreply', 'itemreply'() | undefined, options('itemreply'())} |
      {'language', binary()} |
      {'language', binary(), options(binary())} |
      {'max_items', non_neg_integer() | undefined} |
      {'max_payload_size', non_neg_integer() | undefined} |
      {'node_type', 'node_type'() | undefined} |
      {'node_type', 'node_type'() | undefined, options('node_type'())} |
      {'notification_type', 'notification_type'() | undefined} |
      {'notification_type', 'notification_type'() | undefined, options('notification_type'())} |
      {'notify_config', boolean() | undefined} |
      {'notify_delete', boolean() | undefined} |
      {'notify_retract', boolean() | undefined} |
      {'notify_sub', boolean() | undefined} |
      {'persist_items', boolean() | undefined} |
      {'presence_based_delivery', boolean() | undefined} |
      {'publish_model', 'publish_model'() | undefined} |
      {'publish_model', 'publish_model'() | undefined, options('publish_model'())} |
      {'purge_offline', boolean() | undefined} |
      {'roster_groups_allowed', [binary()]} |
      {'roster_groups_allowed', [binary()], options(binary())} |
      {'send_last_published_item', 'send_last_published_item'() | undefined} |
      {'send_last_published_item', 'send_last_published_item'() | undefined, options('send_last_published_item'())} |
      {'tempsub', boolean() | undefined} |
      {'subscribe', boolean() | undefined} |
      {'title', binary()} |
      {'type', binary()}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
