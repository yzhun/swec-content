#!/bin/bash

# change working directory
touch file2stash-index
git add .

touch file2stash-workdir

git status

# stach changes
git stash push -u
git stash list

# switch to another branch
git checkout submodule
git stash pop
git add .
git commit -m"commit stashed changes"

