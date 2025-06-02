#!/usr/bin/env bash

cd "$(dirname "$0")"/../packages
git submodule --init
stow */
