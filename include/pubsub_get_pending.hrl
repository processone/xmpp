%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_get_pending.xdata
%% Form type: http://jabber.org/protocol/pubsub#subscribe_authorization
%% Document: XEP-0060


-type property() :: {'node', binary()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type form_property() ::
      {'node', binary()} |
      {'node', binary(), options(binary())}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
