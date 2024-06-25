sudo apt update && sudo apt upgrade -y

sudo apt install -y eza git-lfs ripgrep neovim tmux htop zoxide stow fzf thefuck just git-delta tealdeer 

# fd
sudo apt install -y fd-find
alias fd=fdfind

# bat
sudo apt install -y bat
alias cat=batcat

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

sudo apt autoremove -y
sudo apt autoclean -y
