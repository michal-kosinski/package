REMOTE="http://oss.oetiker.ch/mrtg/pub/mrtg-2.16.2.tar.gz"
PKG_NAME=mrtg
PKG_VERSION=1.010
DEPENDS=libgd

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src_nostrip make_pkg update_config clean_after

.include "../../Makefile.pkg"
