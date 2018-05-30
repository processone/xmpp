# Download ABNF Compiler from https://github.com/zinid/abnfc
ABNFC=abnfc
all:
	$(ABNFC) core utf8.abnf -i -n utf8 -o utf8.rl
	$(ABNFC) core uri.abnf -i -n uri -o uri.rl
	$(ABNFC) core lang.abnf -i -n lang -o lang.rl
	ragel -G2 jid.rl -o jid.c
	ragel -G2 xmpp_uri.rl -o xmpp_uri.c
	ragel -G2 xmpp_lang.rl -o xmpp_lang.c
