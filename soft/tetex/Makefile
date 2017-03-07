REMOTE="http://www.tug.org/ftp/historic/systems/teTeX/teTeX-3.0/distrib/tetex-src-3.0.tar.gz"
PKG_NAME=tetex
PKG_VERSION=1.005
DEPENDS=

.include "../../Makefile.var"

REMOTE2="http://www.tug.org/ftp/historic/systems/teTeX/teTeX-3.0/distrib/tetex-texmf-3.0.tar.gz"
REMOTE3="http://www.unruh.de/DniQ/latex/unicode/unicode.tgz"
REMOTE4="http://www.astro.gla.ac.uk/users/norman/distrib/latex/textpos-1.4.tar.gz"
REMOTE5="http://www.unicode.org/Public/UNIDATA/UnicodeData.txt"
LOCAL2=`basename $(REMOTE2)`
LOCAL3=`basename $(REMOTE3)`
LOCAL4=`basename $(REMOTE4)`
LOCAL5=`basename $(REMOTE5)`
BUILDDIR=`pwd`/build/`basename $(REMOTE) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g`
BUILDDIR2=`pwd`/build/`basename $(REMOTE2) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g`
BUILDDIR3=`pwd`/build/`basename $(REMOTE3) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g`
BUILDDIR4=`pwd`/build/`basename $(REMOTE4) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g`
BUILDDIR5=`pwd`/build/`basename $(REMOTE5) | sed s/.tar.gz//g | sed s/.tar.bz2//g | sed s/.tgz//g`

CONFIGURE_FLAGS=--prefix=/usr/teTeX \
		--disable-multiplatform \
		--without-dialog \
		--without-texinfo \
		--with-system-ncurses \
		--with-system-pnglib \
		--with-system-t1lib \
		--with-system-tifflib \
		--with-system-zlib \
		--with-ps=gs \
		--enable-ipc \
		--with-etex

default: make_dep fetch_src fetch_src_2 fetch_src_3 fetch_src_4 fetch_src_5 clean decomp_src_2 decomp_src patch_src config_src make_src install_local make_pkg_local make_pkg update_config clean_after

fetch_src_2:
	@cd ../../archive ; \
	if [ ! -f $(LOCAL2) ]; then \
	  $(FTP) $(REMOTE2) ;\
	fi

fetch_src_3:
	@cd ../../archive ; \
	if [ ! -f $(LOCAL3) ]; then \
	  $(FTP) $(REMOTE3) ;\
	fi

fetch_src_4:
	@cd ../../archive ; \
	if [ ! -f $(LOCAL4) ]; then \
	  $(FTP) $(REMOTE4) ;\
	fi

fetch_src_5:
	@cd ../../archive ; \
	if [ ! -f $(LOCAL5) ]; then \
	  $(FTP) $(REMOTE5) ;\
	fi

decomp_src_2:
	@mkdir -p /usr/teTeX/share/texmf ;\
	tar -zxf ../../archive/$(LOCAL2) -C /usr/teTeX/share/texmf

config_src:
	@cd $(BUILDDIR) ;\
	./configure $(CONFIGURE_FLAGS)

install_local:
	@cd $(BUILDDIR) ;\
	$(MAKE) install ;\
	cd ../.. ;\

	@cd build ;\
	tar -zxf ../../../archive/$(LOCAL3) ;\
	cp ../../../archive/$(LOCAL5) ucs/UnicodeData.txt ;\
	cd ucs ;\
	echo Running perl makeunidef.pl... ;\
	perl makeunidef.pl -t data --nocomments config/*.ucf config/*.ucf.gz --exclude cjkbg5,cjkgb,cjkjis,cjkhangul ;\
	cp *.sty *.def /usr/teTeX/share/texmf/tex/latex/base ;\
	mkdir -p /usr/teTeX/share/texmf/tex/latex/utf ;\
	cp data/* /usr/teTeX/share/texmf/tex/latex/utf ;\
	cd .. ;\
	rm -rf ucs ;\
	cd .. ;\

	@cd build ;\
	tar -zxf ../../../archive/$(LOCAL4) ;\
	cd textpos-1.4 ;\
	export PATH=$$PATH:/usr/teTeX/bin ;\
	latex textpos.ins ;\
	cp textpos.sty /usr/teTeX/share/texmf/tex/latex/base ;\
	cd .. ;\
	rm -rf textpos-1.4 ;\
	cd .. ;\

	texconfig confall ;\
	texconfig dvips paper letter ;\
	texconfig mode ljfour ;\
	texconfig dvips mode ljfour ;\
	texconfig dvips printcmd - ;\
	texconfig dvips add bjc600 ;\
	texconfig dvips add stcolor ;\
	texconfig dvips add deskjet ;\
	texconfig dvips add ljet4 ;\
	texconfig dvips -P bjc600  mode canonbjc ;\
	texconfig dvips -P stcolor mode epstylus ;\
	texconfig dvips -P deskjet mode deskjet ;\
	texconfig dvips -P ljet4   mode ljfour ;\

	mktextfm cmbcsc10.tfm ;\
	mktextfm ecrm1000.tfm ;\
	mktextfm labi0500.tfm ;\
	mktextfm labi0600.tfm ;\
	mktextfm labi0700.tfm ;\
	mktextfm labi0800.tfm ;\
	mktextfm labi0900.tfm ;\
	mktextfm labi1000.tfm ;\
	mktextfm labi1200.tfm ;\
	mktextfm labi1440.tfm ;\
	mktextfm labi1728.tfm ;\
	mktextfm labi2074.tfm ;\
	mktextfm labi2488.tfm ;\
	mktextfm labx0500.tfm ;\
	mktextfm labx0600.tfm ;\
	mktextfm labx0700.tfm ;\
	mktextfm labx0800.tfm ;\
	mktextfm labx0900.tfm ;\
	mktextfm labx1000.tfm ;\
	mktextfm labx1200.tfm ;\
	mktextfm labx1300.tfm ;\
	mktextfm labx1440.tfm ;\
	mktextfm labx1728.tfm ;\
	mktextfm labx2074.tfm ;\
	mktextfm labx2488.tfm ;\
	mktextfm lacc1000.tfm ;\
	mktextfm lacc1200.tfm ;\
	mktextfm lalq8.tfm ;\
	mktextfm larm0500.tfm ;\
	mktextfm larm0600.tfm ;\
	mktextfm larm0700.tfm ;\
	mktextfm larm0800.tfm ;\
	mktextfm larm0900.tfm ;\
	mktextfm larm1000.tfm ;\
	mktextfm larm1095.tfm ;\
	mktextfm larm1200.tfm ;\
	mktextfm larm1440.tfm ;\
	mktextfm larm1728.tfm ;\
	mktextfm larm2074.tfm ;\
	mktextfm larm2488.tfm ;\
	mktextfm lasl1000.tfm ;\
	mktextfm lasl1200.tfm ;\
	mktextfm lati0800.tfm ;\
	mktextfm lati0900.tfm ;\
	mktextfm lati1000.tfm ;\
	mktextfm lati1200.tfm ;\
	mktextfm laxc1000.tfm ;\
	mktextfm laxc1200.tfm ;\

	texconfig font rw ;\
	texconfig rehash

make_pkg_local:
	@mkdir -p ./install/usr ;\
	mv /usr/teTeX ./install/usr ;\
	mv /var/tmp/texfonts ./install/usr/teTeX

.include "../../Makefile.pkg"
