REMOTE="http://switch.dl.sourceforge.net/sourceforge/net-snmp/net-snmp-5.4.tar.gz"
PKG_NAME=net-snmp
PKG_VERSION=1.004
DEPENDS=

.include "../../Makefile.var"

CONFIGURE_FLAGS=--with-libwrap \
		--with-perl-modules \
	        --with-copy-persistent-files="no" \
        	--with-mib-modules="${NET_SNMP_MIB_LIST}" \
	        --with-default-snmp-version="3" \
        	--with-sys-contact="nobody@nowhere.invalid" \
	        --with-sys-location="somewhere" \
        	--with-logfile="/var/log/snmpd" \
	        --with-persistent-directory="/var/net-snmp"

default: make_dep fetch_src clean decomp_src patch_src config_src make_src install_src_nostrip make_pkg update_config clean_after

.include "../../Makefile.pkg"
