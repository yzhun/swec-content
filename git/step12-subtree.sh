#!/bin/bash

# add subtree
git subtree add --prefix bootstrap-subtree https://github.com/twbs/bootstrap.git master --squash

# 
git log -2

# pull subtree
git subtree pull --prefix bootstrap-subtree https://github.com/twbs/bootstrap.git master --squash

# use remote
git remote add bootstrap https://github.com/twbs/bootstrap.git
git remote -v
git subtree add --prefix bootstrap-subtree-from-remote bootstrap master --squash
git branch -av
git subtree pull --prefix bootstrap-subtree-from-remote bootstrap master --squash

#
git subtree push --prefix bootstrap-subtree-from-remote bootstrap master

