REMOTE="http://ftp.gnu.org/gnu/bash/bash-3.2.tar.gz"
PKG_NAME=bash
PKG_VERSION=1.003
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
