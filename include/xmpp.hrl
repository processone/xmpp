%%%-------------------------------------------------------------------
%%% @author Evgeny Khramtsov <ekhramtsov@process-one.net>
%%% @doc
%%%
%%% @end
%%% Created : 10 Dec 2015 by Evgeny Khramtsov <ekhramtsov@process-one.net>
%%%
%%%
%%% Copyright (C) 2002-2021 ProcessOne, SARL. All Rights Reserved.
%%%
%%% Licensed under the Apache License, Version 2.0 (the "License");
%%% you may not use this file except in compliance with the License.
%%% You may obtain a copy of the License at
%%%
%%%     http://www.apache.org/licenses/LICENSE-2.0
%%%
%%% Unless required by applicable law or agreed to in writing, software
%%% distributed under the License is distributed on an "AS IS" BASIS,
%%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%% See the License for the specific language governing permissions and
%%% limitations under the License.
%%%
%%%-------------------------------------------------------------------

-include("ns.hrl").
-include("jid.hrl").
-include("xmpp_codec.hrl").
-include_lib("fast_xml/include/fxml.hrl").

-type stanza() :: iq() | presence() | message().

-define(is_stanza(Pkt),
	(is_record(Pkt, iq) or
	 is_record(Pkt, message) or
	 is_record(Pkt, presence))).

-define(stanza_type(Pkt), element(3, Pkt)).
-define(stanza_from(Pkt), element(5, Pkt)).
-define(stanza_to(Pkt), element(6, Pkt)).
