REMOTE="http://switch.dl.sourceforge.net/sourceforge/eaccelerator/eaccelerator-0.9.5.2.tar.bz2"
PKG_NAME=eaccelerator
PKG_VERSION=1.013
DEPENDS=
# DEPENDS=automake libtool php4 php5
# win32 url: http://www.arnot.info/eaccelerator/

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: dev make_dep fetch_src clean decomp_src__ patch_src config_php4 \
	clean_1 decomp_src_ patch_src_ config_php5 make_pkg update_config clean_after

decomp_src_:
	@cd build ;\
	gtar -jxf ../../../archive/$(LOCAL)
	
decomp_src__:
	@cd build ;\
	gtar -jxf ../../../archive/$(LOCAL)
	
patch_src_:
	@cd $(BUILDDIR) ;\
	    for a in `find ../../patch -type f`; do \
	    patch -p1 < $$a ;\
	done

clean_1:
	@rm -rf build/*

config_php4:
	cd $(BUILDDIR) ;\
	phpize ;\
	sh configure --enable-eaccelerator --with-php-config=/usr/bin/php-config --without-eaccelerator-sessions ;\
	make ;\
	make INSTALL_ROOT=$(DESTDIR) install ;\
	cd $(DESTDIR) ;\
	strip usr/lib/php4/extensions/no-debug-non-zts-20020429/eaccelerator.so
	
config_php5:
	cd $(BUILDDIR) ;\
	phpize5 ;\
	sh configure --enable-eaccelerator --with-php-config=/usr/bin/php-config5 --without-eaccelerator-sessions ;\
	make ;\
	make INSTALL_ROOT=$(DESTDIR) install ;\
	cd $(DESTDIR) ;\
	strip usr/lib/php5/extensions/no-debug-non-zts-20041030/eaccelerator.so
	
.include "../../Makefile.pkg"
