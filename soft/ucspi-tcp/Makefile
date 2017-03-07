REMOTE="http://cr.yp.to/ucspi-tcp/ucspi-tcp-0.88.tar.gz"
PKG_NAME=ucspi-tcp
PKG_VERSION=1.001
DEPENDS=make

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	echo `pwd`/../../install/usr > conf-home ;\
	mkdir -p ../../install/usr ;\
	gmake setup check ;\

.include "../../Makefile.pkg"
