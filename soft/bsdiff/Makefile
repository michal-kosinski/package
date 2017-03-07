REMOTE="http://www.daemonology.net/bsdiff/bsdiff-4.3.tar.gz"
PKG_NAME=bsdiff
PKG_VERSION=1.002
DEPENDS=tar

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src make_local install_local make_pkg update_config clean_after

make_local:
	@cd $(BUILDDIR) ;\
	make all	

install_local:
	mkdir -p install/usr/bin install/usr/share/man/man1 ;\
	cp $(BUILDDIR)/{bsdiff,bspatch} install/usr/bin ;\
	cp $(BUILDDIR)/{bsdiff.1,bspatch.1} install/usr/share/man/man1 ;\
	strip install/usr/bin/*

.include "../../Makefile.pkg"
