REMOTE="http://cr.yp.to/checkpwd/checkpassword-0.90.tar.gz"
PKG_NAME=checkpassword
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	gmake ;\
	cd ../..
	@mkdir -p ./install/usr/bin ;\
	cp $(BUILDDIR)/checkpassword ./install/usr/bin

.include "../../Makefile.pkg"
