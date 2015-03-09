#!/bin/bash

if [ "$1" != "" ]; then
    DAYS="$1"
else
    DAYS=7
fi

NUM_WEEKS=1

today=`date +%u`

if [ "$today" == "4" ]
then
    thursday=`date -dthursday +%Y-%m-%d`
else
    thursday=`date -dlast-thursday +%Y-%m-%d`
fi

previous_thursday=`date -d "$thursday - $NUM_WEEKS week" +%Y-%m-%d`

logs=()
logs+=("project	sha	author	commitdate	message")

for path in *; do
    [ -d "${path}" ] || continue # if not a directory, skip
    [ -d "${path}/.git/" ] || continue # isn't a git repo, skip
    dirname="$(basename "${path}")"

    cd $dirname
    # log=`git --no-pager log --all --since=${DAYS}.days --pretty=format:"\"%h\"%x09%an%x09%ad%x09%s" --date=iso`
    log=`git --no-pager log --all --since="$previous_thursday" --until="$thursday" --pretty=format:"\"%h\"%x09%an%x09%ad%x09%s" --date=iso`

    while read -r line; do
        if [ "$line" != "" ]; then
            sha=`echo $line | awk '{print $1}' | sed -e 's/^"//'  -e 's/"$//'`

            if [ "$sha" != "" ]; then
                stat=`git log $sha^..$sha --shortstat | tail -n1 | awk '{gsub(/^ +| +$/,"")}1'`
            else
                stat=""
            fi

            item="$dirname	$line	$stat"
            logs+=("$item")

        fi
    done <<< "$log"

    cd ..
done

logs=`printf "%s\n" "${logs[@]}"`
echo "$logs" | sort -t$'\t' -k 4 -r
