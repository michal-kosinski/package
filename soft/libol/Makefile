REMOTE="http://www.balabit.com/downloads/files/libol/0.3/libol-0.3.18.tar.gz"
PKG_NAME=libol
PKG_VERSION=1.006
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
