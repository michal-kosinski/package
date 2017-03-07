REMOTE="http://elinks.or.cz/download/elinks-0.11.1.tar.bz2"
PKG_NAME=elinks
PKG_VERSION=1.008
DEPENDS=tar

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-nls \
		--disable-mouse \
		--disable-gpm \
		--disable-formsmemory \
		--disable-smb

default: make_dep fetch_src clean decomp_src_bzip2 patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
