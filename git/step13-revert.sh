#!/bin/bash

# create and modify additional branch
git checkout -b b2revert
touch revert.txt
git add .
git commit -m"revert.txt"

# modify master branch
git checkout master
touch master.txt
git add .
git commit -m"master.txt"

# merge
git merge b2revert

# exit :wq
git log --graph

# revert merge commit
git revert HEAD
#error: commit <SHA1> is a merge but no -m option was given.

# revert with parent from master
git revert HEAD -m 1

# revert revert
git revert HEAD
