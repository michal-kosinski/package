REMOTE="http://www.dovecot.org/releases/1.1/dovecot-1.1.1.tar.gz"
PKG_NAME=dovecot
PKG_VERSION=1.025
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-ipv6 \
		--without-pop3d

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
