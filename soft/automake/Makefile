REMOTE="http://ftp.gnu.org/gnu/automake/automake-1.10.tar.gz"
PKG_NAME=automake
PKG_VERSION=1.003
DEPENDS=autoconf

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
