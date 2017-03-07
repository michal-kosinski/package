REMOTE="ftp://vsftpd.beasts.org/users/cevans/vsftpd-2.0.6.tar.gz"
PKG_NAME=vsftpd
PKG_VERSION=1.006
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=
	
default: make_dep fetch_src clean decomp_src patch_src make_src install_local make_pkg update_config clean_after

make_src:
	@cd $(BUILDDIR) ;\
	$(MAKE)

install_local:
	mkdir -p install/usr/sbin install/usr/share/man/man{5,8} ;\
	cp $(BUILDDIR)/vsftpd install/usr/sbin/vsftpd ;\
	cp $(BUILDDIR)/vsftpd.conf.5 install/usr/share/man/man5/vsftpd.conf.5 ;\
	cp $(BUILDDIR)/vsftpd.8 install/usr/share/man/man8/vsftpd.8 ;\
	strip install/usr/sbin/vsftpd

.include "../../Makefile.pkg"
