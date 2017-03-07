REMOTE="http://ftp.gnu.org/gnu/gettext/gettext-0.17.tar.gz"
PKG_NAME=gettext
PKG_VERSION=1.008
DEPENDS=libiconv

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--with-included-gettext \
		--disable-static \
		--disable-nls \
		--enable-relocatable
	
LDFLAGS=-L$(BUILDDIR)/intl/.libs

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@BUILDDIR=$(BUILDDIR) ;\
	cd $(BUILDDIR) ;\
	if [ ! -f /usr/lib/libgettextlib.so ] ; then \
	  cp /usr/lib/libm.so.2.1 /usr/lib/libgettextlib.so ;\
	  cp /usr/lib/libm.so.2.1 /usr/lib/libgettextsrc.so ;\
	  $(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	  rm /usr/lib/libgettextlib.so ;\
	  rm /usr/lib/libgettextsrc.so ;\
	else \
	  $(MAKE) DESTDIR=$(DESTDIR) install-strip ;\
	fi ;\
	cp gettext-tools/intl/.libs/libgnuintl.so.8.2 ../../install/usr/lib/libintl.so.8.2 ;\
	cd ../../install ;\
	cd usr/lib ;\
	ln -s libasprintf.so.0.0 libasprintf.so ;\
	ln -s libgettextpo.so.1.0 libgettextpo.so ;\
	ln -s libintl.so.8.2 libintl.so ;\
	strip libintl.so.8.2 ;\
	rm -f charset.alias ;\
	rm -f *.la ;\
	cd .. ;\
	cp $$BUILDDIR/gettext-runtime/intl/libgnuintl.h include/libintl.h
	rm -rf share/doc ;\
	rm -rf share/gettext
	
.include "../../Makefile.pkg"
