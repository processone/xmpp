all:
	abnfgen core utf8.abnf | sed 's/generated_from_abnf/utf8/g' | grep -v 'main:=' > utf8.rl
	ragel -G2 jid.rl -o jid.c
