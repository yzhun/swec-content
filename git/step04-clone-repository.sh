# Clone repository

# Switch to your local machine

# Go to home folder
cd ~
git clone git@<host-ip-address>:/opt/git/swec.git
cd swec
git config --local user.name "your name"
git config --local user.email "your email"
git config --local --list

# Add new file
touch README.md
git status
git add .
git status
git commit -m"first commit"
git log
git push origin master
