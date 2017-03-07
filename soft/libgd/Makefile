REMOTE="http://www.libgd.org/releases/gd-2.0.35.tar.gz"
PKG_NAME=libgd
PKG_VERSION=1.005
DEPENDS=libfreetype libpng libjpeg

.include "../../Makefile.var"

CONFIGURE_FLAGS=--without-x \
	--without-xpm \
	--disable-static \
	--enable-shared

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
