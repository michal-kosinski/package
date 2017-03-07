REMOTE="http://python.org/ftp/python/2.5.2/Python-2.5.2.tgz"
PKG_NAME=python
PKG_VERSION=1.006
DEPENDS=tar

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: dev make_dep fetch_src clean decomp_src patch_src config_src make_src install_src_nostrip make_pkg update_config clean_after

.include "../../Makefile.pkg"
