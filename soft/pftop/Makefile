REMOTE="http://www.eee.metu.edu.tr/~canacar/pftop-0.6.tar.gz"
PKG_NAME=pftop
PKG_VERSION=1.002
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=
		
default: make_dep fetch_src clean decomp_src patch_src make_local install_local make_pkg update_config clean_after

make_local:
	@cd $(BUILDDIR) ;\
	make

install_local:
	mkdir -p install/usr/sbin install/usr/share/man8 ;\
	cp $(BUILDDIR)/pftop install/usr/sbin ;\
	cp $(BUILDDIR)/pftop.8 install/usr/share/man8

.include "../../Makefile.pkg"
