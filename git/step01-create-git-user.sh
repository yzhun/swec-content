# Login into remote VM

# Create git user
adduser git

# Create folder for git repositories
cd /opt
mkdir git

# Change folder owner
chown git:git git
ls -la
