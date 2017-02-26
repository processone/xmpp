%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(xep0060).

-compile(export_all).

do_decode(<<"unsupported-access-model">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_unsupported_access_model(<<"http://jabber.org/protocol/pubsub#errors">>,
						 Opts, El);
do_decode(<<"unsupported">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_unsupported(<<"http://jabber.org/protocol/pubsub#errors">>,
				    Opts, El);
do_decode(<<"too-many-subscriptions">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_too_many_subscriptions(<<"http://jabber.org/protocol/pubsub#errors">>,
					       Opts, El);
do_decode(<<"subid-required">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_subid_required(<<"http://jabber.org/protocol/pubsub#errors">>,
				       Opts, El);
do_decode(<<"presence-subscription-required">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_presence_subscription_required(<<"http://jabber.org/protocol/pubsub#errors">>,
						       Opts, El);
do_decode(<<"pending-subscription">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_pending_subscription(<<"http://jabber.org/protocol/pubsub#errors">>,
					     Opts, El);
do_decode(<<"payload-required">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_payload_required(<<"http://jabber.org/protocol/pubsub#errors">>,
					 Opts, El);
do_decode(<<"payload-too-big">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_payload_too_big(<<"http://jabber.org/protocol/pubsub#errors">>,
					Opts, El);
do_decode(<<"not-subscribed">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_not_subscribed(<<"http://jabber.org/protocol/pubsub#errors">>,
				       Opts, El);
do_decode(<<"not-in-roster-group">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_not_in_roster_group(<<"http://jabber.org/protocol/pubsub#errors">>,
					    Opts, El);
do_decode(<<"nodeid-required">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_nodeid_required(<<"http://jabber.org/protocol/pubsub#errors">>,
					Opts, El);
do_decode(<<"max-nodes-exceeded">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_max_nodes_exceeded(<<"http://jabber.org/protocol/pubsub#errors">>,
					   Opts, El);
do_decode(<<"max-items-exceeded">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_max_items_exceeded(<<"http://jabber.org/protocol/pubsub#errors">>,
					   Opts, El);
do_decode(<<"jid-required">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_jid_required(<<"http://jabber.org/protocol/pubsub#errors">>,
				     Opts, El);
do_decode(<<"item-required">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_item_required(<<"http://jabber.org/protocol/pubsub#errors">>,
				      Opts, El);
do_decode(<<"item-forbidden">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_item_forbidden(<<"http://jabber.org/protocol/pubsub#errors">>,
				       Opts, El);
do_decode(<<"invalid-subid">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_invalid_subid(<<"http://jabber.org/protocol/pubsub#errors">>,
				      Opts, El);
do_decode(<<"invalid-payload">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_invalid_payload(<<"http://jabber.org/protocol/pubsub#errors">>,
					Opts, El);
do_decode(<<"invalid-options">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_invalid_options(<<"http://jabber.org/protocol/pubsub#errors">>,
					Opts, El);
do_decode(<<"invalid-jid">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_invalid_jid(<<"http://jabber.org/protocol/pubsub#errors">>,
				    Opts, El);
do_decode(<<"configuration-required">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_configuration_required(<<"http://jabber.org/protocol/pubsub#errors">>,
					       Opts, El);
do_decode(<<"closed-node">>,
	  <<"http://jabber.org/protocol/pubsub#errors">>, El,
	  Opts) ->
    decode_pubsub_error_closed_node(<<"http://jabber.org/protocol/pubsub#errors">>,
				    Opts, El);
do_decode(<<"pubsub">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_owner(<<"http://jabber.org/protocol/pubsub#owner">>,
			Opts, El);
do_decode(<<"pubsub">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub(<<"http://jabber.org/protocol/pubsub">>,
		  Opts, El);
do_decode(<<"purge">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub">>,
			Opts, El);
do_decode(<<"purge">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub#owner">>,
			Opts, El);
do_decode(<<"purge">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub#event">>,
			Opts, El);
do_decode(<<"delete">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub">>,
			 Opts, El);
do_decode(<<"delete">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub#owner">>,
			 Opts, El);
do_decode(<<"delete">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub#event">>,
			 Opts, El);
do_decode(<<"redirect">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_redirect(<<"http://jabber.org/protocol/pubsub">>,
			   Opts, El);
do_decode(<<"redirect">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_redirect(<<"http://jabber.org/protocol/pubsub#owner">>,
			   Opts, El);
do_decode(<<"redirect">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_redirect(<<"http://jabber.org/protocol/pubsub#event">>,
			   Opts, El);
do_decode(<<"default">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_default(<<"http://jabber.org/protocol/pubsub">>,
			  Opts, El);
do_decode(<<"default">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_default(<<"http://jabber.org/protocol/pubsub#owner">>,
			  Opts, El);
do_decode(<<"publish-options">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_publish_options(<<"http://jabber.org/protocol/pubsub">>,
				  Opts, El);
do_decode(<<"configure">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_configure(<<"http://jabber.org/protocol/pubsub">>,
			    Opts, El);
do_decode(<<"configure">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_configure(<<"http://jabber.org/protocol/pubsub#owner">>,
			    Opts, El);
do_decode(<<"create">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_create(<<"http://jabber.org/protocol/pubsub">>,
			 Opts, El);
do_decode(<<"create">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_create(<<"http://jabber.org/protocol/pubsub#event">>,
			 Opts, El);
do_decode(<<"retract">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_retract(<<"http://jabber.org/protocol/pubsub">>,
			  Opts, El);
do_decode(<<"options">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_options(<<"http://jabber.org/protocol/pubsub">>,
			  Opts, El);
do_decode(<<"publish">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_publish(<<"http://jabber.org/protocol/pubsub">>,
			  Opts, El);
do_decode(<<"unsubscribe">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_unsubscribe(<<"http://jabber.org/protocol/pubsub">>,
			      Opts, El);
do_decode(<<"subscribe">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_subscribe(<<"http://jabber.org/protocol/pubsub">>,
			    Opts, El);
do_decode(<<"affiliations">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_owner_affiliations(<<"http://jabber.org/protocol/pubsub#owner">>,
				     Opts, El);
do_decode(<<"affiliations">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_affiliations(<<"http://jabber.org/protocol/pubsub">>,
			       Opts, El);
do_decode(<<"subscriptions">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_subscriptions(<<"http://jabber.org/protocol/pubsub">>,
				Opts, El);
do_decode(<<"subscriptions">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_subscriptions(<<"http://jabber.org/protocol/pubsub#owner">>,
				Opts, El);
do_decode(<<"event">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_event(<<"http://jabber.org/protocol/pubsub#event">>,
			Opts, El);
do_decode(<<"items">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_items(<<"http://jabber.org/protocol/pubsub">>,
			Opts, El);
do_decode(<<"items">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_items(<<"http://jabber.org/protocol/pubsub#event">>,
			Opts, El);
do_decode(<<"item">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_item(<<"http://jabber.org/protocol/pubsub">>,
		       Opts, El);
do_decode(<<"item">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_item(<<"http://jabber.org/protocol/pubsub#event">>,
		       Opts, El);
do_decode(<<"retract">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_event_retract(<<"http://jabber.org/protocol/pubsub#event">>,
				Opts, El);
do_decode(<<"configuration">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_event_configuration(<<"http://jabber.org/protocol/pubsub#event">>,
				      Opts, El);
do_decode(<<"affiliation">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_owner_affiliation(<<"http://jabber.org/protocol/pubsub#owner">>,
				    Opts, El);
do_decode(<<"affiliation">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_affiliation(<<"http://jabber.org/protocol/pubsub">>,
			      Opts, El);
do_decode(<<"subscription">>,
	  <<"http://jabber.org/protocol/pubsub">>, El, Opts) ->
    decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub">>,
			       Opts, El);
do_decode(<<"subscription">>,
	  <<"http://jabber.org/protocol/pubsub#owner">>, El,
	  Opts) ->
    decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub#owner">>,
			       Opts, El);
do_decode(<<"subscription">>,
	  <<"http://jabber.org/protocol/pubsub#event">>, El,
	  Opts) ->
    decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub#event">>,
			       Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"unsupported-access-model">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"unsupported">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"too-many-subscriptions">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"subid-required">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"presence-subscription-required">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"pending-subscription">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"payload-required">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"payload-too-big">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"not-subscribed">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"not-in-roster-group">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"nodeid-required">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"max-nodes-exceeded">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"max-items-exceeded">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"jid-required">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"item-required">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"item-forbidden">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"invalid-subid">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"invalid-payload">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"invalid-options">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"invalid-jid">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"configuration-required">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"closed-node">>,
      <<"http://jabber.org/protocol/pubsub#errors">>},
     {<<"pubsub">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"pubsub">>, <<"http://jabber.org/protocol/pubsub">>},
     {<<"purge">>, <<"http://jabber.org/protocol/pubsub">>},
     {<<"purge">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"purge">>,
      <<"http://jabber.org/protocol/pubsub#event">>},
     {<<"delete">>, <<"http://jabber.org/protocol/pubsub">>},
     {<<"delete">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"delete">>,
      <<"http://jabber.org/protocol/pubsub#event">>},
     {<<"redirect">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"redirect">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"redirect">>,
      <<"http://jabber.org/protocol/pubsub#event">>},
     {<<"default">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"default">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"publish-options">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"configure">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"configure">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"create">>, <<"http://jabber.org/protocol/pubsub">>},
     {<<"create">>,
      <<"http://jabber.org/protocol/pubsub#event">>},
     {<<"retract">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"options">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"publish">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"unsubscribe">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"subscribe">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"affiliations">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"affiliations">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"subscriptions">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"subscriptions">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"event">>,
      <<"http://jabber.org/protocol/pubsub#event">>},
     {<<"items">>, <<"http://jabber.org/protocol/pubsub">>},
     {<<"items">>,
      <<"http://jabber.org/protocol/pubsub#event">>},
     {<<"item">>, <<"http://jabber.org/protocol/pubsub">>},
     {<<"item">>,
      <<"http://jabber.org/protocol/pubsub#event">>},
     {<<"retract">>,
      <<"http://jabber.org/protocol/pubsub#event">>},
     {<<"configuration">>,
      <<"http://jabber.org/protocol/pubsub#event">>},
     {<<"affiliation">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"affiliation">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"subscription">>,
      <<"http://jabber.org/protocol/pubsub">>},
     {<<"subscription">>,
      <<"http://jabber.org/protocol/pubsub#owner">>},
     {<<"subscription">>,
      <<"http://jabber.org/protocol/pubsub#event">>}].

do_encode({ps_subscription, _, _, _, _, _, _} =
	      Subscription,
	  TopXMLNS) ->
    encode_pubsub_subscription(Subscription, TopXMLNS);
do_encode({ps_affiliation,
	   <<"http://jabber.org/protocol/pubsub">>, _, _, _} =
	      Affiliation,
	  TopXMLNS) ->
    encode_pubsub_affiliation(Affiliation, TopXMLNS);
do_encode({ps_affiliation, <<>>, _, _, _} = Affiliation,
	  TopXMLNS = <<"http://jabber.org/protocol/pubsub">>) ->
    encode_pubsub_affiliation(Affiliation, TopXMLNS);
do_encode({ps_affiliation,
	   <<"http://jabber.org/protocol/pubsub#owner">>, _, _,
	   _} =
	      Affiliation,
	  TopXMLNS) ->
    encode_pubsub_owner_affiliation(Affiliation, TopXMLNS);
do_encode({ps_affiliation, <<>>, _, _, _} = Affiliation,
	  TopXMLNS =
	      <<"http://jabber.org/protocol/pubsub#owner">>) ->
    encode_pubsub_owner_affiliation(Affiliation, TopXMLNS);
do_encode({ps_item, _, _, _, _, _} = Item, TopXMLNS) ->
    encode_pubsub_item(Item, TopXMLNS);
do_encode({ps_items, _, _, _, _, _, _} = Items,
	  TopXMLNS) ->
    encode_pubsub_items(Items, TopXMLNS);
do_encode({ps_event, _, _, _, _, _, _} = Event,
	  TopXMLNS) ->
    encode_pubsub_event(Event, TopXMLNS);
do_encode({ps_subscribe, _, _} = Subscribe, TopXMLNS) ->
    encode_pubsub_subscribe(Subscribe, TopXMLNS);
do_encode({ps_unsubscribe, _, _, _} = Unsubscribe,
	  TopXMLNS) ->
    encode_pubsub_unsubscribe(Unsubscribe, TopXMLNS);
do_encode({ps_publish, _, _} = Publish, TopXMLNS) ->
    encode_pubsub_publish(Publish, TopXMLNS);
do_encode({ps_options, _, _, _, _} = Options,
	  TopXMLNS) ->
    encode_pubsub_options(Options, TopXMLNS);
do_encode({ps_retract, _, _, _} = Retract, TopXMLNS) ->
    encode_pubsub_retract(Retract, TopXMLNS);
do_encode({pubsub, _, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _, _} =
	      Pubsub,
	  TopXMLNS) ->
    encode_pubsub(Pubsub, TopXMLNS);
do_encode({pubsub_owner, _, _, _, _, _, _} = Pubsub,
	  TopXMLNS) ->
    encode_pubsub_owner(Pubsub, TopXMLNS);
do_encode({ps_error, 'closed-node', _} = Closed_node,
	  TopXMLNS) ->
    encode_pubsub_error_closed_node(Closed_node, TopXMLNS);
do_encode({ps_error, 'configuration-required', _} =
	      Configuration_required,
	  TopXMLNS) ->
    encode_pubsub_error_configuration_required(Configuration_required,
					       TopXMLNS);
do_encode({ps_error, 'invalid-jid', _} = Invalid_jid,
	  TopXMLNS) ->
    encode_pubsub_error_invalid_jid(Invalid_jid, TopXMLNS);
do_encode({ps_error, 'invalid-options', _} =
	      Invalid_options,
	  TopXMLNS) ->
    encode_pubsub_error_invalid_options(Invalid_options,
					TopXMLNS);
do_encode({ps_error, 'invalid-payload', _} =
	      Invalid_payload,
	  TopXMLNS) ->
    encode_pubsub_error_invalid_payload(Invalid_payload,
					TopXMLNS);
do_encode({ps_error, 'invalid-subid', _} =
	      Invalid_subid,
	  TopXMLNS) ->
    encode_pubsub_error_invalid_subid(Invalid_subid,
				      TopXMLNS);
do_encode({ps_error, 'item-forbidden', _} =
	      Item_forbidden,
	  TopXMLNS) ->
    encode_pubsub_error_item_forbidden(Item_forbidden,
				       TopXMLNS);
do_encode({ps_error, 'item-required', _} =
	      Item_required,
	  TopXMLNS) ->
    encode_pubsub_error_item_required(Item_required,
				      TopXMLNS);
do_encode({ps_error, 'jid-required', _} = Jid_required,
	  TopXMLNS) ->
    encode_pubsub_error_jid_required(Jid_required,
				     TopXMLNS);
do_encode({ps_error, 'max-items-exceeded', _} =
	      Max_items_exceeded,
	  TopXMLNS) ->
    encode_pubsub_error_max_items_exceeded(Max_items_exceeded,
					   TopXMLNS);
do_encode({ps_error, 'max-nodes-exceeded', _} =
	      Max_nodes_exceeded,
	  TopXMLNS) ->
    encode_pubsub_error_max_nodes_exceeded(Max_nodes_exceeded,
					   TopXMLNS);
do_encode({ps_error, 'nodeid-required', _} =
	      Nodeid_required,
	  TopXMLNS) ->
    encode_pubsub_error_nodeid_required(Nodeid_required,
					TopXMLNS);
do_encode({ps_error, 'not-in-roster-group', _} =
	      Not_in_roster_group,
	  TopXMLNS) ->
    encode_pubsub_error_not_in_roster_group(Not_in_roster_group,
					    TopXMLNS);
do_encode({ps_error, 'not-subscribed', _} =
	      Not_subscribed,
	  TopXMLNS) ->
    encode_pubsub_error_not_subscribed(Not_subscribed,
				       TopXMLNS);
do_encode({ps_error, 'payload-too-big', _} =
	      Payload_too_big,
	  TopXMLNS) ->
    encode_pubsub_error_payload_too_big(Payload_too_big,
					TopXMLNS);
do_encode({ps_error, 'payload-required', _} =
	      Payload_required,
	  TopXMLNS) ->
    encode_pubsub_error_payload_required(Payload_required,
					 TopXMLNS);
do_encode({ps_error, 'pending-subscription', _} =
	      Pending_subscription,
	  TopXMLNS) ->
    encode_pubsub_error_pending_subscription(Pending_subscription,
					     TopXMLNS);
do_encode({ps_error, 'presence-subscription-required',
	   _} =
	      Presence_subscription_required,
	  TopXMLNS) ->
    encode_pubsub_error_presence_subscription_required(Presence_subscription_required,
						       TopXMLNS);
do_encode({ps_error, 'subid-required', _} =
	      Subid_required,
	  TopXMLNS) ->
    encode_pubsub_error_subid_required(Subid_required,
				       TopXMLNS);
do_encode({ps_error, 'too-many-subscriptions', _} =
	      Too_many_subscriptions,
	  TopXMLNS) ->
    encode_pubsub_error_too_many_subscriptions(Too_many_subscriptions,
					       TopXMLNS);
do_encode({ps_error, unsupported, _} = Unsupported,
	  TopXMLNS) ->
    encode_pubsub_error_unsupported(Unsupported, TopXMLNS);
do_encode({ps_error, 'unsupported-access-model', _} =
	      Unsupported_access_model,
	  TopXMLNS) ->
    encode_pubsub_error_unsupported_access_model(Unsupported_access_model,
						 TopXMLNS).

do_get_name({ps_affiliation, _, _, _, _}) ->
    <<"affiliation">>;
do_get_name({ps_error, 'closed-node', _}) ->
    <<"closed-node">>;
do_get_name({ps_error, 'configuration-required', _}) ->
    <<"configuration-required">>;
do_get_name({ps_error, 'invalid-jid', _}) ->
    <<"invalid-jid">>;
do_get_name({ps_error, 'invalid-options', _}) ->
    <<"invalid-options">>;
do_get_name({ps_error, 'invalid-payload', _}) ->
    <<"invalid-payload">>;
do_get_name({ps_error, 'invalid-subid', _}) ->
    <<"invalid-subid">>;
do_get_name({ps_error, 'item-forbidden', _}) ->
    <<"item-forbidden">>;
do_get_name({ps_error, 'item-required', _}) ->
    <<"item-required">>;
do_get_name({ps_error, 'jid-required', _}) ->
    <<"jid-required">>;
do_get_name({ps_error, 'max-items-exceeded', _}) ->
    <<"max-items-exceeded">>;
do_get_name({ps_error, 'max-nodes-exceeded', _}) ->
    <<"max-nodes-exceeded">>;
do_get_name({ps_error, 'nodeid-required', _}) ->
    <<"nodeid-required">>;
do_get_name({ps_error, 'not-in-roster-group', _}) ->
    <<"not-in-roster-group">>;
do_get_name({ps_error, 'not-subscribed', _}) ->
    <<"not-subscribed">>;
do_get_name({ps_error, 'payload-required', _}) ->
    <<"payload-required">>;
do_get_name({ps_error, 'payload-too-big', _}) ->
    <<"payload-too-big">>;
do_get_name({ps_error, 'pending-subscription', _}) ->
    <<"pending-subscription">>;
do_get_name({ps_error, 'presence-subscription-required',
	     _}) ->
    <<"presence-subscription-required">>;
do_get_name({ps_error, 'subid-required', _}) ->
    <<"subid-required">>;
do_get_name({ps_error, 'too-many-subscriptions', _}) ->
    <<"too-many-subscriptions">>;
do_get_name({ps_error, unsupported, _}) ->
    <<"unsupported">>;
do_get_name({ps_error, 'unsupported-access-model',
	     _}) ->
    <<"unsupported-access-model">>;
do_get_name({ps_event, _, _, _, _, _, _}) ->
    <<"event">>;
do_get_name({ps_item, _, _, _, _, _}) -> <<"item">>;
do_get_name({ps_items, _, _, _, _, _, _}) ->
    <<"items">>;
do_get_name({ps_options, _, _, _, _}) -> <<"options">>;
do_get_name({ps_publish, _, _}) -> <<"publish">>;
do_get_name({ps_retract, _, _, _}) -> <<"retract">>;
do_get_name({ps_subscribe, _, _}) -> <<"subscribe">>;
do_get_name({ps_subscription, _, _, _, _, _, _}) ->
    <<"subscription">>;
do_get_name({ps_unsubscribe, _, _, _}) ->
    <<"unsubscribe">>;
do_get_name({pubsub, _, _, _, _, _, _, _, _, _, _, _, _,
	     _, _, _, _}) ->
    <<"pubsub">>;
do_get_name({pubsub_owner, _, _, _, _, _, _}) ->
    <<"pubsub">>.

do_get_ns({ps_affiliation, Xmlns, _, _, _}) -> Xmlns;
do_get_ns({ps_error, 'closed-node', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'configuration-required', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'invalid-jid', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'invalid-options', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'invalid-payload', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'invalid-subid', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'item-forbidden', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'item-required', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'jid-required', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'max-items-exceeded', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'max-nodes-exceeded', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'nodeid-required', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'not-in-roster-group', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'not-subscribed', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'payload-required', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'payload-too-big', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'pending-subscription', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'presence-subscription-required',
	   _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'subid-required', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'too-many-subscriptions', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, unsupported, _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_error, 'unsupported-access-model', _}) ->
    <<"http://jabber.org/protocol/pubsub#errors">>;
do_get_ns({ps_event, _, _, _, _, _, _}) ->
    <<"http://jabber.org/protocol/pubsub#event">>;
do_get_ns({ps_item, Xmlns, _, _, _, _}) -> Xmlns;
do_get_ns({ps_items, Xmlns, _, _, _, _, _}) -> Xmlns;
do_get_ns({ps_options, _, _, _, _}) ->
    <<"http://jabber.org/protocol/pubsub">>;
do_get_ns({ps_publish, _, _}) ->
    <<"http://jabber.org/protocol/pubsub">>;
do_get_ns({ps_retract, _, _, _}) ->
    <<"http://jabber.org/protocol/pubsub">>;
do_get_ns({ps_subscribe, _, _}) ->
    <<"http://jabber.org/protocol/pubsub">>;
do_get_ns({ps_subscription, Xmlns, _, _, _, _, _}) ->
    Xmlns;
do_get_ns({ps_unsubscribe, _, _, _}) ->
    <<"http://jabber.org/protocol/pubsub">>;
do_get_ns({pubsub, _, _, _, _, _, _, _, _, _, _, _, _,
	   _, _, _, _}) ->
    <<"http://jabber.org/protocol/pubsub">>;
do_get_ns({pubsub_owner, _, _, _, _, _, _}) ->
    <<"http://jabber.org/protocol/pubsub#owner">>.

pp(ps_subscription, 6) ->
    [xmlns, jid, type, node, subid, expiry];
pp(ps_affiliation, 4) -> [xmlns, node, type, jid];
pp(ps_item, 5) -> [xmlns, id, xml_els, node, publisher];
pp(ps_items, 6) ->
    [xmlns, node, items, max_items, subid, retract];
pp(ps_event, 6) ->
    [items, purge, subscription, delete, create,
     configuration];
pp(ps_subscribe, 2) -> [node, jid];
pp(ps_unsubscribe, 3) -> [node, jid, subid];
pp(ps_publish, 2) -> [node, items];
pp(ps_options, 4) -> [node, jid, subid, xdata];
pp(ps_retract, 3) -> [node, notify, items];
pp(pubsub, 16) ->
    [subscriptions, subscription, affiliations, publish,
     publish_options, subscribe, unsubscribe, options, items,
     retract, create, configure, default, delete, purge,
     rsm];
pp(pubsub_owner, 6) ->
    [affiliations, configure, default, delete, purge,
     subscriptions];
pp(ps_error, 2) -> [type, feature];
pp(_, _) -> no.

records() ->
    [{ps_subscription, 6}, {ps_affiliation, 4},
     {ps_item, 5}, {ps_items, 6}, {ps_event, 6},
     {ps_subscribe, 2}, {ps_unsubscribe, 3}, {ps_publish, 2},
     {ps_options, 4}, {ps_retract, 3}, {pubsub, 16},
     {pubsub_owner, 6}, {ps_error, 2}].

dec_bool(<<"false">>) -> false;
dec_bool(<<"0">>) -> false;
dec_bool(<<"true">>) -> true;
dec_bool(<<"1">>) -> true.

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

dec_ps_aff(<<"member">>) -> member;
dec_ps_aff(<<"none">>) -> none;
dec_ps_aff(<<"outcast">>) -> outcast;
dec_ps_aff(<<"owner">>) -> owner;
dec_ps_aff(<<"publisher">>) -> publisher;
dec_ps_aff(<<"publish-only">>) -> publish_only.

dec_utc(Val) -> xmpp_util:decode_timestamp(Val).

enc_bool(false) -> <<"false">>;
enc_bool(true) -> <<"true">>.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

enc_int(Int) -> erlang:integer_to_binary(Int).

enc_ps_aff(member) -> <<"member">>;
enc_ps_aff(none) -> <<"none">>;
enc_ps_aff(outcast) -> <<"outcast">>;
enc_ps_aff(owner) -> <<"owner">>;
enc_ps_aff(publisher) -> <<"publisher">>;
enc_ps_aff(publish_only) -> <<"publish-only">>.

enc_utc(Val) -> xmpp_util:encode_timestamp(Val).

decode_pubsub_error_unsupported_access_model(__TopXMLNS,
					     __Opts,
					     {xmlel,
					      <<"unsupported-access-model">>,
					      _attrs, _els}) ->
    {ps_error, 'unsupported-access-model', undefined}.

encode_pubsub_error_unsupported_access_model({ps_error,
					      'unsupported-access-model', _},
					     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"unsupported-access-model">>, _attrs, _els}.

decode_pubsub_error_unsupported(__TopXMLNS, __Opts,
				{xmlel, <<"unsupported">>, _attrs, _els}) ->
    Feature =
	decode_pubsub_error_unsupported_attrs(__TopXMLNS,
					      _attrs, undefined),
    {ps_error, unsupported, Feature}.

decode_pubsub_error_unsupported_attrs(__TopXMLNS,
				      [{<<"feature">>, _val} | _attrs],
				      _Feature) ->
    decode_pubsub_error_unsupported_attrs(__TopXMLNS,
					  _attrs, _val);
decode_pubsub_error_unsupported_attrs(__TopXMLNS,
				      [_ | _attrs], Feature) ->
    decode_pubsub_error_unsupported_attrs(__TopXMLNS,
					  _attrs, Feature);
decode_pubsub_error_unsupported_attrs(__TopXMLNS, [],
				      Feature) ->
    decode_pubsub_error_unsupported_attr_feature(__TopXMLNS,
						 Feature).

encode_pubsub_error_unsupported({ps_error, unsupported,
				 Feature},
				__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs =
	encode_pubsub_error_unsupported_attr_feature(Feature,
						     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
										__TopXMLNS)),
    {xmlel, <<"unsupported">>, _attrs, _els}.

decode_pubsub_error_unsupported_attr_feature(__TopXMLNS,
					     undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"feature">>, <<"unsupported">>,
		   __TopXMLNS}});
decode_pubsub_error_unsupported_attr_feature(__TopXMLNS,
					     _val) ->
    case catch dec_enum(_val,
			['access-authorize', 'access-open', 'access-presence',
			 'access-roster', 'access-whitelist', 'auto-create',
			 'auto-subscribe', collections, 'config-node',
			 'create-and-configure', 'create-nodes', 'delete-items',
			 'delete-nodes', 'filtered-notifications',
			 'get-pending', 'instant-nodes', 'item-ids',
			 'last-published', 'leased-subscription',
			 'manage-subscriptions', 'member-affiliation',
			 'meta-data', 'modify-affiliations', 'multi-collection',
			 'multi-subscribe', 'outcast-affiliation',
			 'persistent-items', 'presence-notifications',
			 'presence-subscribe', publish, 'publish-options',
			 'publish-only-affiliation', 'publisher-affiliation',
			 'purge-nodes', 'retract-items',
			 'retrieve-affiliations', 'retrieve-default',
			 'retrieve-items', 'retrieve-subscriptions', subscribe,
			 'subscription-options', 'subscription-notifications'])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"feature">>, <<"unsupported">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_error_unsupported_attr_feature(_val,
					     _acc) ->
    [{<<"feature">>, enc_enum(_val)} | _acc].

decode_pubsub_error_too_many_subscriptions(__TopXMLNS,
					   __Opts,
					   {xmlel, <<"too-many-subscriptions">>,
					    _attrs, _els}) ->
    {ps_error, 'too-many-subscriptions', undefined}.

encode_pubsub_error_too_many_subscriptions({ps_error,
					    'too-many-subscriptions', _},
					   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"too-many-subscriptions">>, _attrs, _els}.

decode_pubsub_error_subid_required(__TopXMLNS, __Opts,
				   {xmlel, <<"subid-required">>, _attrs,
				    _els}) ->
    {ps_error, 'subid-required', undefined}.

encode_pubsub_error_subid_required({ps_error,
				    'subid-required', _},
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"subid-required">>, _attrs, _els}.

decode_pubsub_error_presence_subscription_required(__TopXMLNS,
						   __Opts,
						   {xmlel,
						    <<"presence-subscription-required">>,
						    _attrs, _els}) ->
    {ps_error, 'presence-subscription-required', undefined}.

encode_pubsub_error_presence_subscription_required({ps_error,
						    'presence-subscription-required',
						    _},
						   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"presence-subscription-required">>, _attrs,
     _els}.

decode_pubsub_error_pending_subscription(__TopXMLNS,
					 __Opts,
					 {xmlel, <<"pending-subscription">>,
					  _attrs, _els}) ->
    {ps_error, 'pending-subscription', undefined}.

encode_pubsub_error_pending_subscription({ps_error,
					  'pending-subscription', _},
					 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"pending-subscription">>, _attrs, _els}.

decode_pubsub_error_payload_required(__TopXMLNS, __Opts,
				     {xmlel, <<"payload-required">>, _attrs,
				      _els}) ->
    {ps_error, 'payload-required', undefined}.

encode_pubsub_error_payload_required({ps_error,
				      'payload-required', _},
				     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"payload-required">>, _attrs, _els}.

decode_pubsub_error_payload_too_big(__TopXMLNS, __Opts,
				    {xmlel, <<"payload-too-big">>, _attrs,
				     _els}) ->
    {ps_error, 'payload-too-big', undefined}.

encode_pubsub_error_payload_too_big({ps_error,
				     'payload-too-big', _},
				    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"payload-too-big">>, _attrs, _els}.

decode_pubsub_error_not_subscribed(__TopXMLNS, __Opts,
				   {xmlel, <<"not-subscribed">>, _attrs,
				    _els}) ->
    {ps_error, 'not-subscribed', undefined}.

encode_pubsub_error_not_subscribed({ps_error,
				    'not-subscribed', _},
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-subscribed">>, _attrs, _els}.

decode_pubsub_error_not_in_roster_group(__TopXMLNS,
					__Opts,
					{xmlel, <<"not-in-roster-group">>,
					 _attrs, _els}) ->
    {ps_error, 'not-in-roster-group', undefined}.

encode_pubsub_error_not_in_roster_group({ps_error,
					 'not-in-roster-group', _},
					__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"not-in-roster-group">>, _attrs, _els}.

decode_pubsub_error_nodeid_required(__TopXMLNS, __Opts,
				    {xmlel, <<"nodeid-required">>, _attrs,
				     _els}) ->
    {ps_error, 'nodeid-required', undefined}.

encode_pubsub_error_nodeid_required({ps_error,
				     'nodeid-required', _},
				    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"nodeid-required">>, _attrs, _els}.

decode_pubsub_error_max_nodes_exceeded(__TopXMLNS,
				       __Opts,
				       {xmlel, <<"max-nodes-exceeded">>, _attrs,
					_els}) ->
    {ps_error, 'max-nodes-exceeded', undefined}.

encode_pubsub_error_max_nodes_exceeded({ps_error,
					'max-nodes-exceeded', _},
				       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"max-nodes-exceeded">>, _attrs, _els}.

decode_pubsub_error_max_items_exceeded(__TopXMLNS,
				       __Opts,
				       {xmlel, <<"max-items-exceeded">>, _attrs,
					_els}) ->
    {ps_error, 'max-items-exceeded', undefined}.

encode_pubsub_error_max_items_exceeded({ps_error,
					'max-items-exceeded', _},
				       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"max-items-exceeded">>, _attrs, _els}.

decode_pubsub_error_jid_required(__TopXMLNS, __Opts,
				 {xmlel, <<"jid-required">>, _attrs, _els}) ->
    {ps_error, 'jid-required', undefined}.

encode_pubsub_error_jid_required({ps_error,
				  'jid-required', _},
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"jid-required">>, _attrs, _els}.

decode_pubsub_error_item_required(__TopXMLNS, __Opts,
				  {xmlel, <<"item-required">>, _attrs, _els}) ->
    {ps_error, 'item-required', undefined}.

encode_pubsub_error_item_required({ps_error,
				   'item-required', _},
				  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"item-required">>, _attrs, _els}.

decode_pubsub_error_item_forbidden(__TopXMLNS, __Opts,
				   {xmlel, <<"item-forbidden">>, _attrs,
				    _els}) ->
    {ps_error, 'item-forbidden', undefined}.

encode_pubsub_error_item_forbidden({ps_error,
				    'item-forbidden', _},
				   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"item-forbidden">>, _attrs, _els}.

decode_pubsub_error_invalid_subid(__TopXMLNS, __Opts,
				  {xmlel, <<"invalid-subid">>, _attrs, _els}) ->
    {ps_error, 'invalid-subid', undefined}.

encode_pubsub_error_invalid_subid({ps_error,
				   'invalid-subid', _},
				  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-subid">>, _attrs, _els}.

decode_pubsub_error_invalid_payload(__TopXMLNS, __Opts,
				    {xmlel, <<"invalid-payload">>, _attrs,
				     _els}) ->
    {ps_error, 'invalid-payload', undefined}.

encode_pubsub_error_invalid_payload({ps_error,
				     'invalid-payload', _},
				    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-payload">>, _attrs, _els}.

decode_pubsub_error_invalid_options(__TopXMLNS, __Opts,
				    {xmlel, <<"invalid-options">>, _attrs,
				     _els}) ->
    {ps_error, 'invalid-options', undefined}.

encode_pubsub_error_invalid_options({ps_error,
				     'invalid-options', _},
				    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-options">>, _attrs, _els}.

decode_pubsub_error_invalid_jid(__TopXMLNS, __Opts,
				{xmlel, <<"invalid-jid">>, _attrs, _els}) ->
    {ps_error, 'invalid-jid', undefined}.

encode_pubsub_error_invalid_jid({ps_error,
				 'invalid-jid', _},
				__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"invalid-jid">>, _attrs, _els}.

decode_pubsub_error_configuration_required(__TopXMLNS,
					   __Opts,
					   {xmlel, <<"configuration-required">>,
					    _attrs, _els}) ->
    {ps_error, 'configuration-required', undefined}.

encode_pubsub_error_configuration_required({ps_error,
					    'configuration-required', _},
					   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"configuration-required">>, _attrs, _els}.

decode_pubsub_error_closed_node(__TopXMLNS, __Opts,
				{xmlel, <<"closed-node">>, _attrs, _els}) ->
    {ps_error, 'closed-node', undefined}.

encode_pubsub_error_closed_node({ps_error,
				 'closed-node', _},
				__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#errors">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"closed-node">>, _attrs, _els}.

decode_pubsub_owner(__TopXMLNS, __Opts,
		    {xmlel, <<"pubsub">>, _attrs, _els}) ->
    {Subscriptions, Affiliations, Default, Purge, Delete,
     Configure} =
	decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				undefined, undefined, undefined, undefined,
				undefined, undefined),
    {pubsub_owner, Affiliations, Configure, Default, Delete,
     Purge, Subscriptions}.

decode_pubsub_owner_els(__TopXMLNS, __Opts, [],
			Subscriptions, Affiliations, Default, Purge, Delete,
			Configure) ->
    {Subscriptions, Affiliations, Default, Purge, Delete,
     Configure};
decode_pubsub_owner_els(__TopXMLNS, __Opts,
			[{xmlel, <<"affiliations">>, _attrs, _} = _el | _els],
			Subscriptions, Affiliations, Default, Purge, Delete,
			Configure) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions,
				  decode_pubsub_owner_affiliations(<<"http://jabber.org/protocol/pubsub#owner">>,
								   __Opts, _el),
				  Default, Purge, Delete, Configure);
      _ ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  Delete, Configure)
    end;
decode_pubsub_owner_els(__TopXMLNS, __Opts,
			[{xmlel, <<"configure">>, _attrs, _} = _el | _els],
			Subscriptions, Affiliations, Default, Purge, Delete,
			Configure) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  Delete,
				  decode_pubsub_configure(<<"http://jabber.org/protocol/pubsub">>,
							  __Opts, _el));
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  Delete,
				  decode_pubsub_configure(<<"http://jabber.org/protocol/pubsub#owner">>,
							  __Opts, _el));
      _ ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  Delete, Configure)
    end;
decode_pubsub_owner_els(__TopXMLNS, __Opts,
			[{xmlel, <<"default">>, _attrs, _} = _el | _els],
			Subscriptions, Affiliations, Default, Purge, Delete,
			Configure) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations,
				  decode_pubsub_default(<<"http://jabber.org/protocol/pubsub">>,
							__Opts, _el),
				  Purge, Delete, Configure);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations,
				  decode_pubsub_default(<<"http://jabber.org/protocol/pubsub#owner">>,
							__Opts, _el),
				  Purge, Delete, Configure);
      _ ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  Delete, Configure)
    end;
decode_pubsub_owner_els(__TopXMLNS, __Opts,
			[{xmlel, <<"delete">>, _attrs, _} = _el | _els],
			Subscriptions, Affiliations, Default, Purge, Delete,
			Configure) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub">>,
						       __Opts, _el),
				  Configure);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub#owner">>,
						       __Opts, _el),
				  Configure);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub#event">>,
						       __Opts, _el),
				  Configure);
      _ ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  Delete, Configure)
    end;
decode_pubsub_owner_els(__TopXMLNS, __Opts,
			[{xmlel, <<"purge">>, _attrs, _} = _el | _els],
			Subscriptions, Affiliations, Default, Purge, Delete,
			Configure) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default,
				  decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub">>,
						      __Opts, _el),
				  Delete, Configure);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default,
				  decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub#owner">>,
						      __Opts, _el),
				  Delete, Configure);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default,
				  decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub#event">>,
						      __Opts, _el),
				  Delete, Configure);
      _ ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  Delete, Configure)
    end;
decode_pubsub_owner_els(__TopXMLNS, __Opts,
			[{xmlel, <<"subscriptions">>, _attrs, _} = _el | _els],
			Subscriptions, Affiliations, Default, Purge, Delete,
			Configure) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  decode_pubsub_subscriptions(<<"http://jabber.org/protocol/pubsub">>,
							      __Opts, _el),
				  Affiliations, Default, Purge, Delete,
				  Configure);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  decode_pubsub_subscriptions(<<"http://jabber.org/protocol/pubsub#owner">>,
							      __Opts, _el),
				  Affiliations, Default, Purge, Delete,
				  Configure);
      _ ->
	  decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
				  Subscriptions, Affiliations, Default, Purge,
				  Delete, Configure)
    end;
decode_pubsub_owner_els(__TopXMLNS, __Opts, [_ | _els],
			Subscriptions, Affiliations, Default, Purge, Delete,
			Configure) ->
    decode_pubsub_owner_els(__TopXMLNS, __Opts, _els,
			    Subscriptions, Affiliations, Default, Purge, Delete,
			    Configure).

encode_pubsub_owner({pubsub_owner, Affiliations,
		     Configure, Default, Delete, Purge, Subscriptions},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#owner">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_owner_$subscriptions'(Subscriptions,
							   __NewTopXMLNS,
							   'encode_pubsub_owner_$affiliations'(Affiliations,
											       __NewTopXMLNS,
											       'encode_pubsub_owner_$default'(Default,
															      __NewTopXMLNS,
															      'encode_pubsub_owner_$purge'(Purge,
																			   __NewTopXMLNS,
																			   'encode_pubsub_owner_$delete'(Delete,
																							 __NewTopXMLNS,
																							 'encode_pubsub_owner_$configure'(Configure,
																											  __NewTopXMLNS,
																											  []))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"pubsub">>, _attrs, _els}.

'encode_pubsub_owner_$subscriptions'(undefined,
				     __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_owner_$subscriptions'(Subscriptions,
				     __TopXMLNS, _acc) ->
    [encode_pubsub_subscriptions(Subscriptions, __TopXMLNS)
     | _acc].

'encode_pubsub_owner_$affiliations'(undefined,
				    __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_owner_$affiliations'(Affiliations,
				    __TopXMLNS, _acc) ->
    [encode_pubsub_owner_affiliations(Affiliations,
				      __TopXMLNS)
     | _acc].

'encode_pubsub_owner_$default'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_pubsub_owner_$default'(Default, __TopXMLNS,
			       _acc) ->
    [encode_pubsub_default(Default, __TopXMLNS) | _acc].

'encode_pubsub_owner_$purge'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_pubsub_owner_$purge'(Purge, __TopXMLNS, _acc) ->
    [encode_pubsub_purge(Purge, __TopXMLNS) | _acc].

'encode_pubsub_owner_$delete'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_pubsub_owner_$delete'(Delete, __TopXMLNS,
			      _acc) ->
    [encode_pubsub_delete(Delete, __TopXMLNS) | _acc].

'encode_pubsub_owner_$configure'(undefined, __TopXMLNS,
				 _acc) ->
    _acc;
'encode_pubsub_owner_$configure'(Configure, __TopXMLNS,
				 _acc) ->
    [encode_pubsub_configure(Configure, __TopXMLNS) | _acc].

decode_pubsub(__TopXMLNS, __Opts,
	      {xmlel, <<"pubsub">>, _attrs, _els}) ->
    {Publish_options, Items, Options, Affiliations,
     Subscriptions, Default, Retract, Purge, Delete,
     Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
     Subscription} =
	decode_pubsub_els(__TopXMLNS, __Opts, _els, undefined,
			  undefined, undefined, undefined, undefined, undefined,
			  undefined, undefined, undefined, undefined, undefined,
			  undefined, undefined, undefined, undefined,
			  undefined),
    {pubsub, Subscriptions, Subscription, Affiliations,
     Publish, Publish_options, Subscribe, Unsubscribe,
     Options, Items, Retract, Create, Configure, Default,
     Delete, Purge, Rsm}.

decode_pubsub_els(__TopXMLNS, __Opts, [],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    {Publish_options, Items, Options, Affiliations,
     Subscriptions, Default, Retract, Purge, Delete,
     Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
     Subscription};
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"subscriptions">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    decode_pubsub_subscriptions(<<"http://jabber.org/protocol/pubsub">>,
							__Opts, _el),
			    Default, Retract, Purge, Delete, Configure, Create,
			    Unsubscribe, Subscribe, Publish, Rsm, Subscription);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    decode_pubsub_subscriptions(<<"http://jabber.org/protocol/pubsub#owner">>,
							__Opts, _el),
			    Default, Retract, Purge, Delete, Configure, Create,
			    Unsubscribe, Subscribe, Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"affiliations">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options,
			    decode_pubsub_affiliations(<<"http://jabber.org/protocol/pubsub">>,
						       __Opts, _el),
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"subscribe">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe,
			    decode_pubsub_subscribe(<<"http://jabber.org/protocol/pubsub">>,
						    __Opts, _el),
			    Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"unsubscribe">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create,
			    decode_pubsub_unsubscribe(<<"http://jabber.org/protocol/pubsub">>,
						      __Opts, _el),
			    Subscribe, Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"options">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items,
			    decode_pubsub_options(<<"http://jabber.org/protocol/pubsub">>,
						  __Opts, _el),
			    Affiliations, Subscriptions, Default, Retract,
			    Purge, Delete, Configure, Create, Unsubscribe,
			    Subscribe, Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"items">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options,
			    decode_pubsub_items(<<"http://jabber.org/protocol/pubsub">>,
						__Opts, _el),
			    Options, Affiliations, Subscriptions, Default,
			    Retract, Purge, Delete, Configure, Create,
			    Unsubscribe, Subscribe, Publish, Rsm, Subscription);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options,
			    decode_pubsub_items(<<"http://jabber.org/protocol/pubsub#event">>,
						__Opts, _el),
			    Options, Affiliations, Subscriptions, Default,
			    Retract, Purge, Delete, Configure, Create,
			    Unsubscribe, Subscribe, Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"retract">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default,
			    decode_pubsub_retract(<<"http://jabber.org/protocol/pubsub">>,
						  __Opts, _el),
			    Purge, Delete, Configure, Create, Unsubscribe,
			    Subscribe, Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"create">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure,
			    decode_pubsub_create(<<"http://jabber.org/protocol/pubsub">>,
						 __Opts, _el),
			    Unsubscribe, Subscribe, Publish, Rsm, Subscription);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure,
			    decode_pubsub_create(<<"http://jabber.org/protocol/pubsub#event">>,
						 __Opts, _el),
			    Unsubscribe, Subscribe, Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"configure">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    decode_pubsub_configure(<<"http://jabber.org/protocol/pubsub">>,
						    __Opts, _el),
			    Create, Unsubscribe, Subscribe, Publish, Rsm,
			    Subscription);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    decode_pubsub_configure(<<"http://jabber.org/protocol/pubsub#owner">>,
						    __Opts, _el),
			    Create, Unsubscribe, Subscribe, Publish, Rsm,
			    Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"publish-options">>, _attrs, _} = _el
		   | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    decode_pubsub_publish_options(<<"http://jabber.org/protocol/pubsub">>,
							  __Opts, _el),
			    Items, Options, Affiliations, Subscriptions,
			    Default, Retract, Purge, Delete, Configure, Create,
			    Unsubscribe, Subscribe, Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"default">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions,
			    decode_pubsub_default(<<"http://jabber.org/protocol/pubsub">>,
						  __Opts, _el),
			    Retract, Purge, Delete, Configure, Create,
			    Unsubscribe, Subscribe, Publish, Rsm, Subscription);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions,
			    decode_pubsub_default(<<"http://jabber.org/protocol/pubsub#owner">>,
						  __Opts, _el),
			    Retract, Purge, Delete, Configure, Create,
			    Unsubscribe, Subscribe, Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"delete">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge,
			    decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub">>,
						 __Opts, _el),
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge,
			    decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub#owner">>,
						 __Opts, _el),
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge,
			    decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub#event">>,
						 __Opts, _el),
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"purge">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract,
			    decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub">>,
						__Opts, _el),
			    Delete, Configure, Create, Unsubscribe, Subscribe,
			    Publish, Rsm, Subscription);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract,
			    decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub#owner">>,
						__Opts, _el),
			    Delete, Configure, Create, Unsubscribe, Subscribe,
			    Publish, Rsm, Subscription);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract,
			    decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub#event">>,
						__Opts, _el),
			    Delete, Configure, Create, Unsubscribe, Subscribe,
			    Publish, Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"subscription">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm,
			    decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub">>,
						       __Opts, _el));
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm,
			    decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub#owner">>,
						       __Opts, _el));
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm,
			    decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub#event">>,
						       __Opts, _el));
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"set">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/rsm">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    xep0059:decode_rsm_set(<<"http://jabber.org/protocol/rsm">>,
						   __Opts, _el),
			    Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts,
		  [{xmlel, <<"publish">>, _attrs, _} = _el | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe,
			    decode_pubsub_publish(<<"http://jabber.org/protocol/pubsub">>,
						  __Opts, _el),
			    Rsm, Subscription);
      _ ->
	  decode_pubsub_els(__TopXMLNS, __Opts, _els,
			    Publish_options, Items, Options, Affiliations,
			    Subscriptions, Default, Retract, Purge, Delete,
			    Configure, Create, Unsubscribe, Subscribe, Publish,
			    Rsm, Subscription)
    end;
decode_pubsub_els(__TopXMLNS, __Opts, [_ | _els],
		  Publish_options, Items, Options, Affiliations,
		  Subscriptions, Default, Retract, Purge, Delete,
		  Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		  Subscription) ->
    decode_pubsub_els(__TopXMLNS, __Opts, _els,
		      Publish_options, Items, Options, Affiliations,
		      Subscriptions, Default, Retract, Purge, Delete,
		      Configure, Create, Unsubscribe, Subscribe, Publish, Rsm,
		      Subscription).

encode_pubsub({pubsub, Subscriptions, Subscription,
	       Affiliations, Publish, Publish_options, Subscribe,
	       Unsubscribe, Options, Items, Retract, Create, Configure,
	       Default, Delete, Purge, Rsm},
	      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_$publish_options'(Publish_options,
						       __NewTopXMLNS,
						       'encode_pubsub_$items'(Items,
									      __NewTopXMLNS,
									      'encode_pubsub_$options'(Options,
												       __NewTopXMLNS,
												       'encode_pubsub_$affiliations'(Affiliations,
																     __NewTopXMLNS,
																     'encode_pubsub_$subscriptions'(Subscriptions,
																				    __NewTopXMLNS,
																				    'encode_pubsub_$default'(Default,
																							     __NewTopXMLNS,
																							     'encode_pubsub_$retract'(Retract,
																										      __NewTopXMLNS,
																										      'encode_pubsub_$purge'(Purge,
																													     __NewTopXMLNS,
																													     'encode_pubsub_$delete'(Delete,
																																     __NewTopXMLNS,
																																     'encode_pubsub_$configure'(Configure,
																																				__NewTopXMLNS,
																																				'encode_pubsub_$create'(Create,
																																							__NewTopXMLNS,
																																							'encode_pubsub_$unsubscribe'(Unsubscribe,
																																										     __NewTopXMLNS,
																																										     'encode_pubsub_$subscribe'(Subscribe,
																																														__NewTopXMLNS,
																																														'encode_pubsub_$publish'(Publish,
																																																	 __NewTopXMLNS,
																																																	 'encode_pubsub_$rsm'(Rsm,
																																																			      __NewTopXMLNS,
																																																			      'encode_pubsub_$subscription'(Subscription,
																																																							    __NewTopXMLNS,
																																																							    []))))))))))))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"pubsub">>, _attrs, _els}.

'encode_pubsub_$publish_options'(undefined, __TopXMLNS,
				 _acc) ->
    _acc;
'encode_pubsub_$publish_options'(Publish_options,
				 __TopXMLNS, _acc) ->
    [encode_pubsub_publish_options(Publish_options,
				   __TopXMLNS)
     | _acc].

'encode_pubsub_$items'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_$items'(Items, __TopXMLNS, _acc) ->
    [encode_pubsub_items(Items, __TopXMLNS) | _acc].

'encode_pubsub_$options'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_$options'(Options, __TopXMLNS, _acc) ->
    [encode_pubsub_options(Options, __TopXMLNS) | _acc].

'encode_pubsub_$affiliations'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_pubsub_$affiliations'(Affiliations, __TopXMLNS,
			      _acc) ->
    [encode_pubsub_affiliations(Affiliations, __TopXMLNS)
     | _acc].

'encode_pubsub_$subscriptions'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_pubsub_$subscriptions'(Subscriptions,
			       __TopXMLNS, _acc) ->
    [encode_pubsub_subscriptions(Subscriptions, __TopXMLNS)
     | _acc].

'encode_pubsub_$default'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_$default'(Default, __TopXMLNS, _acc) ->
    [encode_pubsub_default(Default, __TopXMLNS) | _acc].

'encode_pubsub_$retract'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_$retract'(Retract, __TopXMLNS, _acc) ->
    [encode_pubsub_retract(Retract, __TopXMLNS) | _acc].

'encode_pubsub_$purge'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_$purge'(Purge, __TopXMLNS, _acc) ->
    [encode_pubsub_purge(Purge, __TopXMLNS) | _acc].

'encode_pubsub_$delete'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_$delete'(Delete, __TopXMLNS, _acc) ->
    [encode_pubsub_delete(Delete, __TopXMLNS) | _acc].

'encode_pubsub_$configure'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_pubsub_$configure'(Configure, __TopXMLNS,
			   _acc) ->
    [encode_pubsub_configure(Configure, __TopXMLNS) | _acc].

'encode_pubsub_$create'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_$create'(Create, __TopXMLNS, _acc) ->
    [encode_pubsub_create(Create, __TopXMLNS) | _acc].

'encode_pubsub_$unsubscribe'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_pubsub_$unsubscribe'(Unsubscribe, __TopXMLNS,
			     _acc) ->
    [encode_pubsub_unsubscribe(Unsubscribe, __TopXMLNS)
     | _acc].

'encode_pubsub_$subscribe'(undefined, __TopXMLNS,
			   _acc) ->
    _acc;
'encode_pubsub_$subscribe'(Subscribe, __TopXMLNS,
			   _acc) ->
    [encode_pubsub_subscribe(Subscribe, __TopXMLNS) | _acc].

'encode_pubsub_$publish'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_$publish'(Publish, __TopXMLNS, _acc) ->
    [encode_pubsub_publish(Publish, __TopXMLNS) | _acc].

'encode_pubsub_$rsm'(undefined, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_$rsm'(Rsm, __TopXMLNS, _acc) ->
    [xep0059:encode_rsm_set(Rsm, __TopXMLNS) | _acc].

'encode_pubsub_$subscription'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_pubsub_$subscription'(Subscription, __TopXMLNS,
			      _acc) ->
    [encode_pubsub_subscription(Subscription, __TopXMLNS)
     | _acc].

decode_pubsub_purge(__TopXMLNS, __Opts,
		    {xmlel, <<"purge">>, _attrs, _els}) ->
    Node = decode_pubsub_purge_attrs(__TopXMLNS, _attrs,
				     undefined),
    Node.

decode_pubsub_purge_attrs(__TopXMLNS,
			  [{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_purge_attrs(__TopXMLNS, _attrs, _val);
decode_pubsub_purge_attrs(__TopXMLNS, [_ | _attrs],
			  Node) ->
    decode_pubsub_purge_attrs(__TopXMLNS, _attrs, Node);
decode_pubsub_purge_attrs(__TopXMLNS, [], Node) ->
    decode_pubsub_purge_attr_node(__TopXMLNS, Node).

encode_pubsub_purge(Node, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#owner">>,
						 <<"http://jabber.org/protocol/pubsub#event">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_pubsub_purge_attr_node(Node,
					   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								      __TopXMLNS)),
    {xmlel, <<"purge">>, _attrs, _els}.

decode_pubsub_purge_attr_node(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"purge">>, __TopXMLNS}});
decode_pubsub_purge_attr_node(__TopXMLNS, _val) -> _val.

encode_pubsub_purge_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_delete(__TopXMLNS, __Opts,
		     {xmlel, <<"delete">>, _attrs, _els}) ->
    Uri = decode_pubsub_delete_els(__TopXMLNS, __Opts, _els,
				   <<>>),
    Node = decode_pubsub_delete_attrs(__TopXMLNS, _attrs,
				      undefined),
    {Node, Uri}.

decode_pubsub_delete_els(__TopXMLNS, __Opts, [], Uri) ->
    Uri;
decode_pubsub_delete_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"redirect">>, _attrs, _} = _el | _els],
			 Uri) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_delete_els(__TopXMLNS, __Opts, _els,
				   decode_pubsub_redirect(<<"http://jabber.org/protocol/pubsub">>,
							  __Opts, _el));
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_delete_els(__TopXMLNS, __Opts, _els,
				   decode_pubsub_redirect(<<"http://jabber.org/protocol/pubsub#owner">>,
							  __Opts, _el));
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_delete_els(__TopXMLNS, __Opts, _els,
				   decode_pubsub_redirect(<<"http://jabber.org/protocol/pubsub#event">>,
							  __Opts, _el));
      _ ->
	  decode_pubsub_delete_els(__TopXMLNS, __Opts, _els, Uri)
    end;
decode_pubsub_delete_els(__TopXMLNS, __Opts, [_ | _els],
			 Uri) ->
    decode_pubsub_delete_els(__TopXMLNS, __Opts, _els, Uri).

decode_pubsub_delete_attrs(__TopXMLNS,
			   [{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_delete_attrs(__TopXMLNS, _attrs, _val);
decode_pubsub_delete_attrs(__TopXMLNS, [_ | _attrs],
			   Node) ->
    decode_pubsub_delete_attrs(__TopXMLNS, _attrs, Node);
decode_pubsub_delete_attrs(__TopXMLNS, [], Node) ->
    decode_pubsub_delete_attr_node(__TopXMLNS, Node).

encode_pubsub_delete({Node, Uri}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#owner">>,
						 <<"http://jabber.org/protocol/pubsub#event">>],
						__TopXMLNS),
    _els = lists:reverse('encode_pubsub_delete_$uri'(Uri,
						     __NewTopXMLNS, [])),
    _attrs = encode_pubsub_delete_attr_node(Node,
					    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								       __TopXMLNS)),
    {xmlel, <<"delete">>, _attrs, _els}.

'encode_pubsub_delete_$uri'(<<>>, __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_delete_$uri'(Uri, __TopXMLNS, _acc) ->
    [encode_pubsub_redirect(Uri, __TopXMLNS) | _acc].

decode_pubsub_delete_attr_node(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"delete">>, __TopXMLNS}});
decode_pubsub_delete_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_delete_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_redirect(__TopXMLNS, __Opts,
		       {xmlel, <<"redirect">>, _attrs, _els}) ->
    Uri = decode_pubsub_redirect_attrs(__TopXMLNS, _attrs,
				       undefined),
    Uri.

decode_pubsub_redirect_attrs(__TopXMLNS,
			     [{<<"uri">>, _val} | _attrs], _Uri) ->
    decode_pubsub_redirect_attrs(__TopXMLNS, _attrs, _val);
decode_pubsub_redirect_attrs(__TopXMLNS, [_ | _attrs],
			     Uri) ->
    decode_pubsub_redirect_attrs(__TopXMLNS, _attrs, Uri);
decode_pubsub_redirect_attrs(__TopXMLNS, [], Uri) ->
    decode_pubsub_redirect_attr_uri(__TopXMLNS, Uri).

encode_pubsub_redirect(Uri, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#owner">>,
						 <<"http://jabber.org/protocol/pubsub#event">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_pubsub_redirect_attr_uri(Uri,
					     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									__TopXMLNS)),
    {xmlel, <<"redirect">>, _attrs, _els}.

decode_pubsub_redirect_attr_uri(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"uri">>, <<"redirect">>, __TopXMLNS}});
decode_pubsub_redirect_attr_uri(__TopXMLNS, _val) ->
    _val.

