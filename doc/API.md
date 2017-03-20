Erlang/Elixir XMPP library API documentation
============================================

The document describes exported functions from the
following modules:

1. [xmpp](#xmpp)
2. [xmpp_util](#xmpp_util)
3. [jid](#jid)

# xmpp

The following functions are exported from `xmpp` module:
- [decode/1](#decode1)
- [decode/3](#decode3)
- [encode/1](#encode1)
- [encode/2](#encode2)
- [get_id/1](#get_id1)
- [set_id/2](#set_id2)
- [get_type/1](#get_type1)
- [set_type/2](#set_type2)
- [get_lang/1](#get_lang1)
- [set_lang/2](#set_lang2)
- [get_from/1](#get_from1)
- [set_from/2](#set_from2)
- [get_to/1](#get_to1)
- [set_to/2](#set_to2)
- [set_from_to/3](#set_from_to3)
- [get_els/1](#get_els1)
- [set_els/2](#set_els2)
- [get_subtag/2](#get_subtag2)
- [set_subtag/2](#set_subtag2)
- [remove_subtag/2](#remove_subtag2)
- [has_subtag/2](#has_subtag2)
- [append_subtags/2](#append_subtags2)
- [get_meta/1](#get_meta1)
- [get_meta/2](#get_meta2)
- [get_meta/3](#get_meta3)
- [set_meta/2](#set_meta2)
- [put_meta/3](#put_meta3)
- [update_meta/3](#update_meta3)
- [del_meta/2](#del_meta2)
- [is_stanza/1](#is_stanza1)
- [is_known_tag/1](#is_known_tag1)
- [is_known_tag/2](#is_known_tag2)
- [get_ns/1](#get_ns1)
- [get_name/1](#get_name1)
- [make_iq_result/1](#make_iq_result1)
- [make_iq_result/2](#make_iq_result2)
- [make_error/2](#make_error2)
- [get_error/1](#get_error1)
- [format_error/1](#format_error1)
- [io_format_error/1](#io_format_error1)
- [pp/1](#pp1)
- [set_tr_callback/1](#set_tr_callback1)
- [get_text/1](#get_text1)
- [get_text/2](#get_text2)
- [mk_text/1](#mk_text1)
- [mk_text/2](#mk_text2)
- [err_bad_request/0](#err_bad_request0)
- [err_bad_request/2](#err_bad_request2)
- [err_conflict/0](#err_conflict0)
- [err_conflict/2](#err_conflict2)
- [err_feature_not_implemented/0](#err_feature_not_implemented0)
- [err_feature_not_implemented/2](#err_feature_not_implemented2)
- [err_forbidden/0](#err_forbidden0)
- [err_forbidden/2](#err_forbidden2)
- [err_gone/0](#err_gone0)
- [err_gone/2](#err_gone2)
- [err_internal_server_error/0](#err_internal_server_error0)
- [err_internal_server_error/2](#err_internal_server_error2)
- [err_item_not_found/0](#err_item_not_found0)
- [err_item_not_found/2](#err_item_not_found2)
- [err_jid_malformed/0](#err_jid_malformed0)
- [err_jid_malformed/2](#err_jid_malformed2)
- [err_not_acceptable/0](#err_not_acceptable0)
- [err_not_acceptable/2](#err_not_acceptable2)
- [err_not_allowed/0](#err_not_allowed0)
- [err_not_allowed/2](#err_not_allowed2)
- [err_not_authorized/0](#err_not_authorized0)
- [err_not_authorized/2](#err_not_authorized2)
- [err_payment_required/0](#err_payment_required0)
- [err_payment_required/2](#err_payment_required2)
- [err_policy_violation/0](#err_policy_violation0)
- [err_policy_violation/2](#err_policy_violation2)
- [err_recipient_unavailable/0](#err_recipient_unavailable0)
- [err_recipient_unavailable/2](#err_recipient_unavailable2)
- [err_redirect/0](#err_redirect0)
- [err_redirect/2](#err_redirect2)
- [err_registration_required/0](#err_registration_required0)
- [err_registration_required/2](#err_registration_required2)
- [err_remote_server_not_found/0](#err_remote_server_not_found0)
- [err_remote_server_not_found/2](#err_remote_server_not_found2)
- [err_remote_server_timeout/0](#err_remote_server_timeout0)
- [err_remote_server_timeout/2](#err_remote_server_timeout2)
- [err_resource_constraint/0](#err_resource_constraint0)
- [err_resource_constraint/2](#err_resource_constraint2)
- [err_service_unavailable/0](#err_service_unavailable0)
- [err_service_unavailable/2](#err_service_unavailable2)
- [err_subscription_required/0](#err_subscription_required0)
- [err_subscription_required/2](#err_subscription_required2)
- [err_undefined_condition/1](#err_undefined_condition1)
- [err_undefined_condition/3](#err_undefined_condition3)
- [err_unexpected_request/0](#err_unexpected_request0)
- [err_unexpected_request/2](#err_unexpected_request2)
- [serr_bad_format/0](#serr_bad_format0)
- [serr_bad_format/2](#serr_bad_format2)
- [serr_bad_namespace_prefix/0](#serr_bad_namespace_prefix0)
- [serr_bad_namespace_prefix/2](#serr_bad_namespace_prefix2)
- [serr_conflict/0](#serr_conflict0)
- [serr_conflict/2](#serr_conflict2)
- [serr_connection_timeout/0](#serr_connection_timeout0)
- [serr_connection_timeout/2](#serr_connection_timeout2)
- [serr_host_gone/0](#serr_host_gone0)
- [serr_host_gone/2](#serr_host_gone2)
- [serr_host_unknown/0](#serr_host_unknown0)
- [serr_host_unknown/2](#serr_host_unknown2)
- [serr_improper_addressing/0](#serr_improper_addressing0)
- [serr_improper_addressing/2](#serr_improper_addressing2)
- [serr_internal_server_error/0](#serr_internal_server_error0)
- [serr_internal_server_error/2](#serr_internal_server_error2)
- [serr_invalid_from/0](#serr_invalid_from0)
- [serr_invalid_from/2](#serr_invalid_from2)
- [serr_invalid_id/0](#serr_invalid_id0)
- [serr_invalid_id/2](#serr_invalid_id2)
- [serr_invalid_namespace/0](#serr_invalid_namespace0)
- [serr_invalid_namespace/2](#serr_invalid_namespace2)
- [serr_invalid_xml/0](#serr_invalid_xml0)
- [serr_invalid_xml/2](#serr_invalid_xml2)
- [serr_not_authorized/0](#serr_not_authorized0)
- [serr_not_authorized/2](#serr_not_authorized2)
- [serr_not_well_formed/0](#serr_not_well_formed0)
- [serr_not_well_formed/2](#serr_not_well_formed2)
- [serr_policy_violation/0](#serr_policy_violation0)
- [serr_policy_violation/2](#serr_policy_violation2)
- [serr_remote_connection_failed/0](#serr_remote_connection_failed0)
- [serr_remote_connection_failed/2](#serr_remote_connection_failed2)
- [serr_reset/0](#serr_reset0)
- [serr_reset/2](#serr_reset2)
- [serr_resource_constraint/0](#serr_resource_constraint0)
- [serr_resource_constraint/2](#serr_resource_constraint2)
- [serr_restricted_xml/0](#serr_restricted_xml0)
- [serr_restricted_xml/2](#serr_restricted_xml2)
- [serr_see_other_host/0](#serr_see_other_host0)
- [serr_see_other_host/2](#serr_see_other_host2)
- [serr_system_shutdown/0](#serr_system_shutdown0)
- [serr_system_shutdown/2](#serr_system_shutdown2)
- [serr_undefined_condition/0](#serr_undefined_condition0)
- [serr_undefined_condition/2](#serr_undefined_condition2)
- [serr_unsupported_encoding/0](#serr_unsupported_encoding0)
- [serr_unsupported_encoding/2](#serr_unsupported_encoding2)
- [serr_unsupported_feature/0](#serr_unsupported_feature0)
- [serr_unsupported_feature/2](#serr_unsupported_feature2)
- [serr_unsupported_stanza_type/0](#serr_unsupported_stanza_type0)
- [serr_unsupported_stanza_type/2](#serr_unsupported_stanza_type2)
- [serr_unsupported_version/0](#serr_unsupported_version0)
- [serr_unsupported_version/2](#serr_unsupported_version2)

## decode/1
```erlang
-spec decode(El :: xmlel() | xmpp_element()) -> xmpp_element().
```
Shorthand for `decode(El, ?NS_CLIENT, [])`.

## decode/3
```erlang
-spec decode(El :: xmlel() | xmpp_element(),
             Namespace :: binary(),
	     [Option]) -> Pkt :: xmpp_element().
```
Decodes `xmlel()` element into `xmpp_element()`.

The only available value of `Option` is `ignore_els`:
if this option is set, lazy decoding is performed.
By default, full decoding is applied, i.e. all known sub-elements get
decoded. If `El` doesn't possess an `xmlns` attribute, it is
assumed that it is within namespace `Namespace`.
The function might **fail** with `{xmpp_codec, Reason}` exception.
The value of `Reason` can be used to format the failure reason
into human readable description using [format_error/1](#format_error1)
or [io_format_error/1](#io_format_error1) functions.

In the examples below we assume `El` is obtained from the following XML:
```xml
<message>
  <composing xmlns='http://jabber.org/protocol/chatstates'/>
  <foo xmlns='unknown:namespace'/>
</message>
```
thus it is defined as:
```erlang
#xmlel{name = <<"message">>,attrs = [],
       children = [#xmlel{name = <<"composing">>,
                          attrs = [{<<"xmlns">>,
                                    <<"http://jabber.org/protocol/chatstates">>}],
                          children = []},
                   #xmlel{name = <<"foo">>,
                          attrs = [{<<"xmlns">>,<<"unknown:namespace">>}],
                          children = []}]}
```
**Example 1**: lazy decoding
```erlang
> xmpp:decode(El, <<"jabber:client">>, [ignore_els]).
#message{id = <<>>,type = normal,lang = <<>>,
         from = undefined,to = undefined,subject = [],body = [],
         thread = undefined,
         sub_els = [#xmlel{name = <<"composing">>,
                           attrs = [{<<"xmlns">>,
                                     <<"http://jabber.org/protocol/chatstates">>}],
                           children = []},
                    #xmlel{name = <<"foo">>,
                           attrs = [{<<"xmlns">>,<<"unknown:namespace">>}],
                           children = []}],
         meta = #{}}
```
Note that sub-elements (a list in `#message.sub_els` field) remain untouched:
during lazy decoding only top-level element is decoded.

**Example 2**: full decoding
```erlang
> xmpp:decode(El, <<"jabber:client">>, []).          
#message{id = <<>>,type = normal,lang = <<>>,
         from = undefined,to = undefined,subject = [],body = [],
         thread = undefined,
         sub_els = [#chatstate{type = composing}],
         meta = #{}}
```
Note that in this case `<foo/>` element is dropped from `#message.sub_els`
because it doesn't correspond to any `xmpp_element()` record.

**Example 3**: no namespace is provided and `El` doesn't possess any
```erlang
> xmpp:decode(El, <<>>, []).                                   
** exception error: {xmpp_codec,{missing_tag_xmlns,<<"message">>}}
     in function  xmpp_codec:decode/3 (src/xmpp_codec.erl, line 16)
```
It is safe to apply the function to `xmpp_element()`:

**Example 4**: double decoding
```erlang
> xmpp:decode(xmpp:decode(El, <<"jabber:client">>, [])).                                         
#message{id = <<>>,type = normal,lang = <<>>,
         from = undefined,to = undefined,subject = [],body = [],
         thread = undefined,
         sub_els = [#chatstate{type = composing}],
         meta = #{}}
```

## encode/1
```erlang
-spec encode(Pkt :: xmpp_element() | xmlel()) -> El :: xmlel().
```
Shorthand for `encode(Pkt, <<>>)`.

## encode/2
```erlang
-spec encode(Pkt :: xmpp_element() | xmlel(),
             Namespace :: binary()) -> El :: xmlel().
```
Encodes `xmpp_element()` into `xmlel()`.
`Namespace` is a top-level namespace: it is used to tell the codec whether
to include `xmlns` attribute into resulting `xmlel()` element or not -
if the `Pkt` is within the same `Namespace`, `xmlns` attribute will be
omitted in the result.

**Example 1**: encoding without top-level namespace
```erlang
> xmpp:encode(#message{}, <<>>).
#xmlel{name = <<"message">>,
       attrs = [{<<"xmlns">>,<<"jabber:client">>}],
       children = []}
```
**Example 2**: encoding within 'jabber:client' namespace
```erlang
> xmpp:encode(#message{}, <<"jabber:client">>).
#xmlel{name = <<"message">>,attrs = [],children = []}
```
Note that `xmlns` attribute is omitted in this case
because `message()` stanza is defined within 'jabber:client' namespace.

**Example 3**: encoding within 'urn:xmpp:time' namespace
```erlang
> xmpp:encode(#message{}, <<"urn:xmpp:time">>).
#xmlel{name = <<"message">>,
       attrs = [{<<"xmlns">>,<<"jabber:client">>}],
       children = []}
```
Note that `xmlns` is included in the result because
`message()` stanza is not defined within 'urn:xmpp:time' namespace.

**Example 4**: encoding with sub-elements
```erlang
> xmpp:encode(#message{sub_els = [#chatstate{type = composing}]}).
#xmlel{name = <<"message">>,
       attrs = [{<<"xmlns">>,<<"jabber:client">>}],
       children = [#xmlel{name = <<"composing">>,
                          attrs = [{<<"xmlns">>,
                                    <<"http://jabber.org/protocol/chatstates">>}],
                          children = []}]}
```

It's acceptable to encode XMPP elements whose sub-elements are of
mixed content, i.e. `sub_els` field contains both `xmpp_element()` and `xmlel()`
elements as shown in the following example.

**Example 5**: encoding with mixed sub-elements
```erlang
> xmpp:encode(#message{sub_els = [#chatstate{type = composing},
                                  #xmlel{name = <<"foo">>,
                                         attrs = [{<<"xmlns">>, <<"unknown:namespace">>}]}]}).
#xmlel{name = <<"message">>,
       attrs = [{<<"xmlns">>,<<"jabber:client">>}],
       children = [#xmlel{name = <<"composing">>,
                          attrs = [{<<"xmlns">>,
                                    <<"http://jabber.org/protocol/chatstates">>}],
                          children = []},
                   #xmlel{name = <<"foo">>,
                          attrs = [{<<"xmlns">>,<<"unknown:namespace">>}],
                          children = []}]}
```
It is safe to apply the function to `xmlel()` elements

**Example 6**: double encoding
```erlang
> xmpp:encode(xmpp:encode(#message{})).
#xmlel{name = <<"message">>,
       attrs = [{<<"xmlns">>,<<"jabber:client">>}],
       children = []}
```
> **NOTE**: encoding would never fail as long as the
> provided input is a valid `xmpp_element()` with valid values of its record
> fields. Use [Dialyzer](http://erlang.org/doc/man/dialyzer.html) to validate this.

## get_id/1
```erlang
-spec get_id(stanza() | xmlel()) -> binary().
```
Returns a value of `id` field of a `stanza()` or a value of `id` attribute
of an `xmlel()` element.

**Example 1**: obtaining `id` of `message()`
```erlang
> xmpp:get_id(#message{id = <<"abcd">>}).
<<"abcd">>
```
**Example 2**: obtaining `id` of `xmlele()`
```erlang
> xmpp:get_id(#xmlel{attrs = [{<<"id">>, <<"abcd">>}]}).
<<"abcd">>
```

## set_id/2
```erlang
-spec set_id(iq(), binary()) -> iq();
	    (message(), binary()) -> message();
	    (presence(), binary()) -> presence().
```
Sets `id` field of a `stanza()`.

**Example 1**: setting `id` field of `iq()`
```erlang
xmpp:set_id(#iq{}, <<"abcd">>).
> #iq{id = <<"abcd">>,type = undefined,lang = <<>>,
    from = undefined,to = undefined,sub_els = [],meta = #{}}
```

## get_type/1
```erlang
-spec get_type(iq()) -> iq_type();
	      (message()) -> message_type();
	      (presence()) -> presence_type();
	      (xmlel()) -> binary().
```
Returns a value of `type` field of a `stanza()` or a value of `type` attribute
of an `xmlel()` element.

**Example 1**: obtaining `type` of `presence()`
```erlang
> xmpp:get_type(#presence{}).                
available
```
**Example 2**: obtaining `type` of `xmlel()`
```erlang
> xmpp:get_type(#xmlel{attrs = [{<<"type">>, <<"set">>}]}).
<<"set">>
```

## set_type/2
```erlang
-spec set_type(iq(), iq_type()) -> iq();
	      (message(), message_type()) -> message();
	      (presence(), presence_type()) -> presence().
```
Sets `type` field of a `stanza()`.

**Example 1**: setting `type` field of `message()`
```erlang
> xmpp:set_type(#message{}, chat).                         
#message{id = <<>>,type = chat,lang = <<>>,from = undefined,
         to = undefined,subject = [],body = [],thread = undefined,
         sub_els = [],meta = #{}}
```

## get_lang/1
```erlang
-spec get_lang(stanza() | xmlel()) -> binary().
```
Returns a value of `lang` field of a `stanza()` or a value of
`xml:lang` attribute of an `xmlel()` element.

**Example 1**: obtaining `lang` of `iq()`
```erlang
> xmpp:get_lang(#iq{lang = <<"fr">>}).
<<"fr">>
```
**Example 2**: obtaining `xml:lang` of `xmlel()`
```erlang
> xmpp:get_lang(#xmlel{attrs = [{<<"xml:lang">>, <<"fr">>}]}).
<<"fr">>
```

## set_lang/2
```erlang
-spec set_lang(iq(), binary()) -> iq();
	      (message(), binary()) -> message();
	      (presence(), binary()) -> presence().
```
Sets `lang` field of a `stanza()`.

**Example 1**: setting `lang` field of `presence()`
```erlang
> xmpp:set_lang(#presence{}, <<"fr">>).
#presence{id = <<>>,type = available,lang = <<"fr">>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],meta = #{}}
```

## get_from/1
```erlang
-spec get_from(stanza()) -> undefined | jid().
```
Returns a value of `from` field of a `stanza()`.

**Example 1**: obtaining `from` of `message()`
```erlang
> xmpp:get_from(#message{from = jid:decode(<<"user@server/resource">>)}).    
#jid{user = <<"user">>,server = <<"server">>,
     resource = <<"resource">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"resource">>}
```
**Example 2**: `from` field is not set
```erlang
> xmpp:get_from(#message{}).
undefined
```

## set_from/2
```erlang
-spec set_from(iq(), jid:jid() | undefined) -> iq();
	      (message(), jid:jid() | undefined) -> message();
	      (presence(), jid:jid() | undefined) -> presence().
```
Sets `from` field of a `stanza()`.

**Example 1**: setting `from` field of `presence()`
```erlang
> xmpp:set_from(#presence{}, jid:decode(<<"user@server/resource">>)).
#presence{id = <<>>,type = available,lang = <<>>,
          from = #jid{user = <<"user">>,server = <<"server">>,
                      resource = <<"resource">>,luser = <<"user">>,
                      lserver = <<"server">>,lresource = <<"resource">>},
          to = undefined,show = undefined,status = [],
          priority = undefined,sub_els = [],meta = #{}}
```
**Example 2**: removing `from` value from `iq()`
```erlang
> xmpp:set_from(#iq{from = jid:decode(<<"user@server/resource">>)}, undefined).
#iq{id = <<>>,type = undefined,lang = <<>>,from = undefined,
    to = undefined,sub_els = [],meta = #{}}
```

## get_to/1
```erlang
-spec get_to(stanza()) -> undefined | jid().
```
Returns a value of `to` field of a `stanza()`.

**Example 1**: obtaining `to` of `message()`
```erlang
> xmpp:get_to(#message{to = jid:decode(<<"user@server/resource">>)}).    
#jid{user = <<"user">>,server = <<"server">>,
     resource = <<"resource">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"resource">>}
```
**Example 2**: `to` field is not set
```erlang
> xmpp:get_to(#message{}).
undefined
```

## set_to/2
```erlang
-spec set_to(iq(), jid:jid() | undefined) -> iq();
	    (message(), jid:jid() | undefined) -> message();
	    (presence(), jid:jid() | undefined) -> presence().
```
Sets `to` field of a `stanza()`.

**Example 1**: setting `to` field of `presence()`
```erlang
> xmpp:set_to(#presence{}, jid:decode(<<"user@server/resource">>)).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,
          to = #jid{user = <<"user">>,server = <<"server">>,
                    resource = <<"resource">>,luser = <<"user">>,
                    lserver = <<"server">>,lresource = <<"resource">>},
          show = undefined,status = [],priority = undefined,
          sub_els = [],meta = #{}}
```
**Example 2**: removing `to` value from `iq()`
```erlang
> xmpp:set_to(#iq{to = jid:decode(<<"user@server/resource">>)}, undefined).  
#iq{id = <<>>,type = undefined,lang = <<>>,from = undefined,
    to = undefined,sub_els = [],meta = #{}}
```

## set_from_to/3
```erlang
-spec set_from_to(iq(), undefined | jid:jid(), undefined | jid:jid()) -> iq();
		 (message(), undefined | jid:jid(), undefined | jid:jid()) -> message();
		 (presence(), undefined | jid:jid(), undefined | jid:jid()) -> presence().
```
Sets `from` and `to` fields of a `stanza()`.

**Example 1**: setting `from` and `to` fields of `message()`
```erlang
> xmpp:set_from_to(#message{}, jid:decode(<<"user1@server.com">>), jid:decode(<<"user2@server.com">>)).
#message{id = <<>>,type = normal,lang = <<>>,
         from = #jid{user = <<"user1">>,server = <<"server.com">>,
                     resource = <<>>,luser = <<"user1">>,
                     lserver = <<"server.com">>,lresource = <<>>},
         to = #jid{user = <<"user2">>,server = <<"server.com">>,
                   resource = <<>>,luser = <<"user2">>,
                   lserver = <<"server.com">>,lresource = <<>>},
         subject = [],body = [],thread = undefined,sub_els = [],
         meta = #{}}
```

## get_els/1
```erlang
-spec get_els(stanza()) -> [xmpp_element() | xmlel()];
	     (xmlel()) -> [xmlel()].
```
Returns a value of `sub_els` field of a `stanza()` or
child elements of an `xmlel()` element.

**Example 1**: obtaining `sub_els` of `message()`
```erlang
> xmpp:get_els(#message{sub_els = [#chatstate{type = composing}, #xmlel{name = <<"foo">>}]}).
[#chatstate{type = composing},
 #xmlel{name = <<"foo">>,attrs = [],children = []}]
```
**Example 2**: obtaining child elements of `xmlel()`
```erlang
> xmpp:get_els(#xmlel{children = [#xmlel{name = <<"foo">>}, {xmlcdata, <<"bar">>}]}).
[#xmlel{name = <<"foo">>,attrs = [],children = []}]
```
Note that only `xmlel()` elements are returned and `xmlcdata()` is ignored.

## set_els/2
```erlang
-spec set_els(Stanza :: iq(), [xmpp_element() | xmlel()]) -> iq();
	     (Stanza :: message(), [xmpp_element() | xmlel()]) -> message();
	     (Stanza :: presence(), [xmpp_element() | xmlel()]) -> presence().
```
Sets `sub_els` field of `Stanza`.
Note that the function replaces all existing sub-elements of `Stanza`:
use [append_subtags/2](#append_subtags2) if you only want to add new elements.

**Example 1**: setting `sub_els` field of `iq()`
```erlang
> xmpp:set_els(#iq{type = get}, [#ping{}]).
#iq{id = <<>>,type = get,lang = <<>>,from = undefined,
    to = undefined,
    sub_els = [#ping{}],
    meta = #{}}
```
**Example 2**: removing `sub_els` from `presence()`
```erlang
> xmpp:set_els(#presence{sub_els = [#caps{}]}, []).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],meta = #{}}
```

## get_subtag/2
```erlang
-spec get_subtag(Stanza :: stanza(), Tag :: xmpp_element()) -> xmpp_element() | false.
```
Returns first sub-element of `Stanza` matching `Tag`
(i.e. `xmpp_element()` or `xmlel()` element with the same
tag name and namespace as `Tag`) or `false`
if no such element found or decoding of the matched element
has failed.

**Example 1**: obtaining `disco_info()` element
```erlang
> IQ.
#iq{id = <<"id">>,type = result,lang = <<>>,
    from = undefined,to = undefined,
    sub_els = [#xmlel{name = <<"query">>,
                      attrs = [{<<"node">>,<<"node">>},
                               {<<"xmlns">>,<<"http://jabber.org/protocol/disco#info">>}],
                      children = [#xmlel{name = <<"feature">>,
                                         attrs = [{<<"var">>,<<"feature">>}],
                                         children = []}]}],
    meta = #{}}
> xmpp:get_subtag(IQ, #disco_info{}).
#disco_info{node = <<"node">>,identities = [],
            features = [<<"feature">>],
            xdata = []}
```
**Example 2**: obtaining non-existing element
```erlang
> xmpp:get_subtag(#presence{}, #caps{}).
false
```

In the example below `jid` attribute is malformed, so
the function will return `false`.

**Example 3**: obtaining malformed element
```erlang
> IQ.
#iq{id = <<>>,type = undefined,lang = <<>>,from = undefined,
    to = undefined,
    sub_els = [#xmlel{name = <<"query">>,
                      attrs = [{<<"xmlns">>,
                                <<"http://jabber.org/protocol/disco#items">>}],
                      children = [#xmlel{name = <<"item">>,
                                         attrs = [{<<"jid">>,<<"@">>},
                                                  {<<"xmlns">>,<<"http://jabber.org/protocol/disco#items">>}],
                                         children = []}]}],
    meta = #{}}
> xmpp:get_subtag(IQ, #disco_items{}).
false
```

It is also possible to use the function to obtain already decoded elements
as show in the following example.

**Example 4**: obtaining already decoded element
```erlang
> xmpp:get_subtag(#iq{sub_els = [#ping{}]}, #ping{}).
#ping{}
```

## set_subtag/2
```erlang
-spec set_subtag(Stanza :: iq(), Tag :: xmpp_element()) -> iq();
		(Stanza :: message(), Tag :: xmpp_element()) -> message();
		(Stanza :: presence(), Tag :: xmpp_element()) -> presence().
```
Inserts `Tag` into sub-elements of `Stanza`.
If `Stanza` already contains an element with the same tag name
and namespace as `Tag`, the first occurence of such element is replaced by `Tag`.
Otherwise `Tag` is appended to the end of the list of
sub-elements. Note that even malformed element will be replaced if
it is matched, because decoding is not applied during matching.

**Example 1**: insertion without replacement
```erlang
> xmpp:set_subtag(#presence{sub_els = [#delay{stamp = now()}]}, #nick{name = <<"nick">>}).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#delay{stamp = {1489,605315,130667},
                            from = undefined,desc = <<>>},
                     #nick{name = <<"nick">>}],
          meta = #{}}
```
**Example 2**: insertion with replacement
```erlang
> Presence.
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#xmlel{name = <<"nick">>,
                            attrs = [{<<"xmlns">>,
                                      <<"http://jabber.org/protocol/nick">>}],
                            children = [{xmlcdata,<<"old">>}]}],
          meta = #{}}
> xmpp:set_subtag(Presence, #nick{name = <<"new">>}).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#nick{name = <<"new">>}],
          meta = #{}}
```

In the example below existing `<delay/>` tag is replaced even
though it's malformed (`<delay/>` element MUST possess `stamp` attribute).

**Example 3**: replacement of malformed matching element
```erlang
> Presence.
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#xmlel{name = <<"delay">>,
                            attrs = [{<<"xmlns">>,<<"urn:xmpp:delay">>}],
                            children = []}],
          meta = #{}}
> xmpp:set_subtag(Presence, #delay{stamp = now()}).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#delay{stamp = {1489,605957,281474},
                            from = undefined,desc = <<>>}],
          meta = #{}}
```

## remove_subtag/2
```erlang
-spec remove_subtag(Stanza :: iq(), Tag :: xmpp_element()) -> iq();
		   (Stanza :: message(), Tag :: xmpp_element()) -> message();
		   (Stanza :: presence(), Tag :: xmpp_element()) -> presence().
```
Removes all sub-elements of `Stanza` matching `Tag` (i.e. `xmpp_element()`
or `xmlel()` elements with the same tag name and namespace as `Tag`).
Note that even malformed elements will be removed
if they are matched, because decoding is not applied during matching.

**Example 1**: removing all matching elements
```erlang
> Presence.
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#xmlel{name = <<"delay">>,
                            attrs = [{<<"stamp">>,<<"2017-03-15T20:04:50.711597Z">>},
                                     {<<"xmlns">>,<<"urn:xmpp:delay">>}],
                            children = []},
                     #xmlel{name = <<"delay">>,
                            attrs = [{<<"stamp">>,<<"2017-03-15T20:04:50.711613Z">>},
                                     {<<"xmlns">>,<<"urn:xmpp:delay">>}],
                            children = []}],
          meta = #{}}
> xmpp:remove_subtag(Presence, #delay{}).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],meta = #{}}
```
In the example below `<delay/>` tag is removed even
though it's malformed (`<delay/>` element MUST possess `stamp` attribute).

**Example 2**: removing malformed matching element
```erlang
> Presence.
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#xmlel{name = <<"delay">>,
                            attrs = [{<<"xmlns">>,<<"urn:xmpp:delay">>}],
                            children = []}],
          meta = #{}}
> xmpp:remove_subtag(Presence, #delay{}).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],meta = #{}}
```

## has_subtag/2
```erlang
-spec has_subtag(Stanza :: stanza(), Tag :: xmpp_element()) -> boolean().
```
Returns `true` if there exists a sub-element of `Stanza` matching `Tag`
(i.e. an `xmpp_element()` or `xmlel()` element with the same tag name
and namespace as `Tag`). Otherwise returns `false`. Note that `true` is
returned even if matched element is malformed, because decoding is not
applied during matching.

**Example 1**: found matching element
```erlang
> Presence.
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#xmlel{name = <<"delay">>,
                            attrs = [{<<"stamp">>,<<"2017-03-15T20:31:17.911811Z">>},
                                     {<<"xmlns">>,<<"urn:xmpp:delay">>}],
                            children = []}],
          meta = #{}}
> xmpp:has_subtag(Presence, #delay{}).
true
```
**Example 2**: no matching elements found
```erlang
> xmpp:has_subtag(#presence{}, #delay{}).
false
```
In the example below `<delay/>` element is considered as being matched
even though it's malformed (`<delay/>` element MUST possess `stamp` attribute).

**Example 3**: found matching malformed element
```erlang
> Presence.
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#xmlel{name = <<"delay">>,
                            attrs = [{<<"xmlns">>,<<"urn:xmpp:delay">>}],
                            children = []}],
          meta = #{}}
> xmpp:has_subtag(Presence, #delay{}).
true.
```

## append_subtags/2
```erlang
-spec append_subtags(Stanza :: iq(), Els :: [xmpp_element() | xmlel()]) -> iq();
		    (Stanza :: message(), Els :: [xmpp_element() | xmlel()]) -> message();
		    (Stanza :: presence(), Els :: [xmpp_element() | xmlel()]) -> presence().
```
Appends a list of elements `Els` to the end of a list of sub-elements of `Stanza`.

**Example 1**: appending elements
```erlang
> Els.
[#xmlel{name = <<"delay">>,
        attrs = [{<<"stamp">>,<<"2017-03-15T20:39:26.339167Z">>},
                 {<<"xmlns">>,<<"urn:xmpp:delay">>}],
        children = []},
 #stanza_error{type = modify,code = 400,by = <<>>,
               reason = 'bad-request',text = undefined,sub_els = []}]
> xmpp:append_subtags(#presence{sub_els = [#caps{}]}, Els).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,
          sub_els = [#caps{node = <<>>,version = <<>>,hash = <<>>,
                           exts = []},
                     #xmlel{name = <<"delay">>,
                            attrs = [{<<"stamp">>,<<"2017-03-15T20:39:26.339167Z">>},
                                     {<<"xmlns">>,<<"urn:xmpp:delay">>}],
                            children = []},
                     #stanza_error{type = modify,code = 400,by = <<>>,
                                   reason = 'bad-request',text = undefined,sub_els = []}],
          meta = #{}}
```

## get_meta/1
```erlang
-spec get_meta(Stanza :: stanza()) -> Meta :: map().
```
 Returns metadata associated with `Stanza` (that is,
 the value of its `meta` field).

**Example 1**: obtaining metadata
```erlang
> xmpp:get_meta(#presence{meta = #{foo => bar}}).
#{foo => bar}
```

## get_meta/2
```erlang
-spec get_meta(Stanza :: stanza(), Key :: any()) -> Value :: any().
```
Returns value `Value` associated with `Key` if metadata of `Stanza` contains `Key`.
Fails with a `{badkey, Key}` exception otherwise.

**Example 1**: obtaining a value
```erlang
> xmpp:get_meta(#presence{meta = #{foo => bar}}, foo).
bar
```
**Example 2**: key not found
```erlang
> xmpp:get_meta(#presence{meta = #{foo => bar}}, bar).
** exception error: {badkey,bar}
     ...
```

## get_meta/3
```erlang
-spec get_meta(Stanza :: stanza(), Key :: any(), Default :: any()) -> Value :: any().
```
Returns value `Value` associated with `Key` if metadata of `Stanza` contains `Key`.
If no value is associated with `Key`, `Default` is returned.

**Example 1**: obtaining a value
```erlang
> xmpp:get_meta(#presence{meta = #{foo => bar}}, foo, undefined).
bar
```
**Example 2**: key not found
```erlang
> xmpp:get_meta(#presence{meta = #{foo => bar}}, bar, undefined).
undefined
```

## set_meta/2
```erlang
-spec set_meta(Stanza :: stanza(), Meta :: map()) -> stanza().
```
Sets metadata of `Stanza`.

**Example 1**: setting metadata
```erlang
> xmpp:set_meta(#presence{}, #{foo => bar}).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],
          meta = #{foo => bar}}
```
**Example 2**: removing entire metadata
```erlang
> xmpp:set_meta(#presence{meta = #{foo => bar}}, #{}).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],meta = #{}}
```

## put_meta/3
```erlang
-spec put_meta(Stanza :: stanza(), Key :: any(), Value :: any()) -> stanza().
```
Associates `Key` with value `Value` and inserts the association into
metadata of `Stanza`.

**Example 1**: sets new key in metadata
```erlang
> xmpp:put_meta(#presence{}, foo, bar).                    
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],
          meta = #{foo => bar}}
```
**Example 2**: replacing existing key in metadata
```erlang
> xmpp:put_meta(#presence{meta = #{foo => bar}}, foo, baz).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],
          meta = #{foo => baz}}
```

## update_meta/3
```erlang
-spec update_meta(Stanza :: stanza(), Key :: any(), Value :: any()) -> Stanza :: stanza().
```
If `Key` exists in metadata of `Stanza`, the old associated value is replaced by value `Value`.
Fails with `{badkey,Key}` exception if no value is associated with `Key`.

**Example 1**: updating existing key
```erlang
> xmpp:update_meta(#presence{meta = #{foo => bar}}, foo, baz).
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],
          meta = #{foo => baz}}
```
**Example 2**: updating non-existing key
```erlang
> xmpp:update_meta(#presence{}, foo, bar).                    
** exception error: {badkey,foo}
     ...
```

## del_meta/2
```erlang
-spec del_meta(Stanza :: stanza(), Key :: any()) -> stanza().
```
Removes the `Key`, if it exists, and its associated value from
metadata of `Stanza`.

**Example 1**: removing value by key
```erlang
> xmpp:del_meta(#presence{meta = #{foo => bar}}, foo).        
#presence{id = <<>>,type = available,lang = <<>>,
          from = undefined,to = undefined,show = undefined,
          status = [],priority = undefined,sub_els = [],meta = #{}}
```

## is_stanza/1
```erlang
-spec is_stanza(Term :: any()) -> boolean().
```
Returns `true` if `Term` is either of type `stanza()` or an `xmlel()`
element representing stanza. Returns `false` otherwise.

**Examples**:
```erlang
> xmpp:is_stanza(#iq{}).
true
> xmpp:is_stanza(#disco_info{}).
false.
> xmpp:is_stanza(123).
false.
> xmpp:is_stanza(#xmlel{name = <<"message">>}).
true
> xmpp:is_stanza(#xmlel{name = <<"foo">>}).
false.
```

## is_known_tag/1
```erlang
-spec is_known_tag(El :: xmlel()) -> boolean().
```
Shorthand for `is_known_tag(El, ?NS_CLIENT)`.

## is_known_tag/2
```erlang
-spec is_known_tag(El :: xmlel(), Namespace :: binary()) -> boolean().
```
Returns `true` if `El` has corresponding `xmpp_element()`.
Otherwise returns `false`.
If `El` doesn't possess an `xmlns` attribute it's assumed
that it is within namespace `Namespace`.

> **NOTE**: if `El` is considered known doesn't mean it's valid:
> decoding may still fail.

**Example 1**: the tag is known
```erlang
> xmpp:is_known_tag(#xmlel{name = <<"x">>, attrs = [{<<"xmlns">>,<<"http://jabber.org/protocol/muc">>}]}).
true
```
**Example 2**: the tag is unknown
```erlang
> xmpp:is_known_tag(#xmlel{name = <<"foo">>, attrs = [{<<"xmlns">>,<<"bar">>}]}).                         
false
```
**Example 3**: the element lacks namespace, so it's always unknown
```erlang
> xmpp:is_known_tag(#xmlel{name = <<"x">>}).                                                              
false
```
**Example 4**: the element lacks namespace, but we assume it's within 'jabber:server' namespace
```erlang
> xmpp:is_known_tag(#xmlel{name = <<"message">>}, <<"jabber:server">>).
true
```

## get_ns/1
```erlang
-spec get_ns(El :: xmpp_element() | xmlel()) -> Namespace :: binary().
```
Returns namespace of `xmpp_element()` or `xmlel()` element.

**Example 1**: obtaining namespace of `xmpp_element()`
```erlang
> xmpp:get_ns(#disco_info{}).                 
<<"http://jabber.org/protocol/disco#info">>
```
**Example 2**: obtaining namespace of `xmlel()` element
```erlang
> xmpp:get_ns(#xmlel{attrs = [{<<"xmlns">>, <<"foo:bar">>}]}).
<<"foo:bar">>
```

## get_name/1
```erlang
-spec get_name(xmpp_element() | xmlel()) -> binary().
```
Returns tag name of `xmpp_element()` or `xmlel()` element.

**Example 1**: obtaining tag name of `xmpp_element()`
```erlang
> xmpp:get_name(#disco_info{}).
<<"query">>
> xmpp:get_name(#chatstate{type = composing}).
<<"composing">>
```
**Example 2**: obtaining tag name of `xmlel()` element
```erlang
> xmpp:get_name(#xmlel{name = <<"some">>}).
<<"some">>
```

## make_iq_result/1
```erlang
-spec make_iq_result(IQ :: iq()) -> iq().
```
Creates from `IQ` an `iq()` of type `result` with empty sub-elements.

> **WARNING**: only `iq()` of type `set` or `get` should be provided,
> otherwise the function will fail

**Example 1**: creating a result
```erlang
> xmpp:make_iq_result(#iq{type = get, id = <<"1">>, sub_els = [#ping{}]}).
#iq{id = <<"1">>,type = result,lang = <<>>,from = undefined,
    to = undefined,sub_els = [],meta = #{}}
```
**Example 2**: trying to create a result of a result
```erlang
> xmpp:make_iq_result(#iq{type = result, id = <<"1">>}).
** exception error: no function clause matching 
```

## make_iq_result/2
```erlang
-spec make_iq_result(IQ :: iq(), El :: xmpp_element() | xmlel()) -> iq().
```
Creates from `IQ` an `iq()` of type `result` with sub-elements set to `[El]`.

> **WARNING**: only `iq()` of type `set` or `get` should be provided,
> otherwise the function will fail

**Example 1**: creating a result
```erlang
> xmpp:make_iq_result(#iq{type = get, id = <<"1">>}, #disco_info{features = [<<"feature">>]}).
#iq{id = <<"1">>,type = result,lang = <<>>,from = undefined,
    to = undefined,
    sub_els = [#disco_info{node = <<>>,identities = [],
                           features = [<<"feature">>],
                           xdata = []}],
    meta = #{}}
```
**Example 2**: trying to create a result of a result
```erlang
> xmpp:make_iq_result(#iq{type = result, id = <<"1">>}, #disco_items{}).
** exception error: no function clause matching 
```

## make_error/2
```erlang
-spec make_error(Stanza :: stanza(), stanza_error() | xmlel()) -> stanza();
                (El :: xmlel(), stanza_error() | xmlel()) -> xmlel().
```
Constructs `stanza()` of type `error` from `Stanza`.

> **WARNING**: `Stanza` should not have type `error` or `result`,
> otherwise the function will fail

**Example 1**: creating message-error
```erlang
> xmpp:make_error(#message{type = chat}, xmpp:err_bad_request()).
#message{id = <<>>,type = error,lang = <<>>,
         from = undefined,to = undefined,subject = [],body = [],
         thread = undefined,
         sub_els = [#stanza_error{type = modify,code = 400,by = <<>>,
                                  reason = 'bad-request',text = undefined,sub_els = []}],
         meta = #{}}
```
**Example 2**: trying to create an error from an error
```erlang
> xmpp:make_error(#presence{type = error}, xmpp:err_bad_request()).
** exception error: no function clause matching 
```

## get_error/1
```erlang
-spec get_error(Stanza :: stanza()) -> undefined | stanza_error().
```
Returns `stanza_error()` sub-element from `Stanza` or `undefined`
if not found of if decoding has failed.

**Example 1**: extracting `stanza_error()` element
```erlang
> Err.
#xmlel{name = <<"error">>,
       attrs = [{<<"code">>,<<"400">>},{<<"type">>,<<"modify">>}],
       children = [#xmlel{name = <<"bad-request">>,
                          attrs = [{<<"xmlns">>,
                                    <<"urn:ietf:params:xml:ns:xmpp-stanzas">>}],
                          children = []}]}
> xmpp:get_error(#message{sub_els = [Err]}).
#stanza_error{type = modify,code = 400,by = <<>>,
              reason = 'bad-request',text = undefined,sub_els = []}
```
**Example 2**: no `stanza_error()` element found
```erlang
> xmpp:get_error(#message{}).                                  
undefined
```

## format_error/1
```erlang
-spec format_error(_) -> binary().
```
Creates diagnostic text from an error generated by [decode/1](#decode1)
or [decode/3](#decode3).

**Examples**:
```erlang
> try xmpp:decode(#xmlel{name = <<"foo">>})
  catch _:{xmpp_codec, Reason} -> xmpp:format_error(Reason)
  end. 
<<"Unknown tag <foo/> qualified by namespace 'jabber:client'">>
> try xmpp:decode(#xmlel{name = <<"iq">>})
  catch _:{xmpp_codec, Reason} -> xmpp:format_error(Reason)
  end.
<<"Missing attribute 'id' in tag <iq/> qualified by namespace 'jabber:client'">>
> try xmpp:decode(#xmlel{name = <<"x">>}, <<>>, [])
  catch _:{xmpp_codec, Reason} -> xmpp:format_error(Reason)
  end.
<<"Missing namespace for tag <x/>">>
```

## io_format_error/1
```erlang
-spec io_format_error(_) -> {binary(), [binary()]}.
```
Same as [format_error/1](#format_error1), but result is
suitable for using in formatting functions from
[io](http://erlang.org/doc/man/io.html) or
[io_lib](http://erlang.org/doc/man/io_lib.html) modules.

**Example**:
```erlang
> {Format, Args} = try xmpp:decode(#xmlel{name = <<"iq">>})
                   catch _:{xmpp_codec, Reason} -> xmpp:io_format_error(Reason)
		   end.
{<<"Missing attribute '~s' in tag <~s/> qualified by namespace '~s'">>,
 [<<"id">>,<<"iq">>,<<"jabber:client">>]}
> io:format(Format, Args).
Missing attribute 'id' in tag <iq/> qualified by namespace 'jabber:client'
```

## pp/1
```erlang
-spec pp(any()) -> iodata().
```
Pretty printer for XMPP elements.

**Example**:
```erlang
> S = xmpp:pp(#sm_a{h = 10, xmlns = <<"urn:xmpp:sm:3">>}).  
["#sm_a",123,
 [["h"," = ",49,48],
  44,
  ["xmlns"," = ",60,60,"\"urn:xmpp:sm:3\"",62,62]],
 125]
> io:format(S).
#sm_a{h = 10,xmlns = <<"urn:xmpp:sm:3">>}
```

## set_tr_callback/1
```erlang
-spec set_tr_callback({Module :: module(), Function :: atom()} | undefined) -> ok.
```
Installs `Module:Function/2` as a callback translation function or
uninstalls the callback if `undefined` is provided.
The callback function should be defined as:
```erlang
-spec Module:Function(Lang :: binary(), TextIn :: binary()) -> TextOut :: binary().
```
where `Lang` is a language tag, `TextIn` is a text to be translated and
`TextOut` is a resulting translated text.
By default, no translation callback is set and thus translation is not performed.

**Example 1**: installing the callback
```erlang
> xmpp:mk_text(<<"hello">>, <<"ru">>).
[#text{lang = <<"ru">>,data = <<"hello">>}]
> my_trans_mod:trans(<<"ru">>, <<"hello">>).
<<"привет">>.
> xmpp:set_tr_callback({my_trans_mod, trans}).
ok
> xmpp:mk_text(<<"hello">>, <<"ru">>).
[#text{lang = <<"ru">>,data = <<"привет">>}]
```
**Example 2**: uninstalling any callback
```erlang
> xmpp:mk_text(<<"hello">>, <<"ru">>).
[#text{lang = <<"ru">>,data = <<"привет">>}]
> xmpp:set_tr_callback(undefined).
ok
> xmpp:mk_text(<<"hello">>, <<"ru">>).
[#text{lang = <<"ru">>,data = <<"hello">>}]
```

## get_text/1
```erlang
-spec get_text(Text :: [text()]) -> binary().
```
Shorthand for `get_text(Text, <<"en">>)`.

## get_text/2
```erlang
-spec get_text(Text :: [text()], Lang :: binary()) -> binary().
```
Extracts data from a list of `text()` elements, tagged by language `Lang`.

**Example**:
```erlang
> Text.
[#text{lang = <<"en">>,data = <<"hello">>},
 #text{lang = <<"ru">>,data = <<"привет">>}]
> xmpp:get_text(Text, <<"ru">>).
<<"привет">>
> xmpp:get_text(Text, <<"en">>).
<<"hello">>
> xmpp:get_text(Text, <<"fr">>).
<<"hello">>
```

## mk_text/1
```erlang
-spec mk_text(Text :: binary() | {io:format(), list()}) -> [text()].
```
Shorthand for `mk_text(Text, <<"en">>)`.

## mk_text/2
```erlang
-spec mk_text(binary() | {io:format(), list()}, Lang :: binary()) -> [text()].
```
Creates a list of a single `text()` element from `binary()` or formatted text,
translated into language `Lang` using a callback function set in
[set_tr_callback/1](#set_tr_callback1).

**Example**:
```erlang
> xmpp:mk_text(<<"hello">>, <<"en">>).
[#text{lang = <<"en">>, data = <<"hello">>}]
> xmpp:mk_text({"hello, ~s!", ["Bob"]}, <<"en">>).
[#text{lang = <<"en">>, data = <<"hello, Bob!">>}]
```

## err_bad_request/0
```erlang
-spec err_bad_request() -> stanza_error()
```
Creates 'bad-request' stanza error.

## err_bad_request/2
```erlang
-spec err_bad_request(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'bad-request' stanza error.

## err_conflict/0
```erlang
-spec err_conflict() -> stanza_error()
```
Creates 'conflict' stanza error.

## err_conflict/2
```erlang
-spec err_conflict(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'conflict' stanza error.

## err_feature_not_implemented/0
```erlang
-spec err_feature_not_implemented() -> stanza_error()
```
Creates 'feature-not-implemented' stanza error.

## err_feature_not_implemented/2
```erlang
-spec err_feature_not_implemented(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'feature-not-implemented' stanza error.

## err_forbidden/0
```erlang
-spec err_forbidden() -> stanza_error()
```
Creates 'forbidden' stanza error.

## err_forbidden/2
```erlang
-spec err_forbidden(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'forbidden' stanza error.

## err_gone/0
```erlang
-spec err_gone() -> stanza_error()
```
Creates 'gone' stanza error.

## err_gone/2
```erlang
-spec err_gone(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'gone' stanza error.

## err_internal_server_error/0
```erlang
-spec err_internal_server_error() -> stanza_error()
```
Creates 'internal-server-error' stanza error.

## err_internal_server_error/2
```erlang
-spec err_internal_server_error(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'internal-server-error' stanza error.

## err_item_not_found/0
```erlang
-spec err_item_not_found() -> stanza_error()
```
Creates 'item-not-found' stanza error.

## err_item_not_found/2
```erlang
-spec err_item_not_found(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'item-not-found' stanza error.

## err_jid_malformed/0
```erlang
-spec err_jid_malformed() -> stanza_error()
```
Creates 'jid-malformed' stanza error.

## err_jid_malformed/2
```erlang
-spec err_jid_malformed(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'jid-malformed' stanza error.

## err_not_acceptable/0
```erlang
-spec err_not_acceptable() -> stanza_error()
```
Creates 'not-acceptable' stanza error.

## err_not_acceptable/2
```erlang
-spec err_not_acceptable(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'not-acceptable' stanza error.

## err_not_allowed/0
```erlang
-spec err_not_allowed() -> stanza_error()
```
Creates 'not-allowed' stanza error.

## err_not_allowed/2
```erlang
-spec err_not_allowed(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'not-allowed' stanza error.

## err_not_authorized/0
```erlang
-spec err_not_authorized() -> stanza_error()
```
Creates 'not-authorized' stanza error.

## err_not_authorized/2
```erlang
-spec err_not_authorized(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'not-authorized' stanza error.

## err_payment_required/0
```erlang
-spec err_payment_required() -> stanza_error()
```
Creates 'payment-required' stanza error.

## err_payment_required/2
```erlang
-spec err_payment_required(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'payment-required' stanza error.

## err_policy_violation/0
```erlang
-spec err_policy_violation() -> stanza_error()
```
Creates 'policy-violation' stanza error.

## err_policy_violation/2
```erlang
-spec err_policy_violation(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'policy-violation' stanza error.

## err_recipient_unavailable/0
```erlang
-spec err_recipient_unavailable() -> stanza_error()
```
Creates 'recipient-unavailable' stanza error.

## err_recipient_unavailable/2
```erlang
-spec err_recipient_unavailable(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'recipient-unavailable' stanza error.

## err_redirect/0
```erlang
-spec err_redirect() -> stanza_error()
```
Creates 'redirect' stanza error.

## err_redirect/2
```erlang
-spec err_redirect(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'redirect' stanza error.

## err_registration_required/0
```erlang
-spec err_registration_required() -> stanza_error()
```
Creates 'registration-required' stanza error.

## err_registration_required/2
```erlang
-spec err_registration_required(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'registration-required' stanza error.

## err_remote_server_not_found/0
```erlang
-spec err_remote_server_not_found() -> stanza_error()
```
Creates 'remote-server-not-found' stanza error.

## err_remote_server_not_found/2
```erlang
-spec err_remote_server_not_found(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'remote-server-not-found' stanza error.

## err_remote_server_timeout/0
```erlang
-spec err_remote_server_timeout() -> stanza_error()
```
Creates 'remote-server-timeout' stanza error.

## err_remote_server_timeout/2
```erlang
-spec err_remote_server_timeout(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'remote-server-timeout' stanza error.

## err_resource_constraint/0
```erlang
-spec err_resource_constraint() -> stanza_error()
```
Creates 'resource-constraint' stanza error.

## err_resource_constraint/2
```erlang
-spec err_resource_constraint(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'resource-constraint' stanza error.

## err_service_unavailable/0
```erlang
-spec err_service_unavailable() -> stanza_error()
```
Creates 'service-unavailable' stanza error.

## err_service_unavailable/2
```erlang
-spec err_service_unavailable(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'service-unavailable' stanza error.

## err_subscription_required/0
```erlang
-spec err_subscription_required() -> stanza_error()
```
Creates 'subscription-required' stanza error.

## err_subscription_required/2
```erlang
-spec err_subscription_required(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'subscription-required' stanza error.

## err_undefined_condition/1
```erlang
-spec err_undefined_condition(
         Type :: 'auth' | 'cancel' | 'continue' | 'modify' | 'wait') -> stanza_error()
```
Creates 'undefined-condition' stanza error.

## err_undefined_condition/3
```erlang
-spec err_undefined_condition(
         Type :: 'auth' | 'cancel' | 'continue' | 'modify' | 'wait',
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'undefined-condition' stanza error.

## err_unexpected_request/0
```erlang
-spec err_unexpected_request() -> stanza_error()
```
Creates 'unexpected-request' stanza error.

## err_unexpected_request/2
```erlang
-spec err_unexpected_request(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stanza_error()
```
Creates 'unexpected-request' stanza error.

## serr_bad_format/0
```erlang
-spec serr_bad_format() -> stream_error()
```
Creates 'bad-format' stream error.

## serr_bad_format/2
```erlang
-spec serr_bad_format(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'bad-format' stream error.

## serr_bad_namespace_prefix/0
```erlang
-spec serr_bad_namespace_prefix() -> stream_error()
```
Creates 'bad-namespace-prefix' stream error.

## serr_bad_namespace_prefix/2
```erlang
-spec serr_bad_namespace_prefix(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'bad-namespace-prefix' stream error.

## serr_conflict/0
```erlang
-spec serr_conflict() -> stream_error()
```
Creates 'conflict' stream error.

## serr_conflict/2
```erlang
-spec serr_conflict(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'conflict' stream error.

## serr_connection_timeout/0
```erlang
-spec serr_connection_timeout() -> stream_error()
```
Creates 'connection-timeout' stream error.

## serr_connection_timeout/2
```erlang
-spec serr_connection_timeout(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'connection-timeout' stream error.

## serr_host_gone/0
```erlang
-spec serr_host_gone() -> stream_error()
```
Creates 'host-gone' stream error.

## serr_host_gone/2
```erlang
-spec serr_host_gone(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'host-gone' stream error.

## serr_host_unknown/0
```erlang
-spec serr_host_unknown() -> stream_error()
```
Creates 'host-unknown' stream error.

## serr_host_unknown/2
```erlang
-spec serr_host_unknown(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'host-unknown' stream error.

## serr_improper_addressing/0
```erlang
-spec serr_improper_addressing() -> stream_error()
```
Creates 'improper-addressing' stream error.

## serr_improper_addressing/2
```erlang
-spec serr_improper_addressing(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'improper-addressing' stream error.

## serr_internal_server_error/0
```erlang
-spec serr_internal_server_error() -> stream_error()
```
Creates 'internal-server-error' stream error.

## serr_internal_server_error/2
```erlang
-spec serr_internal_server_error(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'internal-server-error' stream error.

## serr_invalid_from/0
```erlang
-spec serr_invalid_from() -> stream_error()
```
Creates 'invalid-from' stream error.

## serr_invalid_from/2
```erlang
-spec serr_invalid_from(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'invalid-from' stream error.

## serr_invalid_id/0
```erlang
-spec serr_invalid_id() -> stream_error()
```
Creates 'invalid-id' stream error.

## serr_invalid_id/2
```erlang
-spec serr_invalid_id(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'invalid-id' stream error.

## serr_invalid_namespace/0
```erlang
-spec serr_invalid_namespace() -> stream_error()
```
Creates 'invalid-namespace' stream error.

## serr_invalid_namespace/2
```erlang
-spec serr_invalid_namespace(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'invalid-namespace' stream error.

## serr_invalid_xml/0
```erlang
-spec serr_invalid_xml() -> stream_error()
```
Creates 'invalid-xml' stream error.

## serr_invalid_xml/2
```erlang
-spec serr_invalid_xml(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'invalid-xml' stream error.

## serr_not_authorized/0
```erlang
-spec serr_not_authorized() -> stream_error()
```
Creates 'not-authorized' stream error.

## serr_not_authorized/2
```erlang
-spec serr_not_authorized(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'not-authorized' stream error.

## serr_not_well_formed/0
```erlang
-spec serr_not_well_formed() -> stream_error()
```
Creates 'not-well-formed' stream error.

## serr_not_well_formed/2
```erlang
-spec serr_not_well_formed(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'not-well-formed' stream error.

## serr_policy_violation/0
```erlang
-spec serr_policy_violation() -> stream_error()
```
Creates 'policy-violation' stream error.

## serr_policy_violation/2
```erlang
-spec serr_policy_violation(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'policy-violation' stream error.

## serr_remote_connection_failed/0
```erlang
-spec serr_remote_connection_failed() -> stream_error()
```
Creates 'remote-connection-failed' stream error.

## serr_remote_connection_failed/2
```erlang
-spec serr_remote_connection_failed(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'remote-connection-failed' stream error.

## serr_reset/0
```erlang
-spec serr_reset() -> stream_error()
```
Creates 'reset' stream error.

## serr_reset/2
```erlang
-spec serr_reset(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'reset' stream error.

## serr_resource_constraint/0
```erlang
-spec serr_resource_constraint() -> stream_error()
```
Creates 'resource-constraint' stream error.

## serr_resource_constraint/2
```erlang
-spec serr_resource_constraint(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'resource-constraint' stream error.

## serr_restricted_xml/0
```erlang
-spec serr_restricted_xml() -> stream_error()
```
Creates 'restricted-xml' stream error.

## serr_restricted_xml/2
```erlang
-spec serr_restricted_xml(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'restricted-xml' stream error.

## serr_see_other_host/0
```erlang
-spec serr_see_other_host() -> stream_error()
```
Creates 'see-other-host' stream error.

## serr_see_other_host/2
```erlang
-spec serr_see_other_host(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'see-other-host' stream error.

## serr_system_shutdown/0
```erlang
-spec serr_system_shutdown() -> stream_error()
```
Creates 'system-shutdown' stream error.

## serr_system_shutdown/2
```erlang
-spec serr_system_shutdown(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'system-shutdown' stream error.

## serr_undefined_condition/0
```erlang
-spec serr_undefined_condition() -> stream_error()
```
Creates 'undefined-condition' stream error.

## serr_undefined_condition/2
```erlang
-spec serr_undefined_condition(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'undefined-condition' stream error.

## serr_unsupported_encoding/0
```erlang
-spec serr_unsupported_encoding() -> stream_error()
```
Creates 'unsupported-encoding' stream error.

## serr_unsupported_encoding/2
```erlang
-spec serr_unsupported_encoding(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'unsupported-encoding' stream error.

## serr_unsupported_feature/0
```erlang
-spec serr_unsupported_feature() -> stream_error()
```
Creates 'unsupported-feature' stream error.

## serr_unsupported_feature/2
```erlang
-spec serr_unsupported_feature(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'unsupported-feature' stream error.

## serr_unsupported_stanza_type/0
```erlang
-spec serr_unsupported_stanza_type() -> stream_error()
```
Creates 'unsupported-stanza-type' stream error.

## serr_unsupported_stanza_type/2
```erlang
-spec serr_unsupported_stanza_type(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'unsupported-stanza-type' stream error.

## serr_unsupported_version/0
```erlang
-spec serr_unsupported_version() -> stream_error()
```
Creates 'unsupported-version' stream error.

## serr_unsupported_version/2
```erlang
-spec serr_unsupported_version(
         Desc :: binary() | {io:format(), list()},
         Lang :: binary()) -> stream_error()
```
Creates 'unsupported-version' stream error.

## xmpp_util

The following functions are exported from `xmpp_util` module:

- [decode_timestamp/1](#decode_timestamp1)
- [encode_timestamp/1](#encode_timestamp1)
- [get_xdata_values/2](#get_xdata_values2)
- [set_xdata_field/2](#set_xdata_field2)
- [has_xdata_var/2](#has_xdata_var2)

## decode_timestamp/1
```erlang
-spec decode_timestamp(Data :: binary()) -> erlang:timestamp().
```
Decodes timestamp from [XEP-0082](https://xmpp.org/extensions/xep-0082.html)
format (both `DateTime` and legacy) into `erlang:timestamp()` format.
Fails with `{bad_timestamp, Data}` exception if `Data` doesn't represent
a valid timestamp.

**Example 1**: decoding from `DateTime` format
```erlang
> xmpp_util:decode_timestamp(<<"2006-12-19T17:58:35Z">>).
{1166,551115,0}
```
**Example 2**: decoding from legacy format
```erlang
> xmpp_util:decode_timestamp(<<"20020910T17:58:35">>).
{1031,680715,0}
```
**Example 3**: decoding failure - not even remotely a timestamp
```erlang
> xmpp_util:decode_timestamp(<<"sd324klsjdpsdf">>).      
** exception error: {bad_timestamp,<<"sd324klsjdpsdf">>}
     ...
```
**Example 4**: decoding failure - month is invalid
```erlang
> xmpp_util:decode_timestamp(<<"2006-13-19T17:58:35Z">>).
** exception error: {bad_timestamp,<<"2006-13-19T17:58:35Z">>}
     ...
```

## encode_timestamp/1
```erlang
-spec encode_timestamp(Timestamp :: erlang:timestamp()) -> binary().
```
Encodes `Timestamp` into `DateTime` format of
[XEP-0082](https://xmpp.org/extensions/xep-0082.html).

**Example**:
```erlang
> xmpp_util:encode_timestamp({1166,551115,34}).
<<"2006-12-19T17:58:35.000034Z">>
```

## get_xdata_values/2
```erlang
-spec get_xdata_values(Var :: binary(), Form :: xdata()) -> Values :: [binary()].
```
Returns `Values` associated with `Var` field of a data form `Form`.

**Example**: obtaining values
```erlang
> Form.
#xdata{type = submit,instructions = [],title = undefined,
       reported = undefined,items = [],
       fields = [#xdata_field{label = <<>>,type = 'text-single',
                              var = <<"search_request">>,required = false,desc = <<>>,
                              values = [<<"verona">>],
                              options = [],sub_els = []}]}
> xmpp_util:get_xdata_values(<<"search_request">>, Form).
[<<"verona">>]
> xmpp_util:get_xdata_values(<<"non_existent">>, Form).
[]
```

## set_xdata_field/2
```erlang
-spec set_xdata_field(Field :: xdata_field(), Form :: xdata()) -> xdata().
```
Sets `Field` in a data form `Form`. If there is already field matching
`Field` exists (i.e. has the same value of `#xdata_field.var`), then
it's replaced. Otherwise `Field` is appended to the end of
`Form#xdata.fields` list.

**Example 1**: setting new field
```erlang
> xmpp_util:set_xdata_field(#xdata_field{var = <<"var">>, values = [<<"val">>]}, #xdata{}).
#xdata{type = undefined,instructions = [],title = undefined,
       reported = undefined,items = [],
       fields = [#xdata_field{label = <<>>,type = undefined,
                              var = <<"var">>,required = false,desc = <<>>,
                              values = [<<"val">>],
                              options = [],sub_els = []}]}
```
**Example 2**: replacing existing field
```erlang
> xmpp_util:set_xdata_field(#xdata_field{var = <<"var">>,
                                         values = [<<"new">>]},
                            #xdata{fields = [#xdata_field{var = <<"var">>,
			                                  values = [<<"old">>]}]}).
#xdata{type = undefined,instructions = [],title = undefined,
       reported = undefined,items = [],
       fields = [#xdata_field{label = <<>>,type = undefined,
                              var = <<"var">>,required = false,desc = <<>>,
                              values = [<<"new">>],
                              options = [],sub_els = []}]}
```

## has_xdata_var/2
```erlang
-spec has_xdata_var(Var :: binary(), Form :: xdata()) -> boolean().
```
Returns `true` if there is `xdata_field()` exists in the `Form` with
value of `#xdata_field.var` field matching `Var`. Returns `false` otherwise.

**Example 1**: the field exists
```erlang
> xmpp_util:has_xdata_var(<<"var">>,
                          #xdata{fields = [#xdata_field{var = <<"var">>,
			                                values = [<<"old">>]}]}).
true
```
**Example 2**: the field doesn't exist
```erlang
> xmpp_util:has_xdata_var(<<"var">>, #xdata{}).
false
```

# jid

The following functions are exported from `jid` module:

- [decode/1](#decode1-1)
- [encode/1](#encode1-1)
- [make/1](#make1)
- [make/2](#make2)
- [make/3](#make3)
- [nodeprep/1](#nodeprep1)
- [nameprep/1](#nameprep1)
- [resourceprep/1](#resourceprep1)
- [tolower/1](#tolower1)
- [split/1](#split1)
- [remove_resource/1](#remove_resource1)
- [replace_resource/2](#replace_resource2)

## decode/1
```erlang
-spec decode(Data :: binary()) -> jid().
```
Decodes `Data` into JID. Fails with `{bad_jid, Data}` on failure.

**Example 1**: successful decoding
```erlang
> jid:decode(<<"User@Server/Resource">>).
#jid{user = <<"User">>,server = <<"Server">>,
     resource = <<"Resource">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"Resource">>}
```
**Example 2**: decoding failure
```erlang
> jid:decode(<<"@server">>).
** exception error: {bad_jid,<<"@server">>}
     ...
```

## encode/1
```erlang
-spec encode(jid() | ljid()) -> binary().
```
Encodes JID.

**Example 1**: encoding `jid()`
```erlang
> JID.
#jid{user = <<"User">>,server = <<"Server">>,
     resource = <<"Resource">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"Resource">>}
> jid:encode(J).
<<"User@Server/Resource">>
```
**Example 2**: encoding `ljid()`
```erlang
> jid:encode({<<"user">>, <<"server">>, <<"resource">>}).
<<"user@server/resource">>
```

## make/1
```erlang
-spec make(ljid() | binary()) -> jid() | error.
```
Creates `jid()` from `ljid()` or from namepart. Returns `error` if
stringprep has failed.

**Example 1**: creating `jid()` from `ljid()`
```erlang
> jid:make({<<"User">>, <<"Server">>, <<"Resource">>}).
#jid{user = <<"User">>,server = <<"Server">>,
     resource = <<"Resource">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"Resource">>}
```
**Example 2**: creating `jid()` from namepart
```erlang
> jid:make(<<"Server">>).
#jid{user = <<>>,server = <<"Server">>,resource = <<>>,
     luser = <<>>,lserver = <<"server">>,lresource = <<>>}
```
**Example 3**: stringprep failure
```erlang
> jid:make({<<"@">>, <<"server">>, <<"resource">>}).
error
```

## make/2
```erlang
-spec make(User :: binary(), Server :: binary()) -> jid() | error.
```
Shorthand for `make({User, Server, <<>>})`.

## make/3
```erlang
-spec make(User :: binary(), Server :: binary(), Resource :: binary()) -> jid() | error.
```
Same as `make({User, Server, Resource})`.

## nodeprep/1
```erlang
-spec nodeprep(binary()) -> binary() | error.
```
Applies Nodeprep Profile of Stringprep. Returns `error` on failure.

**Example**:
```erlang
> jid:nodeprep(<<"User">>).
<<"user">>
> jid:nodeprep(<<"@">>).
error
```

## nameprep/1
```erlang
-spec nameprep(binary()) -> binary() | error.
```
Applies Nameprep Profile of Stringprep. Returns `error` on failure.

**Example**:
```erlang
> jid:nameprep(<<"SerVer">>).
<<"server">>
```

## resourceprep/1
```erlang
-spec resourceprep(binary()) -> binary() | error.
```
Applies Resourceprep Profile of Stringprep. Returns `error` on failure.

**Example**:
```erlang
> jid:resourceprep(<<"Resource">>).
<<"Resource">>
```

## tolower/1
```erlang
-spec tolower(jid() | ljid()) -> ljid() | error.
```
Creates `ljid()` with Stringprep Profile applied to its parts.
Returns `error` if stringprep has failed.

**Example 1**: creating from `jid()`
```erlang
> JID.
#jid{user = <<"User">>,server = <<"Server">>,
     resource = <<"Resource">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"Resource">>}
> jid:tolower(JID).
{<<"user">>,<<"server">>,<<"Resource">>}
```
**Example 2**: creating from `ljid()`
```erlang
> jid:tolower({<<"User">>, <<"Server">>, <<"Resource">>}).
{<<"user">>,<<"server">>,<<"Resource">>}
```
**Example 3**: stringprep failure
```erlang
> jid:tolower({<<"@">>, <<"Server">>, <<"Resource">>}).   
error
```

## split/1
```erlang
-spec split(jid()) -> ljid().
```
Creates `ljid()` from `jid()`.
Unlike [tolower/1](#tolower1) Strinprep Profile is not applied.

**Example**:
```erlang
> JID.
#jid{user = <<"User">>,server = <<"Server">>,
     resource = <<"Resource">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"Resource">>}
> jid:split(JID).
{<<"User">>,<<"Server">>,<<"Resource">>}
```

## remove_resource/1
```erlang
-spec remove_resource(jid()) -> jid();
		     (ljid()) -> ljid().
```
Removes resource part of a JID.

**Example 1**: removing resource of `jid()`
```erlang
> JID.
#jid{user = <<"User">>,server = <<"Server">>,
     resource = <<"Resource">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"Resource">>}
> jid:remove_resource(JID).
#jid{user = <<"User">>,server = <<"Server">>,
     resource = <<>>,luser = <<"user">>,lserver = <<"server">>,
     lresource = <<>>}
```
**Example 2**: removing resource of `ljid()`
```erlang
> jid:remove_resource({<<"User">>, <<"Server">>, <<"Resource">>}).
{<<"User">>,<<"Server">>,<<>>}
```

## replace_resource/2
```erlang
-spec replace_resource(jid(), binary()) -> error | jid().
```
Replaces resource part of a JID.
Returns `error` if resourceprep has failed.

**Example**: replacing resource
```erlang
> JID.
#jid{user = <<"User">>,server = <<"Server">>,
     resource = <<"old">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"old">>}
> jid:replace_resource(JID, <<"new">>).
#jid{user = <<"User">>,server = <<"Server">>,
     resource = <<"new">>,luser = <<"user">>,
     lserver = <<"server">>,lresource = <<"new">>}
```
