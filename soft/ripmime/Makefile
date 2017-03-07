REMOTE="http://www.pldaniels.com/ripmime/ripmime-1.4.0.6.tar.gz"
PKG_NAME=ripmime
PKG_VERSION=1.004
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src make_src install_local make_pkg update_config clean_after

make_src:
	@cd $(BUILDDIR) ;\
	cat Makefile |sed s/"\/usr\/local"/"\/usr"/g > ./Makefile.tmp ;\
	mv Makefile.tmp Makefile ;\
	$(MAKE)

install_local:
	strip $(BUILDDIR)/ripmime ;\
	mkdir -p install/usr/bin install/usr/share/man/man1 ;\
	cp $(BUILDDIR)/ripmime install/usr/bin ;\
	cp $(BUILDDIR)/ripmime.1 install/usr/share/man/man1

.include "../../Makefile.pkg"
