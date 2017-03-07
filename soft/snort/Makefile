REMOTE="http://www.snort.org/dl/current/snort-2.8.0.tar.gz"
PKG_NAME=snort
PKG_VERSION=1.011
DEPENDS=pcre postgresql mysql wget

.include "../../Makefile.var"

CONFIGURE_FLAGS=--sysconfdir=/etc/snort \
		--with-postgresql=/usr \
		--with-mysql=/usr
    
default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	mkdir -p ../../install/etc/snort ../../install/etc/snort/rules ;\
	cp -f etc/* ../../install/etc/snort ;\
	cp -f schemas/create_* ../../install/etc/snort

.include "../../Makefile.pkg"
