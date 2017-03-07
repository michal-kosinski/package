REMOTE="ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-7.6.tar.bz2"
PKG_NAME=pcre
PKG_VERSION=1.005
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--disable-static \
		--disable-libtool-lock
    
default: make_dep fetch_src clean decomp_src_bzip2 patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	cp -f .libs/libpcre.so.0.1 /usr/lib ;\
	$(MAKE) DESTDIR=$(DESTDIR) install;\
	cd ../../install ;\
	cd usr/lib ;\
	ln -s libpcre.so.0.1 libpcre.so ;\
	rm *.la ;\
	rm -f /usr/lib/libpcre.so.0.1

.include "../../Makefile.pkg"
