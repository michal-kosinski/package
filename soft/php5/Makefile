REMOTE="http://pl2.php.net/distributions/php-5.2.5.tar.gz"
PKG_NAME=php5
PKG_VERSION=1.031
DEPENDS=apache2 bzip2 gettext libcurl libfreetype libiconv libjpeg libmcrypt libmhash libpng libxml libxslt mysql postgresql

.include "../../Makefile.var"

CONFIGURE_FLAGS=--with-config-file-path=/etc/php5 \
                --enable-bcmath \
                --enable-calendar \
                --enable-ftp \
                --enable-gd-native-ttf \
                --enable-magic-quotes \
                --enable-mbregex \
                --enable-mbstr-enc-trans \
                --enable-mbstring \
                --enable-memory-limit \
                --enable-shmop \
                --enable-sockets \
                --enable-sysvsem \
                --enable-sysvshm \
                --enable-trans-sid \
                --enable-versioning \
                --enable-wddx \
                --includedir=/usr/include/php5 \
                --libdir=/usr/lib/php5 \
                --with-apxs2 \
                --with-bz2 \
                --with-curl=/usr \
                --with-curlwrappers \
                --with-dom-xslt=/usr \
                --with-dom=/usr \
                --with-exif \
                --with-freetype-dir=/usr \
                --with-gd \
                --with-gettext=/usr \
                --with-iconv=/usr \
                --with-inifile \
                --with-jpeg-dir=/usr \
                --with-mcrypt \
                --with-mhash \
                --with-mysql-sock=/tmp/mysql.sock \
                --with-mysql=/usr \
                --with-openssl \
                --with-pgsql \
                --with-png-dir=/usr \
                --with-xsl \
                --with-zlib \
                --without-pear

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
	strip usr/bin/php5

.include "../../Makefile.pkg"
