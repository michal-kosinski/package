REMOTE="http://www.apache.net.pl/httpd/httpd-2.0.63.tar.gz"
PKG_NAME=apache2
PKG_VERSION=1.011
DEPENDS=

.include "../../Makefile.var"

DEFAULT_FLAGS= 	--prefix=/usr \
	        --exec-prefix=/usr \
	        --bindir=/usr/bin \
	        --sbindir=/usr/sbin \
	        --datadir=/usr/share/httpd \
	        --localstatedir=/var \
	        --includedir=/usr/include \
	        --mandir=/usr/share/man \
		--libexecdir=/usr/lib/apache/modules \
		--sysconfdir=/etc/http \
		--disable-static
	
CONFIGURE_FLAGS=--enable-access \
	        --enable-alias \
	        --enable-auth \
		--enable-autoindex \
		--enable-cgi \
		--enable-deflate \
		--enable-dir \
		--enable-headers \
		--enable-log_config \
		--enable-logio \
		--enable-mime \
		--enable-negotiation \
		--enable-proxy \
		--enable-proxy-connect \
	        --enable-proxy-http \
		--enable-rewrite \
		--enable-setenvif \
		--enable-so \
		--enable-ssl \
		--enable-status \
		--enable-userdir \
		--disable-asis \
		--disable-auth_anon \
		--disable-auth_dbm \
		--disable-auth_digest \
		--disable-auth_ldap \
		--disable-cache \
		--disable-cern_meta \
		--disable-cgid \
		--disable-charset_lite \
		--disable-dav \
		--disable-dav_fs \
		--disable-disk_cache \
		--disable-dumpio \
		--disable-echo \
		--disable-env \
		--disable-example \
		--disable-expires \
		--disable-ext_filter \
		--disable-file_cache \
		--disable-imap \
		--disable-include \
		--disable-info \
		--disable-isapi \
		--disable-ldap \
		--disable-log_forensic \
		--disable-mem_cache \
		--disable-mime_magic \
		--disable-nw_ssl \
		--disable-proxy_ftp \
		--disable-speling \
		--disable-suexec \
		--disable-unique_id \
		--disable-usertrack \
		--disable-vhost_alias
	
default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

config_src:
	@cd $(BUILDDIR) ;\
	export SINGLE_LISTEN_UNSERIALIZED_ACCEPT=1 ;\
	./configure $(DEFAULT_FLAGS) $(CONFIGURE_FLAGS)
	
install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) DESTDIR=$(DESTDIR) install 
	@cd install ;\
	rm -rf var
	@for a in `find install -type f`; do if file $$a|grep stripped >/dev/null ; then strip $$a ; fi ; done

.include "../../Makefile.pkg"
