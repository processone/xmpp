%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: muc_roominfo.xdata
%% Form type: http://jabber.org/protocol/muc#roominfo
%% Document: XEP-0045

-type 'allowpm'() :: anyone | participants | moderators | none.

-type property() :: {'maxhistoryfetch', non_neg_integer()} |
                    {'allowinvites', boolean()} |
                    {'allowpm', 'allowpm'()} |
                    {'contactjid', [jid:jid()]} |
                    {'description', binary()} |
                    {'lang', binary()} |
                    {'ldapgroup', binary()} |
                    {'logs', binary()} |
                    {'roomname', binary()} |
                    {'occupants', non_neg_integer()} |
                    {'subject', binary()} |
                    {'subjectmod', boolean()} |
                    {'pubsub', binary()} |
                    {'changesubject', boolean()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type form_property() ::
      {'maxhistoryfetch', non_neg_integer() | undefined} |
      {'allowinvites', boolean() | undefined} |
      {'allowpm', 'allowpm'() | undefined} |
      {'allowpm', 'allowpm'() | undefined, options('allowpm'())} |
      {'contactjid', [jid:jid()]} |
      {'description', binary()} |
      {'lang', binary() | undefined} |
      {'ldapgroup', binary()} |
      {'logs', binary()} |
      {'roomname', binary()} |
      {'occupants', non_neg_integer() | undefined} |
      {'subject', binary()} |
      {'subjectmod', boolean() | undefined} |
      {'pubsub', binary() | undefined} |
      {'changesubject', boolean() | undefined}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
