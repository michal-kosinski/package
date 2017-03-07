REMOTE="http://www.bzip.org/1.0.5/bzip2-1.0.5.tar.gz"
PKG_NAME=bzip2
PKG_VERSION=1.005
DEPENDS=

.include "../../Makefile.var"
DESTDIR_=$(DESTDIR)/usr

default: make_dep fetch_src clean decomp_src patch_src make_local install_local make_pkg update_config clean_after

make_local: make_src
	cd $(BUILDDIR) ;\
	$(MAKE) -f Makefile-libbz2_so ;\
	mv bzip2-shared bzip2 ;\
	strip bzip2 ;\
	strip libbz2.so.1.0.4
	
install_local:
	cd $(BUILDDIR) ;\
	$(MAKE) PREFIX=$(DESTDIR_) install ;\
	cp libbz2.so.1.0.4 $(DESTDIR_)/lib ;\
	ln -s libbz2.so.1.0.4 $(DESTDIR_)/lib/libbz2.so.1.0 ;\
	ln -s libbz2.so.1.0.4 $(DESTDIR_)/lib/libbz2.so ;\
	mkdir -p ../../install/usr/share/man/man1 ;\
	cp ../../install/usr/man/man1/* ../../install/usr/share/man/man1 ;\
	rm -rf ../../install/usr/man ;\
	rm ../../install/usr/lib/*.a ;\
	rm ../../install/usr/bin/bzcat ;\
	rm ../../install/usr/bin/bunzip2 ;\
	cd ../../install/usr/bin ;\
	ln -s bzip2 bzcat ;\
	ln -s bzip2 bunzip2
	
.include "../../Makefile.pkg"
