REMOTE="http://cr.yp.to/daemontools/daemontools-0.76.tar.gz"
PKG_NAME=daemontools
PKG_VERSION=1.001
DEPENDS=make

.include "../../Makefile.var"

BUILDDIR=build/admin/`basename $(REMOTE) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g`

default: make_dep fetch_src clean decomp_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	rm -rf compile ;\
	sh package/install ;\
	rm -rf /command ;\
	mkdir -p ../../../install/usr/bin ;\
	cp command/* ../../../install/usr/bin/ ;\
	chmod +x ../../../file/usr/bin/svscanboot
	
.include "../../Makefile.pkg"
