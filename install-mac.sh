#!/usr/bin/env bash

echo "Untested script. Exiting to prevent unintentionally running"
exit 1

# this script should be run once on a MacOS machine to setup the rest of this repo to be functional

# move zprofile and zshrc into place. TODO: make backup unless --force is set
mv ~/.zshrc ~/.zshrc-backup
mv .zshrc ~/.zshrc

mv ~/.zprofile ~/.zprofile-backup
mv .zprofile ~/.zprofile

######################################
# install and configure dependencies #
######################################

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew  autoupdate start 43200 --upgrade --cleanup --immediate --sudo

# essential homebrew packages
brew install thefuck
brew install ripgrep
brew install bat
brew install fd
brew install fzf
brew install zoxide
brew install eza

# casks
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font # font
brew install --cask kitty # terminal emulator


