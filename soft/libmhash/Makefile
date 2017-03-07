REMOTE="http://heanet.dl.sourceforge.net/sourceforge/mhash/mhash-0.9.9.tar.gz"
PKG_NAME=libmhash
PKG_VERSION=1.009
DEPENDS=make

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--disable-static

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	cd ../../install ;\
	cd usr/lib ;\
	ln -s libmhash.so.2.0 libmhash.so ;\
	rm *.la ;\
	
.include "../../Makefile.pkg"
