#!/usr/bin/env bash

# install TPM
TPM_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/tmux/plugins/tpm"
if [ ! -d "$TPM_PATH" ] || [ -z "$(ls -A "$TPM_PATH" 2>/dev/null)" ]; then
    echo "Cloning TPM to $TPM_PATH"
    git clone https://github.com/tmux-plugins/tpm "$TPM_PATH" || echo "Failed to install TPM, continuing..."
else
    echo "$TPM_PATH already exists and is not empty"
fi

# install sesh
SESH_PATH="$HOME/.local/bin/sesh"
if [ ! -f "$SESH_PATH" ]; then
    echo "Installing sesh to $SESH_PATH"
    GOBIN="$SESH_PATH/.." go install github.com/joshmedeski/sesh/v2@latest
    chmod +x "$SESH_PATH"
else
    echo "$SESH_PATH already exists and is not empty"
fi
