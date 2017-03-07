REMOTE="ftp://ftp.gtk.org/pub/gtk/v1.2/gtk+-1.2.10.tar.gz"
PKG_NAME=gtk+
PKG_VERSION=1.002
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--disable-static

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip
	
.include "../../Makefile.pkg"
