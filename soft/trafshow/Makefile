REMOTE="http://ftp.sunet.se/pub/os/FreeBSD/distfiles/trafshow-4.0.tgz"
PKG_NAME=trafshow
PKG_VERSION=1.002
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_local install_local make_pkg update_config clean_after

make_local:
	@cd $(BUILDDIR) ;\
	$(MAKE)

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install
	@strip install/usr/bin/trafshow

.include "../../Makefile.pkg"
