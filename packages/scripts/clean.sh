#!/usr/bin/env bash

# remove broken symlinks from $1 or $HOME
find -L "$HOME/.config" -type l -print -exec rm {} \;
find -L "$HOME/.local" -type l -print -exec rm {} \;
