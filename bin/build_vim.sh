#!/bin/bash

#ncurses-dev xorg-dev
#sudo apt-get build-dep vim-gnome

cd ~/src/vim/vim.git
git pull

make distclean
#./configure --with-features=huge --enable-gui=gnome2 --enable-pythoninterp \
	#--disable-python3interp --enable-fail-if-missing --prefix=$HOME/.local/

./configure --enable-pythoninterp --disable-python3interp --enable-fail-if-missing \
	--enable-multibyte --disable-gui --with-x --prefix=$HOME/.local/
make
