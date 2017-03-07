REMOTE="http://heanet.dl.sourceforge.net/sourceforge/freetype/freetype-2.3.4.tar.gz"
PKG_NAME=libfreetype
PKG_VERSION=1.004
DEPENDS=make

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--disable-static
	
default: make_dep fetch_src clean decomp_src patch_src config_local make_src install_local make_pkg update_config clean_after

config_local:
	cd $(BUILDDIR) ;\
	GNUMAKE=gmake ./configure $(DEFAULT_FLAGS) $(CONFIGURE_FLAGS)

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install;\
	cd ../../install ;\
	cd usr/lib ;\
	ln -s libfreetype.so.9.7 libfreetype.so ;\
	rm *.la ;\
	
.include "../../Makefile.pkg"
