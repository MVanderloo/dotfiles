#!/usr/bin/env bash

echo "Untested script. Exiting to prevent unintentionally running"
exit 1

# this script should be run once on a MacOS machine to setup the rest of this repo to be functional

# move zprofile and zshrc into place. make backup unless --force is set


######################################
# install and configure dependencies #
######################################

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew  autoupdate start 43200 --upgrade --cleanup --immediate --sudo
