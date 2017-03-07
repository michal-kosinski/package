REMOTE="http://download.berlios.de/amule/aMule-2.1.3.tar.bz2"
PKG_NAME=amule2.0.0
PKG_VERSION=1.001
DEPENDS=wxwindows libgd

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-debug --enable-optimize --with-x

default: make_dep fetch_src clean decomp_src_bzip2 patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip
	
.include "../../Makefile.pkg"
