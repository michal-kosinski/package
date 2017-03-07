REMOTE="http://www.nano-editor.org/dist/v2.1/nano-2.1.0.tar.gz"
PKG_NAME=nano
PKG_VERSION=1.012
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-nls \
		--disable-wrapping \
		--enable-tiny
		
default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
