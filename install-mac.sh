#!/usr/bin/env bash

echo "Untested script. Exiting to prevent unintentionally running. Remove when ready to run"
exit 1

##########################################################
# this script should be run on a MacOS machine initially #
##########################################################

# prevent Finder from writing those godforsaken .DS_Store files everywhere
defaults write com.apple.desktopservices DSDontWriteNetworkStores true


######################################
# install and configure dependencies #
######################################

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew autoupdate start 43200 --upgrade --cleanup --immediate --sudo

# essential homebrew packages
# replace with Brewfile
brew install thefuck
brew install fzf          # fuzzy find
brew install ripgrep      # better grep
brew install bat          # better cat
brew install fd           # better find
brew install zoxide       # fzf cd replacement
brew install eza          # better ls
brew install zellij       # terminal multiplexor
brew install zsh-vi-mode  # better supported vi mode in terminal
brew install mdless       # markdown preview

# casks
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font # font
brew install --cask kitty # terminal emulator


