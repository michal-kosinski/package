REMOTE="http://heanet.dl.sourceforge.net/sourceforge/libpng/libpng-1.2.25.tar.gz"
PKG_NAME=libpng
PKG_VERSION=1.013
DEPENDS=

.include "../../Makefile.var"

MAKE=make

CONFIGURE_FLAGS=--enable-shared \
		--disable-static
	
default: make_dep fetch_src clean decomp_src local patch_src make_src install_local make_pkg update_config clean_after

local:
	@cd $(BUILDDIR) ;\
	cp scripts/makefile.openbsd Makefile ;\
	cp libpng-1.2.25.txt libpng.txt
		
install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) PREFIX=$(DESTDIR)/usr install ;\
	cd ../../install ;\
	cd usr ;\
	mv man share ;\
	cd lib ;\
	strip libpng.so.0.1.2.25 ;\
	ln -s libpng.so.0.1.2.25 libpng.so ;\
	rm *.a

.include "../../Makefile.pkg"
