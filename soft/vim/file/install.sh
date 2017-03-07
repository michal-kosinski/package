#!/bin/sh

if [ ! -r /usr/share/vim/vimrc ]; then
	cp /usr/share/vim/vim70/vimrc_example.vim /usr/share/vim/vimrc
	cd /etc && ln -sf /usr/share/vim/vimrc
fi
