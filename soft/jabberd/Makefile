REMOTE="http://jabberstudio.rediris.es/jabberd2/jabberd-2.0s11.tar.gz"
PKG_NAME=jabberd
PKG_VERSION=1.003
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-idn \
		--enable-pgsql

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install

.include "../../Makefile.pkg"
