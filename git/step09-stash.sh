# change working directory
touch file2stash
git status

# stach changes
git add .
git stash
git stash list

# switch to another branch
git checkout 18.5.0
git stash pop
git commit -m"commit stash"

git checkout master
