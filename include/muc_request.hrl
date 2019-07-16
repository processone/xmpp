%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_request.xdata
%% Form type: http://jabber.org/protocol/muc#request
%% Document: XEP-0045


-type property() :: {'role', participant} |
                    {'jid', jid:jid()} |
                    {'roomnick', binary()} |
                    {'request_allow', boolean()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type form_property() ::
      {'role', participant | undefined} |
      {'role', participant | undefined, options(participant)} |
      {'jid', jid:jid() | undefined} |
      {'roomnick', binary()} |
      {'request_allow', boolean() | undefined}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