encode_pubsub_redirect_attr_uri(_val, _acc) ->
    [{<<"uri">>, _val} | _acc].

decode_pubsub_default(__TopXMLNS, __Opts,
		      {xmlel, <<"default">>, _attrs, _els}) ->
    Xdata = decode_pubsub_default_els(__TopXMLNS, __Opts,
				      _els, undefined),
    Node = decode_pubsub_default_attrs(__TopXMLNS, _attrs,
				       undefined),
    {Node, Xdata}.

decode_pubsub_default_els(__TopXMLNS, __Opts, [],
			  Xdata) ->
    Xdata;
decode_pubsub_default_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"x">>, _attrs, _} = _el | _els], Xdata) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_pubsub_default_els(__TopXMLNS, __Opts, _els,
				    xep0004:decode_xdata(<<"jabber:x:data">>,
							 __Opts, _el));
      _ ->
	  decode_pubsub_default_els(__TopXMLNS, __Opts, _els,
				    Xdata)
    end;
decode_pubsub_default_els(__TopXMLNS, __Opts,
			  [_ | _els], Xdata) ->
    decode_pubsub_default_els(__TopXMLNS, __Opts, _els,
			      Xdata).

decode_pubsub_default_attrs(__TopXMLNS,
			    [{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_default_attrs(__TopXMLNS, _attrs, _val);
decode_pubsub_default_attrs(__TopXMLNS, [_ | _attrs],
			    Node) ->
    decode_pubsub_default_attrs(__TopXMLNS, _attrs, Node);
decode_pubsub_default_attrs(__TopXMLNS, [], Node) ->
    decode_pubsub_default_attr_node(__TopXMLNS, Node).

encode_pubsub_default({Node, Xdata}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#owner">>],
						__TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_default_$xdata'(Xdata,
						     __NewTopXMLNS, [])),
    _attrs = encode_pubsub_default_attr_node(Node,
					     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									__TopXMLNS)),
    {xmlel, <<"default">>, _attrs, _els}.

'encode_pubsub_default_$xdata'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_pubsub_default_$xdata'(Xdata, __TopXMLNS,
			       _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

decode_pubsub_default_attr_node(__TopXMLNS,
				undefined) ->
    <<>>;
decode_pubsub_default_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_default_attr_node(<<>>, _acc) -> _acc;
encode_pubsub_default_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_publish_options(__TopXMLNS, __Opts,
			      {xmlel, <<"publish-options">>, _attrs, _els}) ->
    Xdata = decode_pubsub_publish_options_els(__TopXMLNS,
					      __Opts, _els, undefined),
    Xdata.

decode_pubsub_publish_options_els(__TopXMLNS, __Opts,
				  [], Xdata) ->
    Xdata;
decode_pubsub_publish_options_els(__TopXMLNS, __Opts,
				  [{xmlel, <<"x">>, _attrs, _} = _el | _els],
				  Xdata) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_pubsub_publish_options_els(__TopXMLNS, __Opts,
					    _els,
					    xep0004:decode_xdata(<<"jabber:x:data">>,
								 __Opts, _el));
      _ ->
	  decode_pubsub_publish_options_els(__TopXMLNS, __Opts,
					    _els, Xdata)
    end;
decode_pubsub_publish_options_els(__TopXMLNS, __Opts,
				  [_ | _els], Xdata) ->
    decode_pubsub_publish_options_els(__TopXMLNS, __Opts,
				      _els, Xdata).

encode_pubsub_publish_options(Xdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_publish_options_$xdata'(Xdata,
							     __NewTopXMLNS,
							     [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"publish-options">>, _attrs, _els}.

'encode_pubsub_publish_options_$xdata'(undefined,
				       __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_publish_options_$xdata'(Xdata,
				       __TopXMLNS, _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

decode_pubsub_configure(__TopXMLNS, __Opts,
			{xmlel, <<"configure">>, _attrs, _els}) ->
    Xdata = decode_pubsub_configure_els(__TopXMLNS, __Opts,
					_els, undefined),
    Node = decode_pubsub_configure_attrs(__TopXMLNS, _attrs,
					 undefined),
    {Node, Xdata}.

decode_pubsub_configure_els(__TopXMLNS, __Opts, [],
			    Xdata) ->
    Xdata;
decode_pubsub_configure_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"x">>, _attrs, _} = _el | _els],
			    Xdata) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_pubsub_configure_els(__TopXMLNS, __Opts, _els,
				      xep0004:decode_xdata(<<"jabber:x:data">>,
							   __Opts, _el));
      _ ->
	  decode_pubsub_configure_els(__TopXMLNS, __Opts, _els,
				      Xdata)
    end;
