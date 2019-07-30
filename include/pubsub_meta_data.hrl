%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_meta_data.xdata
%% Form type: http://jabber.org/protocol/pubsub#meta-data
%% Document: XEP-0060

-type 'access_model'() :: authorize | open | presence | roster | whitelist.
-type 'publish_model'() :: publishers | subscribers | open.

-type property() :: {'contact', [jid:jid()]} |
                    {'creation_date', erlang:timestamp()} |
                    {'creator', jid:jid()} |
                    {'description', binary()} |
                    {'language', binary()} |
                    {'num_subscribers', non_neg_integer()} |
                    {'owner', [jid:jid()]} |
                    {'publisher', [jid:jid()]} |
                    {'title', binary()} |
                    {'type', binary()} |
                    {'max_items', non_neg_integer()} |
                    {'access_model', 'access_model'()} |
                    {'publish_model', 'publish_model'()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type form_property() ::
      {'contact', [jid:jid()]} |
      {'creation_date', erlang:timestamp() | undefined} |
      {'creator', jid:jid() | undefined} |
      {'description', binary()} |
      {'language', binary()} |
      {'language', binary(), options(binary())} |
      {'num_subscribers', non_neg_integer() | undefined} |
      {'owner', [jid:jid()]} |
      {'publisher', [jid:jid()]} |
      {'title', binary()} |
      {'type', binary()} |
      {'max_items', non_neg_integer() | undefined} |
      {'access_model', 'access_model'() | undefined} |
      {'access_model', 'access_model'() | undefined, options('access_model'())} |
      {'publish_model', 'publish_model'() | undefined} |
      {'publish_model', 'publish_model'() | undefined, options('publish_model'())}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
