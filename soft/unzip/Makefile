REMOTE="http://switch.dl.sourceforge.net/sourceforge/infozip/unzip552.tar.gz"
PKG_NAME=unzip
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

BUILDDIR=build/`basename $(REMOTE) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g |sed s/unzip552/unzip-5.52/g`

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src make_src install_local make_pkg update_config clean_after

make_src:
	@cd $(BUILDDIR) ;\
	cat unix/Makefile |sed s/"\/usr\/local"/"\/usr"/g > ./Makefile ;\
	$(MAKE) generic

install_local:
	strip $(BUILDDIR)/{unzip,funzip,unzipsfx} ;\
	rm -f $(BUILDDIR)/zipinfo ;\
	mkdir -p install/usr/bin install/usr/share/man/man1 ;\
	cp $(BUILDDIR)/{unzip,funzip,unzipsfx} install/usr/bin ;\
	cp $(BUILDDIR)/unix/zipgrep install/usr/bin ;\
	ln install/usr/bin/unzip install/usr/bin/zipinfo ;\
	cp $(BUILDDIR)/man/{funzip.1,unzip.1,unzipsfx.1,zipgrep.1,zipinfo.1} install/usr/share/man/man1 ;\
	chmod 755 install/usr/bin/{unzip,funzip,unzipsfx,zipinfo} ;\
	chmod 644 install/usr/share/man/man1/{funzip.1,unzip.1,unzipsfx.1,zipgrep.1,zipinfo.1}

.include "../../Makefile.pkg"
