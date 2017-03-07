REMOTE="http://ovh.dl.sourceforge.net/sourceforge/jboss/jboss-4.0.3SP1.tar.gz"
PKG_NAME=jboss
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg_local update_config clean_after

make_pkg_local:
	@mkdir -p ./install/usr ;\
	mv /usr/jboss ./install/usr/jboss

.include "../../Makefile.pkg"
