REMOTE="http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/libart_lgpl-2.3.17.tar.gz"
PKG_NAME=libart
PKG_VERSION=1.002
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=-disable-nls \
		--enable-shared \
		--disable-static
	
default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src lib_local make_pkg update_config clean_after

lib_local:
	cd install/usr/lib ;\
	ln -s  libart_lgpl.so.5.3 libart_lgpl_2.so.5.3

.include "../../Makefile.pkg"
