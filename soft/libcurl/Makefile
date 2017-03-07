REMOTE="http://curl.haxx.se/download/curl-7.18.2.tar.gz"
PKG_NAME=libcurl
PKG_VERSION=1.022
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
	ln -s libcurl.so.3.0 libcurl.so ;\
	rm *.la ;\
	
.include "../../Makefile.pkg"
