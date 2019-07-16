%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_subscribe_authorization.xdata
%% Form type: http://jabber.org/protocol/pubsub#subscribe_authorization
%% Document: XEP-0060


-type property() :: {'allow', boolean()} |
                    {'node', binary()} |
                    {'subscriber_jid', jid:jid()} |
                    {'subid', binary()}.
-type result() :: [property()].

-type form_property() ::
      {'allow', boolean() | undefined} |
      {'node', binary()} |
      {'subscriber_jid', jid:jid() | undefined} |
      {'subid', binary()}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
