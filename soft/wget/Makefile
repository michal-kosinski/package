REMOTE="http://ftp.gnu.org/pub/gnu/wget/wget-1.11.1.tar.gz"
PKG_NAME=wget
PKG_VERSION=1.007
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-nls

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install
	@strip install/usr/bin/wget

.include "../../Makefile.pkg"
