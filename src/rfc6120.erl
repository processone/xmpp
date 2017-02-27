%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(rfc6120).

-compile(export_all).

do_decode(<<"stream:stream">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_stream_start(<<"jabber:client">>, Opts, El);
do_decode(<<"stream:stream">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_stream_start(<<"jabber:server">>, Opts, El);
do_decode(<<"stream:stream">>,
	  <<"jabber:component:accept">>, El, Opts) ->
    decode_stream_start(<<"jabber:component:accept">>, Opts,
			El);
do_decode(<<"stream:error">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_stream_error(<<"jabber:client">>, Opts, El);
do_decode(<<"stream:error">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_stream_error(<<"jabber:server">>, Opts, El);
do_decode(<<"stream:error">>,
	  <<"jabber:component:accept">>, El, Opts) ->
    decode_stream_error(<<"jabber:component:accept">>, Opts,
			El);
do_decode(<<"unsupported-version">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_unsupported_version(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"unsupported-stanza-type">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_unsupported_stanza_type(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
						Opts, El);
do_decode(<<"unsupported-feature">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_unsupported_feature(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"unsupported-encoding">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_unsupported_encoding(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					     Opts, El);
do_decode(<<"undefined-condition">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_undefined_condition(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"system-shutdown">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_system_shutdown(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					Opts, El);
do_decode(<<"see-other-host">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_see_other_host(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				       Opts, El);
do_decode(<<"restricted-xml">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_restricted_xml(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				       Opts, El);
do_decode(<<"resource-constraint">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_resource_constraint(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"reset">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_reset(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
			      Opts, El);
do_decode(<<"remote-connection-failed">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_remote_connection_failed(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
						 Opts, El);
do_decode(<<"policy-violation">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_policy_violation(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					 Opts, El);
do_decode(<<"not-well-formed">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_not_well_formed(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					Opts, El);
do_decode(<<"not-authorized">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				       Opts, El);
do_decode(<<"invalid-xml">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_invalid_xml(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    Opts, El);
do_decode(<<"invalid-namespace">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_invalid_namespace(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					  Opts, El);
do_decode(<<"invalid-id">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_invalid_id(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				   Opts, El);
do_decode(<<"invalid-from">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_invalid_from(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				     Opts, El);
do_decode(<<"internal-server-error">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_internal_server_error(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					      Opts, El);
do_decode(<<"improper-addressing">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_improper_addressing(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					    Opts, El);
do_decode(<<"host-unknown">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_host_unknown(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				     Opts, El);
do_decode(<<"host-gone">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_host_gone(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				  Opts, El);
do_decode(<<"connection-timeout">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_connection_timeout(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					   Opts, El);
do_decode(<<"conflict">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_conflict(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				 Opts, El);
do_decode(<<"bad-namespace-prefix">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_bad_namespace_prefix(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
					     Opts, El);
do_decode(<<"bad-format">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_bad_format(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				   Opts, El);
do_decode(<<"text">>,
	  <<"urn:ietf:params:xml:ns:xmpp-streams">>, El, Opts) ->
    decode_stream_error_text(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
			     Opts, El);
do_decode(<<"stream:features">>, <<"jabber:client">>,
	  El, Opts) ->
    decode_stream_features(<<"jabber:client">>, Opts, El);
do_decode(<<"stream:features">>, <<"jabber:server">>,
	  El, Opts) ->
    decode_stream_features(<<"jabber:server">>, Opts, El);
do_decode(<<"failure">>,
	  <<"urn:ietf:params:xml:ns:xmpp-tls">>, El, Opts) ->
    decode_starttls_failure(<<"urn:ietf:params:xml:ns:xmpp-tls">>,
			    Opts, El);
do_decode(<<"proceed">>,
	  <<"urn:ietf:params:xml:ns:xmpp-tls">>, El, Opts) ->
    decode_starttls_proceed(<<"urn:ietf:params:xml:ns:xmpp-tls">>,
			    Opts, El);
do_decode(<<"starttls">>,
	  <<"urn:ietf:params:xml:ns:xmpp-tls">>, El, Opts) ->
    decode_starttls(<<"urn:ietf:params:xml:ns:xmpp-tls">>,
		    Opts, El);
do_decode(<<"required">>,
	  <<"urn:ietf:params:xml:ns:xmpp-tls">>, El, Opts) ->
    decode_starttls_required(<<"urn:ietf:params:xml:ns:xmpp-tls">>,
			     Opts, El);
do_decode(<<"mechanisms">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_mechanisms(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
			   Opts, El);
do_decode(<<"mechanism">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_mechanism(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
			  Opts, El);
do_decode(<<"failure">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
			Opts, El);
do_decode(<<"temporary-auth-failure">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_temporary_auth_failure(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
					       Opts, El);
do_decode(<<"bad-protocol">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_bad_protocol(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				     Opts, El);
do_decode(<<"not-authorized">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				       Opts, El);
do_decode(<<"mechanism-too-weak">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_mechanism_too_weak(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
					   Opts, El);
do_decode(<<"malformed-request">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_malformed_request(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
					  Opts, El);
do_decode(<<"invalid-mechanism">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_invalid_mechanism(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
					  Opts, El);
do_decode(<<"invalid-authzid">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_invalid_authzid(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
					Opts, El);
do_decode(<<"incorrect-encoding">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_incorrect_encoding(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
					   Opts, El);
do_decode(<<"encryption-required">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_encryption_required(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
					    Opts, El);
do_decode(<<"credentials-expired">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_credentials_expired(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
					    Opts, El);
do_decode(<<"account-disabled">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_account_disabled(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
					 Opts, El);
do_decode(<<"aborted">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_aborted(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				Opts, El);
do_decode(<<"text">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_failure_text(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
			     Opts, El);
do_decode(<<"success">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_success(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
			Opts, El);
do_decode(<<"response">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_response(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
			 Opts, El);
do_decode(<<"challenge">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_challenge(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
			  Opts, El);
do_decode(<<"abort">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_abort(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
		      Opts, El);
do_decode(<<"auth">>,
	  <<"urn:ietf:params:xml:ns:xmpp-sasl">>, El, Opts) ->
    decode_sasl_auth(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
		     Opts, El);
do_decode(<<"bind">>,
	  <<"urn:ietf:params:xml:ns:xmpp-bind">>, El, Opts) ->
    decode_bind(<<"urn:ietf:params:xml:ns:xmpp-bind">>,
		Opts, El);
do_decode(<<"resource">>,
	  <<"urn:ietf:params:xml:ns:xmpp-bind">>, El, Opts) ->
    decode_bind_resource(<<"urn:ietf:params:xml:ns:xmpp-bind">>,
			 Opts, El);
do_decode(<<"jid">>,
	  <<"urn:ietf:params:xml:ns:xmpp-bind">>, El, Opts) ->
    decode_bind_jid(<<"urn:ietf:params:xml:ns:xmpp-bind">>,
		    Opts, El);
do_decode(<<"error">>, <<"jabber:client">>, El, Opts) ->
    decode_error(<<"jabber:client">>, Opts, El);
do_decode(<<"error">>, <<"jabber:server">>, El, Opts) ->
    decode_error(<<"jabber:server">>, Opts, El);
do_decode(<<"error">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_error(<<"jabber:component:accept">>, Opts, El);
do_decode(<<"text">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_text(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
		      Opts, El);
do_decode(<<"unexpected-request">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_unexpected_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    Opts, El);
do_decode(<<"undefined-condition">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_undefined_condition(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				     Opts, El);
do_decode(<<"subscription-required">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_subscription_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"service-unavailable">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_service_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				     Opts, El);
do_decode(<<"resource-constraint">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_resource_constraint(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				     Opts, El);
do_decode(<<"remote-server-timeout">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_remote_server_timeout(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"remote-server-not-found">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_remote_server_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
					 Opts, El);
do_decode(<<"registration-required">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_registration_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"redirect">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_redirect(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			  Opts, El);
do_decode(<<"recipient-unavailable">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_recipient_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"policy-violation">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_policy_violation(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				  Opts, El);
do_decode(<<"payment-required">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_payment_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				  Opts, El);
do_decode(<<"not-authorized">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				Opts, El);
do_decode(<<"not-allowed">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_not_allowed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			     Opts, El);
do_decode(<<"not-acceptable">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_not_acceptable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				Opts, El);
do_decode(<<"jid-malformed">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_jid_malformed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			       Opts, El);
do_decode(<<"item-not-found">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_item_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				Opts, El);
do_decode(<<"internal-server-error">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_internal_server_error(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				       Opts, El);
do_decode(<<"gone">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_gone(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
		      Opts, El);
do_decode(<<"forbidden">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_forbidden(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			   Opts, El);
do_decode(<<"feature-not-implemented">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_feature_not_implemented(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
					 Opts, El);
do_decode(<<"conflict">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_conflict(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			  Opts, El);
do_decode(<<"bad-request">>,
	  <<"urn:ietf:params:xml:ns:xmpp-stanzas">>, El, Opts) ->
    decode_error_bad_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
			     Opts, El);
do_decode(<<"presence">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_presence(<<"jabber:client">>, Opts, El);
do_decode(<<"presence">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_presence(<<"jabber:server">>, Opts, El);
do_decode(<<"presence">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_presence(<<"jabber:component:accept">>, Opts,
		    El);
do_decode(<<"priority">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_presence_priority(<<"jabber:client">>, Opts, El);
do_decode(<<"priority">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_presence_priority(<<"jabber:server">>, Opts, El);
do_decode(<<"priority">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_presence_priority(<<"jabber:component:accept">>,
			     Opts, El);
do_decode(<<"status">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_presence_status(<<"jabber:client">>, Opts, El);
do_decode(<<"status">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_presence_status(<<"jabber:server">>, Opts, El);
do_decode(<<"status">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_presence_status(<<"jabber:component:accept">>,
			   Opts, El);
do_decode(<<"show">>, <<"jabber:client">>, El, Opts) ->
    decode_presence_show(<<"jabber:client">>, Opts, El);
do_decode(<<"show">>, <<"jabber:server">>, El, Opts) ->
    decode_presence_show(<<"jabber:server">>, Opts, El);
do_decode(<<"show">>, <<"jabber:component:accept">>, El,
	  Opts) ->
    decode_presence_show(<<"jabber:component:accept">>,
			 Opts, El);
do_decode(<<"message">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_message(<<"jabber:client">>, Opts, El);
do_decode(<<"message">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_message(<<"jabber:server">>, Opts, El);
do_decode(<<"message">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_message(<<"jabber:component:accept">>, Opts, El);
do_decode(<<"thread">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_message_thread(<<"jabber:client">>, Opts, El);
do_decode(<<"thread">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_message_thread(<<"jabber:server">>, Opts, El);
do_decode(<<"thread">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_message_thread(<<"jabber:component:accept">>,
			  Opts, El);
do_decode(<<"body">>, <<"jabber:client">>, El, Opts) ->
    decode_message_body(<<"jabber:client">>, Opts, El);
do_decode(<<"body">>, <<"jabber:server">>, El, Opts) ->
    decode_message_body(<<"jabber:server">>, Opts, El);
do_decode(<<"body">>, <<"jabber:component:accept">>, El,
	  Opts) ->
    decode_message_body(<<"jabber:component:accept">>, Opts,
			El);
do_decode(<<"subject">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_message_subject(<<"jabber:client">>, Opts, El);
do_decode(<<"subject">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_message_subject(<<"jabber:server">>, Opts, El);
do_decode(<<"subject">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_message_subject(<<"jabber:component:accept">>,
			   Opts, El);
do_decode(<<"iq">>, <<"jabber:client">>, El, Opts) ->
    decode_iq(<<"jabber:client">>, Opts, El);
do_decode(<<"iq">>, <<"jabber:server">>, El, Opts) ->
    decode_iq(<<"jabber:server">>, Opts, El);
do_decode(<<"iq">>, <<"jabber:component:accept">>, El,
	  Opts) ->
    decode_iq(<<"jabber:component:accept">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"stream:stream">>, <<"jabber:client">>},
     {<<"stream:stream">>, <<"jabber:server">>},
     {<<"stream:stream">>, <<"jabber:component:accept">>},
     {<<"stream:error">>, <<"jabber:client">>},
     {<<"stream:error">>, <<"jabber:server">>},
     {<<"stream:error">>, <<"jabber:component:accept">>},
     {<<"unsupported-version">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"unsupported-stanza-type">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"unsupported-feature">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"unsupported-encoding">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"undefined-condition">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"system-shutdown">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"see-other-host">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"restricted-xml">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"resource-constraint">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"reset">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"remote-connection-failed">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"policy-violation">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"not-well-formed">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"not-authorized">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"invalid-xml">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"invalid-namespace">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"invalid-id">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"invalid-from">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"internal-server-error">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"improper-addressing">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"host-unknown">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"host-gone">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"connection-timeout">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"conflict">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"bad-namespace-prefix">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"bad-format">>,
      <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"text">>, <<"urn:ietf:params:xml:ns:xmpp-streams">>},
     {<<"stream:features">>, <<"jabber:client">>},
     {<<"stream:features">>, <<"jabber:server">>},
     {<<"failure">>, <<"urn:ietf:params:xml:ns:xmpp-tls">>},
     {<<"proceed">>, <<"urn:ietf:params:xml:ns:xmpp-tls">>},
     {<<"starttls">>, <<"urn:ietf:params:xml:ns:xmpp-tls">>},
     {<<"required">>, <<"urn:ietf:params:xml:ns:xmpp-tls">>},
     {<<"mechanisms">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"mechanism">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"failure">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"temporary-auth-failure">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"bad-protocol">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"not-authorized">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"mechanism-too-weak">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"malformed-request">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"invalid-mechanism">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"invalid-authzid">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"incorrect-encoding">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"encryption-required">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"credentials-expired">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"account-disabled">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"aborted">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"text">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"success">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"response">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"challenge">>,
      <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"abort">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"auth">>, <<"urn:ietf:params:xml:ns:xmpp-sasl">>},
     {<<"bind">>, <<"urn:ietf:params:xml:ns:xmpp-bind">>},
     {<<"resource">>,
      <<"urn:ietf:params:xml:ns:xmpp-bind">>},
     {<<"jid">>, <<"urn:ietf:params:xml:ns:xmpp-bind">>},
     {<<"error">>, <<"jabber:client">>},
     {<<"error">>, <<"jabber:server">>},
     {<<"error">>, <<"jabber:component:accept">>},
     {<<"text">>, <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"unexpected-request">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"undefined-condition">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"subscription-required">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"service-unavailable">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"resource-constraint">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"remote-server-timeout">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"remote-server-not-found">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"registration-required">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"redirect">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"recipient-unavailable">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"policy-violation">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"payment-required">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"not-authorized">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"not-allowed">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"not-acceptable">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"jid-malformed">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"item-not-found">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"internal-server-error">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"gone">>, <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"forbidden">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"feature-not-implemented">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"conflict">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"bad-request">>,
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">>},
     {<<"presence">>, <<"jabber:client">>},
     {<<"presence">>, <<"jabber:server">>},
     {<<"presence">>, <<"jabber:component:accept">>},
     {<<"priority">>, <<"jabber:client">>},
     {<<"priority">>, <<"jabber:server">>},
     {<<"priority">>, <<"jabber:component:accept">>},
     {<<"status">>, <<"jabber:client">>},
     {<<"status">>, <<"jabber:server">>},
     {<<"status">>, <<"jabber:component:accept">>},
     {<<"show">>, <<"jabber:client">>},
     {<<"show">>, <<"jabber:server">>},
     {<<"show">>, <<"jabber:component:accept">>},
     {<<"message">>, <<"jabber:client">>},
     {<<"message">>, <<"jabber:server">>},
     {<<"message">>, <<"jabber:component:accept">>},
     {<<"thread">>, <<"jabber:client">>},
     {<<"thread">>, <<"jabber:server">>},
     {<<"thread">>, <<"jabber:component:accept">>},
     {<<"body">>, <<"jabber:client">>},
     {<<"body">>, <<"jabber:server">>},
     {<<"body">>, <<"jabber:component:accept">>},
     {<<"subject">>, <<"jabber:client">>},
     {<<"subject">>, <<"jabber:server">>},
     {<<"subject">>, <<"jabber:component:accept">>},
     {<<"iq">>, <<"jabber:client">>},
     {<<"iq">>, <<"jabber:server">>},
     {<<"iq">>, <<"jabber:component:accept">>}].

do_encode({iq, _, _, _, _, _, _, _} = Iq, TopXMLNS) ->
    encode_iq(Iq, TopXMLNS);
do_encode({message, _, _, _, _, _, _, _, _, _, _} =
	      Message,
	  TopXMLNS) ->
    encode_message(Message, TopXMLNS);
do_encode({presence, _, _, _, _, _, _, _, _, _, _} =
	      Presence,
	  TopXMLNS) ->
    encode_presence(Presence, TopXMLNS);
do_encode({gone, _} = Gone, TopXMLNS) ->
    encode_error_gone(Gone, TopXMLNS);
do_encode({redirect, _} = Redirect, TopXMLNS) ->
    encode_error_redirect(Redirect, TopXMLNS);
do_encode({stanza_error, _, _, _, _, _, _} = Error,
	  TopXMLNS) ->
    encode_error(Error, TopXMLNS);
do_encode({bind, _, _} = Bind, TopXMLNS) ->
    encode_bind(Bind, TopXMLNS);
do_encode({sasl_auth, _, _} = Auth, TopXMLNS) ->
    encode_sasl_auth(Auth, TopXMLNS);
do_encode({sasl_abort} = Abort, TopXMLNS) ->
    encode_sasl_abort(Abort, TopXMLNS);
do_encode({sasl_challenge, _} = Challenge, TopXMLNS) ->
    encode_sasl_challenge(Challenge, TopXMLNS);
do_encode({sasl_response, _} = Response, TopXMLNS) ->
    encode_sasl_response(Response, TopXMLNS);
do_encode({sasl_success, _} = Success, TopXMLNS) ->
    encode_sasl_success(Success, TopXMLNS);
do_encode({sasl_failure, _, _} = Failure, TopXMLNS) ->
    encode_sasl_failure(Failure, TopXMLNS);
do_encode({sasl_mechanisms, _} = Mechanisms,
	  TopXMLNS) ->
    encode_sasl_mechanisms(Mechanisms, TopXMLNS);
do_encode({starttls, _} = Starttls, TopXMLNS) ->
    encode_starttls(Starttls, TopXMLNS);
do_encode({starttls_proceed} = Proceed, TopXMLNS) ->
    encode_starttls_proceed(Proceed, TopXMLNS);
do_encode({starttls_failure} = Failure, TopXMLNS) ->
    encode_starttls_failure(Failure, TopXMLNS);
do_encode({stream_features, _} = Stream_features,
	  TopXMLNS) ->
    encode_stream_features(Stream_features, TopXMLNS);
do_encode({text, _, _} = Text, TopXMLNS) ->
    encode_stream_error_text(Text, TopXMLNS);
do_encode({'see-other-host', _} = See_other_host,
	  TopXMLNS) ->
    encode_stream_error_see_other_host(See_other_host,
				       TopXMLNS);
do_encode({stream_error, _, _} = Stream_error,
	  TopXMLNS) ->
    encode_stream_error(Stream_error, TopXMLNS);
do_encode({stream_start, _, _, _, _, _, _, _, _} =
	      Stream_stream,
	  TopXMLNS) ->
    encode_stream_start(Stream_stream, TopXMLNS).

do_get_name({bind, _, _}) -> <<"bind">>;
do_get_name({gone, _}) -> <<"gone">>;
do_get_name({iq, _, _, _, _, _, _, _}) -> <<"iq">>;
do_get_name({message, _, _, _, _, _, _, _, _, _, _}) ->
    <<"message">>;
do_get_name({presence, _, _, _, _, _, _, _, _, _, _}) ->
    <<"presence">>;
do_get_name({redirect, _}) -> <<"redirect">>;
do_get_name({sasl_abort}) -> <<"abort">>;
do_get_name({sasl_auth, _, _}) -> <<"auth">>;
do_get_name({sasl_challenge, _}) -> <<"challenge">>;
do_get_name({sasl_failure, _, _}) -> <<"failure">>;
do_get_name({sasl_mechanisms, _}) -> <<"mechanisms">>;
do_get_name({sasl_response, _}) -> <<"response">>;
do_get_name({sasl_success, _}) -> <<"success">>;
do_get_name({'see-other-host', _}) ->
    <<"see-other-host">>;
do_get_name({stanza_error, _, _, _, _, _, _}) ->
    <<"error">>;
do_get_name({starttls, _}) -> <<"starttls">>;
do_get_name({starttls_failure}) -> <<"failure">>;
do_get_name({starttls_proceed}) -> <<"proceed">>;
do_get_name({stream_error, _, _}) -> <<"stream:error">>;
do_get_name({stream_features, _}) ->
    <<"stream:features">>;
do_get_name({stream_start, _, _, _, _, _, _, _, _}) ->
    <<"stream:stream">>;
do_get_name({text, _, _}) -> <<"text">>.

do_get_ns({bind, _, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-bind">>;
do_get_ns({gone, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-stanzas">>;
do_get_ns({iq, _, _, _, _, _, _, _}) ->
    <<"jabber:client">>;
do_get_ns({message, _, _, _, _, _, _, _, _, _, _}) ->
    <<"jabber:client">>;
do_get_ns({presence, _, _, _, _, _, _, _, _, _, _}) ->
    <<"jabber:client">>;
do_get_ns({redirect, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-stanzas">>;
do_get_ns({sasl_abort}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_auth, _, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_challenge, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_failure, _, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_mechanisms, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_response, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({sasl_success, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-sasl">>;
do_get_ns({'see-other-host', _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-streams">>;
do_get_ns({stanza_error, _, _, _, _, _, _}) ->
    <<"jabber:client">>;
do_get_ns({starttls, _}) ->
    <<"urn:ietf:params:xml:ns:xmpp-tls">>;
do_get_ns({starttls_failure}) ->
    <<"urn:ietf:params:xml:ns:xmpp-tls">>;
do_get_ns({starttls_proceed}) ->
    <<"urn:ietf:params:xml:ns:xmpp-tls">>;
do_get_ns({stream_error, _, _}) -> <<"jabber:client">>;
do_get_ns({stream_features, _}) -> <<"jabber:client">>;
do_get_ns({stream_start, _, _, _, _, Xmlns, _, _, _}) ->
    Xmlns.

pp(iq, 7) -> [id, type, lang, from, to, sub_els, meta];
pp(message, 10) ->
    [id, type, lang, from, to, subject, body, thread,
     sub_els, meta];
pp(presence, 10) ->
    [id, type, lang, from, to, show, status, priority,
     sub_els, meta];
pp(gone, 1) -> [uri];
pp(redirect, 1) -> [uri];
pp(stanza_error, 6) ->
    [type, code, by, reason, text, sub_els];
pp(bind, 2) -> [jid, resource];
pp(sasl_auth, 2) -> [mechanism, text];
pp(sasl_abort, 0) -> [];
pp(sasl_challenge, 1) -> [text];
pp(sasl_response, 1) -> [text];
pp(sasl_success, 1) -> [text];
pp(sasl_failure, 2) -> [reason, text];
pp(sasl_mechanisms, 1) -> [list];
pp(starttls, 1) -> [required];
pp(starttls_proceed, 0) -> [];
pp(starttls_failure, 0) -> [];
pp(stream_features, 1) -> [sub_els];
pp(text, 2) -> [lang, data];
pp('see-other-host', 1) -> [host];
pp(stream_error, 2) -> [reason, text];
pp(stream_start, 8) ->
    [from, to, id, version, xmlns, stream_xmlns, db_xmlns,
     lang];
pp(_, _) -> no.

records() ->
    [{iq, 7}, {message, 10}, {presence, 10}, {gone, 1},
     {redirect, 1}, {stanza_error, 6}, {bind, 2},
     {sasl_auth, 2}, {sasl_abort, 0}, {sasl_challenge, 1},
     {sasl_response, 1}, {sasl_success, 1},
     {sasl_failure, 2}, {sasl_mechanisms, 1}, {starttls, 1},
     {starttls_proceed, 0}, {starttls_failure, 0},
     {stream_features, 1}, {text, 2}, {'see-other-host', 1},
     {stream_error, 2}, {stream_start, 8}].

check_resource(R) ->
    case jid:resourceprep(R) of
      error -> erlang:error(badarg);
      _ -> R
    end.

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

dec_host_port(<<$[, T/binary>>) ->
    [IP, <<$:, Port/binary>>] = binary:split(T, <<$]>>),
    {dec_ip(IP), dec_int(Port, 0, 65535)};
dec_host_port(S) ->
    case binary:split(S, <<$:>>) of
      [S] -> try dec_ip(S) catch _:_ -> S end;
      [S, P] ->
	  {try dec_ip(S) catch _:_ -> S end, dec_int(P, 0, 65535)}
    end.

dec_int(Val) -> dec_int(Val, infinity, infinity).

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

dec_ip(S) ->
    {ok, Addr} = inet_parse:address(binary_to_list(S)),
    Addr.

dec_message_type(<<"chat">>) -> chat;
dec_message_type(<<"groupchat">>) -> groupchat;
dec_message_type(<<"headline">>) -> headline;
dec_message_type(<<"error">>) -> error;
dec_message_type(_) -> normal.

dec_version(S) ->
    [Major, Minor] = binary:split(S, <<$.>>),
    {binary_to_integer(Major), binary_to_integer(Minor)}.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_host_port(Host) when is_binary(Host) -> Host;
enc_host_port({{_, _, _, _, _, _, _, _} = IPv6,
	       Port}) ->
    enc_host_port({<<$[, (enc_ip(IPv6))/binary, $]>>,
		   Port});
enc_host_port({{_, _, _, _} = IPv4, Port}) ->
    enc_host_port({enc_ip(IPv4), Port});
enc_host_port({Host, Port}) ->
    <<Host/binary, $:, (integer_to_binary(Port))/binary>>;
enc_host_port(Addr) -> enc_ip(Addr).

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_ip({0, 0, 0, 0, 0, 65535, A, B}) ->
    enc_ip({(A bsr 8) band 255, A band 255,
	    (B bsr 8) band 255, B band 255});
enc_ip(Addr) -> list_to_binary(inet_parse:ntoa(Addr)).

enc_version({Maj, Min}) ->
    <<(integer_to_binary(Maj))/binary, $.,
      (integer_to_binary(Min))/binary>>.

decode_stream_start(__TopXMLNS, __Opts,
		    {xmlel, <<"stream:stream">>, _attrs, _els}) ->
    {From, To, Xmlns, Stream_xmlns, Db_xmlns, Lang, Version,
     Id} =
	decode_stream_start_attrs(__TopXMLNS, _attrs, undefined,
				  undefined, undefined, undefined, undefined,
				  undefined, undefined, undefined),
    {stream_start, From, To, Id, Version, Xmlns,
     Stream_xmlns, Db_xmlns, Lang}.

decode_stream_start_attrs(__TopXMLNS,
			  [{<<"from">>, _val} | _attrs], _From, To, Xmlns,
			  Stream_xmlns, Db_xmlns, Lang, Version, Id) ->
    decode_stream_start_attrs(__TopXMLNS, _attrs, _val, To,
			      Xmlns, Stream_xmlns, Db_xmlns, Lang, Version, Id);
decode_stream_start_attrs(__TopXMLNS,
			  [{<<"to">>, _val} | _attrs], From, _To, Xmlns,
			  Stream_xmlns, Db_xmlns, Lang, Version, Id) ->
    decode_stream_start_attrs(__TopXMLNS, _attrs, From,
			      _val, Xmlns, Stream_xmlns, Db_xmlns, Lang,
			      Version, Id);
decode_stream_start_attrs(__TopXMLNS,
			  [{<<"xmlns">>, _val} | _attrs], From, To, _Xmlns,
			  Stream_xmlns, Db_xmlns, Lang, Version, Id) ->
    decode_stream_start_attrs(__TopXMLNS, _attrs, From, To,
			      _val, Stream_xmlns, Db_xmlns, Lang, Version, Id);
decode_stream_start_attrs(__TopXMLNS,
			  [{<<"xmlns:stream">>, _val} | _attrs], From, To,
			  Xmlns, _Stream_xmlns, Db_xmlns, Lang, Version, Id) ->
    decode_stream_start_attrs(__TopXMLNS, _attrs, From, To,
			      Xmlns, _val, Db_xmlns, Lang, Version, Id);
decode_stream_start_attrs(__TopXMLNS,
			  [{<<"xmlns:db">>, _val} | _attrs], From, To, Xmlns,
			  Stream_xmlns, _Db_xmlns, Lang, Version, Id) ->
    decode_stream_start_attrs(__TopXMLNS, _attrs, From, To,
			      Xmlns, Stream_xmlns, _val, Lang, Version, Id);
decode_stream_start_attrs(__TopXMLNS,
			  [{<<"xml:lang">>, _val} | _attrs], From, To, Xmlns,
			  Stream_xmlns, Db_xmlns, _Lang, Version, Id) ->
    decode_stream_start_attrs(__TopXMLNS, _attrs, From, To,
			      Xmlns, Stream_xmlns, Db_xmlns, _val, Version, Id);
decode_stream_start_attrs(__TopXMLNS,
			  [{<<"version">>, _val} | _attrs], From, To, Xmlns,
			  Stream_xmlns, Db_xmlns, Lang, _Version, Id) ->
    decode_stream_start_attrs(__TopXMLNS, _attrs, From, To,
			      Xmlns, Stream_xmlns, Db_xmlns, Lang, _val, Id);
decode_stream_start_attrs(__TopXMLNS,
			  [{<<"id">>, _val} | _attrs], From, To, Xmlns,
			  Stream_xmlns, Db_xmlns, Lang, Version, _Id) ->
    decode_stream_start_attrs(__TopXMLNS, _attrs, From, To,
			      Xmlns, Stream_xmlns, Db_xmlns, Lang, Version,
			      _val);
decode_stream_start_attrs(__TopXMLNS, [_ | _attrs],
			  From, To, Xmlns, Stream_xmlns, Db_xmlns, Lang,
			  Version, Id) ->
    decode_stream_start_attrs(__TopXMLNS, _attrs, From, To,
			      Xmlns, Stream_xmlns, Db_xmlns, Lang, Version, Id);
decode_stream_start_attrs(__TopXMLNS, [], From, To,
			  Xmlns, Stream_xmlns, Db_xmlns, Lang, Version, Id) ->
    {decode_stream_start_attr_from(__TopXMLNS, From),
     decode_stream_start_attr_to(__TopXMLNS, To),
     decode_stream_start_attr_xmlns(__TopXMLNS, Xmlns),
     'decode_stream_start_attr_xmlns:stream'(__TopXMLNS,
					     Stream_xmlns),
     'decode_stream_start_attr_xmlns:db'(__TopXMLNS,
					 Db_xmlns),
     'decode_stream_start_attr_xml:lang'(__TopXMLNS, Lang),
     decode_stream_start_attr_version(__TopXMLNS, Version),
     decode_stream_start_attr_id(__TopXMLNS, Id)}.

encode_stream_start({stream_start, From, To, Id,
		     Version, Xmlns, Stream_xmlns, Db_xmlns, Lang},
		    __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_stream_start_attr_id(Id,
					 encode_stream_start_attr_version(Version,
									  'encode_stream_start_attr_xml:lang'(Lang,
													      'encode_stream_start_attr_xmlns:db'(Db_xmlns,
																		  'encode_stream_start_attr_xmlns:stream'(Stream_xmlns,
																							  encode_stream_start_attr_to(To,
																										      encode_stream_start_attr_from(From,
																														    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																																	       __TopXMLNS)))))))),
    {xmlel, <<"stream:stream">>, _attrs, _els}.

decode_stream_start_attr_from(__TopXMLNS, undefined) ->
    undefined;
decode_stream_start_attr_from(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"stream:stream">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_stream_start_attr_from(undefined, _acc) -> _acc;
encode_stream_start_attr_from(_val, _acc) ->
    [{<<"from">>, jid:encode(_val)} | _acc].

decode_stream_start_attr_to(__TopXMLNS, undefined) ->
    undefined;
decode_stream_start_attr_to(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"stream:stream">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_stream_start_attr_to(undefined, _acc) -> _acc;
encode_stream_start_attr_to(_val, _acc) ->
    [{<<"to">>, jid:encode(_val)} | _acc].

decode_stream_start_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_stream_start_attr_xmlns(__TopXMLNS, _val) ->
    _val.

'decode_stream_start_attr_xmlns:stream'(__TopXMLNS,
					undefined) ->
    <<>>;
'decode_stream_start_attr_xmlns:stream'(__TopXMLNS,
					_val) ->
    _val.

'encode_stream_start_attr_xmlns:stream'(<<>>, _acc) ->
    _acc;
'encode_stream_start_attr_xmlns:stream'(_val, _acc) ->
    [{<<"xmlns:stream">>, _val} | _acc].

'decode_stream_start_attr_xmlns:db'(__TopXMLNS,
				    undefined) ->
    <<>>;
'decode_stream_start_attr_xmlns:db'(__TopXMLNS, _val) ->
    _val.

'encode_stream_start_attr_xmlns:db'(<<>>, _acc) -> _acc;
'encode_stream_start_attr_xmlns:db'(_val, _acc) ->
    [{<<"xmlns:db">>, _val} | _acc].

'decode_stream_start_attr_xml:lang'(__TopXMLNS,
				    undefined) ->
    <<>>;
'decode_stream_start_attr_xml:lang'(__TopXMLNS, _val) ->
    _val.

'encode_stream_start_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_stream_start_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_stream_start_attr_version(__TopXMLNS,
				 undefined) ->
    undefined;
decode_stream_start_attr_version(__TopXMLNS, _val) ->
    case catch dec_version(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"version">>, <<"stream:stream">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_stream_start_attr_version(undefined, _acc) ->
    _acc;
encode_stream_start_attr_version(_val, _acc) ->
    [{<<"version">>, enc_version(_val)} | _acc].

decode_stream_start_attr_id(__TopXMLNS, undefined) ->
    <<>>;
decode_stream_start_attr_id(__TopXMLNS, _val) -> _val.

encode_stream_start_attr_id(<<>>, _acc) -> _acc;
encode_stream_start_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_stream_error(__TopXMLNS, __Opts,
		    {xmlel, <<"stream:error">>, _attrs, _els}) ->
    {Text, Reason} = decode_stream_error_els(__TopXMLNS,
					     __Opts, _els, undefined,
					     undefined),
    {stream_error, Reason, Text}.

decode_stream_error_els(__TopXMLNS, __Opts, [], Text,
			Reason) ->
    {Text, Reason};
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
			Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els,
				  decode_stream_error_text(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
							   __Opts, _el),
				  Reason);
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"bad-format">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_bad_format(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								 __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"bad-namespace-prefix">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_bad_namespace_prefix(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									   __Opts,
									   _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"conflict">>, _attrs, _} = _el | _els], Text,
			Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_conflict(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
							       __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"connection-timeout">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_connection_timeout(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									 __Opts,
									 _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"host-gone">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_host_gone(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								__Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"host-unknown">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_host_unknown(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								   __Opts,
								   _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"improper-addressing">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_improper_addressing(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"internal-server-error">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_internal_server_error(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									    __Opts,
									    _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-from">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_invalid_from(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								   __Opts,
								   _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-id">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_invalid_id(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								 __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-namespace">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_invalid_namespace(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									__Opts,
									_el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-xml">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_invalid_xml(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								  __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"not-authorized">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								     __Opts,
								     _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"not-well-formed">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_not_well_formed(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								      __Opts,
								      _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"policy-violation">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_policy_violation(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								       __Opts,
								       _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"remote-connection-failed">>, _attrs, _} =
			     _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_remote_connection_failed(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									       __Opts,
									       _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"reset">>, _attrs, _} = _el | _els], Text,
			Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_reset(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
							    __Opts, _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"resource-constraint">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_resource_constraint(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"restricted-xml">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_restricted_xml(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								     __Opts,
								     _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"see-other-host">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_see_other_host(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								     __Opts,
								     _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"system-shutdown">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_system_shutdown(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
								      __Opts,
								      _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"undefined-condition">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_undefined_condition(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"unsupported-encoding">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_unsupported_encoding(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									   __Opts,
									   _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"unsupported-feature">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_unsupported_feature(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"unsupported-stanza-type">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_unsupported_stanza_type(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									      __Opts,
									      _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts,
			[{xmlel, <<"unsupported-version">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-streams">> ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  decode_stream_error_unsupported_version(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
									  __Opts,
									  _el));
      _ ->
	  decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_stream_error_els(__TopXMLNS, __Opts, [_ | _els],
			Text, Reason) ->
    decode_stream_error_els(__TopXMLNS, __Opts, _els, Text,
			    Reason).

encode_stream_error({stream_error, Reason, Text},
		    __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = lists:reverse('encode_stream_error_$text'(Text,
						     __NewTopXMLNS,
						     'encode_stream_error_$reason'(Reason,
										   __NewTopXMLNS,
										   []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"stream:error">>, _attrs, _els}.

'encode_stream_error_$text'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_stream_error_$text'(Text, __TopXMLNS, _acc) ->
    [encode_stream_error_text(Text, __TopXMLNS) | _acc].

'encode_stream_error_$reason'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_stream_error_$reason'('bad-format' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_bad_format(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('bad-namespace-prefix' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_bad_namespace_prefix(Reason,
					      __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'(conflict = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_conflict(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('connection-timeout' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_connection_timeout(Reason,
					    __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('host-gone' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_host_gone(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('host-unknown' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_host_unknown(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('improper-addressing' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_improper_addressing(Reason,
					     __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('internal-server-error' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_internal_server_error(Reason,
					       __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('invalid-from' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_invalid_from(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('invalid-id' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_invalid_id(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('invalid-namespace' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_invalid_namespace(Reason,
					   __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('invalid-xml' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_invalid_xml(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('not-authorized' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_not_authorized(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('not-well-formed' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_not_well_formed(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('policy-violation' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_policy_violation(Reason,
					  __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('remote-connection-failed' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_remote_connection_failed(Reason,
						  __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'(reset = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_reset(Reason, __TopXMLNS) | _acc];
'encode_stream_error_$reason'('resource-constraint' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_resource_constraint(Reason,
					     __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('restricted-xml' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_restricted_xml(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'({'see-other-host', _} =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_see_other_host(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('system-shutdown' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_system_shutdown(Reason, __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('undefined-condition' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_undefined_condition(Reason,
					     __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('unsupported-encoding' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_unsupported_encoding(Reason,
					      __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('unsupported-feature' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_unsupported_feature(Reason,
					     __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('unsupported-stanza-type' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_unsupported_stanza_type(Reason,
						 __TopXMLNS)
     | _acc];
'encode_stream_error_$reason'('unsupported-version' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_stream_error_unsupported_version(Reason,
					     __TopXMLNS)
     | _acc].

decode_stream_error_unsupported_version(__TopXMLNS,
					__Opts,
					{xmlel, <<"unsupported-version">>,
					 _attrs, _els}) ->
    'unsupported-version'.

encode_stream_error_unsupported_version('unsupported-version',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-version">>, _attrs, _els}.

decode_stream_error_unsupported_stanza_type(__TopXMLNS,
					    __Opts,
					    {xmlel,
					     <<"unsupported-stanza-type">>,
					     _attrs, _els}) ->
    'unsupported-stanza-type'.

encode_stream_error_unsupported_stanza_type('unsupported-stanza-type',
					    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-stanza-type">>, _attrs, _els}.

decode_stream_error_unsupported_feature(__TopXMLNS,
					__Opts,
					{xmlel, <<"unsupported-feature">>,
					 _attrs, _els}) ->
    'unsupported-feature'.

encode_stream_error_unsupported_feature('unsupported-feature',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-feature">>, _attrs, _els}.

decode_stream_error_unsupported_encoding(__TopXMLNS,
					 __Opts,
					 {xmlel, <<"unsupported-encoding">>,
					  _attrs, _els}) ->
    'unsupported-encoding'.

encode_stream_error_unsupported_encoding('unsupported-encoding',
					 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-encoding">>, _attrs, _els}.

decode_stream_error_undefined_condition(__TopXMLNS,
					__Opts,
					{xmlel, <<"undefined-condition">>,
					 _attrs, _els}) ->
    'undefined-condition'.

encode_stream_error_undefined_condition('undefined-condition',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"undefined-condition">>, _attrs, _els}.

decode_stream_error_system_shutdown(__TopXMLNS, __Opts,
				    {xmlel, <<"system-shutdown">>, _attrs,
				     _els}) ->
    'system-shutdown'.

encode_stream_error_system_shutdown('system-shutdown',
				    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"system-shutdown">>, _attrs, _els}.

decode_stream_error_see_other_host(__TopXMLNS, __Opts,
				   {xmlel, <<"see-other-host">>, _attrs,
				    _els}) ->
    Host =
	decode_stream_error_see_other_host_els(__TopXMLNS,
					       __Opts, _els, <<>>),
    {'see-other-host', Host}.

decode_stream_error_see_other_host_els(__TopXMLNS,
				       __Opts, [], Host) ->
    decode_stream_error_see_other_host_cdata(__TopXMLNS,
					     Host);
decode_stream_error_see_other_host_els(__TopXMLNS,
				       __Opts, [{xmlcdata, _data} | _els],
				       Host) ->
    decode_stream_error_see_other_host_els(__TopXMLNS,
					   __Opts, _els,
					   <<Host/binary, _data/binary>>);
decode_stream_error_see_other_host_els(__TopXMLNS,
				       __Opts, [_ | _els], Host) ->
    decode_stream_error_see_other_host_els(__TopXMLNS,
					   __Opts, _els, Host).

encode_stream_error_see_other_host({'see-other-host',
				    Host},
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = encode_stream_error_see_other_host_cdata(Host,
						    []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"see-other-host">>, _attrs, _els}.

decode_stream_error_see_other_host_cdata(__TopXMLNS,
					 <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"see-other-host">>,
		   __TopXMLNS}});
decode_stream_error_see_other_host_cdata(__TopXMLNS,
					 _val) ->
    case catch dec_host_port(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"see-other-host">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_stream_error_see_other_host_cdata(_val, _acc) ->
    [{xmlcdata, enc_host_port(_val)} | _acc].

decode_stream_error_restricted_xml(__TopXMLNS, __Opts,
				   {xmlel, <<"restricted-xml">>, _attrs,
				    _els}) ->
    'restricted-xml'.

encode_stream_error_restricted_xml('restricted-xml',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"restricted-xml">>, _attrs, _els}.

decode_stream_error_resource_constraint(__TopXMLNS,
					__Opts,
					{xmlel, <<"resource-constraint">>,
					 _attrs, _els}) ->
    'resource-constraint'.

encode_stream_error_resource_constraint('resource-constraint',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"resource-constraint">>, _attrs, _els}.

decode_stream_error_reset(__TopXMLNS, __Opts,
			  {xmlel, <<"reset">>, _attrs, _els}) ->
    reset.

encode_stream_error_reset(reset, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"reset">>, _attrs, _els}.

decode_stream_error_remote_connection_failed(__TopXMLNS,
					     __Opts,
					     {xmlel,
					      <<"remote-connection-failed">>,
					      _attrs, _els}) ->
    'remote-connection-failed'.

encode_stream_error_remote_connection_failed('remote-connection-failed',
					     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"remote-connection-failed">>, _attrs, _els}.

decode_stream_error_policy_violation(__TopXMLNS, __Opts,
				     {xmlel, <<"policy-violation">>, _attrs,
				      _els}) ->
    'policy-violation'.

encode_stream_error_policy_violation('policy-violation',
				     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"policy-violation">>, _attrs, _els}.

decode_stream_error_not_well_formed(__TopXMLNS, __Opts,
				    {xmlel, <<"not-well-formed">>, _attrs,
				     _els}) ->
    'not-well-formed'.

encode_stream_error_not_well_formed('not-well-formed',
				    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-well-formed">>, _attrs, _els}.

decode_stream_error_not_authorized(__TopXMLNS, __Opts,
				   {xmlel, <<"not-authorized">>, _attrs,
				    _els}) ->
    'not-authorized'.

encode_stream_error_not_authorized('not-authorized',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-authorized">>, _attrs, _els}.

decode_stream_error_invalid_xml(__TopXMLNS, __Opts,
				{xmlel, <<"invalid-xml">>, _attrs, _els}) ->
    'invalid-xml'.

encode_stream_error_invalid_xml('invalid-xml',
				__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-xml">>, _attrs, _els}.

decode_stream_error_invalid_namespace(__TopXMLNS,
				      __Opts,
				      {xmlel, <<"invalid-namespace">>, _attrs,
				       _els}) ->
    'invalid-namespace'.

encode_stream_error_invalid_namespace('invalid-namespace',
				      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-namespace">>, _attrs, _els}.

decode_stream_error_invalid_id(__TopXMLNS, __Opts,
			       {xmlel, <<"invalid-id">>, _attrs, _els}) ->
    'invalid-id'.

encode_stream_error_invalid_id('invalid-id',
			       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-id">>, _attrs, _els}.

decode_stream_error_invalid_from(__TopXMLNS, __Opts,
				 {xmlel, <<"invalid-from">>, _attrs, _els}) ->
    'invalid-from'.

encode_stream_error_invalid_from('invalid-from',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-from">>, _attrs, _els}.

decode_stream_error_internal_server_error(__TopXMLNS,
					  __Opts,
					  {xmlel, <<"internal-server-error">>,
					   _attrs, _els}) ->
    'internal-server-error'.

encode_stream_error_internal_server_error('internal-server-error',
					  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"internal-server-error">>, _attrs, _els}.

decode_stream_error_improper_addressing(__TopXMLNS,
					__Opts,
					{xmlel, <<"improper-addressing">>,
					 _attrs, _els}) ->
    'improper-addressing'.

encode_stream_error_improper_addressing('improper-addressing',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"improper-addressing">>, _attrs, _els}.

decode_stream_error_host_unknown(__TopXMLNS, __Opts,
				 {xmlel, <<"host-unknown">>, _attrs, _els}) ->
    'host-unknown'.

encode_stream_error_host_unknown('host-unknown',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"host-unknown">>, _attrs, _els}.

decode_stream_error_host_gone(__TopXMLNS, __Opts,
			      {xmlel, <<"host-gone">>, _attrs, _els}) ->
    'host-gone'.

encode_stream_error_host_gone('host-gone',
			      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"host-gone">>, _attrs, _els}.

decode_stream_error_connection_timeout(__TopXMLNS,
				       __Opts,
				       {xmlel, <<"connection-timeout">>, _attrs,
					_els}) ->
    'connection-timeout'.

encode_stream_error_connection_timeout('connection-timeout',
				       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"connection-timeout">>, _attrs, _els}.

decode_stream_error_conflict(__TopXMLNS, __Opts,
			     {xmlel, <<"conflict">>, _attrs, _els}) ->
    conflict.

encode_stream_error_conflict(conflict, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"conflict">>, _attrs, _els}.

decode_stream_error_bad_namespace_prefix(__TopXMLNS,
					 __Opts,
					 {xmlel, <<"bad-namespace-prefix">>,
					  _attrs, _els}) ->
    'bad-namespace-prefix'.

encode_stream_error_bad_namespace_prefix('bad-namespace-prefix',
					 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"bad-namespace-prefix">>, _attrs, _els}.

decode_stream_error_bad_format(__TopXMLNS, __Opts,
			       {xmlel, <<"bad-format">>, _attrs, _els}) ->
    'bad-format'.

encode_stream_error_bad_format('bad-format',
			       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"bad-format">>, _attrs, _els}.

decode_stream_error_text(__TopXMLNS, __Opts,
			 {xmlel, <<"text">>, _attrs, _els}) ->
    Data = decode_stream_error_text_els(__TopXMLNS, __Opts,
					_els, <<>>),
    Lang = decode_stream_error_text_attrs(__TopXMLNS,
					  _attrs, undefined),
    {text, Lang, Data}.

decode_stream_error_text_els(__TopXMLNS, __Opts, [],
			     Data) ->
    decode_stream_error_text_cdata(__TopXMLNS, Data);
decode_stream_error_text_els(__TopXMLNS, __Opts,
			     [{xmlcdata, _data} | _els], Data) ->
    decode_stream_error_text_els(__TopXMLNS, __Opts, _els,
				 <<Data/binary, _data/binary>>);
decode_stream_error_text_els(__TopXMLNS, __Opts,
			     [_ | _els], Data) ->
    decode_stream_error_text_els(__TopXMLNS, __Opts, _els,
				 Data).

decode_stream_error_text_attrs(__TopXMLNS,
			       [{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_stream_error_text_attrs(__TopXMLNS, _attrs,
				   _val);
decode_stream_error_text_attrs(__TopXMLNS, [_ | _attrs],
			       Lang) ->
    decode_stream_error_text_attrs(__TopXMLNS, _attrs,
				   Lang);
decode_stream_error_text_attrs(__TopXMLNS, [], Lang) ->
    'decode_stream_error_text_attr_xml:lang'(__TopXMLNS,
					     Lang).

encode_stream_error_text({text, Lang, Data},
			 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-streams">>,
				    [], __TopXMLNS),
    _els = encode_stream_error_text_cdata(Data, []),
    _attrs = 'encode_stream_error_text_attr_xml:lang'(Lang,
						      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
										 __TopXMLNS)),
    {xmlel, <<"text">>, _attrs, _els}.

'decode_stream_error_text_attr_xml:lang'(__TopXMLNS,
					 undefined) ->
    <<>>;
'decode_stream_error_text_attr_xml:lang'(__TopXMLNS,
					 _val) ->
    _val.

'encode_stream_error_text_attr_xml:lang'(<<>>, _acc) ->
    _acc;
'encode_stream_error_text_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_stream_error_text_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_stream_error_text_cdata(__TopXMLNS, _val) ->
    _val.

encode_stream_error_text_cdata(<<>>, _acc) -> _acc;
encode_stream_error_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_stream_features(__TopXMLNS, __Opts,
		       {xmlel, <<"stream:features">>, _attrs, _els}) ->
    __Els = decode_stream_features_els(__TopXMLNS, __Opts,
				       _els, []),
    {stream_features, __Els}.

decode_stream_features_els(__TopXMLNS, __Opts, [],
			   __Els) ->
    lists:reverse(__Els);
decode_stream_features_els(__TopXMLNS, __Opts,
			   [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_stream_features_els(__TopXMLNS, __Opts, _els,
				     [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_stream_features_els(__TopXMLNS, __Opts, _els,
					   __Els);
	    Mod ->
		decode_stream_features_els(__TopXMLNS, __Opts, _els,
					   [Mod:do_decode(_name, __XMLNS, _el,
							  __Opts)
					    | __Els])
	  end
    end;
decode_stream_features_els(__TopXMLNS, __Opts,
			   [_ | _els], __Els) ->
    decode_stream_features_els(__TopXMLNS, __Opts, _els,
			       __Els).

encode_stream_features({stream_features, __Els},
		       __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>],
						__TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"stream:features">>, _attrs, _els}.

decode_starttls_failure(__TopXMLNS, __Opts,
			{xmlel, <<"failure">>, _attrs, _els}) ->
    {starttls_failure}.

encode_starttls_failure({starttls_failure},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-tls">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"failure">>, _attrs, _els}.

decode_starttls_proceed(__TopXMLNS, __Opts,
			{xmlel, <<"proceed">>, _attrs, _els}) ->
    {starttls_proceed}.

encode_starttls_proceed({starttls_proceed},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-tls">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"proceed">>, _attrs, _els}.

decode_starttls(__TopXMLNS, __Opts,
		{xmlel, <<"starttls">>, _attrs, _els}) ->
    Required = decode_starttls_els(__TopXMLNS, __Opts, _els,
				   false),
    {starttls, Required}.

decode_starttls_els(__TopXMLNS, __Opts, [], Required) ->
    Required;
decode_starttls_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"required">>, _attrs, _} = _el | _els],
		    Required) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-tls">> ->
	  decode_starttls_els(__TopXMLNS, __Opts, _els,
			      decode_starttls_required(<<"urn:ietf:params:xml:ns:xmpp-tls">>,
						       __Opts, _el));
      _ ->
	  decode_starttls_els(__TopXMLNS, __Opts, _els, Required)
    end;
decode_starttls_els(__TopXMLNS, __Opts, [_ | _els],
		    Required) ->
    decode_starttls_els(__TopXMLNS, __Opts, _els, Required).

encode_starttls({starttls, Required}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-tls">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_starttls_$required'(Required,
						  __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"starttls">>, _attrs, _els}.

'encode_starttls_$required'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_starttls_$required'(Required, __TopXMLNS,
			    _acc) ->
    [encode_starttls_required(Required, __TopXMLNS) | _acc].

decode_starttls_required(__TopXMLNS, __Opts,
			 {xmlel, <<"required">>, _attrs, _els}) ->
    true.

encode_starttls_required(true, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-tls">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"required">>, _attrs, _els}.

decode_sasl_mechanisms(__TopXMLNS, __Opts,
		       {xmlel, <<"mechanisms">>, _attrs, _els}) ->
    List = decode_sasl_mechanisms_els(__TopXMLNS, __Opts,
				      _els, []),
    {sasl_mechanisms, List}.

decode_sasl_mechanisms_els(__TopXMLNS, __Opts, [],
			   List) ->
    lists:reverse(List);
decode_sasl_mechanisms_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"mechanism">>, _attrs, _} = _el | _els],
			   List) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_mechanisms_els(__TopXMLNS, __Opts, _els,
				     [decode_sasl_mechanism(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
							    __Opts, _el)
				      | List]);
      _ ->
	  decode_sasl_mechanisms_els(__TopXMLNS, __Opts, _els,
				     List)
    end;
decode_sasl_mechanisms_els(__TopXMLNS, __Opts,
			   [_ | _els], List) ->
    decode_sasl_mechanisms_els(__TopXMLNS, __Opts, _els,
			       List).

encode_sasl_mechanisms({sasl_mechanisms, List},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_sasl_mechanisms_$list'(List,
						     __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"mechanisms">>, _attrs, _els}.

'encode_sasl_mechanisms_$list'([], __TopXMLNS, _acc) ->
    _acc;
'encode_sasl_mechanisms_$list'([List | _els],
			       __TopXMLNS, _acc) ->
    'encode_sasl_mechanisms_$list'(_els, __TopXMLNS,
				   [encode_sasl_mechanism(List, __TopXMLNS)
				    | _acc]).

decode_sasl_mechanism(__TopXMLNS, __Opts,
		      {xmlel, <<"mechanism">>, _attrs, _els}) ->
    Cdata = decode_sasl_mechanism_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_sasl_mechanism_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_sasl_mechanism_cdata(__TopXMLNS, Cdata);
decode_sasl_mechanism_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_sasl_mechanism_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_sasl_mechanism_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_sasl_mechanism_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_sasl_mechanism(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = encode_sasl_mechanism_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"mechanism">>, _attrs, _els}.

decode_sasl_mechanism_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl_mechanism_cdata(__TopXMLNS, _val) -> _val.

encode_sasl_mechanism_cdata(<<>>, _acc) -> _acc;
encode_sasl_mechanism_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_sasl_failure(__TopXMLNS, __Opts,
		    {xmlel, <<"failure">>, _attrs, _els}) ->
    {Text, Reason} = decode_sasl_failure_els(__TopXMLNS,
					     __Opts, _els, [], undefined),
    {sasl_failure, Reason, Text}.

decode_sasl_failure_els(__TopXMLNS, __Opts, [], Text,
			Reason) ->
    {lists:reverse(Text), Reason};
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
			Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els,
				  [decode_sasl_failure_text(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
							    __Opts, _el)
				   | Text],
				  Reason);
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"aborted">>, _attrs, _} = _el | _els], Text,
			Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_aborted(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
							      __Opts, _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"account-disabled">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_account_disabled(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
								       __Opts,
								       _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"credentials-expired">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_credentials_expired(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
									  __Opts,
									  _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"encryption-required">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_encryption_required(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
									  __Opts,
									  _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"incorrect-encoding">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_incorrect_encoding(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
									 __Opts,
									 _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-authzid">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_invalid_authzid(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
								      __Opts,
								      _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"invalid-mechanism">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_invalid_mechanism(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
									__Opts,
									_el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"malformed-request">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_malformed_request(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
									__Opts,
									_el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"mechanism-too-weak">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_mechanism_too_weak(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
									 __Opts,
									 _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"not-authorized">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
								     __Opts,
								     _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"bad-protocol">>, _attrs, _} = _el | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_bad_protocol(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
								   __Opts,
								   _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts,
			[{xmlel, <<"temporary-auth-failure">>, _attrs, _} = _el
			 | _els],
			Text, Reason) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-sasl">> ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  decode_sasl_failure_temporary_auth_failure(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
									     __Opts,
									     _el));
      _ ->
	  decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
				  Reason)
    end;
decode_sasl_failure_els(__TopXMLNS, __Opts, [_ | _els],
			Text, Reason) ->
    decode_sasl_failure_els(__TopXMLNS, __Opts, _els, Text,
			    Reason).

encode_sasl_failure({sasl_failure, Reason, Text},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_sasl_failure_$text'(Text,
						     __NewTopXMLNS,
						     'encode_sasl_failure_$reason'(Reason,
										   __NewTopXMLNS,
										   []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"failure">>, _attrs, _els}.

'encode_sasl_failure_$text'([], __TopXMLNS, _acc) ->
    _acc;
'encode_sasl_failure_$text'([Text | _els], __TopXMLNS,
			    _acc) ->
    'encode_sasl_failure_$text'(_els, __TopXMLNS,
				[encode_sasl_failure_text(Text, __TopXMLNS)
				 | _acc]).

'encode_sasl_failure_$reason'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_sasl_failure_$reason'(aborted = Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_aborted(Reason, __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('account-disabled' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_account_disabled(Reason,
					  __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('credentials-expired' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_credentials_expired(Reason,
					     __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('encryption-required' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_encryption_required(Reason,
					     __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('incorrect-encoding' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_incorrect_encoding(Reason,
					    __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('invalid-authzid' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_invalid_authzid(Reason, __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('invalid-mechanism' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_invalid_mechanism(Reason,
					   __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('malformed-request' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_malformed_request(Reason,
					   __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('mechanism-too-weak' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_mechanism_too_weak(Reason,
					    __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('not-authorized' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_not_authorized(Reason, __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('bad-protocol' = Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_bad_protocol(Reason, __TopXMLNS)
     | _acc];
'encode_sasl_failure_$reason'('temporary-auth-failure' =
				  Reason,
			      __TopXMLNS, _acc) ->
    [encode_sasl_failure_temporary_auth_failure(Reason,
						__TopXMLNS)
     | _acc].

decode_sasl_failure_temporary_auth_failure(__TopXMLNS,
					   __Opts,
					   {xmlel, <<"temporary-auth-failure">>,
					    _attrs, _els}) ->
    'temporary-auth-failure'.

encode_sasl_failure_temporary_auth_failure('temporary-auth-failure',
					   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"temporary-auth-failure">>, _attrs, _els}.

decode_sasl_failure_bad_protocol(__TopXMLNS, __Opts,
				 {xmlel, <<"bad-protocol">>, _attrs, _els}) ->
    'bad-protocol'.

encode_sasl_failure_bad_protocol('bad-protocol',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"bad-protocol">>, _attrs, _els}.

decode_sasl_failure_not_authorized(__TopXMLNS, __Opts,
				   {xmlel, <<"not-authorized">>, _attrs,
				    _els}) ->
    'not-authorized'.

encode_sasl_failure_not_authorized('not-authorized',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-authorized">>, _attrs, _els}.

decode_sasl_failure_mechanism_too_weak(__TopXMLNS,
				       __Opts,
				       {xmlel, <<"mechanism-too-weak">>, _attrs,
					_els}) ->
    'mechanism-too-weak'.

encode_sasl_failure_mechanism_too_weak('mechanism-too-weak',
				       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"mechanism-too-weak">>, _attrs, _els}.

decode_sasl_failure_malformed_request(__TopXMLNS,
				      __Opts,
				      {xmlel, <<"malformed-request">>, _attrs,
				       _els}) ->
    'malformed-request'.

encode_sasl_failure_malformed_request('malformed-request',
				      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"malformed-request">>, _attrs, _els}.

decode_sasl_failure_invalid_mechanism(__TopXMLNS,
				      __Opts,
				      {xmlel, <<"invalid-mechanism">>, _attrs,
				       _els}) ->
    'invalid-mechanism'.

encode_sasl_failure_invalid_mechanism('invalid-mechanism',
				      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-mechanism">>, _attrs, _els}.

decode_sasl_failure_invalid_authzid(__TopXMLNS, __Opts,
				    {xmlel, <<"invalid-authzid">>, _attrs,
				     _els}) ->
    'invalid-authzid'.

encode_sasl_failure_invalid_authzid('invalid-authzid',
				    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-authzid">>, _attrs, _els}.

decode_sasl_failure_incorrect_encoding(__TopXMLNS,
				       __Opts,
				       {xmlel, <<"incorrect-encoding">>, _attrs,
					_els}) ->
    'incorrect-encoding'.

encode_sasl_failure_incorrect_encoding('incorrect-encoding',
				       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"incorrect-encoding">>, _attrs, _els}.

decode_sasl_failure_encryption_required(__TopXMLNS,
					__Opts,
					{xmlel, <<"encryption-required">>,
					 _attrs, _els}) ->
    'encryption-required'.

encode_sasl_failure_encryption_required('encryption-required',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"encryption-required">>, _attrs, _els}.

decode_sasl_failure_credentials_expired(__TopXMLNS,
					__Opts,
					{xmlel, <<"credentials-expired">>,
					 _attrs, _els}) ->
    'credentials-expired'.

encode_sasl_failure_credentials_expired('credentials-expired',
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"credentials-expired">>, _attrs, _els}.

decode_sasl_failure_account_disabled(__TopXMLNS, __Opts,
				     {xmlel, <<"account-disabled">>, _attrs,
				      _els}) ->
    'account-disabled'.

encode_sasl_failure_account_disabled('account-disabled',
				     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"account-disabled">>, _attrs, _els}.

decode_sasl_failure_aborted(__TopXMLNS, __Opts,
			    {xmlel, <<"aborted">>, _attrs, _els}) ->
    aborted.

encode_sasl_failure_aborted(aborted, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"aborted">>, _attrs, _els}.

decode_sasl_failure_text(__TopXMLNS, __Opts,
			 {xmlel, <<"text">>, _attrs, _els}) ->
    Data = decode_sasl_failure_text_els(__TopXMLNS, __Opts,
					_els, <<>>),
    Lang = decode_sasl_failure_text_attrs(__TopXMLNS,
					  _attrs, undefined),
    {text, Lang, Data}.

decode_sasl_failure_text_els(__TopXMLNS, __Opts, [],
			     Data) ->
    decode_sasl_failure_text_cdata(__TopXMLNS, Data);
decode_sasl_failure_text_els(__TopXMLNS, __Opts,
			     [{xmlcdata, _data} | _els], Data) ->
    decode_sasl_failure_text_els(__TopXMLNS, __Opts, _els,
				 <<Data/binary, _data/binary>>);
decode_sasl_failure_text_els(__TopXMLNS, __Opts,
			     [_ | _els], Data) ->
    decode_sasl_failure_text_els(__TopXMLNS, __Opts, _els,
				 Data).

decode_sasl_failure_text_attrs(__TopXMLNS,
			       [{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_sasl_failure_text_attrs(__TopXMLNS, _attrs,
				   _val);
decode_sasl_failure_text_attrs(__TopXMLNS, [_ | _attrs],
			       Lang) ->
    decode_sasl_failure_text_attrs(__TopXMLNS, _attrs,
				   Lang);
decode_sasl_failure_text_attrs(__TopXMLNS, [], Lang) ->
    'decode_sasl_failure_text_attr_xml:lang'(__TopXMLNS,
					     Lang).

encode_sasl_failure_text({text, Lang, Data},
			 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = encode_sasl_failure_text_cdata(Data, []),
    _attrs = 'encode_sasl_failure_text_attr_xml:lang'(Lang,
						      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
										 __TopXMLNS)),
    {xmlel, <<"text">>, _attrs, _els}.

'decode_sasl_failure_text_attr_xml:lang'(__TopXMLNS,
					 undefined) ->
    <<>>;
'decode_sasl_failure_text_attr_xml:lang'(__TopXMLNS,
					 _val) ->
    _val.

'encode_sasl_failure_text_attr_xml:lang'(<<>>, _acc) ->
    _acc;
'encode_sasl_failure_text_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_sasl_failure_text_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_sasl_failure_text_cdata(__TopXMLNS, _val) ->
    _val.

encode_sasl_failure_text_cdata(<<>>, _acc) -> _acc;
encode_sasl_failure_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_sasl_success(__TopXMLNS, __Opts,
		    {xmlel, <<"success">>, _attrs, _els}) ->
    Text = decode_sasl_success_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    {sasl_success, Text}.

decode_sasl_success_els(__TopXMLNS, __Opts, [], Text) ->
    decode_sasl_success_cdata(__TopXMLNS, Text);
decode_sasl_success_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Text) ->
    decode_sasl_success_els(__TopXMLNS, __Opts, _els,
			    <<Text/binary, _data/binary>>);
decode_sasl_success_els(__TopXMLNS, __Opts, [_ | _els],
			Text) ->
    decode_sasl_success_els(__TopXMLNS, __Opts, _els, Text).

encode_sasl_success({sasl_success, Text}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = encode_sasl_success_cdata(Text, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"success">>, _attrs, _els}.

decode_sasl_success_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl_success_cdata(__TopXMLNS, _val) ->
    case catch base64:mime_decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"success">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sasl_success_cdata(<<>>, _acc) -> _acc;
encode_sasl_success_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_sasl_response(__TopXMLNS, __Opts,
		     {xmlel, <<"response">>, _attrs, _els}) ->
    Text = decode_sasl_response_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    {sasl_response, Text}.

decode_sasl_response_els(__TopXMLNS, __Opts, [],
			 Text) ->
    decode_sasl_response_cdata(__TopXMLNS, Text);
decode_sasl_response_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Text) ->
    decode_sasl_response_els(__TopXMLNS, __Opts, _els,
			     <<Text/binary, _data/binary>>);
decode_sasl_response_els(__TopXMLNS, __Opts, [_ | _els],
			 Text) ->
    decode_sasl_response_els(__TopXMLNS, __Opts, _els,
			     Text).

encode_sasl_response({sasl_response, Text},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = encode_sasl_response_cdata(Text, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"response">>, _attrs, _els}.

decode_sasl_response_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl_response_cdata(__TopXMLNS, _val) ->
    case catch base64:mime_decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"response">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sasl_response_cdata(<<>>, _acc) -> _acc;
encode_sasl_response_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_sasl_challenge(__TopXMLNS, __Opts,
		      {xmlel, <<"challenge">>, _attrs, _els}) ->
    Text = decode_sasl_challenge_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    {sasl_challenge, Text}.

decode_sasl_challenge_els(__TopXMLNS, __Opts, [],
			  Text) ->
    decode_sasl_challenge_cdata(__TopXMLNS, Text);
decode_sasl_challenge_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Text) ->
    decode_sasl_challenge_els(__TopXMLNS, __Opts, _els,
			      <<Text/binary, _data/binary>>);
decode_sasl_challenge_els(__TopXMLNS, __Opts,
			  [_ | _els], Text) ->
    decode_sasl_challenge_els(__TopXMLNS, __Opts, _els,
			      Text).

encode_sasl_challenge({sasl_challenge, Text},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = encode_sasl_challenge_cdata(Text, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"challenge">>, _attrs, _els}.

decode_sasl_challenge_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl_challenge_cdata(__TopXMLNS, _val) ->
    case catch base64:mime_decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"challenge">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sasl_challenge_cdata(<<>>, _acc) -> _acc;
encode_sasl_challenge_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_sasl_abort(__TopXMLNS, __Opts,
		  {xmlel, <<"abort">>, _attrs, _els}) ->
    {sasl_abort}.

encode_sasl_abort({sasl_abort}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"abort">>, _attrs, _els}.

decode_sasl_auth(__TopXMLNS, __Opts,
		 {xmlel, <<"auth">>, _attrs, _els}) ->
    Text = decode_sasl_auth_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Mechanism = decode_sasl_auth_attrs(__TopXMLNS, _attrs,
				       undefined),
    {sasl_auth, Mechanism, Text}.

decode_sasl_auth_els(__TopXMLNS, __Opts, [], Text) ->
    decode_sasl_auth_cdata(__TopXMLNS, Text);
decode_sasl_auth_els(__TopXMLNS, __Opts,
		     [{xmlcdata, _data} | _els], Text) ->
    decode_sasl_auth_els(__TopXMLNS, __Opts, _els,
			 <<Text/binary, _data/binary>>);
decode_sasl_auth_els(__TopXMLNS, __Opts, [_ | _els],
		     Text) ->
    decode_sasl_auth_els(__TopXMLNS, __Opts, _els, Text).

decode_sasl_auth_attrs(__TopXMLNS,
		       [{<<"mechanism">>, _val} | _attrs], _Mechanism) ->
    decode_sasl_auth_attrs(__TopXMLNS, _attrs, _val);
decode_sasl_auth_attrs(__TopXMLNS, [_ | _attrs],
		       Mechanism) ->
    decode_sasl_auth_attrs(__TopXMLNS, _attrs, Mechanism);
decode_sasl_auth_attrs(__TopXMLNS, [], Mechanism) ->
    decode_sasl_auth_attr_mechanism(__TopXMLNS, Mechanism).

encode_sasl_auth({sasl_auth, Mechanism, Text},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-sasl">>,
				    [], __TopXMLNS),
    _els = encode_sasl_auth_cdata(Text, []),
    _attrs = encode_sasl_auth_attr_mechanism(Mechanism,
					     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									__TopXMLNS)),
    {xmlel, <<"auth">>, _attrs, _els}.

decode_sasl_auth_attr_mechanism(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"mechanism">>, <<"auth">>,
		   __TopXMLNS}});
decode_sasl_auth_attr_mechanism(__TopXMLNS, _val) ->
    _val.

encode_sasl_auth_attr_mechanism(_val, _acc) ->
    [{<<"mechanism">>, _val} | _acc].

decode_sasl_auth_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_sasl_auth_cdata(__TopXMLNS, _val) ->
    case catch base64:mime_decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"auth">>, __TopXMLNS}});
      _res -> _res
    end.

encode_sasl_auth_cdata(<<>>, _acc) -> _acc;
encode_sasl_auth_cdata(_val, _acc) ->
    [{xmlcdata, base64:encode(_val)} | _acc].

decode_bind(__TopXMLNS, __Opts,
	    {xmlel, <<"bind">>, _attrs, _els}) ->
    {Jid, Resource} = decode_bind_els(__TopXMLNS, __Opts,
				      _els, undefined, <<>>),
    {bind, Jid, Resource}.

decode_bind_els(__TopXMLNS, __Opts, [], Jid,
		Resource) ->
    {Jid, Resource};
decode_bind_els(__TopXMLNS, __Opts,
		[{xmlel, <<"jid">>, _attrs, _} = _el | _els], Jid,
		Resource) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-bind">> ->
	  decode_bind_els(__TopXMLNS, __Opts, _els,
			  decode_bind_jid(<<"urn:ietf:params:xml:ns:xmpp-bind">>,
					  __Opts, _el),
			  Resource);
      _ ->
	  decode_bind_els(__TopXMLNS, __Opts, _els, Jid, Resource)
    end;
decode_bind_els(__TopXMLNS, __Opts,
		[{xmlel, <<"resource">>, _attrs, _} = _el | _els], Jid,
		Resource) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-bind">> ->
	  decode_bind_els(__TopXMLNS, __Opts, _els, Jid,
			  decode_bind_resource(<<"urn:ietf:params:xml:ns:xmpp-bind">>,
					       __Opts, _el));
      _ ->
	  decode_bind_els(__TopXMLNS, __Opts, _els, Jid, Resource)
    end;
decode_bind_els(__TopXMLNS, __Opts, [_ | _els], Jid,
		Resource) ->
    decode_bind_els(__TopXMLNS, __Opts, _els, Jid,
		    Resource).

encode_bind({bind, Jid, Resource}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-bind">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_bind_$jid'(Jid,
					    __NewTopXMLNS,
					    'encode_bind_$resource'(Resource,
								    __NewTopXMLNS,
								    []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"bind">>, _attrs, _els}.

'encode_bind_$jid'(undefined, __TopXMLNS, _acc) -> _acc;
'encode_bind_$jid'(Jid, __TopXMLNS, _acc) ->
    [encode_bind_jid(Jid, __TopXMLNS) | _acc].

'encode_bind_$resource'(<<>>, __TopXMLNS, _acc) -> _acc;
'encode_bind_$resource'(Resource, __TopXMLNS, _acc) ->
    [encode_bind_resource(Resource, __TopXMLNS) | _acc].

decode_bind_resource(__TopXMLNS, __Opts,
		     {xmlel, <<"resource">>, _attrs, _els}) ->
    Cdata = decode_bind_resource_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_bind_resource_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_bind_resource_cdata(__TopXMLNS, Cdata);
decode_bind_resource_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_bind_resource_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_bind_resource_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_bind_resource_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_bind_resource(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-bind">>,
				    [], __TopXMLNS),
    _els = encode_bind_resource_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"resource">>, _attrs, _els}.

decode_bind_resource_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_bind_resource_cdata(__TopXMLNS, _val) ->
    case catch check_resource(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"resource">>, __TopXMLNS}});
      _res -> _res
    end.

encode_bind_resource_cdata(<<>>, _acc) -> _acc;
encode_bind_resource_cdata(_val, _acc) ->
    [{xmlcdata, check_resource(_val)} | _acc].

decode_bind_jid(__TopXMLNS, __Opts,
		{xmlel, <<"jid">>, _attrs, _els}) ->
    Cdata = decode_bind_jid_els(__TopXMLNS, __Opts, _els,
				<<>>),
    Cdata.

decode_bind_jid_els(__TopXMLNS, __Opts, [], Cdata) ->
    decode_bind_jid_cdata(__TopXMLNS, Cdata);
decode_bind_jid_els(__TopXMLNS, __Opts,
		    [{xmlcdata, _data} | _els], Cdata) ->
    decode_bind_jid_els(__TopXMLNS, __Opts, _els,
			<<Cdata/binary, _data/binary>>);
decode_bind_jid_els(__TopXMLNS, __Opts, [_ | _els],
		    Cdata) ->
    decode_bind_jid_els(__TopXMLNS, __Opts, _els, Cdata).

encode_bind_jid(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-bind">>,
				    [], __TopXMLNS),
    _els = encode_bind_jid_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"jid">>, _attrs, _els}.

decode_bind_jid_cdata(__TopXMLNS, <<>>) -> undefined;
decode_bind_jid_cdata(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"jid">>, __TopXMLNS}});
      _res -> _res
    end.

encode_bind_jid_cdata(undefined, _acc) -> _acc;
encode_bind_jid_cdata(_val, _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].

decode_error(__TopXMLNS, __Opts,
	     {xmlel, <<"error">>, _attrs, _els}) ->
    {Text, Reason, __Els} = decode_error_els(__TopXMLNS,
					     __Opts, _els, undefined, undefined,
					     []),
    {Type, Code, By} = decode_error_attrs(__TopXMLNS,
					  _attrs, undefined, undefined,
					  undefined),
    {stanza_error, Type, Code, By, Reason, Text, __Els}.

decode_error_els(__TopXMLNS, __Opts, [], Text, Reason,
		 __Els) ->
    {Text, Reason, lists:reverse(__Els)};
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"text">>, _attrs, _} = _el | _els], Text,
		 Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els,
			   decode_error_text(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
					     __Opts, _el),
			   Reason, __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"bad-request">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_bad_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"conflict">>, _attrs, _} = _el | _els], Text,
		 Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_conflict(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						 __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"feature-not-implemented">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_feature_not_implemented(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								__Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"forbidden">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_forbidden(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						  __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"gone">>, _attrs, _} = _el | _els], Text,
		 Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_gone(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
					     __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"internal-server-error">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_internal_server_error(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"item-not-found">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_item_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						       __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"jid-malformed">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_jid_malformed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"not-acceptable">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_not_acceptable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						       __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"not-allowed">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_not_allowed(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"not-authorized">>, _attrs, _} = _el | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_not_authorized(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						       __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"payment-required">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_payment_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							 __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"policy-violation">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_policy_violation(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							 __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"recipient-unavailable">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_recipient_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"redirect">>, _attrs, _} = _el | _els], Text,
		 Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_redirect(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
						 __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"registration-required">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_registration_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"remote-server-not-found">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_remote_server_not_found(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
								__Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"remote-server-timeout">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_remote_server_timeout(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"resource-constraint">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_resource_constraint(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"service-unavailable">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_service_unavailable(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"subscription-required">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_subscription_required(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							      __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"undefined-condition">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_undefined_condition(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							    __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, <<"unexpected-request">>, _attrs, _} = _el
		  | _els],
		 Text, Reason, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:ietf:params:xml:ns:xmpp-stanzas">> ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text,
			   decode_error_unexpected_request(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
							   __Opts, _el),
			   __Els);
      _ ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   __Els)
    end;
decode_error_els(__TopXMLNS, __Opts,
		 [{xmlel, _name, _attrs, _} = _el | _els], Text, Reason,
		 __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
			   [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
				 __Els);
	    Mod ->
		decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
				 [Mod:do_decode(_name, __XMLNS, _el, __Opts)
				  | __Els])
	  end
    end;
decode_error_els(__TopXMLNS, __Opts, [_ | _els], Text,
		 Reason, __Els) ->
    decode_error_els(__TopXMLNS, __Opts, _els, Text, Reason,
		     __Els).

decode_error_attrs(__TopXMLNS,
		   [{<<"type">>, _val} | _attrs], _Type, Code, By) ->
    decode_error_attrs(__TopXMLNS, _attrs, _val, Code, By);
decode_error_attrs(__TopXMLNS,
		   [{<<"code">>, _val} | _attrs], Type, _Code, By) ->
    decode_error_attrs(__TopXMLNS, _attrs, Type, _val, By);
decode_error_attrs(__TopXMLNS,
		   [{<<"by">>, _val} | _attrs], Type, Code, _By) ->
    decode_error_attrs(__TopXMLNS, _attrs, Type, Code,
		       _val);
decode_error_attrs(__TopXMLNS, [_ | _attrs], Type, Code,
		   By) ->
    decode_error_attrs(__TopXMLNS, _attrs, Type, Code, By);
decode_error_attrs(__TopXMLNS, [], Type, Code, By) ->
    {decode_error_attr_type(__TopXMLNS, Type),
     decode_error_attr_code(__TopXMLNS, Code),
     decode_error_attr_by(__TopXMLNS, By)}.

encode_error({stanza_error, Type, Code, By, Reason,
	      Text, __Els},
	     __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els]
	     ++
	     lists:reverse('encode_error_$text'(Text, __NewTopXMLNS,
						'encode_error_$reason'(Reason,
								       __NewTopXMLNS,
								       []))),
    _attrs = encode_error_attr_by(By,
				  encode_error_attr_code(Code,
							 encode_error_attr_type(Type,
										xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													   __TopXMLNS)))),
    {xmlel, <<"error">>, _attrs, _els}.

'encode_error_$text'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_error_$text'(Text, __TopXMLNS, _acc) ->
    [encode_error_text(Text, __TopXMLNS) | _acc].

'encode_error_$reason'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_error_$reason'('bad-request' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_bad_request(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'(conflict = Reason, __TopXMLNS,
		       _acc) ->
    [encode_error_conflict(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('feature-not-implemented' =
			   Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_feature_not_implemented(Reason,
					  __TopXMLNS)
     | _acc];
'encode_error_$reason'(forbidden = Reason, __TopXMLNS,
		       _acc) ->
    [encode_error_forbidden(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'({gone, _} = Reason, __TopXMLNS,
		       _acc) ->
    [encode_error_gone(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('internal-server-error' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_internal_server_error(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('item-not-found' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_item_not_found(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('jid-malformed' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_jid_malformed(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('not-acceptable' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_not_acceptable(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('not-allowed' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_not_allowed(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('not-authorized' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_not_authorized(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('payment-required' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_payment_required(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('policy-violation' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_policy_violation(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('recipient-unavailable' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_recipient_unavailable(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'({redirect, _} = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_redirect(Reason, __TopXMLNS) | _acc];
'encode_error_$reason'('registration-required' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_registration_required(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('remote-server-not-found' =
			   Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_remote_server_not_found(Reason,
					  __TopXMLNS)
     | _acc];
'encode_error_$reason'('remote-server-timeout' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_remote_server_timeout(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('resource-constraint' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_resource_constraint(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('service-unavailable' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_service_unavailable(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('subscription-required' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_subscription_required(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('undefined-condition' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_undefined_condition(Reason, __TopXMLNS)
     | _acc];
'encode_error_$reason'('unexpected-request' = Reason,
		       __TopXMLNS, _acc) ->
    [encode_error_unexpected_request(Reason, __TopXMLNS)
     | _acc].

decode_error_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"error">>, __TopXMLNS}});
decode_error_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[auth, cancel, continue, modify, wait])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"error">>, __TopXMLNS}});
      _res -> _res
    end.

encode_error_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_error_attr_code(__TopXMLNS, undefined) ->
    undefined;
decode_error_attr_code(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"code">>, <<"error">>, __TopXMLNS}});
      _res -> _res
    end.

encode_error_attr_code(undefined, _acc) -> _acc;
encode_error_attr_code(_val, _acc) ->
    [{<<"code">>, enc_int(_val)} | _acc].

decode_error_attr_by(__TopXMLNS, undefined) -> <<>>;
decode_error_attr_by(__TopXMLNS, _val) -> _val.

encode_error_attr_by(<<>>, _acc) -> _acc;
encode_error_attr_by(_val, _acc) ->
    [{<<"by">>, _val} | _acc].

decode_error_text(__TopXMLNS, __Opts,
		  {xmlel, <<"text">>, _attrs, _els}) ->
    Data = decode_error_text_els(__TopXMLNS, __Opts, _els,
				 <<>>),
    Lang = decode_error_text_attrs(__TopXMLNS, _attrs,
				   undefined),
    {text, Lang, Data}.

decode_error_text_els(__TopXMLNS, __Opts, [], Data) ->
    decode_error_text_cdata(__TopXMLNS, Data);
decode_error_text_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Data) ->
    decode_error_text_els(__TopXMLNS, __Opts, _els,
			  <<Data/binary, _data/binary>>);
decode_error_text_els(__TopXMLNS, __Opts, [_ | _els],
		      Data) ->
    decode_error_text_els(__TopXMLNS, __Opts, _els, Data).

decode_error_text_attrs(__TopXMLNS,
			[{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_error_text_attrs(__TopXMLNS, _attrs, _val);
decode_error_text_attrs(__TopXMLNS, [_ | _attrs],
			Lang) ->
    decode_error_text_attrs(__TopXMLNS, _attrs, Lang);
decode_error_text_attrs(__TopXMLNS, [], Lang) ->
    'decode_error_text_attr_xml:lang'(__TopXMLNS, Lang).

encode_error_text({text, Lang, Data}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = encode_error_text_cdata(Data, []),
    _attrs = 'encode_error_text_attr_xml:lang'(Lang,
					       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									  __TopXMLNS)),
    {xmlel, <<"text">>, _attrs, _els}.

'decode_error_text_attr_xml:lang'(__TopXMLNS,
				  undefined) ->
    <<>>;
'decode_error_text_attr_xml:lang'(__TopXMLNS, _val) ->
    _val.

'encode_error_text_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_error_text_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_error_text_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_error_text_cdata(__TopXMLNS, _val) -> _val.

encode_error_text_cdata(<<>>, _acc) -> _acc;
encode_error_text_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_error_unexpected_request(__TopXMLNS, __Opts,
				{xmlel, <<"unexpected-request">>, _attrs,
				 _els}) ->
    'unexpected-request'.

encode_error_unexpected_request('unexpected-request',
				__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unexpected-request">>, _attrs, _els}.

decode_error_undefined_condition(__TopXMLNS, __Opts,
				 {xmlel, <<"undefined-condition">>, _attrs,
				  _els}) ->
    'undefined-condition'.

encode_error_undefined_condition('undefined-condition',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"undefined-condition">>, _attrs, _els}.

decode_error_subscription_required(__TopXMLNS, __Opts,
				   {xmlel, <<"subscription-required">>, _attrs,
				    _els}) ->
    'subscription-required'.

encode_error_subscription_required('subscription-required',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"subscription-required">>, _attrs, _els}.

decode_error_service_unavailable(__TopXMLNS, __Opts,
				 {xmlel, <<"service-unavailable">>, _attrs,
				  _els}) ->
    'service-unavailable'.

encode_error_service_unavailable('service-unavailable',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"service-unavailable">>, _attrs, _els}.

decode_error_resource_constraint(__TopXMLNS, __Opts,
				 {xmlel, <<"resource-constraint">>, _attrs,
				  _els}) ->
    'resource-constraint'.

encode_error_resource_constraint('resource-constraint',
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"resource-constraint">>, _attrs, _els}.

decode_error_remote_server_timeout(__TopXMLNS, __Opts,
				   {xmlel, <<"remote-server-timeout">>, _attrs,
				    _els}) ->
    'remote-server-timeout'.

encode_error_remote_server_timeout('remote-server-timeout',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"remote-server-timeout">>, _attrs, _els}.

decode_error_remote_server_not_found(__TopXMLNS, __Opts,
				     {xmlel, <<"remote-server-not-found">>,
				      _attrs, _els}) ->
    'remote-server-not-found'.

encode_error_remote_server_not_found('remote-server-not-found',
				     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"remote-server-not-found">>, _attrs, _els}.

decode_error_registration_required(__TopXMLNS, __Opts,
				   {xmlel, <<"registration-required">>, _attrs,
				    _els}) ->
    'registration-required'.

encode_error_registration_required('registration-required',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"registration-required">>, _attrs, _els}.

decode_error_redirect(__TopXMLNS, __Opts,
		      {xmlel, <<"redirect">>, _attrs, _els}) ->
    Uri = decode_error_redirect_els(__TopXMLNS, __Opts,
				    _els, <<>>),
    {redirect, Uri}.

decode_error_redirect_els(__TopXMLNS, __Opts, [],
			  Uri) ->
    decode_error_redirect_cdata(__TopXMLNS, Uri);
decode_error_redirect_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Uri) ->
    decode_error_redirect_els(__TopXMLNS, __Opts, _els,
			      <<Uri/binary, _data/binary>>);
decode_error_redirect_els(__TopXMLNS, __Opts,
			  [_ | _els], Uri) ->
    decode_error_redirect_els(__TopXMLNS, __Opts, _els,
			      Uri).

encode_error_redirect({redirect, Uri}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = encode_error_redirect_cdata(Uri, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"redirect">>, _attrs, _els}.

decode_error_redirect_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_error_redirect_cdata(__TopXMLNS, _val) -> _val.

encode_error_redirect_cdata(<<>>, _acc) -> _acc;
encode_error_redirect_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_error_recipient_unavailable(__TopXMLNS, __Opts,
				   {xmlel, <<"recipient-unavailable">>, _attrs,
				    _els}) ->
    'recipient-unavailable'.

encode_error_recipient_unavailable('recipient-unavailable',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"recipient-unavailable">>, _attrs, _els}.

decode_error_policy_violation(__TopXMLNS, __Opts,
			      {xmlel, <<"policy-violation">>, _attrs, _els}) ->
    'policy-violation'.

encode_error_policy_violation('policy-violation',
			      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"policy-violation">>, _attrs, _els}.

decode_error_payment_required(__TopXMLNS, __Opts,
			      {xmlel, <<"payment-required">>, _attrs, _els}) ->
    'payment-required'.

encode_error_payment_required('payment-required',
			      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"payment-required">>, _attrs, _els}.

decode_error_not_authorized(__TopXMLNS, __Opts,
			    {xmlel, <<"not-authorized">>, _attrs, _els}) ->
    'not-authorized'.

encode_error_not_authorized('not-authorized',
			    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-authorized">>, _attrs, _els}.

decode_error_not_allowed(__TopXMLNS, __Opts,
			 {xmlel, <<"not-allowed">>, _attrs, _els}) ->
    'not-allowed'.

encode_error_not_allowed('not-allowed', __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-allowed">>, _attrs, _els}.

decode_error_not_acceptable(__TopXMLNS, __Opts,
			    {xmlel, <<"not-acceptable">>, _attrs, _els}) ->
    'not-acceptable'.

encode_error_not_acceptable('not-acceptable',
			    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-acceptable">>, _attrs, _els}.

decode_error_jid_malformed(__TopXMLNS, __Opts,
			   {xmlel, <<"jid-malformed">>, _attrs, _els}) ->
    'jid-malformed'.

encode_error_jid_malformed('jid-malformed',
			   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"jid-malformed">>, _attrs, _els}.

decode_error_item_not_found(__TopXMLNS, __Opts,
			    {xmlel, <<"item-not-found">>, _attrs, _els}) ->
    'item-not-found'.

encode_error_item_not_found('item-not-found',
			    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"item-not-found">>, _attrs, _els}.

decode_error_internal_server_error(__TopXMLNS, __Opts,
				   {xmlel, <<"internal-server-error">>, _attrs,
				    _els}) ->
    'internal-server-error'.

encode_error_internal_server_error('internal-server-error',
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"internal-server-error">>, _attrs, _els}.

decode_error_gone(__TopXMLNS, __Opts,
		  {xmlel, <<"gone">>, _attrs, _els}) ->
    Uri = decode_error_gone_els(__TopXMLNS, __Opts, _els,
				<<>>),
    {gone, Uri}.

decode_error_gone_els(__TopXMLNS, __Opts, [], Uri) ->
    decode_error_gone_cdata(__TopXMLNS, Uri);
decode_error_gone_els(__TopXMLNS, __Opts,
		      [{xmlcdata, _data} | _els], Uri) ->
    decode_error_gone_els(__TopXMLNS, __Opts, _els,
			  <<Uri/binary, _data/binary>>);
decode_error_gone_els(__TopXMLNS, __Opts, [_ | _els],
		      Uri) ->
    decode_error_gone_els(__TopXMLNS, __Opts, _els, Uri).

encode_error_gone({gone, Uri}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = encode_error_gone_cdata(Uri, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"gone">>, _attrs, _els}.

decode_error_gone_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_error_gone_cdata(__TopXMLNS, _val) -> _val.

encode_error_gone_cdata(<<>>, _acc) -> _acc;
encode_error_gone_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_error_forbidden(__TopXMLNS, __Opts,
		       {xmlel, <<"forbidden">>, _attrs, _els}) ->
    forbidden.

encode_error_forbidden(forbidden, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"forbidden">>, _attrs, _els}.

decode_error_feature_not_implemented(__TopXMLNS, __Opts,
				     {xmlel, <<"feature-not-implemented">>,
				      _attrs, _els}) ->
    'feature-not-implemented'.

encode_error_feature_not_implemented('feature-not-implemented',
				     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"feature-not-implemented">>, _attrs, _els}.

decode_error_conflict(__TopXMLNS, __Opts,
		      {xmlel, <<"conflict">>, _attrs, _els}) ->
    conflict.

encode_error_conflict(conflict, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"conflict">>, _attrs, _els}.

decode_error_bad_request(__TopXMLNS, __Opts,
			 {xmlel, <<"bad-request">>, _attrs, _els}) ->
    'bad-request'.

encode_error_bad_request('bad-request', __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:ietf:params:xml:ns:xmpp-stanzas">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"bad-request">>, _attrs, _els}.

decode_presence(__TopXMLNS, __Opts,
		{xmlel, <<"presence">>, _attrs, _els}) ->
    {Status, Show, Priority, __Els} =
	decode_presence_els(__TopXMLNS, __Opts, _els, [],
			    undefined, undefined, []),
    {Id, Type, From, To, Lang} =
	decode_presence_attrs(__TopXMLNS, _attrs, undefined,
			      undefined, undefined, undefined, undefined),
    {presence, Id, Type, Lang, From, To, Show, Status,
     Priority, __Els, #{}}.

decode_presence_els(__TopXMLNS, __Opts, [], Status,
		    Show, Priority, __Els) ->
    {lists:reverse(Status), Show, Priority,
     lists:reverse(__Els)};
decode_presence_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"show">>, _attrs, _} = _el | _els], Status,
		    Show, Priority, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:client">> ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      decode_presence_show(<<"jabber:client">>, __Opts,
						   _el),
			      Priority, __Els);
      <<"jabber:server">> ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      decode_presence_show(<<"jabber:server">>, __Opts,
						   _el),
			      Priority, __Els);
      <<"jabber:component:accept">> ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      decode_presence_show(<<"jabber:component:accept">>,
						   __Opts, _el),
			      Priority, __Els);
      _ ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      Show, Priority, __Els)
    end;
decode_presence_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"status">>, _attrs, _} = _el | _els], Status,
		    Show, Priority, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:client">> ->
	  decode_presence_els(__TopXMLNS, __Opts, _els,
			      [decode_presence_status(<<"jabber:client">>,
						      __Opts, _el)
			       | Status],
			      Show, Priority, __Els);
      <<"jabber:server">> ->
	  decode_presence_els(__TopXMLNS, __Opts, _els,
			      [decode_presence_status(<<"jabber:server">>,
						      __Opts, _el)
			       | Status],
			      Show, Priority, __Els);
      <<"jabber:component:accept">> ->
	  decode_presence_els(__TopXMLNS, __Opts, _els,
			      [decode_presence_status(<<"jabber:component:accept">>,
						      __Opts, _el)
			       | Status],
			      Show, Priority, __Els);
      _ ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      Show, Priority, __Els)
    end;
decode_presence_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"priority">>, _attrs, _} = _el | _els],
		    Status, Show, Priority, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:client">> ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      Show,
			      decode_presence_priority(<<"jabber:client">>,
						       __Opts, _el),
			      __Els);
      <<"jabber:server">> ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      Show,
			      decode_presence_priority(<<"jabber:server">>,
						       __Opts, _el),
			      __Els);
      <<"jabber:component:accept">> ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      Show,
			      decode_presence_priority(<<"jabber:component:accept">>,
						       __Opts, _el),
			      __Els);
      _ ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      Show, Priority, __Els)
    end;
decode_presence_els(__TopXMLNS, __Opts,
		    [{xmlel, _name, _attrs, _} = _el | _els], Status, Show,
		    Priority, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			      Show, Priority, [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_presence_els(__TopXMLNS, __Opts, _els, Status,
				    Show, Priority, __Els);
	    Mod ->
		decode_presence_els(__TopXMLNS, __Opts, _els, Status,
				    Show, Priority,
				    [Mod:do_decode(_name, __XMLNS, _el, __Opts)
				     | __Els])
	  end
    end;
decode_presence_els(__TopXMLNS, __Opts, [_ | _els],
		    Status, Show, Priority, __Els) ->
    decode_presence_els(__TopXMLNS, __Opts, _els, Status,
			Show, Priority, __Els).

decode_presence_attrs(__TopXMLNS,
		      [{<<"id">>, _val} | _attrs], _Id, Type, From, To,
		      Lang) ->
    decode_presence_attrs(__TopXMLNS, _attrs, _val, Type,
			  From, To, Lang);
decode_presence_attrs(__TopXMLNS,
		      [{<<"type">>, _val} | _attrs], Id, _Type, From, To,
		      Lang) ->
    decode_presence_attrs(__TopXMLNS, _attrs, Id, _val,
			  From, To, Lang);
decode_presence_attrs(__TopXMLNS,
		      [{<<"from">>, _val} | _attrs], Id, Type, _From, To,
		      Lang) ->
    decode_presence_attrs(__TopXMLNS, _attrs, Id, Type,
			  _val, To, Lang);
decode_presence_attrs(__TopXMLNS,
		      [{<<"to">>, _val} | _attrs], Id, Type, From, _To,
		      Lang) ->
    decode_presence_attrs(__TopXMLNS, _attrs, Id, Type,
			  From, _val, Lang);
decode_presence_attrs(__TopXMLNS,
		      [{<<"xml:lang">>, _val} | _attrs], Id, Type, From, To,
		      _Lang) ->
    decode_presence_attrs(__TopXMLNS, _attrs, Id, Type,
			  From, To, _val);
decode_presence_attrs(__TopXMLNS, [_ | _attrs], Id,
		      Type, From, To, Lang) ->
    decode_presence_attrs(__TopXMLNS, _attrs, Id, Type,
			  From, To, Lang);
decode_presence_attrs(__TopXMLNS, [], Id, Type, From,
		      To, Lang) ->
    {decode_presence_attr_id(__TopXMLNS, Id),
     decode_presence_attr_type(__TopXMLNS, Type),
     decode_presence_attr_from(__TopXMLNS, From),
     decode_presence_attr_to(__TopXMLNS, To),
     'decode_presence_attr_xml:lang'(__TopXMLNS, Lang)}.

encode_presence({presence, Id, Type, Lang, From, To,
		 Show, Status, Priority, __Els, _},
		__TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els]
	     ++
	     lists:reverse('encode_presence_$status'(Status,
						     __NewTopXMLNS,
						     'encode_presence_$show'(Show,
									     __NewTopXMLNS,
									     'encode_presence_$priority'(Priority,
													 __NewTopXMLNS,
													 [])))),
    _attrs = 'encode_presence_attr_xml:lang'(Lang,
					     encode_presence_attr_to(To,
								     encode_presence_attr_from(From,
											       encode_presence_attr_type(Type,
															 encode_presence_attr_id(Id,
																		 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																					    __TopXMLNS)))))),
    {xmlel, <<"presence">>, _attrs, _els}.

'encode_presence_$status'([], __TopXMLNS, _acc) -> _acc;
'encode_presence_$status'([Status | _els], __TopXMLNS,
			  _acc) ->
    'encode_presence_$status'(_els, __TopXMLNS,
			      [encode_presence_status(Status, __TopXMLNS)
			       | _acc]).

'encode_presence_$show'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_presence_$show'(Show, __TopXMLNS, _acc) ->
    [encode_presence_show(Show, __TopXMLNS) | _acc].

'encode_presence_$priority'(undefined, __TopXMLNS,
			    _acc) ->
    _acc;
'encode_presence_$priority'(Priority, __TopXMLNS,
			    _acc) ->
    [encode_presence_priority(Priority, __TopXMLNS) | _acc].

decode_presence_attr_id(__TopXMLNS, undefined) -> <<>>;
decode_presence_attr_id(__TopXMLNS, _val) -> _val.

encode_presence_attr_id(<<>>, _acc) -> _acc;
encode_presence_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_presence_attr_type(__TopXMLNS, undefined) ->
    available;
decode_presence_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[unavailable, subscribe, subscribed, unsubscribe,
			 unsubscribed, available, probe, error])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"presence">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_presence_attr_type(available, _acc) -> _acc;
encode_presence_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_presence_attr_from(__TopXMLNS, undefined) ->
    undefined;
decode_presence_attr_from(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"presence">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_presence_attr_from(undefined, _acc) -> _acc;
encode_presence_attr_from(_val, _acc) ->
    [{<<"from">>, jid:encode(_val)} | _acc].

decode_presence_attr_to(__TopXMLNS, undefined) ->
    undefined;
decode_presence_attr_to(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"presence">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_presence_attr_to(undefined, _acc) -> _acc;
encode_presence_attr_to(_val, _acc) ->
    [{<<"to">>, jid:encode(_val)} | _acc].

'decode_presence_attr_xml:lang'(__TopXMLNS,
				undefined) ->
    <<>>;
'decode_presence_attr_xml:lang'(__TopXMLNS, _val) ->
    _val.

'encode_presence_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_presence_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_presence_priority(__TopXMLNS, __Opts,
			 {xmlel, <<"priority">>, _attrs, _els}) ->
    Cdata = decode_presence_priority_els(__TopXMLNS, __Opts,
					 _els, <<>>),
    Cdata.

decode_presence_priority_els(__TopXMLNS, __Opts, [],
			     Cdata) ->
    decode_presence_priority_cdata(__TopXMLNS, Cdata);
decode_presence_priority_els(__TopXMLNS, __Opts,
			     [{xmlcdata, _data} | _els], Cdata) ->
    decode_presence_priority_els(__TopXMLNS, __Opts, _els,
				 <<Cdata/binary, _data/binary>>);
decode_presence_priority_els(__TopXMLNS, __Opts,
			     [_ | _els], Cdata) ->
    decode_presence_priority_els(__TopXMLNS, __Opts, _els,
				 Cdata).

encode_presence_priority(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = encode_presence_priority_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"priority">>, _attrs, _els}.

decode_presence_priority_cdata(__TopXMLNS, <<>>) ->
    undefined;
decode_presence_priority_cdata(__TopXMLNS, _val) ->
    case catch dec_int(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"priority">>, __TopXMLNS}});
      _res -> _res
    end.

encode_presence_priority_cdata(undefined, _acc) -> _acc;
encode_presence_priority_cdata(_val, _acc) ->
    [{xmlcdata, enc_int(_val)} | _acc].

decode_presence_status(__TopXMLNS, __Opts,
		       {xmlel, <<"status">>, _attrs, _els}) ->
    Data = decode_presence_status_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Lang = decode_presence_status_attrs(__TopXMLNS, _attrs,
					undefined),
    {text, Lang, Data}.

decode_presence_status_els(__TopXMLNS, __Opts, [],
			   Data) ->
    decode_presence_status_cdata(__TopXMLNS, Data);
decode_presence_status_els(__TopXMLNS, __Opts,
			   [{xmlcdata, _data} | _els], Data) ->
    decode_presence_status_els(__TopXMLNS, __Opts, _els,
			       <<Data/binary, _data/binary>>);
decode_presence_status_els(__TopXMLNS, __Opts,
			   [_ | _els], Data) ->
    decode_presence_status_els(__TopXMLNS, __Opts, _els,
			       Data).

decode_presence_status_attrs(__TopXMLNS,
			     [{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_presence_status_attrs(__TopXMLNS, _attrs, _val);
decode_presence_status_attrs(__TopXMLNS, [_ | _attrs],
			     Lang) ->
    decode_presence_status_attrs(__TopXMLNS, _attrs, Lang);
decode_presence_status_attrs(__TopXMLNS, [], Lang) ->
    'decode_presence_status_attr_xml:lang'(__TopXMLNS,
					   Lang).

encode_presence_status({text, Lang, Data},
		       __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = encode_presence_status_cdata(Data, []),
    _attrs = 'encode_presence_status_attr_xml:lang'(Lang,
						    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									       __TopXMLNS)),
    {xmlel, <<"status">>, _attrs, _els}.

'decode_presence_status_attr_xml:lang'(__TopXMLNS,
				       undefined) ->
    <<>>;
'decode_presence_status_attr_xml:lang'(__TopXMLNS,
				       _val) ->
    _val.

'encode_presence_status_attr_xml:lang'(<<>>, _acc) ->
    _acc;
'encode_presence_status_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_presence_status_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_presence_status_cdata(__TopXMLNS, _val) -> _val.

encode_presence_status_cdata(<<>>, _acc) -> _acc;
encode_presence_status_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_presence_show(__TopXMLNS, __Opts,
		     {xmlel, <<"show">>, _attrs, _els}) ->
    Cdata = decode_presence_show_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_presence_show_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_presence_show_cdata(__TopXMLNS, Cdata);
decode_presence_show_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_presence_show_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_presence_show_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_presence_show_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_presence_show(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = encode_presence_show_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"show">>, _attrs, _els}.

decode_presence_show_cdata(__TopXMLNS, <<>>) ->
    undefined;
decode_presence_show_cdata(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [away, chat, dnd, xa]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"show">>, __TopXMLNS}});
      _res -> _res
    end.

encode_presence_show_cdata(undefined, _acc) -> _acc;
encode_presence_show_cdata(_val, _acc) ->
    [{xmlcdata, enc_enum(_val)} | _acc].

decode_message(__TopXMLNS, __Opts,
	       {xmlel, <<"message">>, _attrs, _els}) ->
    {Thread, Subject, Body, __Els} =
	decode_message_els(__TopXMLNS, __Opts, _els, undefined,
			   [], [], []),
    {Id, Type, From, To, Lang} =
	decode_message_attrs(__TopXMLNS, _attrs, undefined,
			     undefined, undefined, undefined, undefined),
    {message, Id, Type, Lang, From, To, Subject, Body,
     Thread, __Els, #{}}.

decode_message_els(__TopXMLNS, __Opts, [], Thread,
		   Subject, Body, __Els) ->
    {Thread, lists:reverse(Subject), lists:reverse(Body),
     lists:reverse(__Els)};
decode_message_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"subject">>, _attrs, _} = _el | _els],
		   Thread, Subject, Body, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:client">> ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     [decode_message_subject(<<"jabber:client">>,
						     __Opts, _el)
			      | Subject],
			     Body, __Els);
      <<"jabber:server">> ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     [decode_message_subject(<<"jabber:server">>,
						     __Opts, _el)
			      | Subject],
			     Body, __Els);
      <<"jabber:component:accept">> ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     [decode_message_subject(<<"jabber:component:accept">>,
						     __Opts, _el)
			      | Subject],
			     Body, __Els);
      _ ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     Subject, Body, __Els)
    end;
decode_message_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"thread">>, _attrs, _} = _el | _els], Thread,
		   Subject, Body, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:client">> ->
	  decode_message_els(__TopXMLNS, __Opts, _els,
			     decode_message_thread(<<"jabber:client">>, __Opts,
						   _el),
			     Subject, Body, __Els);
      <<"jabber:server">> ->
	  decode_message_els(__TopXMLNS, __Opts, _els,
			     decode_message_thread(<<"jabber:server">>, __Opts,
						   _el),
			     Subject, Body, __Els);
      <<"jabber:component:accept">> ->
	  decode_message_els(__TopXMLNS, __Opts, _els,
			     decode_message_thread(<<"jabber:component:accept">>,
						   __Opts, _el),
			     Subject, Body, __Els);
      _ ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     Subject, Body, __Els)
    end;
decode_message_els(__TopXMLNS, __Opts,
		   [{xmlel, <<"body">>, _attrs, _} = _el | _els], Thread,
		   Subject, Body, __Els) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:client">> ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     Subject,
			     [decode_message_body(<<"jabber:client">>, __Opts,
						  _el)
			      | Body],
			     __Els);
      <<"jabber:server">> ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     Subject,
			     [decode_message_body(<<"jabber:server">>, __Opts,
						  _el)
			      | Body],
			     __Els);
      <<"jabber:component:accept">> ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     Subject,
			     [decode_message_body(<<"jabber:component:accept">>,
						  __Opts, _el)
			      | Body],
			     __Els);
      _ ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     Subject, Body, __Els)
    end;
decode_message_els(__TopXMLNS, __Opts,
		   [{xmlel, _name, _attrs, _} = _el | _els], Thread,
		   Subject, Body, __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_message_els(__TopXMLNS, __Opts, _els, Thread,
			     Subject, Body, [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_message_els(__TopXMLNS, __Opts, _els, Thread,
				   Subject, Body, __Els);
	    Mod ->
		decode_message_els(__TopXMLNS, __Opts, _els, Thread,
				   Subject, Body,
				   [Mod:do_decode(_name, __XMLNS, _el, __Opts)
				    | __Els])
	  end
    end;
decode_message_els(__TopXMLNS, __Opts, [_ | _els],
		   Thread, Subject, Body, __Els) ->
    decode_message_els(__TopXMLNS, __Opts, _els, Thread,
		       Subject, Body, __Els).

decode_message_attrs(__TopXMLNS,
		     [{<<"id">>, _val} | _attrs], _Id, Type, From, To,
		     Lang) ->
    decode_message_attrs(__TopXMLNS, _attrs, _val, Type,
			 From, To, Lang);
decode_message_attrs(__TopXMLNS,
		     [{<<"type">>, _val} | _attrs], Id, _Type, From, To,
		     Lang) ->
    decode_message_attrs(__TopXMLNS, _attrs, Id, _val, From,
			 To, Lang);
decode_message_attrs(__TopXMLNS,
		     [{<<"from">>, _val} | _attrs], Id, Type, _From, To,
		     Lang) ->
    decode_message_attrs(__TopXMLNS, _attrs, Id, Type, _val,
			 To, Lang);
decode_message_attrs(__TopXMLNS,
		     [{<<"to">>, _val} | _attrs], Id, Type, From, _To,
		     Lang) ->
    decode_message_attrs(__TopXMLNS, _attrs, Id, Type, From,
			 _val, Lang);
decode_message_attrs(__TopXMLNS,
		     [{<<"xml:lang">>, _val} | _attrs], Id, Type, From, To,
		     _Lang) ->
    decode_message_attrs(__TopXMLNS, _attrs, Id, Type, From,
			 To, _val);
decode_message_attrs(__TopXMLNS, [_ | _attrs], Id, Type,
		     From, To, Lang) ->
    decode_message_attrs(__TopXMLNS, _attrs, Id, Type, From,
			 To, Lang);
decode_message_attrs(__TopXMLNS, [], Id, Type, From, To,
		     Lang) ->
    {decode_message_attr_id(__TopXMLNS, Id),
     decode_message_attr_type(__TopXMLNS, Type),
     decode_message_attr_from(__TopXMLNS, From),
     decode_message_attr_to(__TopXMLNS, To),
     'decode_message_attr_xml:lang'(__TopXMLNS, Lang)}.

encode_message({message, Id, Type, Lang, From, To,
		Subject, Body, Thread, __Els, _},
	       __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els]
	     ++
	     lists:reverse('encode_message_$thread'(Thread,
						    __NewTopXMLNS,
						    'encode_message_$subject'(Subject,
									      __NewTopXMLNS,
									      'encode_message_$body'(Body,
												     __NewTopXMLNS,
												     [])))),
    _attrs = 'encode_message_attr_xml:lang'(Lang,
					    encode_message_attr_to(To,
								   encode_message_attr_from(From,
											    encode_message_attr_type(Type,
														     encode_message_attr_id(Id,
																	    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																				       __TopXMLNS)))))),
    {xmlel, <<"message">>, _attrs, _els}.

'encode_message_$thread'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_message_$thread'(Thread, __TopXMLNS, _acc) ->
    [encode_message_thread(Thread, __TopXMLNS) | _acc].

'encode_message_$subject'([], __TopXMLNS, _acc) -> _acc;
'encode_message_$subject'([Subject | _els], __TopXMLNS,
			  _acc) ->
    'encode_message_$subject'(_els, __TopXMLNS,
			      [encode_message_subject(Subject, __TopXMLNS)
			       | _acc]).

'encode_message_$body'([], __TopXMLNS, _acc) -> _acc;
'encode_message_$body'([Body | _els], __TopXMLNS,
		       _acc) ->
    'encode_message_$body'(_els, __TopXMLNS,
			   [encode_message_body(Body, __TopXMLNS) | _acc]).

decode_message_attr_id(__TopXMLNS, undefined) -> <<>>;
decode_message_attr_id(__TopXMLNS, _val) -> _val.

encode_message_attr_id(<<>>, _acc) -> _acc;
encode_message_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_message_attr_type(__TopXMLNS, undefined) ->
    normal;
decode_message_attr_type(__TopXMLNS, _val) ->
    case catch dec_message_type(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"message">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_message_attr_type(normal, _acc) -> _acc;
encode_message_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_message_attr_from(__TopXMLNS, undefined) ->
    undefined;
decode_message_attr_from(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"message">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_message_attr_from(undefined, _acc) -> _acc;
encode_message_attr_from(_val, _acc) ->
    [{<<"from">>, jid:encode(_val)} | _acc].

decode_message_attr_to(__TopXMLNS, undefined) ->
    undefined;
decode_message_attr_to(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"message">>, __TopXMLNS}});
      _res -> _res
    end.

encode_message_attr_to(undefined, _acc) -> _acc;
encode_message_attr_to(_val, _acc) ->
    [{<<"to">>, jid:encode(_val)} | _acc].

'decode_message_attr_xml:lang'(__TopXMLNS, undefined) ->
    <<>>;
'decode_message_attr_xml:lang'(__TopXMLNS, _val) ->
    _val.

'encode_message_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_message_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_message_thread(__TopXMLNS, __Opts,
		      {xmlel, <<"thread">>, _attrs, _els}) ->
    Cdata = decode_message_thread_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_message_thread_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_message_thread_cdata(__TopXMLNS, Cdata);
decode_message_thread_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_message_thread_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_message_thread_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_message_thread_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_message_thread(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = encode_message_thread_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"thread">>, _attrs, _els}.

decode_message_thread_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_message_thread_cdata(__TopXMLNS, _val) -> _val.

encode_message_thread_cdata(<<>>, _acc) -> _acc;
encode_message_thread_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_message_body(__TopXMLNS, __Opts,
		    {xmlel, <<"body">>, _attrs, _els}) ->
    Data = decode_message_body_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Lang = decode_message_body_attrs(__TopXMLNS, _attrs,
				     undefined),
    {text, Lang, Data}.

decode_message_body_els(__TopXMLNS, __Opts, [], Data) ->
    decode_message_body_cdata(__TopXMLNS, Data);
decode_message_body_els(__TopXMLNS, __Opts,
			[{xmlcdata, _data} | _els], Data) ->
    decode_message_body_els(__TopXMLNS, __Opts, _els,
			    <<Data/binary, _data/binary>>);
decode_message_body_els(__TopXMLNS, __Opts, [_ | _els],
			Data) ->
    decode_message_body_els(__TopXMLNS, __Opts, _els, Data).

decode_message_body_attrs(__TopXMLNS,
			  [{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_message_body_attrs(__TopXMLNS, _attrs, _val);
decode_message_body_attrs(__TopXMLNS, [_ | _attrs],
			  Lang) ->
    decode_message_body_attrs(__TopXMLNS, _attrs, Lang);
decode_message_body_attrs(__TopXMLNS, [], Lang) ->
    'decode_message_body_attr_xml:lang'(__TopXMLNS, Lang).

encode_message_body({text, Lang, Data}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = encode_message_body_cdata(Data, []),
    _attrs = 'encode_message_body_attr_xml:lang'(Lang,
						 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									    __TopXMLNS)),
    {xmlel, <<"body">>, _attrs, _els}.

'decode_message_body_attr_xml:lang'(__TopXMLNS,
				    undefined) ->
    <<>>;
'decode_message_body_attr_xml:lang'(__TopXMLNS, _val) ->
    _val.

'encode_message_body_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_message_body_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_message_body_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_message_body_cdata(__TopXMLNS, _val) -> _val.

encode_message_body_cdata(<<>>, _acc) -> _acc;
encode_message_body_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_message_subject(__TopXMLNS, __Opts,
		       {xmlel, <<"subject">>, _attrs, _els}) ->
    Data = decode_message_subject_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Lang = decode_message_subject_attrs(__TopXMLNS, _attrs,
					undefined),
    {text, Lang, Data}.

decode_message_subject_els(__TopXMLNS, __Opts, [],
			   Data) ->
    decode_message_subject_cdata(__TopXMLNS, Data);
decode_message_subject_els(__TopXMLNS, __Opts,
			   [{xmlcdata, _data} | _els], Data) ->
    decode_message_subject_els(__TopXMLNS, __Opts, _els,
			       <<Data/binary, _data/binary>>);
decode_message_subject_els(__TopXMLNS, __Opts,
			   [_ | _els], Data) ->
    decode_message_subject_els(__TopXMLNS, __Opts, _els,
			       Data).

decode_message_subject_attrs(__TopXMLNS,
			     [{<<"xml:lang">>, _val} | _attrs], _Lang) ->
    decode_message_subject_attrs(__TopXMLNS, _attrs, _val);
decode_message_subject_attrs(__TopXMLNS, [_ | _attrs],
			     Lang) ->
    decode_message_subject_attrs(__TopXMLNS, _attrs, Lang);
decode_message_subject_attrs(__TopXMLNS, [], Lang) ->
    'decode_message_subject_attr_xml:lang'(__TopXMLNS,
					   Lang).

encode_message_subject({text, Lang, Data},
		       __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = encode_message_subject_cdata(Data, []),
    _attrs = 'encode_message_subject_attr_xml:lang'(Lang,
						    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									       __TopXMLNS)),
    {xmlel, <<"subject">>, _attrs, _els}.

'decode_message_subject_attr_xml:lang'(__TopXMLNS,
				       undefined) ->
    <<>>;
'decode_message_subject_attr_xml:lang'(__TopXMLNS,
				       _val) ->
    _val.

'encode_message_subject_attr_xml:lang'(<<>>, _acc) ->
    _acc;
'encode_message_subject_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].

decode_message_subject_cdata(__TopXMLNS, <<>>) -> <<>>;
decode_message_subject_cdata(__TopXMLNS, _val) -> _val.

encode_message_subject_cdata(<<>>, _acc) -> _acc;
encode_message_subject_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_iq(__TopXMLNS, __Opts,
	  {xmlel, <<"iq">>, _attrs, _els}) ->
    __Els = decode_iq_els(__TopXMLNS, __Opts, _els, []),
    {Id, Type, From, To, Lang} = decode_iq_attrs(__TopXMLNS,
						 _attrs, undefined, undefined,
						 undefined, undefined,
						 undefined),
    {iq, Id, Type, Lang, From, To, __Els, #{}}.

decode_iq_els(__TopXMLNS, __Opts, [], __Els) ->
    lists:reverse(__Els);
decode_iq_els(__TopXMLNS, __Opts,
	      [{xmlel, _name, _attrs, _} = _el | _els], __Els) ->
    case proplists:get_bool(ignore_els, __Opts) of
      true ->
	  decode_iq_els(__TopXMLNS, __Opts, _els, [_el | __Els]);
      false ->
	  __XMLNS = xmpp_codec:get_attr(<<"xmlns">>, _attrs,
					__TopXMLNS),
	  case xmpp_codec:get_mod(_name, __XMLNS) of
	    undefined ->
		decode_iq_els(__TopXMLNS, __Opts, _els, __Els);
	    Mod ->
		decode_iq_els(__TopXMLNS, __Opts, _els,
			      [Mod:do_decode(_name, __XMLNS, _el, __Opts)
			       | __Els])
	  end
    end;
decode_iq_els(__TopXMLNS, __Opts, [_ | _els], __Els) ->
    decode_iq_els(__TopXMLNS, __Opts, _els, __Els).

decode_iq_attrs(__TopXMLNS, [{<<"id">>, _val} | _attrs],
		_Id, Type, From, To, Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, _val, Type, From,
		    To, Lang);
decode_iq_attrs(__TopXMLNS,
		[{<<"type">>, _val} | _attrs], Id, _Type, From, To,
		Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, _val, From, To,
		    Lang);
decode_iq_attrs(__TopXMLNS,
		[{<<"from">>, _val} | _attrs], Id, Type, _From, To,
		Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, Type, _val, To,
		    Lang);
decode_iq_attrs(__TopXMLNS, [{<<"to">>, _val} | _attrs],
		Id, Type, From, _To, Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, Type, From,
		    _val, Lang);
decode_iq_attrs(__TopXMLNS,
		[{<<"xml:lang">>, _val} | _attrs], Id, Type, From, To,
		_Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, Type, From, To,
		    _val);
decode_iq_attrs(__TopXMLNS, [_ | _attrs], Id, Type,
		From, To, Lang) ->
    decode_iq_attrs(__TopXMLNS, _attrs, Id, Type, From, To,
		    Lang);
decode_iq_attrs(__TopXMLNS, [], Id, Type, From, To,
		Lang) ->
    {decode_iq_attr_id(__TopXMLNS, Id),
     decode_iq_attr_type(__TopXMLNS, Type),
     decode_iq_attr_from(__TopXMLNS, From),
     decode_iq_attr_to(__TopXMLNS, To),
     'decode_iq_attr_xml:lang'(__TopXMLNS, Lang)}.

encode_iq({iq, Id, Type, Lang, From, To, __Els, _},
	  __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = [xmpp_codec:encode(_el, __NewTopXMLNS)
	    || _el <- __Els],
    _attrs = 'encode_iq_attr_xml:lang'(Lang,
				       encode_iq_attr_to(To,
							 encode_iq_attr_from(From,
									     encode_iq_attr_type(Type,
												 encode_iq_attr_id(Id,
														   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																	      __TopXMLNS)))))),
    {xmlel, <<"iq">>, _attrs, _els}.

decode_iq_attr_id(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"id">>, <<"iq">>, __TopXMLNS}});
decode_iq_attr_id(__TopXMLNS, _val) -> _val.

encode_iq_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_iq_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"iq">>, __TopXMLNS}});
decode_iq_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [get, set, result, error]) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"type">>, <<"iq">>, __TopXMLNS}});
      _res -> _res
    end.

encode_iq_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_iq_attr_from(__TopXMLNS, undefined) -> undefined;
decode_iq_attr_from(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"from">>, <<"iq">>, __TopXMLNS}});
      _res -> _res
    end.

encode_iq_attr_from(undefined, _acc) -> _acc;
encode_iq_attr_from(_val, _acc) ->
    [{<<"from">>, jid:encode(_val)} | _acc].

decode_iq_attr_to(__TopXMLNS, undefined) -> undefined;
decode_iq_attr_to(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"to">>, <<"iq">>, __TopXMLNS}});
      _res -> _res
    end.

encode_iq_attr_to(undefined, _acc) -> _acc;
encode_iq_attr_to(_val, _acc) ->
    [{<<"to">>, jid:encode(_val)} | _acc].

'decode_iq_attr_xml:lang'(__TopXMLNS, undefined) ->
    <<>>;
'decode_iq_attr_xml:lang'(__TopXMLNS, _val) -> _val.

'encode_iq_attr_xml:lang'(<<>>, _acc) -> _acc;
'encode_iq_attr_xml:lang'(_val, _acc) ->
    [{<<"xml:lang">>, _val} | _acc].
