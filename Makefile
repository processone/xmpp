REBAR=./rebar
ERL=erl

all: src

src:
	$(REBAR) compile

spec: src/xmpp_codec.erl include/xmpp_codec.hrl
	$(ERL) -noinput +B -pa ebin -pa deps/*/ebin -eval \
	'case fxml_gen:compile("specs/xmpp_codec.spec", [{add_type_specs, xmpp_element}, {erl_dir, "src"}, {hrl_dir, "include"}]) of ok -> halt(0); _ -> halt(1) end.'

xdata:
	$(ERL) -noinput +B -pa ebin -pa deps/*/ebin -eval \
	'case xdata_codec:compile("specs", [{erl_dir, "src"}, {hrl_dir, "include"}]) of ok -> halt(0); _ -> halt(1) end.'

clean:
	$(REBAR) clean
	rm -rf deps
	rm -rf ebin

.PHONY: clean src all spec xdata
