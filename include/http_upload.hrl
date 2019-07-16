%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: http_upload.xdata
%% Form type: urn:xmpp:http:upload:0, urn:xmpp:http:upload, eu:siacs:conversations:http:upload
%% Document: XEP-0363


-type property() :: {'max-file-size', non_neg_integer()}.
-type result() :: [property()].

-type form_property() ::
      {'max-file-size', non_neg_integer() | undefined}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
