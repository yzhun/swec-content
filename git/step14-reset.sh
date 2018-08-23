#!/bin/bash

# mixed
# remove from index
touch file2reset.txt
git status
git add .
git status
git reset HEAD -- .
git status

# soft
git add .
git commit -m"file2reset"
git reset --soft HEAD^1

# hard
git reset --hard HEAD^1

# ^ vs ~
# http://www.paulboxley.com/blog/2011/06/git-caret-and-tilde
