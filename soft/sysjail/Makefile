REMOTE="http://sysjail.bsd.lv/dist/sysjail-0.4.5.tar.gz"
PKG_NAME=sysjail
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
