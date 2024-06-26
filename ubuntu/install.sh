sudo apt update && sudo apt upgrade -y

sudo apt install -y bat eza fd-find git-lfs ripgrep neovim tmux htop zoxide stow fzf just git-delta tealdeer ranger

# starship
curl -fsSL https://starship.rs/install.sh | sh

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# mise
curl https://mise.run | sh

# cleanup
sudo apt autoremove -y
sudo apt autoclean -y
