# Version 1.9.1

* Updating fast_xml to version 1.1.55.
* Make `allow_unencrypted_sasl2` option also allow connection
  for clients that tell us they wanted to use but didn't find
  channel bindings
* Implement XEP-0484 Fast Authentication Streamlining Tokens
* Improvements to XEP-0480 parsing
* Improve `make spec` and `make xdata` commands

# Version 1.9.0

* Updating fast_tls to version 1.1.22.
* Updating fast_xml to version 1.1.53.
* Add support for XEP-0480 SASL Upgrade Tasks
* Add support for XEP-0288 Bidirectional Server-to-Server Connections
* Improve failback handling for S2S connections using direct tls
* Add option for allowing SASL2 on unencrypted connections
* Update spec of XEP-0356 Privileged Entity to version 0.4.1
* Automatic "make spec xdata"

# Version 1.8.3

* Updating fast_tls to version 1.1.21.
* Improve handling of muc retracions
* Add support for muc#roominfo_avatarhash field

# Version 1.8.2

* Updating fast_tls to version 1.1.20.
* Updating fast_xml to version 1.1.52.
* Updating ezlib to version 1.0.13.
* Updating stringprep to version 1.0.30.
* Updating p1_utils to version 1.0.26.
* Add support for xep-0425 (0.3.0)
* Fix auth error when using sasl2 with empty id in user-agent
* Fix crash when using older ejabberd without handle_bind2_inline hook
* Don't use stable resources when client didn't provide user-agent

# Version 1.8.1

* Updating fast_tls to version 1.1.19.

# Version 1.8.0

* Updating fast_tls to version 1.1.17.
* Updating fast_xml to version 1.1.50.
* Add support for xep-0474 - SASL SCRAM Downgrade Protection
* Add support for xep-0388 - SASL2
* Add support for xep-0386 - Bind 2
* Add support for xep-0440 - SASL Channel-Binding Type Capability
* Update support for xep-0424 to versuib 0.4.0
* Allow disabling scram downgrade protection
* Extend xmpp_stream_out to allow use as component implementation
* Make handling of extra attributes in scram exchange better follow spec
* Add support for tls-unique and tls-server-end-point channel binding
* Fix compilation on arch where char is unsigned

# 1.7.0

* Add support for  xep-0421 - MUC Occupant Id
* Accept all node config options in pubsub publish options
* Update bundled rebar
* Fix compilation on Erlang 26
* Add automatic update of files on specs change
* Add support for  xep-0402 - PEP Native Bookmarks
* Fix types of pubsub publish options

# Version 1.6.2

* Add decoders for xep-0422 - Message Fastening
* Add decoders for xep-0424 - Message Retraction
* Add decoders for xep-0425 - Message Moderation

# Version 1.6.1

* Apply change introduced in XEP-0060 Version 1.23.0
* Use net:getaddrinfo for hostname resolution

# Version 1.6.0

* Updating fast_tls to version 1.1.16.
* Updating stringprep to version 1.0.29.
* Support additional namespaces in MIX elements
* Add support for MIX presences, update_subscriptions and unsubscribe
* Add allow_query_users to muc config

# Version 1.5.8

* Updating fast_tls to version 1.1.15.
* Updating ezlib to version 1.0.12.

# Version 1.5.7

* Updating ezlib to version 1.0.11.
* Updating fast_tls to version 1.1.14.
* Updating fast_xml to version 1.1.49.
* Updating stringprep to version 1.0.28.
* Updating p1_utils to version 1.0.25.
* Make socket release on detach, free resources earlier
* Fix crash when doing srv resolution

# Version 1.5.6

* Updating fast_xml to version 1.1.48.

# Version 1.5.5

* Updating fast_xml to version 1.1.47.
* Allow 'max' value in pubsub max_items, item_expire and children_max
* Add compatibility quirk for old smack version in roster
* Don't generate code attribute in errors (deprececed by rfc6120)
* Change internal representation of markable element
* Add MUC hats support
* Generate documentation before publishing to hex
*

# Version 1.5.4

* Updating ezlib to version 1.0.10.
* Updating fast_tls to version 1.1.13.
* Updating fast_xml to version 1.1.47.
* Updating stringprep to version 1.0.27.
* Updating p1_utils to version 1.0.23.
* Switch from using Travis to Github Actions as CI
* Add support for MIX roster extension
* Allow children inside address element
* Make compatible with OTP24
* Allow arbitrary children inside vCard

# Version 1.5.3

* Updating fast_tls to version 1.1.12.
* Updating fast_xml to version 1.1.46.
* Updating p1_utils to version 1.0.22.
* Updating stringprep to version 1.0.25.
* Fix spec to match the current source code, as reportd by Dialyzer
* xmpp uses p1_options, so Dialyzer reports some false warnings
* Fix return value when skipping queued tcp packet to already closed socket

# Version 1.5.2

* Updating fast_tls to version 1.1.11.
* Allow to free socket/parser/tls when session get detached
* Add support for XEP-0430: Inbox
* Add support for XEP-0333: Chat Markers
* Add missing applications to xmpp.app
* Fix timezone in timestamp used by XEP-0202
* Don't throw exception when client send invalid length sasl response

