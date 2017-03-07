REMOTE="http://untroubled.org/qmail-autoresponder/qmail-autoresponder-0.96.2.tar.gz"
PKG_NAME=qmail-autoresponder
PKG_VERSION=1.001
DEPENDS=bglibs

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) install ;\
	cd ../../
	@mkdir -p ./install/var/qmail/bin ;\
	mv /usr/local/bin/qmail-* ./install/var/qmail/bin

.include "../../Makefile.pkg"