decode_pubsub_configure_els(__TopXMLNS, __Opts,
			    [_ | _els], Xdata) ->
    decode_pubsub_configure_els(__TopXMLNS, __Opts, _els,
				Xdata).

decode_pubsub_configure_attrs(__TopXMLNS,
			      [{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_configure_attrs(__TopXMLNS, _attrs, _val);
decode_pubsub_configure_attrs(__TopXMLNS, [_ | _attrs],
			      Node) ->
    decode_pubsub_configure_attrs(__TopXMLNS, _attrs, Node);
decode_pubsub_configure_attrs(__TopXMLNS, [], Node) ->
    decode_pubsub_configure_attr_node(__TopXMLNS, Node).

encode_pubsub_configure({Node, Xdata}, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#owner">>],
						__TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_configure_$xdata'(Xdata,
						       __NewTopXMLNS, [])),
    _attrs = encode_pubsub_configure_attr_node(Node,
					       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									  __TopXMLNS)),
    {xmlel, <<"configure">>, _attrs, _els}.

'encode_pubsub_configure_$xdata'(undefined, __TopXMLNS,
				 _acc) ->
    _acc;
'encode_pubsub_configure_$xdata'(Xdata, __TopXMLNS,
				 _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

decode_pubsub_configure_attr_node(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_pubsub_configure_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_configure_attr_node(<<>>, _acc) -> _acc;
encode_pubsub_configure_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_create(__TopXMLNS, __Opts,
		     {xmlel, <<"create">>, _attrs, _els}) ->
    Node = decode_pubsub_create_attrs(__TopXMLNS, _attrs,
				      undefined),
    Node.

decode_pubsub_create_attrs(__TopXMLNS,
			   [{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_create_attrs(__TopXMLNS, _attrs, _val);
decode_pubsub_create_attrs(__TopXMLNS, [_ | _attrs],
			   Node) ->
    decode_pubsub_create_attrs(__TopXMLNS, _attrs, Node);
decode_pubsub_create_attrs(__TopXMLNS, [], Node) ->
    decode_pubsub_create_attr_node(__TopXMLNS, Node).

encode_pubsub_create(Node, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#event">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_pubsub_create_attr_node(Node,
					    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								       __TopXMLNS)),
    {xmlel, <<"create">>, _attrs, _els}.

decode_pubsub_create_attr_node(__TopXMLNS, undefined) ->
    <<>>;
decode_pubsub_create_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_create_attr_node(<<>>, _acc) -> _acc;
encode_pubsub_create_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_retract(__TopXMLNS, __Opts,
		      {xmlel, <<"retract">>, _attrs, _els}) ->
    Items = decode_pubsub_retract_els(__TopXMLNS, __Opts,
				      _els, []),
    {Node, Notify} = decode_pubsub_retract_attrs(__TopXMLNS,
						 _attrs, undefined, undefined),
    {ps_retract, Node, Notify, Items}.

decode_pubsub_retract_els(__TopXMLNS, __Opts, [],
			  Items) ->
    lists:reverse(Items);
decode_pubsub_retract_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"item">>, _attrs, _} = _el | _els],
			  Items) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_retract_els(__TopXMLNS, __Opts, _els,
				    [decode_pubsub_item(<<"http://jabber.org/protocol/pubsub">>,
							__Opts, _el)
				     | Items]);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_retract_els(__TopXMLNS, __Opts, _els,
				    [decode_pubsub_item(<<"http://jabber.org/protocol/pubsub#event">>,
							__Opts, _el)
				     | Items]);
      _ ->
	  decode_pubsub_retract_els(__TopXMLNS, __Opts, _els,
				    Items)
    end;
decode_pubsub_retract_els(__TopXMLNS, __Opts,
			  [_ | _els], Items) ->
    decode_pubsub_retract_els(__TopXMLNS, __Opts, _els,
			      Items).

decode_pubsub_retract_attrs(__TopXMLNS,
			    [{<<"node">>, _val} | _attrs], _Node, Notify) ->
    decode_pubsub_retract_attrs(__TopXMLNS, _attrs, _val,
				Notify);
decode_pubsub_retract_attrs(__TopXMLNS,
			    [{<<"notify">>, _val} | _attrs], Node, _Notify) ->
    decode_pubsub_retract_attrs(__TopXMLNS, _attrs, Node,
				_val);
decode_pubsub_retract_attrs(__TopXMLNS, [_ | _attrs],
			    Node, Notify) ->
    decode_pubsub_retract_attrs(__TopXMLNS, _attrs, Node,
				Notify);
decode_pubsub_retract_attrs(__TopXMLNS, [], Node,
			    Notify) ->
    {decode_pubsub_retract_attr_node(__TopXMLNS, Node),
     decode_pubsub_retract_attr_notify(__TopXMLNS, Notify)}.

encode_pubsub_retract({ps_retract, Node, Notify, Items},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_retract_$items'(Items,
						     __NewTopXMLNS, [])),
    _attrs = encode_pubsub_retract_attr_notify(Notify,
					       encode_pubsub_retract_attr_node(Node,
									       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													  __TopXMLNS))),
    {xmlel, <<"retract">>, _attrs, _els}.

