REMOTE="http://heanet.dl.sourceforge.net/sourceforge/mod-gzip/mod_gzip-1.3.26.1a.tgz"
PKG_NAME=mod_gzip
PKG_VERSION=1.001
DEPENDS=

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src make_local

make_local:
	@cd $(BUILDDIR) ;\
	dir=`ls ../../../apache/build` ;\
	mkdir -p ../../../apache/build/$$dir/src/modules/gzip ;\
	cp -r * ../../../apache/build/$$dir/src/modules/gzip
	
.include "../../Makefile.pkg"
