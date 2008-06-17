#!/usr/bin/make -f

build: build-stamp
build-stamp:
	dh build
	touch $@

clean:
	dh $@

install: install-stamp
install-stamp: build-stamp
	dh install
	touch $@

binary-arch: install
	dh $@

binary-indep:

binary: binary-arch binary-indep

.PHONY: binary binary-arch binary-indep install clean build
