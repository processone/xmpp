%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_publish_options.xdata
%% Form type: http://jabber.org/protocol/pubsub#publish-options
%% Document: XEP-0060

-type 'access_model'() :: authorize | open | presence | roster | whitelist.

-type property() :: {'persist_items', boolean()} |
                    {'access_model', 'access_model'()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type form_property() ::
      {'persist_items', boolean() | undefined} |
      {'access_model', 'access_model'() | undefined} |
      {'access_model', 'access_model'() | undefined, options('access_model'())}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
