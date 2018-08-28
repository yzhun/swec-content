#!/bin/bash

git checkout master
git checkout -b submodule

# Submodules
git submodule add https://github.com/pure-css/pure.git pure-css
git submodule init
git submodule update
cd pure-css
git branch
git branch -av
cd ..
git add .
git commit -m"pure-css submodule"
