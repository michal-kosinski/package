REMOTE="http://openvpn.net/release/openvpn-2.0.9.tar.gz"
PKG_NAME=openvpn
PKG_VERSION=1.026
DEPENDS=tar liblzo

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
