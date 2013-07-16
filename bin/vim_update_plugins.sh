#!/bin/bash

for i in `ls $HOME/.vim/bundle/`; do
	cd "$HOME/.vim/bundle/$i/"
	echo "Updating $i"
	git pull
done
