ERL=erl

ifndef USE_REBAR3
REBAR ?= ./rebar
else
REBAR ?= rebar3
endif

IS_REBAR3:=$(shell expr `$(REBAR) --version | awk -F '[ .]' '/rebar / {print $$2}'` '>=' 3)

ifeq "$(IS_REBAR3)" "1"
  DEPSBASE=_build
  DEPDIR=$(DEPSBASE)/default/lib
  CHEDIR=$(DEPSBASE)/default/checkouts
else
  DEPSBASE=deps
  DEPDIR=$(DEPSBASE)
endif

all: src

src:
	$(REBAR) get-deps
	$(REBAR) compile

spec: src/xmpp_codec.erl include/xmpp_codec.hrl $(DEPDIR)/fast_xml/ebin/fxml_gen.beam
	$(ERL) -noinput +B -pa ebin -pa $(CHEDIR)/*/ebin -pa $(DEPDIR)/*/ebin -eval \
	'case fxml_gen:compile("specs/xmpp_codec.spec", [{add_type_specs, xmpp_element}, {erl_dir, "src"}, {hrl_dir, "include"}]) of ok -> halt(0); _ -> halt(1) end.'

xdata: ebin/xdata_codec.beam
	ERLTIDY=true $(REBAR) compile
	$(ERL) -noinput +B -pa ebin -pa $(CHEDIR)/*/ebin -pa $(DEPDIR)/*/ebin -eval \
	'case xdata_codec:compile("specs", [{erl_dir, "src"}, {hrl_dir, "include"}]) of ok -> halt(0); _ -> halt(1) end.'

clean:
	$(REBAR) clean
	rm -rf _build/default/lib
	rm -rf deps
	rm -rf ebin

xref: all
	$(REBAR) xref

ifeq ($(MAKECMDGOALS),doap)
xep_files := $(wildcard src/xep*.erl)
xep_numbers := $(foreach i,$(xep_files),$(shell echo $(i) | sed 's|.*p\([0-9]*\).*|\1|g' | sort -u))
xeps_missing := $(foreach i,$(xep_numbers),$(shell grep -q $(i) xmpp.doap || echo $(i)))
xeps_missing2 := $(foreach i,$(xeps_missing),$(strip $(i)))
endif

doap:
	@[ -z "$(xeps_missing2)" ] \
	        && echo "All the supported XEPs are mentioned in xmpp.doap." \
	        || (echo "XEPs supported but not mentioned in xmpp.doap: $(xeps_missing2)." && exit 1)

ifeq "$(IS_REBAR3)" "1"
dialyzer:
	$(REBAR) dialyzer
else
deps := $(wildcard deps/*/ebin)

dialyzer/erlang.plt:
	@mkdir -p dialyzer
	@dialyzer --build_plt --output_plt dialyzer/erlang.plt \
	-o dialyzer/erlang.log --apps kernel stdlib sasl erts syntax_tools compiler asn1 crypto; \
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
endif

_build/default/lib/fast_xml/ebin/fxml_gen.beam:
	$(REBAR) get-deps
	$(REBAR) compile

deps/fast_xml/ebin/fxml_gen.beam:
	$(REBAR) get-deps compile

ebin/xdata_codec.beam:
	$(REBAR) get-deps compile

.PHONY: clean src all spec xdata dialyzer erlang_plt deps_plt xmpp_plt doap
