# create orphan branch
git checkout --orphan orphan_branch
git rm -rf .

echo "#Title of Orphan branch" > README.md
git add .
git commit -a -m "Initial Commit"

git log
