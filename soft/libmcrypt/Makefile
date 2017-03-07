REMOTE="http://mesh.dl.sourceforge.net/sourceforge/mcrypt/libmcrypt-2.5.8.tar.gz"
PKG_NAME=libmcrypt
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
	ln -s libmcrypt.so.8.7 libmcrypt.so ;\
	rm *.la ;\

.include "../../Makefile.pkg"
