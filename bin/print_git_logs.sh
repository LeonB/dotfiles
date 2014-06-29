#!/bin/bash

if [ "$1" != "" ]; then
    DAYS="$1"
else
    DAYS=7
fi

logs=()
logs+=("project	sha	author	commitdate	message")

for path in *; do
    [ -d "${path}" ] || continue # if not a directory, skip
    [ -d "${path}/.git/" ] || continue # isn't a git repo, skip
    dirname="$(basename "${path}")"

    cd $dirname
    log=`git --no-pager log --all --since=${DAYS}.days --pretty=format:"%h%x09%an%x09%ad%x09%s" --date=iso`

    while read -r line; do
        if [ "$line" != "" ]; then
            item="$dirname	$line"
            logs+=("$item")
        fi
    done <<< "$log"
    cd ..
done

logs=`printf "%s\n" "${logs[@]}"`
echo "$logs" | sort -t$'\t' -k 4 -r