# Version 1.5.1

* Fix issues with scram *-PLUS

# Version 1.5.0

* Updating p1_utils to version 1.0.21.
* Updating stringprep to version 1.0.24.
* Updating fast_tls to version 1.1.10.
* Updating fast_xml to version 1.1.45.
* Add support for scram-sha-256/512-{plus}

# Version 1.4.10

* Updating ezlib to version 1.0.9.
* Updating fast_tls to version 1.1.9.
* Updating fast_xml to version 1.1.44.
* Updating stringprep to version 1.0.23.
* Add support for MAM Flipped Pages
* Exclude old OTP releases from Travis
* Support building specs with rebar3

# Version 1.4.9

* Updating p1_utils to version 1.0.20.
* Updating fast_xml to version 1.1.43.
* Updating fast_tls to version 1.1.8.
* Updating stringprep to version 1.0.22.

# Version 1.4.8

* Fixes to compile with Erlang/OTP 23.0
* updating ezlib to version 1.0.8.
* updating fast_tls to version 1.1.7.
* updating fast_xml to version 1.1.42.
* updating stringprep to version 1.0.21.
* Replace bad-protocol sasl errors with not-authorized
* Add Travis setup, and set Erlang/OTP 19.0 as lowest supported version

# Version 1.4.7

* Updating fast_tls to version 1.1.6.
* Updating p1_utils to version 1.0.19.
* Updating fast_xml to version 1.1.41.
* Updating stringprep to version 1.0.20.
* Fix compatibility issues with Erlang 23

# Version 1.4.6

* Updating fast_tls to version 1.1.5.
* Updating fast_xml to version 1.1.40.
* Recognize elements from XEP-0215 (External Service Discovery)
* Limit usage of synchronously terminating session, as is can cause
  problems with handling of queued messages

# Version 1.4.5

* Updating ezlib to version 1.0.7.
* Updating fast_tls to version 1.1.4.
* Updating fast_xml to version 1.1.39.
* Updating p1_utils to version 1.0.18.
* Updating stringprep to version 1.0.19.
* Update copyright year

# Version 1.4.4

* Fix handling of infinity values in couple places
* Declare namespace for "urn:xmpp:carbons:rules:0"

# Version 1.4.3

* Updating fast_tls to version 1.1.3.
* Updating stringprep to version 1.0.18.
* Updating fast_xml to version 1.1.38.
* Updating p1_utils to version 1.0.17.

# Version 1.4.2

* Fix incorrect return type

# Version 1.4.1

* Add support for jid-prep
* Improve handling of IDNA

# Version 1.4.0

* Updating fast_tls to version 1.1.2.
* Updating fast_xml to version 1.1.37.
* Updating stringprep to version 1.0.17.
* Updating p1_utils to version 1.0.16.
* Update type specs
* Improve xdata compiler
* Add support for CAPTCHA data forms (XEP-0158)
* Accept certificates without XmppAddr fields
* Improve xmpp\_socket:get\_peer\_certificate/2
* Update pubsub#metadata form

# Version 1.3.4

* Updating ezlib to version 1.0.6.
* Updating fast_tls to version 1.1.1.
* Updating fast_xml to version 1.1.36.
* Updating p1_utils to version 1.0.15.
* Updating stringprep to version 1.0.16.

# Version 1.3.3

* Allow muc_subscriber element to have jid or nick attribute
* Add support for XEP-0417
* Add get_subtags/2 and try_subtags/2

# Version 1.3.2

* Release from correct branch

# Version 1.3.1

* Updating ezlib to version 1.0.5.
* Updating fast_tls to version 1.1.0.
* Updating fast_xml to version 1.1.35.
* Updating p1_utils to version 1.0.14.
* Updating stringprep to version 1.0.15.
* Add contribution guide
* Encode by attribute in stanza\_error

# Version 1.3.0

* Introduce 'ignore_unknown' xdata codec option
* Add support for decoding language tags generated by Cisco Jabber
* Add support for latest MIX version and MIX-PAM (XEP-0405)

# Version 1.2.8

* Improve building with rebar3 and hex packaging

# Version 1.2.7

* Add code required for proxy protocol support

# Version 1.2.6

* Updating fast_tls to version 1.0.26.
* Add support for XEP-0048 and XEP-0411
* Add logging of data transmitted over xml sockets
* Add functions for processing white space pings
* Validate xml:lang values
* Fix encoding of timestamp with negative TZ offsets

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

* Support for password on MUC subscribe (Badlop)

# Version 1.1.3

* Prepare release on hex.pm (Mickaël Rémond)
* Add missing license (Mickaël Rémond)

# Version 1.1.2

* Use fixed dependencies (Christophe Romain)

# Version 1.1.1

* Work around Psi and 'jid-multi' field (Evgeniy Khramtsov)

# Version 1.1.0

* Initial stable version (Evgeniy Khramtsov)
