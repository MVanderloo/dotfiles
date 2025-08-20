#!/usr/bin/env bash

# cd to script's parent
cd "$(dirname "$0")"

echo "Installing dependencies"
brew bundle check || brew bundle install
echo

echo "Setting 'Displays have separate Spaces' to True"
defaults write com.apple.spaces "spans-displays" -bool "true"
echo

echo "Adding AeroSpace to login items"
osascript -e 'tell application "System Events" to make login item at end with properties { name: "AeroSpace", path:"/Applications/AeroSpace.app", hidden:false }' >/dev/null
echo

echo "Edit configuration in '~/.config/aerospace/aerospace.toml'"
