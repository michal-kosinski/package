REMOTE="http://www.networkupstools.org/source/2.2/nut-2.2.2.tar.gz"
PKG_NAME=nut
PKG_VERSION=1.007
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--with-user=nut \
		--with-group=nut

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-conf

.include "../../Makefile.pkg"
