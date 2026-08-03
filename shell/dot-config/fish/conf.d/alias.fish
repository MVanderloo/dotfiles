if type -q eza
    set EZA_PARAMS --icons=always --classify --group-directories-first --time-style=long-iso --group --color-scale=size

    alias ls 'eza $EZA_PARAMS'
    alias la 'eza --all $EZA_PARAMS'
    alias lg 'eza --all --git-ignore $EZA_PARAMS'
    alias tree 'eza --tree $EZA_PARAMS'
    alias trea 'eza --all --tree $EZA_PARAMS'
else
    echo >&2 "eza: not found, skipping eza aliases"
end

if type -q bat
    alias cat bat
end

if type -q nvim
  alias vim nvim
end

if type -q fzf
    alias fim 'fzf --multi --bind "enter:become(vim {})"'
end

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

alias dotfiles 'git -C ~/.local/dotfiles'

abbr lag lazygit

abbr g git
abbr gd 'git diff'
abbr gs 'git status'
