# Version 1.2.5

* Update packaging for hex

# Version 1.2.4

* Updating fast_xml to version 1.1.34.
* Updating stringprep to version 1.0.14.
* Updating p1_utils to version 1.0.13.
* Updating fast_tls to version 1.0.25.

# Version 1.2.3

* Updating fast_tls to version f36ea5b74526c2c1c9c38f8d473168d95804f59d.
* Updating fast_xml to version 1.1.33.
* Updating p1_utils to version 1.0.13.
* Updating stringprep to version 1.0.13.
* Added handling for xeps: 319, 047, 261, 260, 234, 300, 166
* Refactor of xmpp\_socket

# Version 1.2.2

* Updating fast_xml to version 1.1.32.
* Fix crash when trying to encode xmlcdata
* Add missing files to hex package

# Version 1.2.1

* Updating p1_utils to version 1.0.12.
* Updating fast_xml to version 1.1.31.
* Updating stringprep to version 1.0.12.

# Version 1.2.0

* Support XEP-0377: Spam Reporting
* New xmpp_lang module to validate language tags
* Improve muc#roominfo and muc#roomconfig data forms
* XEP-0363: support <retry/> and <file-too-large/> tags
* XEP-0363: data form support
* Add more functions to format errors
* Change arity of err_gone(), err_redirect() and serr_see_other_host()
  THIS CHANGE INTRODUCES API INCOMPATIBILITY: use xref to check the code
* Support multiple namespaces for the same data form

# Version 1.1.21

* Updating fast_xml to version 1.1.30.
* Support urn:xmpp:push:summary
* Add parent attribute in \<thread/\>
* Update supported XEP-0359 version to v0.3.0

# Version 1.1.20

* Updating fast_xml to version 1.1.29.
* Updating p1_utils to version 1.0.11.
* Updating stringprep to version 1.0.11.
* Fix compilation with rebar3
* Add new namespace from XEP-0398
* Update for changes in fast\_xml
* Make mk\_text() append original text

# Version 1.1.19

* Updating fast_xml to version 1.1.28.

# Version 1.1.18

* Updating fast_xml to version 1.1.27.
* Don't treat xmpp: URI as valid

# Version 1.1.17

* Register pubsub#multi-items feature and add pubsub#max_items field to meta-data
* Mention try_subtag/2 in the README
* Fix formatting in API.md
* New function: xmpp:try_subtag/2
* Make pretty printer understand jid records
* Support XEP-0184: Message Delivery Receipts
* Improve pretty printer and sub-elements processing
* Add PubSub error condition: 'precondition-not-met'
* pubsub_publish_options.xdata: Reject 'secret'
* Allow empty URIs in xmpp_uri:check/1
* Update muc#roominfo form and add validation for 'muc#room*_pubsub' fields
* Introduce xmpp_uri module

# Version 1.1.16

* Updating fast_xml to version 1.1.25.
* Add support for NS_MAM_2
* Improve handling of pubsub requests
* Add supporgt for RFC 7622
* Allow multiple text element inside stanza/stream_error

# Version 1.1.15

* Updating fast_xml to version 1.1.24.
* Updating p1_utils to version 1.0.10.
* Updating stringprep to version 1.0.10.
* Compatibility with R19.3+
* XEP-0084 (User Avatar) support

# Version 1.1.14

* Update hex packaging
* Fix namespace in PubSub publishing options

# Version 1.1.12

Holger Weiss:
* Support XEP-0357: Push Notifications

# Version 1.1.11

* Use fast_xml-1.1.23
* Use stringprep-1.0.9

# Version 1.1.10

Badlop:
* Add jid support in muc_unsubscribe and muc_subscribe

Evgeniy Khramtsov:
* Add ?stanza_type, ?stanza_from and ?stanza_to macros
* Remove unused p1_stream extension
* Clarify the library's main idea

Holger Weiss (4):
* Encode/decode muc_unsubscribe JIDs
* Add support for HTTP File Upload, version 0.3.0
* Makefile: Add dependencies for spec/xdata targets

Paweł Chmielowski (3):
* Add nif function jid:string_to_usr and use it
* Fix return value from xmpp:start
* Make multiple calls to jid:start() not generate nif reload error

# Version 1.1.9

Evgeniy Khramtsov:
* Deprecate jid:to_string/1 and jid:from_string/1
* Only check resource with stringprep
* Improve type specs
* Add documentation
* Add set_tr_callback/2 function
* Make it possible to uninstall translation callback
* Use translation callback in data form encoders
* Fix external codec registration for OTP 17
* Include compiler app when generating erlang.plt
* Add notes about API instability

# Version 1.1.8

Evgeniy Khramtsov:
* Add get_meta/2 and get_meta/3
* Get rid of some dialyzer warnings

# Version 1.1.7

Evgeniy Khramtsov:
* Generate modular code for xmpp_codec
* Improve type specs for set_from()/set_to()

# Version 1.1.6

Evgeniy Khramtsov:
* Add xmpp:serr_unsupported_feature()
* Don't replace existing delay tag with the same 'from'

# Version 1.1.5

Evgeniy Khramtsov:
* Fix translation order
* Add legacy auth stream feature support
* Better support subtags with empty namespaces
* Add dialback feature support
* Fix error generation for raw xml elements
* Treat unknown message type as "normal"
* Allow including #text{} elements into #sm_failed{}
* Add xmpp:del_meta/2 function
* Fix typo in add_delay_info/4
* Make it possible to get text by lang
* Don't crash if previous delay tag misses 'from' attribute

# Version 1.1.4

* Support for password on MUC subcribe (Badlop)

# Version 1.1.3

* Prepare release on hex.pm (Mickaël Rémond)
* Add missing license (Mickaël Rémond)

# Version 1.1.2

* Use fixed dependencies (Christophe Romain)

# Version 1.1.1

* Work around Psi and 'jid-multi' field (Evgeniy Khramtsov)

# Version 1.1.0

* Initial stable version (Evgeniy Khramtsov)
