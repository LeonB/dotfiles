#!/bin/bash

# apt-get install python-bitbucket

repos=`python <<EOF
import bitbucket
import os

bb = bitbucket.BitBucket(os.environ.get('BITBUCKET_USERNAME'),
    os.environ.get('BITBUCKET_PASSWORD'))
for repo in bb.user('Tim_online').repositories():
    print repo['slug']
EOF`

if [ "$BITBUCKET_USERNAME" == "" ] || [ "$BITBUCKET_PASSWORD" == "" ]; then
    echo set BITBUCKET_USERNAME and BITBUCKET_PASSWORD env variables
    exit
fi

export GIT_SSH_COMMAND="ssh -o ControlPath=none"

# Sort based on repo name
repos=`echo "${repos}" | sort`

for repo in $repos
do
    echo "Checking $repo"
    new=false

    if [ ! -d "${repo}" ]; then
        new=true
        echo -n " (cloning)"
        git clone "git@bitbucket.org:tim_online/${repo}.git" > /dev/null
    fi

    cd "${repo}"
    echo -n "tracking all remote branches"
    for branch in $(git branch --all | grep '^\s*remotes' | awk '{ print $1 }' | egrep --invert-match '(:?HEAD|master)$'); do
        remote=`echo $branch | cut -f2 -d/`
        branch=`echo $branch | cut -f3 -d/`
        exists=`git show-ref refs/heads/$remote/$branch`
        if [ ! -n "$exists" ]; then
            git branch --track "$remote/$branch" "$remote/$branch"
        fi
    done

    if [ "$new" = false ] ; then
        echo -n " (updating)"
        git fetch --all > /dev/null
        git reset --hard FETCH_HEAD > /dev/null
        git clean -df > /dev/null
    fi

    cd ..
    echo ""
done
