#!/usr/bin/env zsh

export PATH="$:/snap/bin"

# XDG base directory
export XDG_DATA_HOME=~/.local/share
# export XDG_DATA_DIRS
export XDG_CONFIG_HOME=~/.config
# export XDG_CONFIG_DIRS
export XDG_STATE_HOME=~/.local/state
export XDG_CACHE_HOME=~/.cache
export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir/

# Term
export TERM='xterm-256color'

# editor
export EDITOR="nvim"
export VISUAL="nvim"
alias vim="nvim"
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

# zsh
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Man pages
export MANPAGER='nvim +Man!'

# fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
# export FZF_DEFAULT_OPTS="--height 60% \
# --border sharp \
# --layout reverse \
# --color '$FZF_COLORS' \
# --prompt '∷ ' \
# --pointer ▶ \
# --marker ⇒"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"

export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

# FZF_COLORS="bg+:-1,\
# fg:gray,\
# fg+:white,\
# border:black,\
# spinner:0,\
# hl:yellow,\
# header:blue,\
# info:green,\
# pointer:red,\
# marker:blue,\
# prompt:gray,\
# hl+:red"

# if tldr is run without arguments run a fzf search over tldr --list
# if in a tmux session it will be a popup
function tldr() {
    if [[ $# -eq 0 ]]; then
        # Run tldr with --list to get all available commands
        tldr "$(tldr --list | fzf-tmux --preview "tldr {1} --color=always --compact" --preview-window=right,60% --reverse -p)"
    else
        # Pass arguments to the original tldr command
        command tldr "$@"
    fi
}


