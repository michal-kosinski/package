REMOTE="http://www.rarlab.com/rar/rarlinux-3.7.1.tar.gz"
PKG_NAME=rar
PKG_VERSION=1.002
DEPENDS=

.include "../../Makefile.var"

BUILDDIR=build/rar

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p install/usr/bin ;\
	cp $(BUILDDIR)/{rar,unrar} install/usr/bin

.include "../../Makefile.pkg"
