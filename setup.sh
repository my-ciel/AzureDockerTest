#!/bin/bash

# Start of the script
echo "=== Starting Docker, Azure CLI, and Git installation and configuration ==="

# 1. Update and upgrade system packages
echo ">> Updating and upgrading system packages..."
sudo apt update -y
sudo apt upgrade -y

# 2. Install Docker using the official installation script
echo ">> Downloading and running the Docker installation script..."
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh
sudo sh get-docker.sh

# 3. Verify Docker installation
echo ">> Verifying Docker installation..."
sudo docker version
sudo systemctl status docker --no-pager

# 4. Install bash-completion
echo ">> Installing bash-completion..."
sudo apt install bash-completion -y

# 5. Configure Docker bash-completion
echo ">> Configuring Docker bash-completion..."
sudo curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker -o /etc/bash_completion.d/docker
source /usr/share/bash-completion/bash_completion
source /etc/bash_completion.d/docker

# 6. Add the current user to the Docker group
echo ">> Adding the current user to the Docker group..."
sudo usermod -aG docker $(whoami)

# 7. Install Azure CLI
echo ">> Installing Azure CLI..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 8. Verify Azure CLI installation
echo ">> Verifying Azure CLI installation..."
az version

# 9. Install Git
echo ">> Installing Git..."
sudo apt install git -y

# 10. Verify Git installation
echo ">> Verifying Git installation..."
git --version

# 11. Apply Docker group without logout at the end
echo ">> Applying Docker group without logout..."
newgrp docker

echo "=== Docker, Azure CLI, and Git installation and configuration completed ==="

