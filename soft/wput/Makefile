REMOTE="http://garr.dl.sourceforge.net/sourceforge/wput/wput-0.6.tgz"
PKG_NAME=wput
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-nls

default: make_dep fetch_src clean decomp_src rename patch_src config_src make_src install_local make_pkg update_config clean_after

rename:
	mv build/wput build/wput-0.6

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) ;\
	mkdir -p ../../install/usr/bin ;\
	mkdir -p ../../install/etc ;\
	mkdir -p ../../install/usr/share/man/man1 ;\
	cp ./wput ../../install/usr/bin ;\
	cp ./doc/wputrc ../../install/etc ;\
	cp ./doc/wput.1.gz ../../install/usr/share/man/man1 ;\
	strip ../../install/usr/bin/wput

.include "../../Makefile.pkg"
