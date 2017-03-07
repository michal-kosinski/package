REMOTE="http://ftp.gnu.org/pub/gnu/screen/screen-4.0.2.tar.gz"
PKG_NAME=screen
PKG_VERSION=1.004
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install ;\
	strip ../../install/usr/bin/screen-*

.include "../../Makefile.pkg"
