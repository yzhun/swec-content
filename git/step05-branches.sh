# Create new branch
git checkout -b 18.5.0
touch file-18.5.0.txt
git add *
git status
git commit -m"v18.5.0"
git checkout master

# Push branch
git checkout 18.5.0
git push origin 18.5.0
