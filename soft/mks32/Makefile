REMOTE="http://80.72.33.122/download/openbsd/mks32-OpenBSD3.6-i386-1-9-6.tgz"
PKG_NAME=mks32
PKG_VERSION=1.001
DEPENDS=mksd

.include "../../Makefile.var"

BUILDDIR=build/`basename $(REMOTE)|sed s/"3\.6"//g|sed s/.tgz//g`

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p ./install/usr/mksvirus ;\
	for a in $(BUILDDIR)/*.static ; do b=`basename $$a ".static"` ; cp $$a ./install/usr/mksvirus/$$b ; done

.include "../../Makefile.pkg"
