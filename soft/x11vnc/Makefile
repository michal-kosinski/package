REMOTE="http://www.karlrunge.com/x11vnc/x11vnc-0.8.2.tar.gz"
PKG_NAME=x11vnc
PKG_VERSION=1.003
DEPENDS=libjpeg

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
