REMOTE="http://monkey.org/~provos/libevent-1.1a.tar.gz"
PKG_NAME=libevent
PKG_VERSION=1.002
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--disable-static

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	cd ../../install ;\
	cd usr/lib ;\
	ln -s libevent-1.1a.so.1.2 libevent.so
	rm -f *.la ;\

.include "../../Makefile.pkg"
