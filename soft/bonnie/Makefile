REMOTE="http://www.coker.com.au/bonnie++/bonnie++-1.03a.tgz"
PKG_NAME=bonnie
PKG_VERSION=1.001
DEPENDS=make

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p install/usr/{bin,sbin} ;\
	mkdir -p install/usr/share/man/{man1,man8} ;\
	cp $(BUILDDIR)/bonnie++ install/usr/sbin ;\
	cp $(BUILDDIR)/bon_csv2html install/usr/bin ;\
	cp $(BUILDDIR)/{bon_csv2html.1,bon_csv2txt.1} install/usr/share/man/man1 ;\
	cp $(BUILDDIR)/{bonnie++.8,zcav.8} install/usr/share/man/man8

.include "../../Makefile.pkg"
