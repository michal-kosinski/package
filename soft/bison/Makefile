REMOTE="http://ftp.gnu.org/gnu/bison/bison-2.3.tar.gz"
PKG_NAME=bison
PKG_VERSION=1.005
DEPENDS=m4

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
