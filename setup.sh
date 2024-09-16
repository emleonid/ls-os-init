#!/bin/bash

# Update the package list
sudo apt update

# Upgrade all installed packages
sudo apt upgrade -y

# Install some essential packages
sudo apt install -y curl git tree 

# Print a message when the setup is complete
echo "Setup completed successfully!"