%%%-------------------------------------------------------------------
%%% @author Evgeny Khramtsov <ekhramtsov@process-one.net>
%%% @copyright (C) 2015, Evgeny Khramtsov
%%% @doc
%%%
%%% @end
%%% Created : 10 Dec 2015 by Evgeny Khramtsov <ekhramtsov@process-one.net>
%%%-------------------------------------------------------------------
-include("ns.hrl").
-include("jid.hrl").
-include("xmpp_codec.hrl").
-include("fxml.hrl").

-type stanza() :: iq() | presence() | message().

-define(is_stanza(Pkt),
	(is_record(Pkt, iq) or
	 is_record(Pkt, message) or
	 is_record(Pkt, presence))).
