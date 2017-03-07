REMOTE="http://rsync.samba.org/ftp/rsync/rsync-3.0.2.tar.gz"
PKG_NAME=rsync
PKG_VERSION=1.012
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--sysconfdir=/etc/rsync \
		--with-rsyncd-conf=/etc/rsync/rsyncd.conf

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src make_pkg update_config clean_after

.include "../../Makefile.pkg"
