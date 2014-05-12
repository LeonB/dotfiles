#!/bin/bash

BASEPATH=$HOME/.vim/bundle/
cd $BASEPATH

for i in $(find ./* -maxdepth 0 -type d); do
    name=${i:2}
	cd "$BASEPATH/$name/"
	echo "Updating $name"

    git fetch
    git reset --hard FETCH_HEAD
    git clean -df
done
