%% Created automatically by xdata generator (xdata_codec.erl)
%% Source: captcha_form.xdata
%% Form type: urn:xmpp:captcha
%% Document: XEP-0158


-type property() :: {'answers', non_neg_integer()} |
                    {'audio_recog', binary()} |
                    {'challenge', binary()} |
                    {'from', jid:jid()} |
                    {'ocr', binary()} |
                    {'picture_q', binary()} |
                    {'picture_recog', binary()} |
                    {'qa', binary()} |
                    {'SHA-256', binary()} |
                    {'sid', binary()} |
                    {'speech_q', binary()} |
                    {'speech_recog', binary()} |
                    {'video_q', binary()} |
                    {'video_recog', binary()} |
                    {'captcha-fallback-text', binary()} |
                    {'captcha-fallback-url', binary()}.
-type result() :: [property()].

-type form_property() ::
      {'answers', non_neg_integer() | undefined} |
      {'audio_recog', binary()} |
      {'challenge', binary()} |
      {'from', jid:jid() | undefined} |
      {'ocr', binary()} |
      {'picture_q', binary()} |
      {'picture_recog', binary()} |
      {'qa', binary()} |
      {'SHA-256', binary()} |
      {'sid', binary()} |
      {'speech_q', binary()} |
      {'speech_recog', binary()} |
      {'video_q', binary()} |
      {'video_recog', binary()} |
      {'captcha-fallback-text', binary()} |
      {'captcha-fallback-url', binary()}.
-type form() :: [form_property() | xdata_field()].

-type error_reason() :: {form_type_mismatch, binary()} |
                        {bad_var_value, binary(), binary()} |
                        {missing_required_var, binary(), binary()} |
                        {missing_value, binary(), binary()} |
                        {too_many_values, binary(), binary()} |
                        {unknown_var, binary(), binary()}.
