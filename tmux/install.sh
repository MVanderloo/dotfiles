#!/usr/bin/env bash

install="${XDG_DATA_HOME:-$HOME/.local/share}/tmux/plugins/tpm"

echo "Cloning TPM to $install"

git clone https://github.com/tmux-plugins/tpm "$install"
