REMOTE="http://pl2.php.net/distributions/php-5.2.5.tar.gz"
PKG_NAME=php5o
PKG_VERSION=1.006
DEPENDS=apache2 bzip2 gettext libcurl libfreetype libiconv libjpeg libmcrypt libmhash libpng libxml libxslt postgresql

.include "../../Makefile.var"

CONFIGURE_FLAGS=--disable-cgi \
	        --enable-bcmath \
	        --enable-calendar \
	        --enable-ftp \
	        --enable-gd-native-ttf \
	        --enable-magic-quotes \
	        --enable-mbregex \
	        --enable-mbstr-enc-trans \
	        --enable-mbstring \
	        --enable-memory-limit \
                --enable-pdo \
	        --enable-shmop \
	        --enable-sockets \
	        --enable-sqlite \
	        --enable-sqlite-utf8 \
	        --enable-sysvsem \
	        --enable-sysvshm \
	        --enable-trans-sid \
	        --enable-wddx \
	        --includedir=/usr/include/php \
	        --libdir=/usr/lib/php \
	        --with-apxs2 \
	        --with-bz2 \
	        --with-config-file-path=/etc/php5 \
	        --with-curl=/usr \
	        --with-curlwrappers \
	        --with-dom \
	        --with-dom-xslt \
	        --with-exif \
	        --with-freetype-dir=/usr \
	        --with-gd \
	        --with-gettext=/usr \
	        --with-iconv=/usr \
	        --with-inifile \
	        --with-jpeg-dir=/usr \
	        --with-mcrypt \
	        --with-mhash \
	        --with-openssl \
                --with-pdo-pgsql \
	        --with-pgsql \
	        --with-png-dir=/usr \
	        --with-xsl \
	        --with-zlib

# for c-client support use:
# cd /usr/ports/mail/c-client && make install 
# --with-imap=/usr/local
# --with-imap-ssl

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_local make_pkg update_config clean_after

install_local:
	@cd install ;\
	mkdir -p etc/http ;\
	echo "\nLoadModule test_mod lib/mod_test.so" > etc/http/httpd.conf
	
	@cd $(BUILDDIR) ;\
	$(MAKE) INSTALL_ROOT=$(DESTDIR) install
	
	@cd install ;\
	rm -r etc/http ;\
	strip usr/bin/php

.include "../../Makefile.pkg"
