REMOTE="http://untroubled.org/bglibs/bglibs-1.100.tar.gz"
PKG_NAME=bglibs
PKG_VERSION=1.003
DEPENDS=make libtool

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) install ;\
	cd ../..
	@mkdir -p ./install/usr/local ;\
	mv /usr/local/bglibs ./install/usr/local

.include "../../Makefile.pkg"
