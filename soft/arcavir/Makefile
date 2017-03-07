REMOTE="http://www.arcabit.com/download/linux/arcavir-1.0.4-OpenBSD-3.7.tgz"
PKG_NAME=arcavir
PKG_VERSION=1.003
DEPENDS=

.include "../../Makefile.var"

BUILDDIR=build/`basename $(REMOTE)|sed s/"-OpenBSD-3.7"//g|sed s/.tgz//g`

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p ./install/usr/{arcavir,bin} ;\
	for a in $(BUILDDIR)/*.static ; do b=`basename $$a ".static"` ; cp $$a ./install/usr/arcavir/$$b ; done ;\
	cd ./install/usr/bin ;\
	ln -sf ../arcavir/arcavir

.include "../../Makefile.pkg"
