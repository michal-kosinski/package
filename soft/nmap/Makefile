REMOTE="http://download.insecure.org/nmap/dist/nmap-4.68.tar.bz2"
PKG_NAME=nmap
PKG_VERSION=1.017
DEPENDS=make tar

.include "../../Makefile.var"

CONFIGURE_FLAGS=--with-openssl=shared \
		--without-nmapfe

default: make_dep fetch_src clean decomp_src_bzip2 patch_src config_src make_src install_src_nostrip make_pkg update_config clean_after

.include "../../Makefile.pkg"
