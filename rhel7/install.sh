#!/bin/bash

# Update and upgrade system
sudo yum update -y && sudo yum upgrade -y

# Enable EPEL repository for additional packages
sudo yum install epel-release -y

# Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install packages
# TODO: most of these are not on yum, need to figure out which
# sudo yum install -y bat eza fd-find git-lfs ripgrep neovim tmux htop zoxide stow fzf just git-delta tealdeer ranger
cargo install eza

# Starship
curl -fsSL https://starship.rs/install.sh | sh

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# Mise
curl https://mise.run | sh

# Cleanup
sudo yum autoremove -y
sudo yum clean all

