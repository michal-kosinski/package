REMOTE="http://alioth.debian.org/download.php/123/minicom-2.1.tar.gz"
PKG_NAME=minicom
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
