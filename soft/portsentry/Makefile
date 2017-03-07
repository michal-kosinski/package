REMOTE="http://packetstorm.linuxsecurity.com/UNIX/IDS/portsentry-1.1.tar.gz"
PKG_NAME=portsentry
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=
    
default: make_dep fetch_src clean decomp_src patch_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) openbsd ;\
	mkdir -p ../../install/usr/sbin ;\
	cp portsentry ../../install/usr/sbin

.include "../../Makefile.pkg"
