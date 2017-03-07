REMOTE="http://cband.linux.pl/download/mod-cband-0.9.7.2.tgz"
PKG_NAME=mod_cband
PKG_VERSION=1.001
DEPENDS=apache2

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src_nostrip make_pkg update_config clean_after

.include "../../Makefile.pkg"
