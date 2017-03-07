REMOTE="http://belnet.dl.sourceforge.net/sourceforge/ojnk/oidentd-2.0.8.tar.gz"
PKG_NAME=oidentd
PKG_VERSION=1.003
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-ipv6

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"