'encode_pubsub_retract_$items'([], __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_retract_$items'([Items | _els],
			       __TopXMLNS, _acc) ->
    'encode_pubsub_retract_$items'(_els, __TopXMLNS,
				   [encode_pubsub_item(Items, __TopXMLNS)
				    | _acc]).

decode_pubsub_retract_attr_node(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"retract">>, __TopXMLNS}});
decode_pubsub_retract_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_retract_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_retract_attr_notify(__TopXMLNS,
				  undefined) ->
    false;
decode_pubsub_retract_attr_notify(__TopXMLNS, _val) ->
    case catch dec_bool(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"notify">>, <<"retract">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_retract_attr_notify(false, _acc) -> _acc;
encode_pubsub_retract_attr_notify(_val, _acc) ->
    [{<<"notify">>, enc_bool(_val)} | _acc].

decode_pubsub_options(__TopXMLNS, __Opts,
		      {xmlel, <<"options">>, _attrs, _els}) ->
    Xdata = decode_pubsub_options_els(__TopXMLNS, __Opts,
				      _els, undefined),
    {Node, Subid, Jid} =
	decode_pubsub_options_attrs(__TopXMLNS, _attrs,
				    undefined, undefined, undefined),
    {ps_options, Node, Jid, Subid, Xdata}.

decode_pubsub_options_els(__TopXMLNS, __Opts, [],
			  Xdata) ->
    Xdata;
decode_pubsub_options_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"x">>, _attrs, _} = _el | _els], Xdata) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_pubsub_options_els(__TopXMLNS, __Opts, _els,
				    xep0004:decode_xdata(<<"jabber:x:data">>,
							 __Opts, _el));
      _ ->
	  decode_pubsub_options_els(__TopXMLNS, __Opts, _els,
				    Xdata)
    end;
