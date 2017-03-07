REMOTE="http://www.stunnel.org/download/stunnel/src/stunnel-4.20.tar.gz"
PKG_NAME=stunnel
PKG_VERSION=1.010
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
