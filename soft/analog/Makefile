REMOTE="http://www.analog.cx/analog-6.0.tar.gz"
PKG_NAME=analog
PKG_VERSION=1.002
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=
	
default: make_dep fetch_src clean decomp_src patch_src make_src install_local make_pkg update_config clean_after

make_src:
	@cd $(BUILDDIR) ;\
	$(MAKE)

install_local:
	mkdir -p install/usr/bin install/etc ;\
	cp $(BUILDDIR)/analog.cfg install/etc ;\
	cp $(BUILDDIR)/analog install/usr/bin ;\
	strip install/usr/bin/*

.include "../../Makefile.pkg"
