REMOTE="ftp://ftp.gnome.org/pub/GNOME/sources/libxml2/2.6/libxml2-2.6.30.tar.gz"
PKG_NAME=libxml
PKG_VERSION=1.012
DEPENDS=libiconv

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--disable-static \
		--with-zlib=/usr

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	cd ../../install ;\
	cd usr/lib ;\
	ln -s libxml2.so.8.23 libxml2.so ;\
	rm *.la ;\

.include "../../Makefile.pkg"
