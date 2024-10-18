#!/bin/bash

echo 'RUN THIS SCRIPT WITH YOUR GITHUB USERNAME AND EMAIL AS ARGUMENTS'

# Update the package list and install necessary tools
apt update 
apt install -y ncat

# Add GitHub to SSH config (without proxy)
echo Host github.com >> ~/.ssh/config
echo '        Hostname github.com' >> ~/.ssh/config
echo '        User git' >> ~/.ssh/config

# Set Git username and email
gituser=$1
gitemail=$2
echo "Setting Git username: $gituser"
echo "Setting Git email: $gitemail"

git config --global user.name "$gituser"
git config --global user.email "$gitemail"

# Generate SSH key for GitHub access
ssh-keygen -t ed25519 -C "$gitemail"

# Display the public key for copying to GitHub
cat ~/.ssh/id_ed25519.pub

# Set permissions for SSH config file
chmod 600 ~/.ssh/config

# Inform the user to copy the SSH key to GitHub
echo "Copy the above key to GITHUB and try ssh -T git@github.com"
