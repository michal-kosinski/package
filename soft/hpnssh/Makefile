REMOTE="ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-5.0p1.tar.gz"
PKG_NAME=hpnssh
PKG_VERSION=1.008
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--sysconfdir=/etc/hpnssh

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-nokeys

.include "../../Makefile.pkg"
