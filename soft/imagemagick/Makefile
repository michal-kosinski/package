REMOTE="ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick-6.3.6-0.tar.gz"
PKG_NAME=imagemagick
PKG_VERSION=1.008
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--enable-shared \
		--disable-static \
		--without-perl
	
default: make_dep fetch_src clean decomp_src rename patch_src config_src make_src install_local install_src make_pkg update_config clean_after

rename:
	mv build/ImageMagick-6.3.6 build/ImageMagick-6.3.6-0
	
install_local:
		@cd $(BUILDDIR) ;\
	        $(MAKE) install-strip
	
.include "../../Makefile.pkg"
