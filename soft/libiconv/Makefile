REMOTE="http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.11.tar.gz"
PKG_NAME=libiconv
PKG_VERSION=1.004
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-relocatable \
		--disable-nls \
		--enable-shared \
		--disable-static

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install ;\
	cd ../../install ;\
	cd usr/lib ;\
	strip libcharset.so.1.0 ;\
	strip libiconv.so.6.0 ;\
	ln -s libcharset.so.1.0 libcharset.so ;\
	ln -s libiconv.so.6.0 libiconv.so ;\
	rm charset.alias ;\
	rm *.la ;\
	cd ../bin ;\
	strip iconv ;\
	strip iconv.bin

.include "../../Makefile.pkg"
