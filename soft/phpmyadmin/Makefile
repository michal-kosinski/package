REMOTE="http://switch.dl.sourceforge.net/sourceforge/phpmyadmin/phpMyAdmin-2.11.7-all-languages-utf-8-only.tar.gz"
PKG_NAME=phpmyadmin
PKG_VERSION=1.047
DEPENDS=

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p install/http ;\
	rm -f $(BUILDDIR)/{[A-Z][A-Z]*,ChangeLog} ;\
	cp -r $(BUILDDIR)/* install/http

.include "../../Makefile.pkg"
