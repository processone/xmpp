%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: mam_query.xdata
%% Form type: urn:xmpp:mam:1
%% Document: XEP-0313


-type property() :: {'with', jid:jid()} |
                    {'start', erlang:timestamp()} |
                    {'end', erlang:timestamp()} |
                    {'withtext', binary()}.
-type result() :: [property()].

-type form_property() ::
      {'with', jid:jid() | undefined} |
      {'start', erlang:timestamp() | undefined} |
      {'end', erlang:timestamp() | undefined} |
      {'withtext', binary()}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
