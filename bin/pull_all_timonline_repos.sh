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
    echo -n "Checking $repo"

    if [ ! -d "${repo}" ]; then
        echo " (cloning)"
        git clone "git@bitbucket.org:tim_online/${repo}.git" > /dev/null
    else
        echo " (updating)"
        cd "${repo}"
        git fetch --all > /dev/null
        git reset --hard FETCH_HEAD > /dev/null
        git clean -df > /dev/null
        cd ..
    fi
done
