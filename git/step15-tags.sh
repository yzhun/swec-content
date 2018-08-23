#!/bin/bash

# create annotated tag
git tag -a v18.8.0 -m "my-project 18.8.0 GA"
git show v18.8.0

# tag old commit
git checkout -b rc1 HEAD~2
git tag -a v18.8.0-rc1 -m "18.8.0-rc1"

git checkout master
git branch -d rc1
git tag

# share tags
git push origin v18.8.0

# fetch
git fetch origin --tags

# checkout tags
git checkout v18.8.0-rc1
git checkout -b rc1

# delete
git tag -d v18.8.0-rc1
