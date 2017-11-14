#!/bin/bash

# using sub-tree command
## add project remote
git remote add bootstrap-upstream https://github.com/twbs/bootstrap.git

## fork remote repository and it as additional remote
git remote add bootstrap-origin git@github.com:VladyslavKurmaz/bootstrap.git

git remote -v

git subtree add --prefix bootstrap-subtree bootstrap-upstream master --squash
git branch -av
git subtree pull --prefix bootstrap-subtree bootstrap-upstream master --squash
## edit README.md
git subtree push --prefix bootstrap-subtree bootstrap-origin master


# using read-tree
git fetch bootstrap-upstream
git branch -av

git checkout -b bootstrap_branch bootstrap-upstream/master
git checkout master
git read-tree --prefix=bootstrap-read-tree/ -u bootstrap_branch
git add *
git commit -m"read-tree test"

# pull bootstrap
git checkout bootstrap_branch
git pull

git checkout master
git merge --squash -s subtree --no-commit bootstrap_branch
