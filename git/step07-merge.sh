#!/bin/bash

git checkout master

# Merge first branch
git merge 18.8.0

# Merge second branch
git merge submodule

# :wq - exit vim )

# To see a diamond
git log --graph

# Publish changes
git push origin master