decode_pubsub_options_els(__TopXMLNS, __Opts,
			  [_ | _els], Xdata) ->
    decode_pubsub_options_els(__TopXMLNS, __Opts, _els,
			      Xdata).

decode_pubsub_options_attrs(__TopXMLNS,
			    [{<<"node">>, _val} | _attrs], _Node, Subid, Jid) ->
    decode_pubsub_options_attrs(__TopXMLNS, _attrs, _val,
				Subid, Jid);
decode_pubsub_options_attrs(__TopXMLNS,
			    [{<<"subid">>, _val} | _attrs], Node, _Subid,
			    Jid) ->
    decode_pubsub_options_attrs(__TopXMLNS, _attrs, Node,
				_val, Jid);
decode_pubsub_options_attrs(__TopXMLNS,
			    [{<<"jid">>, _val} | _attrs], Node, Subid, _Jid) ->
    decode_pubsub_options_attrs(__TopXMLNS, _attrs, Node,
				Subid, _val);
decode_pubsub_options_attrs(__TopXMLNS, [_ | _attrs],
			    Node, Subid, Jid) ->
    decode_pubsub_options_attrs(__TopXMLNS, _attrs, Node,
				Subid, Jid);
decode_pubsub_options_attrs(__TopXMLNS, [], Node, Subid,
			    Jid) ->
    {decode_pubsub_options_attr_node(__TopXMLNS, Node),
     decode_pubsub_options_attr_subid(__TopXMLNS, Subid),
     decode_pubsub_options_attr_jid(__TopXMLNS, Jid)}.

encode_pubsub_options({ps_options, Node, Jid, Subid,
		       Xdata},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_options_$xdata'(Xdata,
						     __NewTopXMLNS, [])),
    _attrs = encode_pubsub_options_attr_jid(Jid,
					    encode_pubsub_options_attr_subid(Subid,
									     encode_pubsub_options_attr_node(Node,
													     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																	__TopXMLNS)))),
    {xmlel, <<"options">>, _attrs, _els}.

'encode_pubsub_options_$xdata'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_pubsub_options_$xdata'(Xdata, __TopXMLNS,
			       _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

decode_pubsub_options_attr_node(__TopXMLNS,
				undefined) ->
    <<>>;
decode_pubsub_options_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_options_attr_node(<<>>, _acc) -> _acc;
encode_pubsub_options_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_options_attr_subid(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_pubsub_options_attr_subid(__TopXMLNS, _val) ->
    _val.

encode_pubsub_options_attr_subid(<<>>, _acc) -> _acc;
encode_pubsub_options_attr_subid(_val, _acc) ->
    [{<<"subid">>, _val} | _acc].

decode_pubsub_options_attr_jid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"options">>, __TopXMLNS}});
decode_pubsub_options_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"options">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_options_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_pubsub_publish(__TopXMLNS, __Opts,
		      {xmlel, <<"publish">>, _attrs, _els}) ->
    Items = decode_pubsub_publish_els(__TopXMLNS, __Opts,
				      _els, []),
    Node = decode_pubsub_publish_attrs(__TopXMLNS, _attrs,
				       undefined),
    {ps_publish, Node, Items}.

decode_pubsub_publish_els(__TopXMLNS, __Opts, [],
			  Items) ->
    lists:reverse(Items);
decode_pubsub_publish_els(__TopXMLNS, __Opts,
			  [{xmlel, <<"item">>, _attrs, _} = _el | _els],
			  Items) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_publish_els(__TopXMLNS, __Opts, _els,
				    [decode_pubsub_item(<<"http://jabber.org/protocol/pubsub">>,
							__Opts, _el)
				     | Items]);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_publish_els(__TopXMLNS, __Opts, _els,
				    [decode_pubsub_item(<<"http://jabber.org/protocol/pubsub#event">>,
							__Opts, _el)
				     | Items]);
      _ ->
	  decode_pubsub_publish_els(__TopXMLNS, __Opts, _els,
				    Items)
    end;
decode_pubsub_publish_els(__TopXMLNS, __Opts,
			  [_ | _els], Items) ->
    decode_pubsub_publish_els(__TopXMLNS, __Opts, _els,
			      Items).

decode_pubsub_publish_attrs(__TopXMLNS,
			    [{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_publish_attrs(__TopXMLNS, _attrs, _val);
decode_pubsub_publish_attrs(__TopXMLNS, [_ | _attrs],
			    Node) ->
    decode_pubsub_publish_attrs(__TopXMLNS, _attrs, Node);
decode_pubsub_publish_attrs(__TopXMLNS, [], Node) ->
    decode_pubsub_publish_attr_node(__TopXMLNS, Node).

encode_pubsub_publish({ps_publish, Node, Items},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_publish_$items'(Items,
						     __NewTopXMLNS, [])),
    _attrs = encode_pubsub_publish_attr_node(Node,
					     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									__TopXMLNS)),
    {xmlel, <<"publish">>, _attrs, _els}.

'encode_pubsub_publish_$items'([], __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_publish_$items'([Items | _els],
			       __TopXMLNS, _acc) ->
    'encode_pubsub_publish_$items'(_els, __TopXMLNS,
				   [encode_pubsub_item(Items, __TopXMLNS)
				    | _acc]).

decode_pubsub_publish_attr_node(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"publish">>, __TopXMLNS}});
decode_pubsub_publish_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_publish_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_unsubscribe(__TopXMLNS, __Opts,
			  {xmlel, <<"unsubscribe">>, _attrs, _els}) ->
    {Node, Subid, Jid} =
	decode_pubsub_unsubscribe_attrs(__TopXMLNS, _attrs,
					undefined, undefined, undefined),
    {ps_unsubscribe, Node, Jid, Subid}.

decode_pubsub_unsubscribe_attrs(__TopXMLNS,
				[{<<"node">>, _val} | _attrs], _Node, Subid,
				Jid) ->
    decode_pubsub_unsubscribe_attrs(__TopXMLNS, _attrs,
				    _val, Subid, Jid);
decode_pubsub_unsubscribe_attrs(__TopXMLNS,
				[{<<"subid">>, _val} | _attrs], Node, _Subid,
				Jid) ->
    decode_pubsub_unsubscribe_attrs(__TopXMLNS, _attrs,
				    Node, _val, Jid);
decode_pubsub_unsubscribe_attrs(__TopXMLNS,
				[{<<"jid">>, _val} | _attrs], Node, Subid,
				_Jid) ->
    decode_pubsub_unsubscribe_attrs(__TopXMLNS, _attrs,
				    Node, Subid, _val);
decode_pubsub_unsubscribe_attrs(__TopXMLNS,
				[_ | _attrs], Node, Subid, Jid) ->
    decode_pubsub_unsubscribe_attrs(__TopXMLNS, _attrs,
				    Node, Subid, Jid);
decode_pubsub_unsubscribe_attrs(__TopXMLNS, [], Node,
				Subid, Jid) ->
    {decode_pubsub_unsubscribe_attr_node(__TopXMLNS, Node),
     decode_pubsub_unsubscribe_attr_subid(__TopXMLNS, Subid),
     decode_pubsub_unsubscribe_attr_jid(__TopXMLNS, Jid)}.

