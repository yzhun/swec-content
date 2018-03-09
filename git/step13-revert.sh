
git checkout master
touch master.txt
git add *
git commit -m"master.txt"

git merge feature

# exit :wq
git log --graph

# revert merge commit
$ git revert HEAD
#error: commit 86ab406d8bd5f123b4ae6438308cccb093d34616 is a merge but no -m option was given.

# revert with parent from master
git revert HEAD -m 1

# revert revert
git revert HEAD
