REMOTE="http://www.oberhumer.com/opensource/lzo/download/lzo-2.03.tar.gz"
PKG_NAME=liblzo
PKG_VERSION=1.005
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
	ln -s liblzo2.so.2.0 liblzo.so ;\
	rm *.la ;\

.include "../../Makefile.pkg"