encode_pubsub_unsubscribe({ps_unsubscribe, Node, Jid,
			   Subid},
			  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_pubsub_unsubscribe_attr_jid(Jid,
						encode_pubsub_unsubscribe_attr_subid(Subid,
										     encode_pubsub_unsubscribe_attr_node(Node,
															 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																		    __TopXMLNS)))),
    {xmlel, <<"unsubscribe">>, _attrs, _els}.

decode_pubsub_unsubscribe_attr_node(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_pubsub_unsubscribe_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_unsubscribe_attr_node(<<>>, _acc) -> _acc;
encode_pubsub_unsubscribe_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_unsubscribe_attr_subid(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_pubsub_unsubscribe_attr_subid(__TopXMLNS,
				     _val) ->
    _val.

encode_pubsub_unsubscribe_attr_subid(<<>>, _acc) ->
    _acc;
encode_pubsub_unsubscribe_attr_subid(_val, _acc) ->
    [{<<"subid">>, _val} | _acc].

decode_pubsub_unsubscribe_attr_jid(__TopXMLNS,
				   undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"unsubscribe">>,
		   __TopXMLNS}});
decode_pubsub_unsubscribe_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"unsubscribe">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_unsubscribe_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_pubsub_subscribe(__TopXMLNS, __Opts,
			{xmlel, <<"subscribe">>, _attrs, _els}) ->
    {Node, Jid} = decode_pubsub_subscribe_attrs(__TopXMLNS,
						_attrs, undefined, undefined),
    {ps_subscribe, Node, Jid}.

decode_pubsub_subscribe_attrs(__TopXMLNS,
			      [{<<"node">>, _val} | _attrs], _Node, Jid) ->
    decode_pubsub_subscribe_attrs(__TopXMLNS, _attrs, _val,
				  Jid);
decode_pubsub_subscribe_attrs(__TopXMLNS,
			      [{<<"jid">>, _val} | _attrs], Node, _Jid) ->
    decode_pubsub_subscribe_attrs(__TopXMLNS, _attrs, Node,
				  _val);
decode_pubsub_subscribe_attrs(__TopXMLNS, [_ | _attrs],
			      Node, Jid) ->
    decode_pubsub_subscribe_attrs(__TopXMLNS, _attrs, Node,
				  Jid);
decode_pubsub_subscribe_attrs(__TopXMLNS, [], Node,
			      Jid) ->
    {decode_pubsub_subscribe_attr_node(__TopXMLNS, Node),
     decode_pubsub_subscribe_attr_jid(__TopXMLNS, Jid)}.

encode_pubsub_subscribe({ps_subscribe, Node, Jid},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_pubsub_subscribe_attr_jid(Jid,
					      encode_pubsub_subscribe_attr_node(Node,
										xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													   __TopXMLNS))),
    {xmlel, <<"subscribe">>, _attrs, _els}.

decode_pubsub_subscribe_attr_node(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_pubsub_subscribe_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_subscribe_attr_node(<<>>, _acc) -> _acc;
encode_pubsub_subscribe_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_subscribe_attr_jid(__TopXMLNS,
				 undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"subscribe">>,
		   __TopXMLNS}});
decode_pubsub_subscribe_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"subscribe">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_subscribe_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_pubsub_owner_affiliations(__TopXMLNS, __Opts,
				 {xmlel, <<"affiliations">>, _attrs, _els}) ->
    Affiliations =
	decode_pubsub_owner_affiliations_els(__TopXMLNS, __Opts,
					     _els, []),
    Node =
	decode_pubsub_owner_affiliations_attrs(__TopXMLNS,
					       _attrs, undefined),
    {Node, Affiliations}.

decode_pubsub_owner_affiliations_els(__TopXMLNS, __Opts,
				     [], Affiliations) ->
    lists:reverse(Affiliations);
decode_pubsub_owner_affiliations_els(__TopXMLNS, __Opts,
				     [{xmlel, <<"affiliation">>, _attrs, _} =
					  _el
				      | _els],
				     Affiliations) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_owner_affiliations_els(__TopXMLNS, __Opts,
					       _els,
					       [decode_pubsub_owner_affiliation(<<"http://jabber.org/protocol/pubsub#owner">>,
										__Opts,
										_el)
						| Affiliations]);
      _ ->
	  decode_pubsub_owner_affiliations_els(__TopXMLNS, __Opts,
					       _els, Affiliations)
    end;
decode_pubsub_owner_affiliations_els(__TopXMLNS, __Opts,
				     [_ | _els], Affiliations) ->
    decode_pubsub_owner_affiliations_els(__TopXMLNS, __Opts,
					 _els, Affiliations).

decode_pubsub_owner_affiliations_attrs(__TopXMLNS,
				       [{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_owner_affiliations_attrs(__TopXMLNS,
					   _attrs, _val);
decode_pubsub_owner_affiliations_attrs(__TopXMLNS,
				       [_ | _attrs], Node) ->
    decode_pubsub_owner_affiliations_attrs(__TopXMLNS,
					   _attrs, Node);
decode_pubsub_owner_affiliations_attrs(__TopXMLNS, [],
				       Node) ->
    decode_pubsub_owner_affiliations_attr_node(__TopXMLNS,
					       Node).

encode_pubsub_owner_affiliations({Node, Affiliations},
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#owner">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_owner_affiliations_$affiliations'(Affiliations,
								       __NewTopXMLNS,
								       [])),
    _attrs =
	encode_pubsub_owner_affiliations_attr_node(Node,
						   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									      __TopXMLNS)),
    {xmlel, <<"affiliations">>, _attrs, _els}.

'encode_pubsub_owner_affiliations_$affiliations'([],
						 __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_owner_affiliations_$affiliations'([Affiliations
						  | _els],
						 __TopXMLNS, _acc) ->
    'encode_pubsub_owner_affiliations_$affiliations'(_els,
						     __TopXMLNS,
						     [encode_pubsub_owner_affiliation(Affiliations,
										      __TopXMLNS)
						      | _acc]).

decode_pubsub_owner_affiliations_attr_node(__TopXMLNS,
					   undefined) ->
    <<>>;
decode_pubsub_owner_affiliations_attr_node(__TopXMLNS,
					   _val) ->
    _val.

encode_pubsub_owner_affiliations_attr_node(<<>>,
					   _acc) ->
    _acc;
encode_pubsub_owner_affiliations_attr_node(_val,
					   _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_affiliations(__TopXMLNS, __Opts,
			   {xmlel, <<"affiliations">>, _attrs, _els}) ->
    Affiliations =
	decode_pubsub_affiliations_els(__TopXMLNS, __Opts, _els,
				       []),
    Node = decode_pubsub_affiliations_attrs(__TopXMLNS,
					    _attrs, undefined),
    {Node, Affiliations}.

decode_pubsub_affiliations_els(__TopXMLNS, __Opts, [],
			       Affiliations) ->
    lists:reverse(Affiliations);
decode_pubsub_affiliations_els(__TopXMLNS, __Opts,
			       [{xmlel, <<"affiliation">>, _attrs, _} = _el
				| _els],
			       Affiliations) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_affiliations_els(__TopXMLNS, __Opts, _els,
					 [decode_pubsub_affiliation(<<"http://jabber.org/protocol/pubsub">>,
								    __Opts, _el)
					  | Affiliations]);
      _ ->
	  decode_pubsub_affiliations_els(__TopXMLNS, __Opts, _els,
					 Affiliations)
    end;
decode_pubsub_affiliations_els(__TopXMLNS, __Opts,
			       [_ | _els], Affiliations) ->
    decode_pubsub_affiliations_els(__TopXMLNS, __Opts, _els,
				   Affiliations).

decode_pubsub_affiliations_attrs(__TopXMLNS,
				 [{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_affiliations_attrs(__TopXMLNS, _attrs,
				     _val);
decode_pubsub_affiliations_attrs(__TopXMLNS,
				 [_ | _attrs], Node) ->
    decode_pubsub_affiliations_attrs(__TopXMLNS, _attrs,
				     Node);
decode_pubsub_affiliations_attrs(__TopXMLNS, [],
				 Node) ->
    decode_pubsub_affiliations_attr_node(__TopXMLNS, Node).

encode_pubsub_affiliations({Node, Affiliations},
			   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_affiliations_$affiliations'(Affiliations,
								 __NewTopXMLNS,
								 [])),
    _attrs = encode_pubsub_affiliations_attr_node(Node,
						  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									     __TopXMLNS)),
    {xmlel, <<"affiliations">>, _attrs, _els}.

'encode_pubsub_affiliations_$affiliations'([],
					   __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_affiliations_$affiliations'([Affiliations
					    | _els],
					   __TopXMLNS, _acc) ->
    'encode_pubsub_affiliations_$affiliations'(_els,
					       __TopXMLNS,
					       [encode_pubsub_affiliation(Affiliations,
									  __TopXMLNS)
						| _acc]).

decode_pubsub_affiliations_attr_node(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_pubsub_affiliations_attr_node(__TopXMLNS,
				     _val) ->
    _val.

encode_pubsub_affiliations_attr_node(<<>>, _acc) ->
    _acc;
encode_pubsub_affiliations_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_subscriptions(__TopXMLNS, __Opts,
			    {xmlel, <<"subscriptions">>, _attrs, _els}) ->
    Subscriptions =
	decode_pubsub_subscriptions_els(__TopXMLNS, __Opts,
					_els, []),
    Node = decode_pubsub_subscriptions_attrs(__TopXMLNS,
					     _attrs, undefined),
    {Node, Subscriptions}.

decode_pubsub_subscriptions_els(__TopXMLNS, __Opts, [],
				Subscriptions) ->
    lists:reverse(Subscriptions);
decode_pubsub_subscriptions_els(__TopXMLNS, __Opts,
				[{xmlel, <<"subscription">>, _attrs, _} = _el
				 | _els],
				Subscriptions) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_subscriptions_els(__TopXMLNS, __Opts,
					  _els,
					  [decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub">>,
								      __Opts,
								      _el)
					   | Subscriptions]);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_subscriptions_els(__TopXMLNS, __Opts,
					  _els,
					  [decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub#owner">>,
								      __Opts,
								      _el)
					   | Subscriptions]);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_subscriptions_els(__TopXMLNS, __Opts,
					  _els,
					  [decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub#event">>,
								      __Opts,
								      _el)
					   | Subscriptions]);
      _ ->
	  decode_pubsub_subscriptions_els(__TopXMLNS, __Opts,
					  _els, Subscriptions)
    end;
decode_pubsub_subscriptions_els(__TopXMLNS, __Opts,
				[_ | _els], Subscriptions) ->
    decode_pubsub_subscriptions_els(__TopXMLNS, __Opts,
				    _els, Subscriptions).

decode_pubsub_subscriptions_attrs(__TopXMLNS,
				  [{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_subscriptions_attrs(__TopXMLNS, _attrs,
				      _val);
decode_pubsub_subscriptions_attrs(__TopXMLNS,
				  [_ | _attrs], Node) ->
    decode_pubsub_subscriptions_attrs(__TopXMLNS, _attrs,
				      Node);
decode_pubsub_subscriptions_attrs(__TopXMLNS, [],
				  Node) ->
    decode_pubsub_subscriptions_attr_node(__TopXMLNS, Node).

encode_pubsub_subscriptions({Node, Subscriptions},
			    __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#owner">>],
						__TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_subscriptions_$subscriptions'(Subscriptions,
								   __NewTopXMLNS,
								   [])),
    _attrs = encode_pubsub_subscriptions_attr_node(Node,
						   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									      __TopXMLNS)),
    {xmlel, <<"subscriptions">>, _attrs, _els}.

'encode_pubsub_subscriptions_$subscriptions'([],
					     __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_subscriptions_$subscriptions'([Subscriptions
					      | _els],
					     __TopXMLNS, _acc) ->
    'encode_pubsub_subscriptions_$subscriptions'(_els,
						 __TopXMLNS,
						 [encode_pubsub_subscription(Subscriptions,
									     __TopXMLNS)
						  | _acc]).

decode_pubsub_subscriptions_attr_node(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_pubsub_subscriptions_attr_node(__TopXMLNS,
				      _val) ->
    _val.

encode_pubsub_subscriptions_attr_node(<<>>, _acc) ->
    _acc;
encode_pubsub_subscriptions_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_event(__TopXMLNS, __Opts,
		    {xmlel, <<"event">>, _attrs, _els}) ->
    {Items, Create, Delete, Purge, Configuration,
     Subscription} =
	decode_pubsub_event_els(__TopXMLNS, __Opts, _els,
				undefined, undefined, undefined, undefined,
				undefined, undefined),
    {ps_event, Items, Purge, Subscription, Delete, Create,
     Configuration}.

decode_pubsub_event_els(__TopXMLNS, __Opts, [], Items,
			Create, Delete, Purge, Configuration, Subscription) ->
    {Items, Create, Delete, Purge, Configuration,
     Subscription};
decode_pubsub_event_els(__TopXMLNS, __Opts,
			[{xmlel, <<"items">>, _attrs, _} = _el | _els], Items,
			Create, Delete, Purge, Configuration, Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els,
				  decode_pubsub_items(<<"http://jabber.org/protocol/pubsub">>,
						      __Opts, _el),
				  Create, Delete, Purge, Configuration,
				  Subscription);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els,
				  decode_pubsub_items(<<"http://jabber.org/protocol/pubsub#event">>,
						      __Opts, _el),
				  Create, Delete, Purge, Configuration,
				  Subscription);
      _ ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge, Configuration,
				  Subscription)
    end;
decode_pubsub_event_els(__TopXMLNS, __Opts,
			[{xmlel, <<"subscription">>, _attrs, _} = _el | _els],
			Items, Create, Delete, Purge, Configuration,
			Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge, Configuration,
				  decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub">>,
							     __Opts, _el));
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge, Configuration,
				  decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub#owner">>,
							     __Opts, _el));
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge, Configuration,
				  decode_pubsub_subscription(<<"http://jabber.org/protocol/pubsub#event">>,
							     __Opts, _el));
      _ ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge, Configuration,
				  Subscription)
    end;
decode_pubsub_event_els(__TopXMLNS, __Opts,
			[{xmlel, <<"purge">>, _attrs, _} = _el | _els], Items,
			Create, Delete, Purge, Configuration, Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete,
				  decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub">>,
						      __Opts, _el),
				  Configuration, Subscription);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete,
				  decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub#owner">>,
						      __Opts, _el),
				  Configuration, Subscription);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete,
				  decode_pubsub_purge(<<"http://jabber.org/protocol/pubsub#event">>,
						      __Opts, _el),
				  Configuration, Subscription);
      _ ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge, Configuration,
				  Subscription)
    end;
decode_pubsub_event_els(__TopXMLNS, __Opts,
			[{xmlel, <<"delete">>, _attrs, _} = _el | _els], Items,
			Create, Delete, Purge, Configuration, Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create,
				  decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub">>,
						       __Opts, _el),
				  Purge, Configuration, Subscription);
      <<"http://jabber.org/protocol/pubsub#owner">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create,
				  decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub#owner">>,
						       __Opts, _el),
				  Purge, Configuration, Subscription);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create,
				  decode_pubsub_delete(<<"http://jabber.org/protocol/pubsub#event">>,
						       __Opts, _el),
				  Purge, Configuration, Subscription);
      _ ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge, Configuration,
				  Subscription)
    end;
