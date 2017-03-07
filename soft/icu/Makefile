REMOTE="ftp://ftp.software.ibm.com/software/globalization/icu/3.4.1/icu-3.4.1.tgz"
PKG_NAME=icu
PKG_VERSION=1.003
DEPENDS=

.include "../../Makefile.var"

BUILDDIR=build/`basename $(REMOTE) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g| sed s/-3.4//g`/source

CONFIGURE_FLAGS=
	
default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src_nostrip make_pkg update_config clean_after

.include "../../Makefile.pkg"
