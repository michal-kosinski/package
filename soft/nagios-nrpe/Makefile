REMOTE="http://heanet.dl.sourceforge.net/sourceforge/nagios/nrpe-2.9.tar.gz"
PKG_NAME=nagios-nrpe
PKG_VERSION=1.004
DEPENDS=nagios-plugins

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-nls \
		--datadir=/usr/share/nagios \
		--sysconfdir=/etc/nagios \
		--sbindir=/usr/share/nagios/cgi \
		--with-nrpe-user=nagios \
		--with-nrpe-group=nagios \
		--with-nrpe-port=4096

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	cd $(BUILDDIR) ;\
	mkdir -p $(DESTDIR)/usr/bin ;\
	mkdir -p $(DESTDIR)/usr/libexec ;\
	mkdir -p $(DESTDIR)/etc/nagios ;\
	cp -p src/nrpe $(DESTDIR)/usr/bin/nrpe ;\
	cp -p src/check_nrpe $(DESTDIR)/usr/libexec/check_nrpe ;\
	cp -p sample-config/nrpe.cfg $(DESTDIR)/etc/nagios/

.include "../../Makefile.pkg"
