# Create new branch
git checkout -b "#101"
touch file.txt
git add *
git status
git commit -m"your comment here"
git checkout master

# Push branch
git checkout "#101"
git push origin "#101"
