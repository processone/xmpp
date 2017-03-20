REBAR=./rebar
ERL=erl

all: src

src:
	$(REBAR) get-deps compile

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

xref: all
	$(REBAR) skip_deps=true xref

deps := $(wildcard deps/*/ebin)

dialyzer/erlang.plt:
	@mkdir -p dialyzer
	@dialyzer --build_plt --output_plt dialyzer/erlang.plt \
	-o dialyzer/erlang.log --apps kernel stdlib sasl erts syntax_tools compiler; \
	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi

dialyzer/deps.plt:
	@mkdir -p dialyzer
	@dialyzer --build_plt --output_plt dialyzer/deps.plt \
	-o dialyzer/deps.log $(deps); \
	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi

dialyzer/xmpp.plt:
	@mkdir -p dialyzer
	@dialyzer --build_plt --output_plt dialyzer/xmpp.plt \
	-o dialyzer/xmpp.log ebin; \
	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi

erlang_plt: dialyzer/erlang.plt
	@dialyzer --plt dialyzer/erlang.plt --check_plt -o dialyzer/erlang.log; \
	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi

deps_plt: dialyzer/deps.plt
	@dialyzer --plt dialyzer/deps.plt --check_plt -o dialyzer/deps.log; \
	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi

xmpp_plt: dialyzer/xmpp.plt
	@dialyzer --plt dialyzer/xmpp.plt --check_plt -o dialyzer/xmpp.log; \
	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi

dialyzer: erlang_plt deps_plt xmpp_plt
	@dialyzer --plts dialyzer/*.plt --no_check_plt \
	--get_warnings -o dialyzer/error.log ebin; \
	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi

.PHONY: clean src all spec xdata dialyzer erlang_plt deps_plt xmpp_plt
