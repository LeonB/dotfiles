#!/bin/bash

export GIT_AUTHOR_NAME=`/usr/bin/git config user.name`
export GIT_AUTHOR_EMAIL=`/usr/bin/git config user.email`
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
