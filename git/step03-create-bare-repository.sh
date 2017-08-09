# Switch back to the remote VM

# Act as git user
su – git

#Create folder for the new git repository
mkdir /opt/git/sec.git

# Initialize bare repository
cd /opt/git/sec.git
git --bare init

# Configure SSH access
cd ~
mkdir .ssh
touch ~/.ssh/authorized_keys

# Exit su session
#	<ctrl> + D

# Merge with other keys
cd ~
cat ~/sec.pub >> /home/git/.ssh/authorized_keys
