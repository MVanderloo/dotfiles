# prompt
eval $(starship init bash)

# bash vi mode
set -o vi

# eza
eza_params="--git --icons=always --classify --group-directories-first --time-style=long-iso --group --color-scale"
alias ls='eza $eza_params'
alias la='eza $eza_params --all'
alias tree='eza --tree $eza_params'

# fd
alias fd=fdfind

# bat 
alias cat=batcat
