REMOTE="http://www.uebimiau.org/downloads/uebimiau-2.7.10-any.zip"
PKG_NAME=uebimiau
PKG_VERSION=1.004
DEPENDS=unzip

.include "../../Makefile.var"

BUILDDIR=build/webmail

default: make_dep fetch_src clean decomp_src_unzip patch_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p install/http ;\
	rm -rf $(BUILDDIR)/install ;\
	cp -r $(BUILDDIR)/* install/http

.include "../../Makefile.pkg"
