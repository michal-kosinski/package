REMOTE="ftp://ftp.berlios.de/pub/cdrecord/cdrtools-2.01.tar.gz"
PKG_NAME=cdrtools
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src make_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p install/usr/bin ;\
	for a in `find . -type f -perm 0755 -mindepth 5` ; do cp $$a install/usr/bin ; done ;\
	rm -f install/usr/bin/config.status \;
	strip install/usr/bin/*

.include "../../Makefile.pkg"
