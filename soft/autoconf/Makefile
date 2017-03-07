REMOTE="http://ftp.gnu.org/gnu/autoconf/autoconf-2.61.tar.gz"
PKG_NAME=autoconf
PKG_VERSION=1.003
DEPENDS=m4

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
