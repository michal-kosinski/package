REMOTE="http://www.ibiblio.org/pub/Linux/utils/file/managers/mc/mc-4.6.1.tar.gz"
PKG_NAME=mc
PKG_VERSION=1.002
DEPENDS=glib libiconv nano

.include "../../Makefile.var"

CONFIGURE_FLAGS=--with-included-gettext \
		--without-libiconv-prefix \
		--disable-glibtest \
		--without-samba \
	        --without-x \
		--disable-nls \
		--disable-charset

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
