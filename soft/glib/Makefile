REMOTE="ftp://ftp.gtk.org/pub/gtk/v1.2/glib-1.2.10.tar.gz"
PKG_NAME=glib
PKG_VERSION=1.001
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
	ln -s libglib-1.2.so.0.10 libglib.so ;\
	ln -s libgmodule-1.2.so.0.10 libgmodule.so ;\
	ln -s libgthread-1.2.so.0.10 libgthread.so ;\
	rm *.la ;\
	strip libglib-1.2.so.0.10 ;\
	strip libgmodule-1.2.so.0.10 ;\
	strip libgthread-1.2.so.0.10
	
.include "../../Makefile.pkg"
