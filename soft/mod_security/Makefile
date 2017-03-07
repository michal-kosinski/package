REMOTE="http://www.modsecurity.org/download/modsecurity-apache_2.1.2.tar.gz"
PKG_NAME=mod_security
PKG_VERSION=1.012
DEPENDS=apache2 wget

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src make_local install_local make_pkg update_config clean_after

make_local:
	@cd $(BUILDDIR)/apache2 ;\
	make

install_local:
	@mkdir -p install/usr/lib/apache/modules ;\
	cp $(BUILDDIR)/apache2/.libs/mod_security2.so install/usr/lib/apache/modules/mod_security2.so ;\
	strip install/usr/lib/apache/modules/mod_security2.so ;\
	chmod 444 install/usr/lib/apache/modules/mod_security2.so ;\
	chown root.bin install/usr/lib/apache/modules/mod_security2.so

.include "../../Makefile.pkg"
