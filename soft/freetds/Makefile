REMOTE="ftp://ftp.ibiblio.org/pub/Linux/ALPHA/freetds/stable/freetds-stable.tgz"
PKG_NAME=freetds
PKG_VERSION=1.003
DEPENDS=

.include "../../Makefile.var"

BUILDDIR=build/freetds-0.63

CONFIGURE_FLAGS=--enable-shared \
		--disable-static \
		--disable-threadsafe
	
default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	cd ../../install ;\
	cd usr/lib ;\
	ln -s libtds.so.3.0 libtds.so ;\
	rm *.la ;\

.include "../../Makefile.pkg"
