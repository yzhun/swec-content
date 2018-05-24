
# create new branch
git checkout -b b2r

# make changes inside b2r branch
touch b2r
git add .
git commit -m"b2r commit"

# switch to master and make changes there
git checkout master
touch b2r.master
git add .
git commit -m"commit in master"

# rebase
git checkout b2r
git rebase master
