all:
	abnfgen core utf8.abnf | sed 's/generated_from_abnf/utf8/g' | grep -v 'main:=' > utf8.rl
	abnfgen core uri.abnf | sed 's/generated_from_abnf/uri/g' | grep -v 'main:=' > uri.rl
	ragel -G2 jid.rl -o jid.c
	ragel -G2 xmpp_uri.rl -o xmpp_uri.c
