#!/usr/bin/env bash

# created using https://macos-defaults.com/


# Keyboard
defaults write -g AppleKeyboardUIMode -int 2
defaults write -g KeyRepeat -float 1 # time (ms) until repeating a key
defaults write -g InitialKeyRepeat -float 15 # time (ms) between repeats
defaults write -g ApplePressAndHoldEnabled -bool false # disable press and hold for special characters
defaults write com.apple.HIToolbox AppleFnUsageType -int 0 # 0: Do Nothing, 1: Change Input Source, 2: Show Emoji & Symbols, 3: Start Dictation

# Dock
defaults write com.apple.dock orientation -string bottom # bottom left right
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.2
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock show-recents -bool true
defaults write com.apple.dock mineffect -string scale # genie scale suck
defaults write com.apple.dock static-only -bool false

# Screenshots
defaults write com.apple.screencapture location -string "~/Pictures/Screenshots/"

# Finder
defaults write -g AppleShowAllExtensions -bool true
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
defaults write -g NSTableViewDefaultSizeMode -int 1
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string clmv # icnv glyv Nlsv clmvj
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string SCcf # SCev SCsp SCcf
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder CreateDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Menu Bar
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

# Mouse
defaults write -g com.apple.mouse.linear -bool true
defaults write -g com.apple.mouse.scaling -float 1.0

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0

# Mission Control
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock expose-group-apps -bool false
defaults write -g AppleSpacesSwitchOnActivate -bool false
defaults write com.apple.spaces spans-displays -bool false

# TextEdit
defaults write com.apple.TextEdit RichText -bool false
defaults write com.apple.TextEdit SmartQuotes -bool false

# Disable Apple Intelligence
defaults write com.apple.CloudSubscriptionFeatures.optIn 545129924 -bool false

# Disable Application Downloaded from Internet warning
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Don't restore windows when opening application
defaults write -g NSQuitAlwaysKeepsWindow -bool false

# Move windows with cmd+ctrl+leftclick on any part of the window
defaults write -g NSWindowShouldDragOnGesture -bool true

echo "Warning: certain settings only apply on logout or reboot."
