REMOTE="http://puzzle.dl.sourceforge.net/sourceforge/phppgadmin/phpPgAdmin-4.2.tar.gz"
PKG_NAME=phppgadmin
PKG_VERSION=1.007
DEPENDS=

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p install/http ;\
	rm -f $(BUILDDIR)/{[A-Z][A-Z]*,*.orig,libraries/*.orig,conf/*.orig} ;\
	cp -r $(BUILDDIR)/* install/http

.include "../../Makefile.pkg"
