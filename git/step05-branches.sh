#!/bin/bash

# Create new branch
git checkout -b 18.8.0
touch file-18.8.0.txt
git add .
git status
git commit -m"v18.8.0"
git checkout master

# Display all branches
git branch
git branch -av

# Push branch
git checkout 18.8.0
git push origin 18.8.0

# View one more remote branch
git branch -av