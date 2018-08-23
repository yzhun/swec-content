#!/bin/bash

git checkout master

#
##
git checkout -b feature
# create file 1.txt
touch 1.txt
git add .
git commit -m"1.txt"

# create file 2.txt
touch 2.txt
git add .
git commit -m"2.txt"

# create file 3.txt
touch 3.txt
git add .
git commit -m"3.txt"

git log -4
# copy commit hash for "2.txt" <commit-hash>

git checkout master
ls -la
git cherry-pick <commit-hash>
