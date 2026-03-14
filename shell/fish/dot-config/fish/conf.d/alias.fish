set EZA_PARAMS --icons=always --classify --group-directories-first --time-style=long-iso --group --color-scale

alias ls 'eza $EZA_PARAMS'
alias la 'eza --all $EZA_PARAMS'
alias lg 'eza --all --git-ignore $EZA_PARAMS'
alias tree 'eza --tree $EZA_PARAMS'
alias trea 'eza --all --tree $EZA_PARAMS'

alias cat bat

alias vim nvim
alias fim 'fzf --multi --bind "enter:become(vim {})"'

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

abbr lag lazygit
abbr lad lazydocker
abbr las lazysql

abbr g 'git'
abbr ga 'git add'
abbr gd 'git diff'
abbr gs 'git status'
abbr gc 'git commit'
abbr gst 'git stash apply'
abbr gsp 'git stash pop'
abbr gch 'git checkout'
