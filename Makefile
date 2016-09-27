
prefix ?= $(CURDIR)/usr
runprefix ?= $(prefix)

all: all-cc65 all-m65dsb all-xemu

prefix:
	@echo $(prefix)

.PHONY: all update all-cc65 all-m65dsb all-xemu install install-cc65 install-m65dbg install-xemu clean

install: install-cc65 install-m65dbg install-xemu

clean:
	@if [ "$(prefix)" = "$(CURDIR)/usr" ]; then echo "removing $(prefix)"; rm -rf "$(prefix)"; else echo "prefix=$(prefix), will not clean"; fi

update:
	git submodule init
	git submodule update

# cc65 stuff

all-cc65:
	make -C cc65 all

install-cc65: all-cc65
	make -C cc65 install prefix=$(prefix)

# m65dbg stuff

all-m65dbg:
	make -C m65dbg all

install-m65dbg: all-m65dbg
	make -C m65dbg install prefix=$(prefix)

# xemu stuff

all-xemu:
	make -C xemu TARGETS="c65 mega65" PREFIX=$(runprefix) all
	make -C xemu/rom all

install-xemu: all-xemu
	install -s -D -m 0755 xemu/build/bin/xc65.native $(prefix)/bin/xc65
	install -s -D -m 0755 xemu/build/bin/xmega65.native $(prefix)/bin/xmega65
	install -D -m 0644 xemu/rom/c65-system.rom $(prefix)/lib/xemu/c65-system.rom

