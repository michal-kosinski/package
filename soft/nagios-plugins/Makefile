REMOTE="http://heanet.dl.sourceforge.net/sourceforge/nagiosplug/nagios-plugins-1.4.10.tar.gz"
PKG_NAME=nagios-plugins
PKG_VERSION=1.005
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-nls \
		--datadir=/usr/share/nagios \
		--sysconfdir=/etc/nagios \
		--sbindir=/usr/share/nagios/cgi

default: make_dep fetch_src clean do_local decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

do_local:
	ln -s /usr/lib/libcrypto.so.12.0 /usr/lib/libcrypt.so.12.0

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install

.include "../../Makefile.pkg"
