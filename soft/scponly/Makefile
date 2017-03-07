REMOTE="http://sublimation.org/scponly/scponly-4.6.tgz"
PKG_NAME=scponly
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-winscp-compat \
		--enable-scp-compat \
		--enable-chrooted-binary

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install
	cp $(BUILDDIR)/groups install/usr/bin/scponly-groups
	@strip install/usr/bin/scponly install/usr/bin/scponly-groups install/usr/sbin/scponlyc

.include "../../Makefile.pkg"
