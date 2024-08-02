# XDG Base Directory 
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir/


# If not running interactively, don't do anything
case $- in 
  *i*) ;;
  *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000


eval $(starship init bash)

set -o vi

eza_params="--git --icons=always --classify --group-directories-first --time-style=long-iso --group --color-scale"
alias ls='eza $eza_params'
alias la='eza $eza_params --all'
alias tree='eza --tree $eza_params'

alias fd=fdfind

alias cat=batcat
