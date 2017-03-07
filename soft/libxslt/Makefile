REMOTE="ftp://ftp.gnome.org/pub/GNOME/sources/libxslt/1.1/libxslt-1.1.22.tar.gz"
PKG_NAME=libxslt
PKG_VERSION=1.006
DEPENDS=libiconv libxml

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--disable-static \
		--with-zlib=/usr

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	cp libxslt/.libs/libxslt.so.2.22 /usr/lib ;\
	cp libexslt/.libs/libexslt.so.8.13 /usr/lib ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	cd ../../install ;\
	cd usr/lib ;\
	ln -s libxslt.so.2.22 libxslt.so ;\
	ln -s libexslt.so.8.13 libexslt.so ;\
	rm *.la ;\
	rm -f /usr/lib/libxslt.so.2.20 /usr/lib/libexslt.so.8.13

.include "../../Makefile.pkg"
