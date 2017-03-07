REMOTE="http://tidy.sourceforge.net/src/tidy_src.tgz"
PKG_NAME=tidy
PKG_VERSION=1.004
DEPENDS=automake libtool

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src config_local make_src install_local make_pkg update_config clean_after

config_local:
	mv build/tidy build/tidy_src ;\
	cd $(BUILDDIR) ;\
	/bin/sh build/gnuauto/setup.sh ;\
	./configure $(DEFAULT_FLAGS) $(CONFIGURE_FLAGS)

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	cd ../../install/usr/lib ;\
	ln -s libtidy-0.99.so.0.0 libtidy.so

.include "../../Makefile.pkg"

