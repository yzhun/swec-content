#!/bin/bash

# Switch to your local machine

# Go to .ssh folder
cd ~/.ssh

# Generate pair of SSH keys, use sec as key name, use empty passphrase
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f ~/.ssh/swec

# Add SSH config file on local machine, use your remote VM ip address as host-ip-address
echo "Host <host-ip-address>" > config
echo "  IdentityFile ~/.ssh/swec" >> config

# Copy public key to the remote VM
ssh-copy-id -i ~/.ssh/swec git@<host-ip-address>
