REMOTE="http://alpha.voidsystems.pl/prime-qmail.tgz"
PKG_NAME=qmail
PKG_VERSION=1.009
DEPENDS=arcavir checkpassword daemontools ucspi-tcp stunnel

.include "../../Makefile.var"

CONFIGURE_FLAGS=

default: dev make_dep fetch_src clean decomp_src patch_src install_local make_pkg update_config clean_after

install_local:
	@cd $(BUILDDIR) ;\
	make setup check ;\
	mkdir -p /usr/qmail/service ;\
	mv /var/qmail/bin /usr/qmail ;\
	rm -rf /var/qmail/{bin,service,rc} ;\
	ln -s /usr/qmail/bin /var/qmail/bin ;\
	cp service/rc /usr/qmail/rc ;\
	ln -s /usr/qmail/rc /var/qmail/rc ;\
	cp -r service/service/* /usr/qmail/service ;\
	ln -s /usr/qmail/service /var/qmail/service ;\
	find /usr/qmail/service -name CVS -or -name .cvsignore -exec rm -rf {} \; 2>/dev/null ;\
	find /usr/qmail/service -name run -exec chmod +x {} \; ;\
	chmod +x /usr/qmail/rc ;\
	if [ ! -f /var/qmail/control/auth ]; then echo "auth set to default [1]" ; echo 1 > /var/qmail/control/auth ; fi ;\
	if [ ! -f /var/qmail/control/databyes ]; then echo "databytes set to default [25000000] (23.8MB)" ; echo 25000000 > /var/qmail/control/databytes ; fi ;\
	if [ ! -f /var/qmail/control/greylist ]; then echo "greylist set to default [1]" ; echo 1 > /var/qmail/control/greylist ; fi ;\
	if [ ! -f /var/qmail/control/mailfromdefaultok ]; then echo "mailfromdefaultok set to default [1]" ; echo 1 > /var/qmail/control/mailfromdefaultok ; fi ;\
	if [ ! -f /var/qmail/control/me ]; then echo "me set to default [`hostname`]" ; /bin/hostname > /var/qmail/control/me ; fi ;\
	if [ ! -f /var/qmail/control/mfcheck ]; then echo "mfcheck set to default [1]" ; echo 1 > /var/qmail/control/mfcheck ; fi ;\
	if [ ! -f /var/qmail/control/relaycheck ]; then echo "relaycheck set to default [1]" ; echo 1 > /var/qmail/control/relaycheck ; fi ;\
	if [ ! -f /var/qmail/control/smtpscanner ]; then echo "smtpscanner set to default [/usr/arcavir/arcafiltr -m -b -q]" ; echo -n "/usr/arcavir/arcafiltr -m -b -q" > /var/qmail/control/smtpscanner ; fi ;\
	if [ ! -f /var/qmail/control/spfbehavior ]; then echo "spfbehavior set to default [1]" ; echo 1 > /var/qmail/control/spfbehavior ; fi ;\
	if [ ! -f /var/qmail/control/virtualdomains ]; then echo "virtualdomains set to default [`hostname`:alias-`hostname|sed s/"\."//g`]" ; echo "`hostname`:alias-`hostname|sed s/"\."//g`" > /var/qmail/control/virtualdomains ; fi ;\
	if [ ! -f /var/qmail/control/whitelist ]; then echo "whitelist set to default [127.0.0.1]" ; echo 127.0.0.1 > /var/qmail/control/whitelist ; fi ;\
	touch /var/qmail/control/{autowhitelist,badmailfrom,nogreyto,virtualdomains} ;\
	mkdir -p /var/qmail/alias ;\
	VIRTUALDOMAIN="`hostname|sed s/"\."//g`" ;\
	echo root > /var/qmail/alias/.qmail-root ;\
	ln -s /var/qmail/alias/.qmail-root /var/qmail/alias/.qmail-abuse ;\
	ln -s /var/qmail/alias/.qmail-root /var/qmail/alias/.qmail-postmaster ;\
	ln -s /var/qmail/alias/.qmail-root /var/qmail/alias/.qmail-mailer-daemon ;\
	ln -s /var/qmail/alias/.qmail-root /var/qmail/alias/.qmail-$$VIRTUALDOMAIN-root ;\
	ln -s /var/qmail/alias/.qmail-root /var/qmail/alias/.qmail-$$VIRTUALDOMAIN-abuse ;\
	ln -s /var/qmail/alias/.qmail-root /var/qmail/alias/.qmail-$$VIRTUALDOMAIN-postmaster ;\
	ln -s /var/qmail/alias/.qmail-root /var/qmail/alias/.qmail-$$VIRTUALDOMAIN-mailer-daemon ;\
	chown -R alias.qmail /var/qmail/alias
	@mkdir -p ./install/{usr,var} ;\
	mv /usr/qmail ./install/usr ;\
	mv /var/qmail ./install/var ;\
	echo "\nMAKE SURE THAT SENDMAIL IS DISABLED IN /etc/rc.conf AND IN ROOT CRONTAB!\n"

.include "../../Makefile.pkg"
