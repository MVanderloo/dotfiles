#!/usr/bin/env bash

# cd to location of this script
cd "$(dirname -- "${BASH_SOURCE[0]}")"

git submodule foreach git pull origin main
