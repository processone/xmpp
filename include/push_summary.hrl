%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: push_summary.xdata
%% Form type: urn:xmpp:push:summary
%% Document: XEP-0357


-type property() :: {'message-count', non_neg_integer()} |
                    {'pending-subscription-count', non_neg_integer()} |
                    {'last-message-sender', jid:jid()} |
                    {'last-message-body', binary()}.
-type result() :: [property()].

-type form_property() ::
      {'message-count', non_neg_integer() | undefined} |
      {'pending-subscription-count', non_neg_integer() | undefined} |
      {'last-message-sender', jid:jid() | undefined} |
      {'last-message-body', binary()}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
