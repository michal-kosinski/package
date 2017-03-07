REMOTE="http://subversion.tigris.org/downloads/subversion-1.4.5.tar.gz"
PKG_NAME=subversion
PKG_VERSION=1.010
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--with-apr=/usr \
		--with-apr-util=/usr \
		--with-ssl \
		--without-berkeley-db \
		--disable-mod-activation

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	for a in `find subversion/libsvn* -name "libsvn_*so.0.0"` ; do cp $$a /usr/lib ; done ;\
	cp neon/src/.libs/libneon.so.25.5 /usr/lib/libneon.so.25.5 ;\
	$(MAKE) DESTDIR=$(DESTDIR) install ;\
	cd ../../install/usr/bin ;\
	strip svn* ;\
	rm -f /usr/lib/libsvn_* ;\
	rm -f /usr/lib/libneon.so.25.5

.include "../../Makefile.pkg"
