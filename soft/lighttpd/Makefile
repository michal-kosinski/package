REMOTE="http://www.lighttpd.net/download/lighttpd-1.4.19.tar.gz"
PKG_NAME=lighttpd
PKG_VERSION=1.008
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--sysconfdir=/etc/lighttp \
		--libdir=/usr/lib/lighttp \
		--disable-ipv6 \
		--with-openssl

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
