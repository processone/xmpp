%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_register.xdata
%% Form type: http://jabber.org/protocol/muc#register
%% Document: XEP-0045


-type property() :: {'allow', boolean()} |
                    {'email', binary()} |
                    {'faqentry', [binary()]} |
                    {'first', binary()} |
                    {'last', binary()} |
                    {'roomnick', binary()} |
                    {'url', binary()}.
-type result() :: [property()].

-type form_property() ::
      {'allow', boolean() | undefined} |
      {'email', binary()} |
      {'faqentry', [binary()]} |
      {'first', binary()} |
      {'last', binary()} |
      {'roomnick', binary()} |
      {'url', binary()}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
