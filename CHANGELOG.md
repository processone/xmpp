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
