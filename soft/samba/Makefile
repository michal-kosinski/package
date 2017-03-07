REMOTE="http://us1.samba.org/samba/ftp/stable/samba-3.0.30.tar.gz"
PKG_NAME=samba
PKG_VERSION=1.031
DEPENDS=libiconv

.include "../../Makefile.var"

BUILDDIR=build/`basename $(REMOTE) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g`/source
DESTDIR=`cd ../../.. ; pwd`/install

CONFIGURE_FLAGS=--localstatedir=/var/log/samba \
		--sysconfdir=/etc/smb \
		--sharedstatedir=/etc/smb \
		--libdir=/usr/samba \
		--with-configdir=/etc/smb \
		--prefix=/usr/samba \
		--exec-prefix=/usr \
		--infodir=/usr/share/info \
		--mandir=/usr/share/man \
		--without-sambabook \
		--with-piddir=/var/run \
		--without-ldap \
		--without-readline \
		--without-sambabook \
		--disable-cups

default: make_dep fetch_src clean decomp_src patch_local config_src make_src install_local make_pkg update_config clean_after

patch_local:
	@cd $(BUILDDIR) ;\
	for a in `find ../../../patch -type f`; do \
	patch -p2 < $$a ;\
	done

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install
	@cd install ;\
	for a in `find usr/bin -type f|grep -v findsmb|grep -v smbtar`; do strip $$a; done ;\
	strip usr/sbin/* ;\

.include "../../Makefile.pkg"
