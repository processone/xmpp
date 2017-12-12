%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: pubsub_meta_data.xdata
%% Form type: http://jabber.org/protocol/pubsub#meta-data
%% Document: XEP-0060


-type property() :: {'contact', [jid:jid()]} |
                    {'creation_date', erlang:timestamp()} |
                    {'creator', jid:jid()} |
                    {'description', binary()} |
                    {'language', binary()} |
                    {'num_subscribers', non_neg_integer()} |
                    {'owner', [jid:jid()]} |
                    {'publisher', [jid:jid()]} |
                    {'title', binary()} |
                    {'type', binary()} |
                    {'max_items', non_neg_integer()}.
-type result() :: [property()].

-type options(T) :: [{binary(), T}].
-type property_with_options() ::
      {'language', binary(), options(binary())}.
-type form() :: [property() | property_with_options() | xdata_field()].
