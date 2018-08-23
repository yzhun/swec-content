#!/bin/bash

# Switch back to the remote VM

# Act as git user
su - git

#Create folder for the new git repository
mkdir /opt/git/swec.git

# Initialize bare repository
cd /opt/git/swec.git
git --bare init

ls -la

#exit git session
# Ctrl+D
