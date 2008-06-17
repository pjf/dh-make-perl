#!/usr/bin/make -f

build: build-stamp
build-stamp:
	dh $@
	touch $@

clean:
	dh $@

install: install-stamp
install-stamp: build-stamp
	dh $@
	touch $@

binary-arch: install
	dh $@

binary-indep:

binary: binary-arch binary-indep
