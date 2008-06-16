#!/usr/bin/make -f

build:
	dh $@

clean:
	dh $@

install: build
	dh $@

binary-arch: install
	dh $@

binary-indep:

binary: binary-arch binary-indep
