REMOTE="http://www.squid-cache.org/Versions/v3/3.0/squid-3.0.STABLE7.tar.gz"
PKG_NAME=squid
PKG_VERSION=1.030
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--datadir=/usr/share/squid \
	--enable-ssl \
	--disable-ident-lookups \
	--disable-hostname-checks \
	--enable-underscores \
	--enable-err-languages=Polish \
	--enable-pf-transparent \
	--enable-storeio=ufs,null

default: make_dep fetch_src clean decomp_src patch_src config_src make_src do_local make_pkg update_config clean_after

do_local:
	@this_dir=`pwd` ;\
	cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install
	@cd install ;\
	for a in `find usr -type f`; do if file $$a|grep stripped >/dev/null ; then strip $$a ; fi ; done
	
.include "../../Makefile.pkg"
