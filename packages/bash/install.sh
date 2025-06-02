#!/usr/bin/env bash

set -euo pipefail

LOGIN="/etc/profile.d/bash-xdg.sh"
LOGIND=$(dirname $LOGIN)
INTERACTIVE="/etc/bash/bashrc.d/bash-xdg.sh"
INTERACTIVED=$(dirname $INTERACTIVE)

if [ ! -d $LOGIND ]; then
	echo "$LOGIND doesn't exist"
	exit 1
elif [ -f "$LOGIN" ]; then
	echo "$LOGIN already exists"
	exit 1
fi

cat <<EOF >"$LOGIN"
# Make bash follow the XDG_CONFIG_HOME specification
_confdir="${XDG_CONFIG_HOME:-$HOME/.config}/bash"
_datadir="${XDG_DATA_HOME:-$HOME/.local/share}/bash"

# Source settings file
if [ -d "$_confdir" ] then
    for f in bash_profile bashrc; do
        [ -f "$_confdir/$f" ] && . "$_confdir/$f"
    done
fi

# Change the location of the history file by setting the environment variable
[ ! -d "$_datadir" ] && mkdir -p "$_datadir"
HISTFILE="$_datadir/history"

unset _confdir
unset _datadir
EOF


if [ ! -d "$INTERACTIVED" ]; then
	echo "$INTERACTIVED doesn't exist"
	exit 1
elif [ -f "$INTERACTIVE" ]; then
	echo "$INTERACTIVE already exists"
	exit 1
fi

cat <<EOF >"$INTERACTIVE"
_confdir="${XDG_CONFIG_HOME:-$HOME/.config}/bash"
_datadir="${XDG_DATA_HOME:-$HOME/.local/share}/bash"

[[ -r "$_confdir/bashrc" ]] && . "$_confdir/bashrc"

[[ ! -d "$_datadir" ]] && mkdir -p "$_datadir"
HISTFILE=$_datadir/history

unset _confdir
unset _datadir
EOF
