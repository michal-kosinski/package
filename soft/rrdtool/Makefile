REMOTE="http://oss.oetiker.ch/rrdtool/pub/rrdtool-1.2.23.tar.gz"
PKG_NAME=rrdtool
PKG_VERSION=1.006
DEPENDS=libpng libjpeg libart

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-rrdcgi

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"


