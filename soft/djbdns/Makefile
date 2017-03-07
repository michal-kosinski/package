REMOTE="http://cr.yp.to/djbdns/djbdns-1.05.tar.gz"
PKG_NAME=djbdns
PKG_VERSION=1.001
DEPENDS=make daemontools

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	echo `pwd`/../../install/usr > conf-home ;\
	mkdir -p ../../install/usr ;\
	gmake setup check ;\
	
.include "../../Makefile.pkg"
