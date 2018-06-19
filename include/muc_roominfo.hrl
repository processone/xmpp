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
-type property_with_options() ::
      {'allowpm', 'allowpm'(), options('allowpm'())}.
-type form() :: [property() | property_with_options() | xdata_field()].
