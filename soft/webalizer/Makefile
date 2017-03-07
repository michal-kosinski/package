REMOTE="ftp://ftp.mrunix.net/pub/webalizer/webalizer-2.01-10-src.tgz"
PKG_NAME=webalizer
PKG_VERSION=1.002
DEPENDS=libgd

.include "../../Makefile.var"

BUILDDIR=build/`basename $(REMOTE) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g| sed s/-src//g`

CONFIGURE_FLAGS=--with-language=polish

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p install/usr/bin install/usr/share/man/man1 install/etc ;\
	rm -f $(BUILDDIR)/webazolver ;\
	strip $(BUILDDIR)/webalizer ;\
	cp $(BUILDDIR)/webalizer install/usr/bin ;\
	cp $(BUILDDIR)/webalizer.1 install/usr/share/man/man1 ;\
	cp $(BUILDDIR)/sample.conf install/etc/webalizer.conf.sample ;\
	cd install/usr/bin ;\
	ln -s webalizer webazolver

.include "../../Makefile.pkg"
