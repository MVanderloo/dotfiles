#!/usr/bin/env bash

# Check if script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo: sudo $0"
    exit 1
fi

# Remove any non-official docker packages
echo "Removing any existing Docker packages..."
dnf remove -y \
    docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine

# Setup the repository
echo "Setting up Docker repository..."
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install packages
echo "Installing Docker packages..."
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Ask about starting Docker on boot
read -p "Enabling docker; do you want docker to start on boot? (y/n) " choice
case "$choice" in
[yY])
    systemctl enable --now docker
    ;;
[nN])
    echo "Starting Docker for this session only."
    systemctl start docker
    echo "Run 'sudo systemctl enable docker' whenever you want to enable docker on boot."
    ;;
*)
    echo "Invalid input. Please answer y or n."
    exit 1
    ;;
esac

# Ask about adding user to docker group
read -p "Do you want to add your user to the docker group? (y/n) " choice
case "$choice" in
[yY])
    # Get the actual username (not the sudo user)
    if [ -z "$SUDO_USER" ]; then
        USERNAME=$USER
    else
        USERNAME=$SUDO_USER
    fi

    # Add user to docker group
    usermod -aG docker $USERNAME
    echo "User '$USERNAME' has been added to the docker group."
    echo "You may need to log out and back in for the group changes to take effect."
    ;;
[nN])
    echo "User not added to docker group. You'll need to use sudo with docker commands."
    ;;
*)
    echo "Invalid input. Please answer y or n."
    exit 1
    ;;
esac

# Test the Docker installation
echo "Testing Docker installation..."
if docker run --rm hello-world >/dev/null 2>&1; then
    echo "Docker installation verified successfully!"
else
    echo "There was an issue with the Docker installation. Try 'docker run hello-world'."
    exit 1
fi

echo "Docker setup complete!"
echo "To use docker without sudo in this session, run: 'newgrp docker' or log out and back in."
