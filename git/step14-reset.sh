
# remove from staging area
touch file2reset.txt
git status
git add *
git status
git reset HEAD -- .
git status

# move HEAD from one commit to another

# switch to one of the commit from history
#git reset HEAD --soft
#git reset HEAD --mixed
#git reset HEAD --hard
