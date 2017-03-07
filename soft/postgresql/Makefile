REMOTE="ftp://ftp6.pl.postgresql.org/pub/postgresql/source/v8.3.3/postgresql-8.3.3.tar.gz"
PKG_NAME=postgresql
PKG_VERSION=1.023
DEPENDS=make

.include "../../Makefile.var"

DEFAULT_FLAGS=  --prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--datadir=/usr/share \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libdir=/usr/lib \
		--includedir=/usr/include \
		--mandir=/usr/share/man \
		--enable-depend \
		--enable-rpath \
		--disable-static \
		--without-readline

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src patch_src config_src make_src do_local make_pkg update_config clean_after

do_local:
	@this_dir=`pwd` ;\
	cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install
	@this_dir=`pwd` ;\
	cd $(BUILDDIR)/contrib ;\
	cd tsearch2 ;\
	$(MAKE) all ;\
	$(MAKE) DESTDIR=$$this_dir/install install ;\
	cd ../ltree ;\
	$(MAKE) all ;\
	$(MAKE) DESTDIR=$$this_dir/install install ;\
	cd ../pgcrypto ;\
	$(MAKE) all ;\
	$(MAKE) DESTDIR=$$this_dir/install install
	@cd install ;\
	rm -rf usr/doc ;\
	rm -f usr/lib/*.a
	@for a in `find install/usr -type f`; do if file $$a|grep stripped >/dev/null ; then strip $$a ; fi ; done
	
.include "../../Makefile.pkg"
