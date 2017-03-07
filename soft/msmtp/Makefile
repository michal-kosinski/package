REMOTE="http://garr.dl.sourceforge.net/sourceforge/msmtp/msmtp-1.4.14.tar.bz2"
PKG_NAME=msmtp
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--with-ssl=openssl

default: make_dep fetch_src clean decomp_src_bzip2 patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
