#!/bin/bash

## add project remote
git remote add pure-css-upstream https://github.com/pure-css/pure.git

git remote -v

git subtree add --prefix pure-css-subtree pure-css-upstream master --squash
git branch -av
git subtree pull --prefix pure-css-subtree pure-css-upstream master --squash

## edit README.md
#git subtree push --prefix pure-css-subtree pure-css-upstream master
