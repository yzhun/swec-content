# Switch to your local machine

# Go to .ssh folder
cd ~/.ssh

# Generate pair of SSH keys, use sec as key name, use empty passphrase
ssh-keygen -t rsa -b 4096

# Add SSH config file on local machine, use your remote VM ip address as host-ip-address
echo "Host host-ip-address" > config
echo "  IdentityFile ~/.ssh/qa" >> config

# Copy public key to the remote VM
scp ./sec.pub root@host-ip-address:~/
