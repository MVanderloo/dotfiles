set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_RUNTIME_HOME (getconf DARWIN_USER_TEMP_DIR)

set -x LESSHISTFILE $XDG_DATA_HOME/less/history
set -x PYTHON_HISTORY $XDG_DATA_HOME/python/history
set -x SQLITE_HISTORY $XDG_DATA_HOME/sqlite3
set -x GOPATH $XDG_DATA_HOME/go
