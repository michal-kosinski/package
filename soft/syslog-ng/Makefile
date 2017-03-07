REMOTE="http://www.balabit.com/downloads/files/syslog-ng/sources/stable/src/syslog-ng-2.0.8.tar.gz"
PKG_NAME=syslog-ng
PKG_VERSION=1.010
DEPENDS=libol

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	mkdir -p ../../install/etc/syslog-ng ;\
	cp doc/syslog-ng.conf.sample ../../install/etc/syslog-ng

.include "../../Makefile.pkg"

