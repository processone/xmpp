%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_subscribe_options.xdata
%% Form type: http://jabber.org/protocol/pubsub#subscribe_options
%% Document: XEP-0060

-type 'show-values'() :: away | chat | dnd | online | xa.
-type 'subscription_type'() :: items | nodes.
-type 'subscription_depth'() :: 1 | all.

-type property() :: {'deliver', boolean()} |
                    {'digest', boolean()} |
                    {'digest_frequency', binary()} |
                    {'expire', binary()} |
                    {'include_body', boolean()} |
                    {'show-values', ['show-values'()]} |
                    {'subscription_type', 'subscription_type'()} |
                    {'subscription_depth', 'subscription_depth'()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type form_property() ::
      {'deliver', boolean() | undefined} |
      {'digest', boolean() | undefined} |
      {'digest_frequency', binary()} |
      {'expire', binary()} |
      {'include_body', boolean() | undefined} |
      {'show-values', ['show-values'()]} |
      {'show-values', ['show-values'()], options('show-values'())} |
      {'subscription_type', 'subscription_type'() | undefined} |
      {'subscription_type', 'subscription_type'() | undefined, options('subscription_type'())} |
      {'subscription_depth', 'subscription_depth'() | undefined} |
      {'subscription_depth', 'subscription_depth'() | undefined, options('subscription_depth'())}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
