REMOTE="http://www.modssl.org/source/mod_ssl-2.8.30-1.3.39.tar.gz"
PKG_NAME=mod_ssl
PKG_VERSION=1.009
DEPENDS=

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src make_local

make_local:
	@cd $(BUILDDIR) ;\
	dir=`ls ../../../apache/build` ;\
	./configure ./configure --with-apache=../../../apache/build/$$dir
	
.include "../../Makefile.pkg"
