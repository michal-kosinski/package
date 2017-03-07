REMOTE="http://heanet.dl.sourceforge.net/sourceforge/wxwindows/wxWidgets-2.6.3.tar.gz"
PKG_NAME=wxwindows
PKG_VERSION=1.001
DEPENDS=libjpeg libpng gtk+

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-gtk2 \
		--enable-unicode \
		--without-libtiff

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install
	
.include "../../Makefile.pkg"
