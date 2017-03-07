REMOTE="http://ftp.gnu.org/gnu/tar/tar-1.18.tar.gz"
PKG_NAME=tar
PKG_VERSION=1.006
DEPENDS=bzip2 libiconv

.include "../../Makefile.var"

CONFIGURE_FLAGS=--program-prefix=g \
		--without-libiconv-prefix \
		--without-included-gettext

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
