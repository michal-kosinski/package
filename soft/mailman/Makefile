REMOTE="http://ovh.dl.sourceforge.net/sourceforge/mailman/mailman-2.1.10.tgz"
PKG_NAME=mailman
PKG_VERSION=1.007
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--prefix=/usr/mailman \
		--with-mail-gid=nofiles \
		--with-cgi-gid=httpd \
		--without-permcheck

default: dev make_dep fetch_src clean decomp_src patch_src config_local make_src install_local make_pkg_local make_pkg update_config clean_after

config_local:
	@cd $(BUILDDIR) ;\
	./configure $(CONFIGURE_FLAGS)

install_local:
	@cd $(BUILDDIR) ;\
        $(MAKE) install

make_pkg_local:
	@mkdir -p ./install/usr ;\
	mv /usr/mailman ./install/usr

.include "../../Makefile.pkg"
