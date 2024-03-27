# zsh configuration

# tab completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# lazy loading with zinit for faster startup
# https://zdharma-continuum.github.io/zinit/wiki/
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1
zinit light mafredri/zsh-async
zinit light romkatv/zsh-defer
zinit ice blockf

# add some most-used zsh plugins
zinit wait lucid light-mode for \
              zsh-users/zsh-autosuggestions \
              zdharma-continuum/fast-syntax-highlighting \
              zdharma-continuum/history-search-multi-word \
              sroze/docker-compose-zsh-plugin \
              chrisvander/docker-helpers.zshplugin \

# load completions
zinit for \
  atload"zicompinit; zicdreplay" \
    blockf \
    lucid \
    wait \
  zsh-users/zsh-completions

# shell prompt
eval "$(starship init zsh)"

# vi mode
bindkey -v 
# allow deleting characters that weren't written 
# within the current insert mode. 
bindkey -v '^?' backward-delete-char

# zoxide keeps track of commonly used directories
# and can navigate to them using fuzzy input
alias z zoxide
