REMOTE="ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.1.tar.gz"
PKG_NAME=proftpd
PKG_VERSION=1.004
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--with-modules=mod_sql:mod_sql_postgres

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install

.include "../../Makefile.pkg"
