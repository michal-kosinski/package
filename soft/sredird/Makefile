REMOTE="http://www.ibiblio.org/pub/Linux/system/serial/sredird-2.2.2.tar.gz"
PKG_NAME=sredird
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=	

default: make_dep fetch_src clean decomp_src patch_src make_local install_local make_pkg update_config clean_after

make_local:
	cd $(BUILDDIR) ;\
	$(MAKE)

install_local:
	cd $(BUILDDIR) ;\
	mkdir -p ../../install/usr/sbin ../../install/usr/share/man/man8 ;\
	cp sredird ../../install/usr/sbin ;\
        cp sredird.8 ../../install/usr/share/man/man8

.include "../../Makefile.pkg"
