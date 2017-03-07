REMOTE="ftp://ftp.uu.net/graphics/jpeg/jpegsrc.v6b.tar.gz"
PKG_NAME=libjpeg
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--disable-static

default: make_dep fetch_src clean decomp_src rename_local patch_src config_src make_src install_local make_pkg update_config clean_after

rename_local:
	@cd build ;\
	mv jpeg-6b jpegsrc.v6b

install_local:
	@cd $(BUILDDIR) ;\
	mkdir -p ../../install/usr/include ;\
	mkdir -p ../../install/usr/lib ;\
	mkdir -p ../../install/usr/bin ;\
	mkdir -p ../../install/usr/share/man/man1 ;\
	$(MAKE) DESTDIR=$(DESTDIR) install ;\
	cd ../../install ;\
	cd usr/lib ;\
	ln -s libjpeg.so.62.0 libjpeg.so ;\
	rm *.la ;\
	strip libjpeg.so.62.0 ;\
	cd ../bin ;\
	strip *

.include "../../Makefile.pkg"
