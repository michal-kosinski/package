REMOTE="http://heanet.dl.sourceforge.net/sourceforge/phpsysinfo/phpsysinfo-2.5.4.tar.gz"
PKG_NAME=phpsysinfo
PKG_VERSION=1.007
DEPENDS=

.include "../../Makefile.var"

BUILDDIR=build/phpsysinfo

default: make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p install/http ;\
	rm -f $(BUILDDIR)/{[A-Z][A-Z]*,ChangeLog,*.orig} ;\
        cp $(BUILDDIR)/config.php.new $(BUILDDIR)/config.php ;\
	cp -r $(BUILDDIR)/* install/http

.include "../../Makefile.pkg"
