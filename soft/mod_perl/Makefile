REMOTE="http://perl.apache.org/dist/mod_perl-2.0.3.tar.gz"
PKG_NAME=mod_perl
PKG_VERSION=1.002
DEPENDS=apache2

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src make_local install_local make_pkg update_config clean_after

make_local:
	@cd $(BUILDDIR) ;\
	perl Makefile.PL MP_APXS=/usr/sbin/apxs EVERYTHING=1 ;\
	make

install_local:
	@mkdir -p install/usr/lib/apache/modules ;\
	cp $(BUILDDIR)/src/modules/perl/mod_perl.so install/usr/lib/apache/modules/mod_perl.so ;\
	strip install/usr/lib/apache/modules/mod_perl.so ;\
	chmod 444 install/usr/lib/apache/modules/mod_perl.so ;\
	chown root.bin install/usr/lib/apache/modules/mod_perl.so

.include "../../Makefile.pkg"
