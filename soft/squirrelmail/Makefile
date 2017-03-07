REMOTE="http://switch.dl.sourceforge.net/sourceforge/squirrelmail/squirrelmail-1.4.9a.tar.gz"
PKG_NAME=squirrelmail
PKG_VERSION=1.005
DEPENDS=wget

.include "../../Makefile.var"

default: make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	mkdir -p install/squirrelmail ;\
	rm -f $(BUILDDIR)/{[A-Z][A-Z]*,ChangeLog} ;\
	cp -r $(BUILDDIR)/* install/squirrelmail ;\
	wget -q http://switch.dl.sourceforge.net/sourceforge/squirrelmail/pl_PL-1.4.8-20060903.tar.gz -O pl_PL.tar.gz ;\
	tar zxf pl_PL.tar.gz -C install/squirrelmail ;\
	wget -q http://www.squirrelmail.org/plugins/show_user_and_ip-3.3-1.2.2.tar.gz -O show_user_and_ip.tar.gz ;\
	tar zxf show_user_and_ip.tar.gz -C install/squirrelmail/plugins ;\
	wget -q http://www.squirrelmail.org/plugins/folder_sizes-1.5-1.4.0.tar.gz -O folder_sizes.tar.gz ;\
	tar zxf folder_sizes.tar.gz -C install/squirrelmail/plugins ;\
	rm *.tar.gz

.include "../../Makefile.pkg"
