%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: http_upload.xdata
%% Form type: urn:xmpp:http:upload:0, urn:xmpp:http:upload, eu:siacs:conversations:http:upload
%% Document: XEP-0363


-type property() :: {'max-file-size', non_neg_integer()}.
-type result() :: [property()].

-type form() :: [property() | xdata_field()].
