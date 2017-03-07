REMOTE="ftp://ftp.cac.washington.edu/pine/old/pine4.61.tar.Z"
PKG_NAME=pine
PKG_VERSION=1.003
DEPENDS=make

.include "../../Makefile.var"

BUILDDIR=build/pine4.61/imap

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_local make_local install_local make_pkg update_config clean_after

patch_local:
	@cd $(BUILDDIR) ;\
	for a in `find ../../../patch -type f`; do \
	patch -p0 < $$a ;\
	done

make_local:
	@cd $(BUILDDIR) ;\
	export SHLIB=libc-client.so.4.0 ;\
	export SUBST_VARS=SHLIB ;\
	$(MAKE) bso SHLIB="${SHLIB}" SSLTYPE="unix"

install_local:
	mkdir -p ./install/usr/include/c-client ;\
	mkdir -p ./install/usr/lib ;\
	cp $(BUILDDIR)/src/c-client/*.h ./install/usr/include/c-client ;\
	cp $(BUILDDIR)/c-client/c-client.a ./install/usr/lib/libc-client.a ;\
	cp $(BUILDDIR)/c-client/libc-client.so.4.0 ./install/usr/lib ;\
	strip ./install/usr/lib/*

.include "../../Makefile.pkg"
