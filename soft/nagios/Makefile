REMOTE="http://heanet.dl.sourceforge.net/sourceforge/nagios/nagios-2.9.tar.gz"
PKG_NAME=nagios
PKG_VERSION=1.011
DEPENDS=libgd nagios-plugins nagios-nrpe

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-nls \
		--datadir=/usr/share/nagios \
		--localstatedir=/var/nagios \
		--sysconfdir=/etc/nagios \
		--sbindir=/usr/share/nagios/cgi \
		--with-lockfile=/var/run/nagios.pid

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install ;\
	$(MAKE) DESTDIR=$(DESTDIR) install-config ;\

.include "../../Makefile.pkg"
