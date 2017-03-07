REMOTE="http://ftp.gnu.org/pub/gnu/make/make-3.81.tar.gz"
PKG_NAME=make
PKG_VERSION=1.002
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--program-prefix=g \
		--disable-nls \
		--disable-job-server

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
