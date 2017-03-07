REMOTE="http://mysql.mirrors.crysys.hit.bme.hu/Downloads/MySQL-5.0/mysql-5.0.51.tar.gz"
PKG_NAME=mysql
PKG_VERSION=1.032
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--with-unix-socket-path=/tmp/mysql.sock \
		--localstatedir=/usr/mysql/data \
		--enable-thread-safe-client \
		--with-client-ldflags=-all-static \
	        --with-mysqld-ldflags=-all-static \
		--with-libwrap \
		--with-mysqld-user="mysql" \
		--with-vio \
		--disable-nls \
		--without-docs \
		--without-bench \
		--without-debug \
		--without-extra-tools \
		--enable-assembler \
		--enable-shared \
		--enable-static

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src do_local make_pkg update_config clean_after

do_local:
	@mkdir -p install/etc/mysql
	cp $(BUILDDIR)/support-files/my*cnf install/etc/mysql/
	cd install/usr ;\
	rm -rf mysql-test ;\
	cd lib/mysql ;\
	rm -rf *.a ;\
	rm -rf *.la ;\
	cd .. ;\
	ln -s mysql/libmysqlclient.so.15.0 libmysqlclient.so.15.0 ;\
	ln -s libmysqlclient.so.15.0 libmysqlclient.so
	
.include "../../Makefile.pkg"
