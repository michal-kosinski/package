REMOTE="ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.9.tgz"
PKG_NAME=openldap
PKG_VERSION=1.024
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-slapd \
	--disable-slurp \
	--disable-bdb \
	--disable-static \
	--enable-shared \
	--with-ldap \
	--without-cyrus-sasl

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	cp libraries/liblber/.libs/liblber.so.2.5 /usr/lib/liblber.so.2.5 ;\
	$(MAKE) DESTDIR=$(DESTDIR) install
	@BUILDDIR=$(BUILDDIR) ;\
	cd install/usr/bin ;\
	strip * ;\
	cd ../lib ;\
	cp $$BUILDDIR/libraries/libldap/.libs/libldap-2.4.so.2.5T ./libldap.so ;\
	cp $$BUILDDIR/libraries/libldap_r/.libs/libldap_r-2.4.so.2.5T ./libldap_r.so ;\
	cp $$BUILDDIR/libraries/liblber/.libs/liblber-2.4.so.2.5 ./liblber.so ;\
	rm -f *.a ;\
	rm -f *.la ;\
	strip *.so ;\
	rm -f /usr/lib/liblber.so.2.5

.include "../../Makefile.pkg"
