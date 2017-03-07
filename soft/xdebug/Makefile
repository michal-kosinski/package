REMOTE="http://www.xdebug.com/link.php?url=xdebug200b5"
PKG_NAME=xdebug
PKG_VERSION=1.002
DEPENDS=automake libtool

.include "../../Makefile.var"

CONFIGURE_FLAGS=--infodir=/usr/share/info

default: make_dep fetch_src clean decomp_src patch_src config_php4 \
	clean_1 decomp_src_ patch_src_ config_php5 make_pkg update_config clean_after

decomp_src_:
	@cd build ;\
	tar -zxf ../../../archive/$(LOCAL)

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
	sh configure --enable-xdebug --with-php-config=/usr/bin/php-config ;\
	make ;\
	make INSTALL_ROOT=$(DESTDIR) install ;\
	cd $(DESTDIR) ;\
	strip usr/lib/php4/extensions/no-debug-non-zts-20020429/xdebug.so
	
config_php5:
	cd $(BUILDDIR) ;\
	phpize5 ;\
	sh configure --enable-xdebug --with-php-config=/usr/bin/php-config5 ;\
	make ;\
	make INSTALL_ROOT=$(DESTDIR) install ;\
	cd $(DESTDIR) ;\
	strip usr/lib/php5/extensions/no-debug-non-zts-20050922/xdebug.so

install_local:
	@cd $(BUILDDIR) ;\
	mkdir -p $(DESTDIR)/usr/info ;\
	mkdir -p $(DESTDIR)/usr/bin/ ;\
	mkdir -p $(DESTDIR)/usr/share ;\
	$(MAKE) DESTDIR=$(DESTDIR) install ;\
	strip $(DESTDIR)/usr/bin/m4 ;\
	mv $(DESTDIR)/usr/info $(DESTDIR)/usr/share/info
	
.include "../../Makefile.pkg"
