#!/usr/bin/env bash

# remove broken symlinks from $1 or $HOME
search_path="${1:-$HOME}"
find -L "$search_path" -type l -print -exec rm -i {} \;
