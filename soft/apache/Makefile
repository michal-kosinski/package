REMOTE="http://sunsite.icm.edu.pl/pub/www/apache/dist/httpd/apache_1.3.39.tar.gz"
PKG_NAME=apache
PKG_VERSION=1.008
DEPENDS=

.include "../../Makefile.var"

DEFAULT_FLAGS= 	--prefix=/usr \
	        --exec-prefix=/usr \
	        --bindir=/usr/bin \
	        --sbindir=/usr/sbin \
	        --datadir=/usr/share \
	        --localstatedir=/var \
	        --includedir=/usr/include \
	        --mandir=/usr/share/man \
		--libexecdir=/usr/lib/apache/modules \
		--sysconfdir=/etc/http \
	        --runtimedir=/var/run \
	        --iconsdir=/var/www/icons \
	        --htdocsdir=/var/www/htdocs \
	        --cgidir=/var/www/cgi-bin \
	        --logfiledir=/var/log 
	
CONFIGURE_FLAGS=--server-uid=httpd \
	        --server-gid=httpd \
	        --disable-module=all \
	        --enable-module=rewrite \
	        --enable-module=log_config \
	        --enable-module=mime \
	        --enable-module=negotiation \
	        --enable-module=dir \
	        --enable-module=alias \
	        --enable-module=access \
	        --enable-module=auth \
		--enable-module=cgi \
	        --enable-module=so \
	        --enable-module=ssl \
		--activate-module=src/modules/php5/libphp5.a \
		--activate-module=src/modules/gzip/gzip/mod_gzip.a

default: make_dep fetch_src clean decomp_src config_local make_modules patch_src config_src make_src_local install_local make_pkg update_config clean_after clean_local

config_local:
	@cd $(BUILDDIR) ;\
	./configure ;\
		
config_next:
	@cd $(BUILDDIR) ;\
	./configure $(DEFAULT_FLAGS) $(CONFIGURE_FLAGS)

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) root=$(DESTDIR) install 
	@cd install ;\
	rm -rf var/www 
	@for a in `find install -type f`; do if file $$a|grep stripped >/dev/null ; then strip $$a ; fi ; done

make_modules:
	@cd ../mod_ssl ;\
	make
	@cd ../mod_gzip ;\
	make
	DIR=$(BUILDDIR) ;\
	cd ../php5 ;\
	make APACHE_DIR=$$DIR for_apache

clean_local:
	@cd ../mod_ssl ;\
	make clean
	@cd ../mod_gzip ;\
	make clean
	@cd ../php5 ;\
	make clean
	
make_src_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) all
		
make_install_local:

.include "../../Makefile.pkg"