decode_pubsub_event_els(__TopXMLNS, __Opts,
			[{xmlel, <<"create">>, _attrs, _} = _el | _els], Items,
			Create, Delete, Purge, Configuration, Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  decode_pubsub_create(<<"http://jabber.org/protocol/pubsub">>,
						       __Opts, _el),
				  Delete, Purge, Configuration, Subscription);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  decode_pubsub_create(<<"http://jabber.org/protocol/pubsub#event">>,
						       __Opts, _el),
				  Delete, Purge, Configuration, Subscription);
      _ ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge, Configuration,
				  Subscription)
    end;
decode_pubsub_event_els(__TopXMLNS, __Opts,
			[{xmlel, <<"configuration">>, _attrs, _} = _el | _els],
			Items, Create, Delete, Purge, Configuration,
			Subscription) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge,
				  decode_pubsub_event_configuration(<<"http://jabber.org/protocol/pubsub#event">>,
								    __Opts,
								    _el),
				  Subscription);
      _ ->
	  decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
				  Create, Delete, Purge, Configuration,
				  Subscription)
    end;
decode_pubsub_event_els(__TopXMLNS, __Opts, [_ | _els],
			Items, Create, Delete, Purge, Configuration,
			Subscription) ->
    decode_pubsub_event_els(__TopXMLNS, __Opts, _els, Items,
			    Create, Delete, Purge, Configuration, Subscription).

encode_pubsub_event({ps_event, Items, Purge,
		     Subscription, Delete, Create, Configuration},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#event">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_pubsub_event_$items'(Items,
						      __NewTopXMLNS,
						      'encode_pubsub_event_$create'(Create,
										    __NewTopXMLNS,
										    'encode_pubsub_event_$delete'(Delete,
														  __NewTopXMLNS,
														  'encode_pubsub_event_$purge'(Purge,
																	       __NewTopXMLNS,
																	       'encode_pubsub_event_$configuration'(Configuration,
																						    __NewTopXMLNS,
																						    'encode_pubsub_event_$subscription'(Subscription,
																											__NewTopXMLNS,
																											[]))))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"event">>, _attrs, _els}.

'encode_pubsub_event_$items'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_pubsub_event_$items'(Items, __TopXMLNS, _acc) ->
    [encode_pubsub_items(Items, __TopXMLNS) | _acc].

'encode_pubsub_event_$create'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_pubsub_event_$create'(Create, __TopXMLNS,
			      _acc) ->
    [encode_pubsub_create(Create, __TopXMLNS) | _acc].

'encode_pubsub_event_$delete'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_pubsub_event_$delete'(Delete, __TopXMLNS,
			      _acc) ->
    [encode_pubsub_delete(Delete, __TopXMLNS) | _acc].

'encode_pubsub_event_$purge'(undefined, __TopXMLNS,
			     _acc) ->
    _acc;
'encode_pubsub_event_$purge'(Purge, __TopXMLNS, _acc) ->
    [encode_pubsub_purge(Purge, __TopXMLNS) | _acc].

'encode_pubsub_event_$configuration'(undefined,
				     __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_event_$configuration'(Configuration,
				     __TopXMLNS, _acc) ->
    [encode_pubsub_event_configuration(Configuration,
				       __TopXMLNS)
     | _acc].

'encode_pubsub_event_$subscription'(undefined,
				    __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_event_$subscription'(Subscription,
				    __TopXMLNS, _acc) ->
    [encode_pubsub_subscription(Subscription, __TopXMLNS)
     | _acc].

decode_pubsub_items(__TopXMLNS, __Opts,
		    {xmlel, <<"items">>, _attrs, _els}) ->
    {Items, Retract} = decode_pubsub_items_els(__TopXMLNS,
					       __Opts, _els, [], undefined),
    {Xmlns, Max_items, Node, Subid} =
	decode_pubsub_items_attrs(__TopXMLNS, _attrs, undefined,
				  undefined, undefined, undefined),
    {ps_items, Xmlns, Node, Items, Max_items, Subid,
     Retract}.

decode_pubsub_items_els(__TopXMLNS, __Opts, [], Items,
			Retract) ->
    {lists:reverse(Items), Retract};
decode_pubsub_items_els(__TopXMLNS, __Opts,
			[{xmlel, <<"retract">>, _attrs, _} = _el | _els], Items,
			Retract) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_items_els(__TopXMLNS, __Opts, _els, Items,
				  decode_pubsub_event_retract(<<"http://jabber.org/protocol/pubsub#event">>,
							      __Opts, _el));
      _ ->
	  decode_pubsub_items_els(__TopXMLNS, __Opts, _els, Items,
				  Retract)
    end;
decode_pubsub_items_els(__TopXMLNS, __Opts,
			[{xmlel, <<"item">>, _attrs, _} = _el | _els], Items,
			Retract) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"http://jabber.org/protocol/pubsub">> ->
	  decode_pubsub_items_els(__TopXMLNS, __Opts, _els,
				  [decode_pubsub_item(<<"http://jabber.org/protocol/pubsub">>,
						      __Opts, _el)
				   | Items],
				  Retract);
      <<"http://jabber.org/protocol/pubsub#event">> ->
	  decode_pubsub_items_els(__TopXMLNS, __Opts, _els,
				  [decode_pubsub_item(<<"http://jabber.org/protocol/pubsub#event">>,
						      __Opts, _el)
				   | Items],
				  Retract);
      _ ->
	  decode_pubsub_items_els(__TopXMLNS, __Opts, _els, Items,
				  Retract)
    end;
decode_pubsub_items_els(__TopXMLNS, __Opts, [_ | _els],
			Items, Retract) ->
    decode_pubsub_items_els(__TopXMLNS, __Opts, _els, Items,
			    Retract).

decode_pubsub_items_attrs(__TopXMLNS,
			  [{<<"xmlns">>, _val} | _attrs], _Xmlns, Max_items,
			  Node, Subid) ->
    decode_pubsub_items_attrs(__TopXMLNS, _attrs, _val,
			      Max_items, Node, Subid);
decode_pubsub_items_attrs(__TopXMLNS,
			  [{<<"max_items">>, _val} | _attrs], Xmlns, _Max_items,
			  Node, Subid) ->
    decode_pubsub_items_attrs(__TopXMLNS, _attrs, Xmlns,
			      _val, Node, Subid);
decode_pubsub_items_attrs(__TopXMLNS,
			  [{<<"node">>, _val} | _attrs], Xmlns, Max_items,
			  _Node, Subid) ->
    decode_pubsub_items_attrs(__TopXMLNS, _attrs, Xmlns,
			      Max_items, _val, Subid);
decode_pubsub_items_attrs(__TopXMLNS,
			  [{<<"subid">>, _val} | _attrs], Xmlns, Max_items,
			  Node, _Subid) ->
    decode_pubsub_items_attrs(__TopXMLNS, _attrs, Xmlns,
			      Max_items, Node, _val);
decode_pubsub_items_attrs(__TopXMLNS, [_ | _attrs],
			  Xmlns, Max_items, Node, Subid) ->
    decode_pubsub_items_attrs(__TopXMLNS, _attrs, Xmlns,
			      Max_items, Node, Subid);
decode_pubsub_items_attrs(__TopXMLNS, [], Xmlns,
			  Max_items, Node, Subid) ->
    {decode_pubsub_items_attr_xmlns(__TopXMLNS, Xmlns),
     decode_pubsub_items_attr_max_items(__TopXMLNS,
					Max_items),
     decode_pubsub_items_attr_node(__TopXMLNS, Node),
     decode_pubsub_items_attr_subid(__TopXMLNS, Subid)}.

encode_pubsub_items({ps_items, Xmlns, Node, Items,
		     Max_items, Subid, Retract},
		    __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#event">>],
						__TopXMLNS),
    _els = lists:reverse('encode_pubsub_items_$items'(Items,
						      __NewTopXMLNS,
						      'encode_pubsub_items_$retract'(Retract,
										     __NewTopXMLNS,
										     []))),
    _attrs = encode_pubsub_items_attr_subid(Subid,
					    encode_pubsub_items_attr_node(Node,
									  encode_pubsub_items_attr_max_items(Max_items,
													     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																	__TopXMLNS)))),
    {xmlel, <<"items">>, _attrs, _els}.

'encode_pubsub_items_$items'([], __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_items_$items'([Items | _els], __TopXMLNS,
			     _acc) ->
    'encode_pubsub_items_$items'(_els, __TopXMLNS,
				 [encode_pubsub_item(Items, __TopXMLNS)
				  | _acc]).

'encode_pubsub_items_$retract'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_pubsub_items_$retract'(Retract, __TopXMLNS,
			       _acc) ->
    [encode_pubsub_event_retract(Retract, __TopXMLNS)
     | _acc].

decode_pubsub_items_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_pubsub_items_attr_xmlns(__TopXMLNS, _val) ->
    _val.

decode_pubsub_items_attr_max_items(__TopXMLNS,
				   undefined) ->
    undefined;
decode_pubsub_items_attr_max_items(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"max_items">>, <<"items">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_items_attr_max_items(undefined, _acc) ->
    _acc;
encode_pubsub_items_attr_max_items(_val, _acc) ->
    [{<<"max_items">>, enc_int(_val)} | _acc].

decode_pubsub_items_attr_node(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"items">>, __TopXMLNS}});
decode_pubsub_items_attr_node(__TopXMLNS, _val) -> _val.

encode_pubsub_items_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_items_attr_subid(__TopXMLNS, undefined) ->
    <<>>;
decode_pubsub_items_attr_subid(__TopXMLNS, _val) ->
    _val.

encode_pubsub_items_attr_subid(<<>>, _acc) -> _acc;
encode_pubsub_items_attr_subid(_val, _acc) ->
    [{<<"subid">>, _val} | _acc].

decode_pubsub_item(__TopXMLNS, __Opts,
		   {xmlel, <<"item">>, _attrs, _els}) ->
    __Xmls = decode_pubsub_item_els(__TopXMLNS, __Opts,
				    _els, []),
    {Id, Xmlns, Node, Publisher} =
	decode_pubsub_item_attrs(__TopXMLNS, _attrs, undefined,
				 undefined, undefined, undefined),
    {ps_item, Xmlns, Id, __Xmls, Node, Publisher}.

decode_pubsub_item_els(__TopXMLNS, __Opts, [],
		       __Xmls) ->
    lists:reverse(__Xmls);
decode_pubsub_item_els(__TopXMLNS, __Opts,
		       [{xmlel, _name, _attrs, _} = _el | _els], __Xmls) ->
    decode_pubsub_item_els(__TopXMLNS, __Opts, _els,
			   [_el | __Xmls]);
decode_pubsub_item_els(__TopXMLNS, __Opts, [_ | _els],
		       __Xmls) ->
    decode_pubsub_item_els(__TopXMLNS, __Opts, _els,
			   __Xmls).

decode_pubsub_item_attrs(__TopXMLNS,
			 [{<<"id">>, _val} | _attrs], _Id, Xmlns, Node,
			 Publisher) ->
    decode_pubsub_item_attrs(__TopXMLNS, _attrs, _val,
			     Xmlns, Node, Publisher);
decode_pubsub_item_attrs(__TopXMLNS,
			 [{<<"xmlns">>, _val} | _attrs], Id, _Xmlns, Node,
			 Publisher) ->
    decode_pubsub_item_attrs(__TopXMLNS, _attrs, Id, _val,
			     Node, Publisher);
decode_pubsub_item_attrs(__TopXMLNS,
			 [{<<"node">>, _val} | _attrs], Id, Xmlns, _Node,
			 Publisher) ->
    decode_pubsub_item_attrs(__TopXMLNS, _attrs, Id, Xmlns,
			     _val, Publisher);
decode_pubsub_item_attrs(__TopXMLNS,
			 [{<<"publisher">>, _val} | _attrs], Id, Xmlns, Node,
			 _Publisher) ->
    decode_pubsub_item_attrs(__TopXMLNS, _attrs, Id, Xmlns,
			     Node, _val);
decode_pubsub_item_attrs(__TopXMLNS, [_ | _attrs], Id,
			 Xmlns, Node, Publisher) ->
    decode_pubsub_item_attrs(__TopXMLNS, _attrs, Id, Xmlns,
			     Node, Publisher);
decode_pubsub_item_attrs(__TopXMLNS, [], Id, Xmlns,
			 Node, Publisher) ->
    {decode_pubsub_item_attr_id(__TopXMLNS, Id),
     decode_pubsub_item_attr_xmlns(__TopXMLNS, Xmlns),
     decode_pubsub_item_attr_node(__TopXMLNS, Node),
     decode_pubsub_item_attr_publisher(__TopXMLNS,
				       Publisher)}.

encode_pubsub_item({ps_item, Xmlns, Id, __Xmls, Node,
		    Publisher},
		   __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#event">>],
						__TopXMLNS),
    _els = __Xmls,
    _attrs = encode_pubsub_item_attr_publisher(Publisher,
					       encode_pubsub_item_attr_node(Node,
									    encode_pubsub_item_attr_id(Id,
												       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																  __TopXMLNS)))),
    {xmlel, <<"item">>, _attrs, _els}.

decode_pubsub_item_attr_id(__TopXMLNS, undefined) ->
    <<>>;
decode_pubsub_item_attr_id(__TopXMLNS, _val) -> _val.

encode_pubsub_item_attr_id(<<>>, _acc) -> _acc;
encode_pubsub_item_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_pubsub_item_attr_xmlns(__TopXMLNS, undefined) ->
    <<>>;
decode_pubsub_item_attr_xmlns(__TopXMLNS, _val) -> _val.

decode_pubsub_item_attr_node(__TopXMLNS, undefined) ->
    <<>>;
decode_pubsub_item_attr_node(__TopXMLNS, _val) -> _val.

encode_pubsub_item_attr_node(<<>>, _acc) -> _acc;
encode_pubsub_item_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_item_attr_publisher(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_pubsub_item_attr_publisher(__TopXMLNS, _val) ->
    _val.

encode_pubsub_item_attr_publisher(<<>>, _acc) -> _acc;
encode_pubsub_item_attr_publisher(_val, _acc) ->
    [{<<"publisher">>, _val} | _acc].

decode_pubsub_event_retract(__TopXMLNS, __Opts,
			    {xmlel, <<"retract">>, _attrs, _els}) ->
    Id = decode_pubsub_event_retract_attrs(__TopXMLNS,
					   _attrs, undefined),
    Id.

decode_pubsub_event_retract_attrs(__TopXMLNS,
				  [{<<"id">>, _val} | _attrs], _Id) ->
    decode_pubsub_event_retract_attrs(__TopXMLNS, _attrs,
				      _val);
decode_pubsub_event_retract_attrs(__TopXMLNS,
				  [_ | _attrs], Id) ->
    decode_pubsub_event_retract_attrs(__TopXMLNS, _attrs,
				      Id);
decode_pubsub_event_retract_attrs(__TopXMLNS, [], Id) ->
    decode_pubsub_event_retract_attr_id(__TopXMLNS, Id).

encode_pubsub_event_retract(Id, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#event">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_pubsub_event_retract_attr_id(Id,
						 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									    __TopXMLNS)),
    {xmlel, <<"retract">>, _attrs, _els}.

decode_pubsub_event_retract_attr_id(__TopXMLNS,
				    undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"id">>, <<"retract">>, __TopXMLNS}});
decode_pubsub_event_retract_attr_id(__TopXMLNS, _val) ->
    _val.

encode_pubsub_event_retract_attr_id(_val, _acc) ->
    [{<<"id">>, _val} | _acc].

decode_pubsub_event_configuration(__TopXMLNS, __Opts,
				  {xmlel, <<"configuration">>, _attrs, _els}) ->
    Xdata =
	decode_pubsub_event_configuration_els(__TopXMLNS,
					      __Opts, _els, undefined),
    Node =
	decode_pubsub_event_configuration_attrs(__TopXMLNS,
						_attrs, undefined),
    {Node, Xdata}.

