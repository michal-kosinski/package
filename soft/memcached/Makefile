REMOTE="http://www.danga.com/memcached/dist/memcached-1.1.13.tar.gz"
PKG_NAME=memcached
PKG_VERSION=1.002
DEPENDS=

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
