REMOTE="http://ftp.gnu.org/gnu/m4/m4-1.4.11.tar.gz"
PKG_NAME=m4
PKG_VERSION=1.008
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--infodir=/usr/share/info

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	mkdir -p $(DESTDIR)/usr/info ;\
	mkdir -p $(DESTDIR)/usr/bin/ ;\
	mkdir -p $(DESTDIR)/usr/share ;\
	$(MAKE) DESTDIR=$(DESTDIR) install ;\
	strip $(DESTDIR)/usr/bin/m4 ;\
	mv $(DESTDIR)/usr/info $(DESTDIR)/usr/share/info

.include "../../Makefile.pkg"
