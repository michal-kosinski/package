REMOTE="ftp://ftp.vim.org/pub/vim/unix/vim-7.1.tar.bz2"
PKG_NAME=vim
PKG_VERSION=1.004
DEPENDS=tar

.include "../../Makefile.var"

BUILDDIR=build/vim71

CONFIGURE_FLAGS=

default: make_dep fetch_src clean decomp_src_bzip2 patch_src config_src make_src install_src_nostrip make_pkg update_config clean_after

.include "../../Makefile.pkg"