decode_pubsub_event_configuration_els(__TopXMLNS,
				      __Opts, [], Xdata) ->
    Xdata;
decode_pubsub_event_configuration_els(__TopXMLNS,
				      __Opts,
				      [{xmlel, <<"x">>, _attrs, _} = _el
				       | _els],
				      Xdata) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:x:data">> ->
	  decode_pubsub_event_configuration_els(__TopXMLNS,
						__Opts, _els,
						xep0004:decode_xdata(<<"jabber:x:data">>,
								     __Opts,
								     _el));
      _ ->
	  decode_pubsub_event_configuration_els(__TopXMLNS,
						__Opts, _els, Xdata)
    end;
decode_pubsub_event_configuration_els(__TopXMLNS,
				      __Opts, [_ | _els], Xdata) ->
    decode_pubsub_event_configuration_els(__TopXMLNS,
					  __Opts, _els, Xdata).

decode_pubsub_event_configuration_attrs(__TopXMLNS,
					[{<<"node">>, _val} | _attrs], _Node) ->
    decode_pubsub_event_configuration_attrs(__TopXMLNS,
					    _attrs, _val);
decode_pubsub_event_configuration_attrs(__TopXMLNS,
					[_ | _attrs], Node) ->
    decode_pubsub_event_configuration_attrs(__TopXMLNS,
					    _attrs, Node);
decode_pubsub_event_configuration_attrs(__TopXMLNS, [],
					Node) ->
    decode_pubsub_event_configuration_attr_node(__TopXMLNS,
						Node).

encode_pubsub_event_configuration({Node, Xdata},
				  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"http://jabber.org/protocol/pubsub#event">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_pubsub_event_configuration_$xdata'(Xdata,
								 __NewTopXMLNS,
								 [])),
    _attrs =
	encode_pubsub_event_configuration_attr_node(Node,
						    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									       __TopXMLNS)),
    {xmlel, <<"configuration">>, _attrs, _els}.

'encode_pubsub_event_configuration_$xdata'(undefined,
					   __TopXMLNS, _acc) ->
    _acc;
'encode_pubsub_event_configuration_$xdata'(Xdata,
					   __TopXMLNS, _acc) ->
    [xep0004:encode_xdata(Xdata, __TopXMLNS) | _acc].

decode_pubsub_event_configuration_attr_node(__TopXMLNS,
					    undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"configuration">>,
		   __TopXMLNS}});
decode_pubsub_event_configuration_attr_node(__TopXMLNS,
					    _val) ->
    _val.

encode_pubsub_event_configuration_attr_node(_val,
					    _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_owner_affiliation(__TopXMLNS, __Opts,
				{xmlel, <<"affiliation">>, _attrs, _els}) ->
    {Jid, Xmlns, Type} =
	decode_pubsub_owner_affiliation_attrs(__TopXMLNS,
					      _attrs, undefined, undefined,
					      undefined),
    {ps_affiliation, Xmlns, <<>>, Type, Jid}.

decode_pubsub_owner_affiliation_attrs(__TopXMLNS,
				      [{<<"jid">>, _val} | _attrs], _Jid, Xmlns,
				      Type) ->
    decode_pubsub_owner_affiliation_attrs(__TopXMLNS,
					  _attrs, _val, Xmlns, Type);
decode_pubsub_owner_affiliation_attrs(__TopXMLNS,
				      [{<<"xmlns">>, _val} | _attrs], Jid,
				      _Xmlns, Type) ->
    decode_pubsub_owner_affiliation_attrs(__TopXMLNS,
					  _attrs, Jid, _val, Type);
decode_pubsub_owner_affiliation_attrs(__TopXMLNS,
				      [{<<"affiliation">>, _val} | _attrs], Jid,
				      Xmlns, _Type) ->
    decode_pubsub_owner_affiliation_attrs(__TopXMLNS,
					  _attrs, Jid, Xmlns, _val);
decode_pubsub_owner_affiliation_attrs(__TopXMLNS,
				      [_ | _attrs], Jid, Xmlns, Type) ->
    decode_pubsub_owner_affiliation_attrs(__TopXMLNS,
					  _attrs, Jid, Xmlns, Type);
decode_pubsub_owner_affiliation_attrs(__TopXMLNS, [],
				      Jid, Xmlns, Type) ->
    {decode_pubsub_owner_affiliation_attr_jid(__TopXMLNS,
					      Jid),
     decode_pubsub_owner_affiliation_attr_xmlns(__TopXMLNS,
						Xmlns),
     decode_pubsub_owner_affiliation_attr_affiliation(__TopXMLNS,
						      Type)}.

encode_pubsub_owner_affiliation({ps_affiliation, Xmlns,
				 _, Type, Jid},
				__TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"http://jabber.org/protocol/pubsub#owner">>],
						__TopXMLNS),
    _els = [],
    _attrs =
	encode_pubsub_owner_affiliation_attr_affiliation(Type,
							 encode_pubsub_owner_affiliation_attr_jid(Jid,
												  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
															     __TopXMLNS))),
    {xmlel, <<"affiliation">>, _attrs, _els}.

decode_pubsub_owner_affiliation_attr_jid(__TopXMLNS,
					 undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"affiliation">>,
		   __TopXMLNS}});
decode_pubsub_owner_affiliation_attr_jid(__TopXMLNS,
					 _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"affiliation">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_owner_affiliation_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_pubsub_owner_affiliation_attr_xmlns(__TopXMLNS,
					   undefined) ->
    <<>>;
decode_pubsub_owner_affiliation_attr_xmlns(__TopXMLNS,
					   _val) ->
    _val.

decode_pubsub_owner_affiliation_attr_affiliation(__TopXMLNS,
						 undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"affiliation">>, <<"affiliation">>,
		   __TopXMLNS}});
decode_pubsub_owner_affiliation_attr_affiliation(__TopXMLNS,
						 _val) ->
    case catch dec_ps_aff(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"affiliation">>, <<"affiliation">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_owner_affiliation_attr_affiliation(_val,
						 _acc) ->
    [{<<"affiliation">>, enc_ps_aff(_val)} | _acc].

decode_pubsub_affiliation(__TopXMLNS, __Opts,
			  {xmlel, <<"affiliation">>, _attrs, _els}) ->
    {Node, Xmlns, Type} =
	decode_pubsub_affiliation_attrs(__TopXMLNS, _attrs,
					undefined, undefined, undefined),
    {ps_affiliation, Xmlns, Node, Type, undefined}.

decode_pubsub_affiliation_attrs(__TopXMLNS,
				[{<<"node">>, _val} | _attrs], _Node, Xmlns,
				Type) ->
    decode_pubsub_affiliation_attrs(__TopXMLNS, _attrs,
				    _val, Xmlns, Type);
decode_pubsub_affiliation_attrs(__TopXMLNS,
				[{<<"xmlns">>, _val} | _attrs], Node, _Xmlns,
				Type) ->
    decode_pubsub_affiliation_attrs(__TopXMLNS, _attrs,
				    Node, _val, Type);
decode_pubsub_affiliation_attrs(__TopXMLNS,
				[{<<"affiliation">>, _val} | _attrs], Node,
				Xmlns, _Type) ->
    decode_pubsub_affiliation_attrs(__TopXMLNS, _attrs,
				    Node, Xmlns, _val);
decode_pubsub_affiliation_attrs(__TopXMLNS,
				[_ | _attrs], Node, Xmlns, Type) ->
    decode_pubsub_affiliation_attrs(__TopXMLNS, _attrs,
				    Node, Xmlns, Type);
decode_pubsub_affiliation_attrs(__TopXMLNS, [], Node,
				Xmlns, Type) ->
    {decode_pubsub_affiliation_attr_node(__TopXMLNS, Node),
     decode_pubsub_affiliation_attr_xmlns(__TopXMLNS, Xmlns),
     decode_pubsub_affiliation_attr_affiliation(__TopXMLNS,
						Type)}.

encode_pubsub_affiliation({ps_affiliation, Xmlns, Node,
			   Type, _},
			  __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"http://jabber.org/protocol/pubsub">>],
						__TopXMLNS),
    _els = [],
    _attrs =
	encode_pubsub_affiliation_attr_affiliation(Type,
						   encode_pubsub_affiliation_attr_node(Node,
										       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
														  __TopXMLNS))),
    {xmlel, <<"affiliation">>, _attrs, _els}.

decode_pubsub_affiliation_attr_node(__TopXMLNS,
				    undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"node">>, <<"affiliation">>,
		   __TopXMLNS}});
decode_pubsub_affiliation_attr_node(__TopXMLNS, _val) ->
    _val.

encode_pubsub_affiliation_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_affiliation_attr_xmlns(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_pubsub_affiliation_attr_xmlns(__TopXMLNS,
				     _val) ->
    _val.

decode_pubsub_affiliation_attr_affiliation(__TopXMLNS,
					   undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"affiliation">>, <<"affiliation">>,
		   __TopXMLNS}});
decode_pubsub_affiliation_attr_affiliation(__TopXMLNS,
					   _val) ->
    case catch dec_ps_aff(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"affiliation">>, <<"affiliation">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_affiliation_attr_affiliation(_val,
					   _acc) ->
    [{<<"affiliation">>, enc_ps_aff(_val)} | _acc].

decode_pubsub_subscription(__TopXMLNS, __Opts,
			   {xmlel, <<"subscription">>, _attrs, _els}) ->
    {Xmlns, Jid, Node, Subid, Type, Expiry} =
	decode_pubsub_subscription_attrs(__TopXMLNS, _attrs,
					 undefined, undefined, undefined,
					 undefined, undefined, undefined),
    {ps_subscription, Xmlns, Jid, Type, Node, Subid,
     Expiry}.

decode_pubsub_subscription_attrs(__TopXMLNS,
				 [{<<"xmlns">>, _val} | _attrs], _Xmlns, Jid,
				 Node, Subid, Type, Expiry) ->
    decode_pubsub_subscription_attrs(__TopXMLNS, _attrs,
				     _val, Jid, Node, Subid, Type, Expiry);
decode_pubsub_subscription_attrs(__TopXMLNS,
				 [{<<"jid">>, _val} | _attrs], Xmlns, _Jid,
				 Node, Subid, Type, Expiry) ->
    decode_pubsub_subscription_attrs(__TopXMLNS, _attrs,
				     Xmlns, _val, Node, Subid, Type, Expiry);
decode_pubsub_subscription_attrs(__TopXMLNS,
				 [{<<"node">>, _val} | _attrs], Xmlns, Jid,
				 _Node, Subid, Type, Expiry) ->
    decode_pubsub_subscription_attrs(__TopXMLNS, _attrs,
				     Xmlns, Jid, _val, Subid, Type, Expiry);
decode_pubsub_subscription_attrs(__TopXMLNS,
				 [{<<"subid">>, _val} | _attrs], Xmlns, Jid,
				 Node, _Subid, Type, Expiry) ->
    decode_pubsub_subscription_attrs(__TopXMLNS, _attrs,
				     Xmlns, Jid, Node, _val, Type, Expiry);
decode_pubsub_subscription_attrs(__TopXMLNS,
				 [{<<"subscription">>, _val} | _attrs], Xmlns,
				 Jid, Node, Subid, _Type, Expiry) ->
    decode_pubsub_subscription_attrs(__TopXMLNS, _attrs,
				     Xmlns, Jid, Node, Subid, _val, Expiry);
decode_pubsub_subscription_attrs(__TopXMLNS,
				 [{<<"expiry">>, _val} | _attrs], Xmlns, Jid,
				 Node, Subid, Type, _Expiry) ->
    decode_pubsub_subscription_attrs(__TopXMLNS, _attrs,
				     Xmlns, Jid, Node, Subid, Type, _val);
decode_pubsub_subscription_attrs(__TopXMLNS,
				 [_ | _attrs], Xmlns, Jid, Node, Subid, Type,
				 Expiry) ->
    decode_pubsub_subscription_attrs(__TopXMLNS, _attrs,
				     Xmlns, Jid, Node, Subid, Type, Expiry);
decode_pubsub_subscription_attrs(__TopXMLNS, [], Xmlns,
				 Jid, Node, Subid, Type, Expiry) ->
    {decode_pubsub_subscription_attr_xmlns(__TopXMLNS,
					   Xmlns),
     decode_pubsub_subscription_attr_jid(__TopXMLNS, Jid),
     decode_pubsub_subscription_attr_node(__TopXMLNS, Node),
     decode_pubsub_subscription_attr_subid(__TopXMLNS,
					   Subid),
     decode_pubsub_subscription_attr_subscription(__TopXMLNS,
						  Type),
     decode_pubsub_subscription_attr_expiry(__TopXMLNS,
					    Expiry)}.

encode_pubsub_subscription({ps_subscription, Xmlns, Jid,
			    Type, Node, Subid, Expiry},
			   __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(Xmlns,
						[<<"http://jabber.org/protocol/pubsub">>,
						 <<"http://jabber.org/protocol/pubsub#owner">>,
						 <<"http://jabber.org/protocol/pubsub#event">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_pubsub_subscription_attr_expiry(Expiry,
						    encode_pubsub_subscription_attr_subscription(Type,
												 encode_pubsub_subscription_attr_subid(Subid,
																       encode_pubsub_subscription_attr_node(Node,
																					    encode_pubsub_subscription_attr_jid(Jid,
																										xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																													   __TopXMLNS)))))),
    {xmlel, <<"subscription">>, _attrs, _els}.

decode_pubsub_subscription_attr_xmlns(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_pubsub_subscription_attr_xmlns(__TopXMLNS,
				      _val) ->
    _val.

decode_pubsub_subscription_attr_jid(__TopXMLNS,
				    undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"jid">>, <<"subscription">>,
		   __TopXMLNS}});
decode_pubsub_subscription_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"subscription">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_subscription_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_pubsub_subscription_attr_node(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_pubsub_subscription_attr_node(__TopXMLNS,
				     _val) ->
    _val.

encode_pubsub_subscription_attr_node(<<>>, _acc) ->
    _acc;
encode_pubsub_subscription_attr_node(_val, _acc) ->
    [{<<"node">>, _val} | _acc].

decode_pubsub_subscription_attr_subid(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_pubsub_subscription_attr_subid(__TopXMLNS,
				      _val) ->
    _val.

encode_pubsub_subscription_attr_subid(<<>>, _acc) ->
    _acc;
encode_pubsub_subscription_attr_subid(_val, _acc) ->
    [{<<"subid">>, _val} | _acc].

decode_pubsub_subscription_attr_subscription(__TopXMLNS,
					     undefined) ->
    undefined;
decode_pubsub_subscription_attr_subscription(__TopXMLNS,
					     _val) ->
    case catch dec_enum(_val,
			[none, pending, subscribed, unconfigured])
	of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"subscription">>, <<"subscription">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_subscription_attr_subscription(undefined,
					     _acc) ->
    _acc;
encode_pubsub_subscription_attr_subscription(_val,
					     _acc) ->
    [{<<"subscription">>, enc_enum(_val)} | _acc].

decode_pubsub_subscription_attr_expiry(__TopXMLNS,
				       undefined) ->
    undefined;
decode_pubsub_subscription_attr_expiry(__TopXMLNS,
				       _val) ->
    case catch dec_utc(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"expiry">>, <<"subscription">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_pubsub_subscription_attr_expiry(undefined,
				       _acc) ->
    _acc;
encode_pubsub_subscription_attr_expiry(_val, _acc) ->
    [{<<"expiry">>, enc_utc(_val)} | _acc].
