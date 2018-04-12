%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: push_summary.xdata
%% Form type: urn:xmpp:push:summary
%% Document: XEP-0357


-type property() :: {'message-count', non_neg_integer()} |
                    {'pending-subscription-count', non_neg_integer()} |
                    {'last-message-sender', jid:jid()} |
                    {'last-message-body', binary()}.
-type result() :: [property()].

-type form() :: [property() | xdata_field()].
