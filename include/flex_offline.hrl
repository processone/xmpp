%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: flex_offline.xdata
%% Form type: http://jabber.org/protocol/offline
%% Document: XEP-0013


-type property() :: {'number_of_messages', non_neg_integer()}.
-type result() :: [property()].

-type form_property() ::
      {'number_of_messages', non_neg_integer() | undefined}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
