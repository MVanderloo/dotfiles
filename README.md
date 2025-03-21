# Welcome to my dotfiles

## Supported Systems
See branches for all supported systems.

The main branch can be considered a system independent set of configuration files. Whenever I have an OS that I need dotfiles for, I can create a new branch off main and make changes as needed. Configurations that are system specific stay in their own branch. When I want to make changes to a configuration on any system, I should be able to make edits on main and rebase.

While main is the meat and potatoes of my configurations, I'd like to maintain dependency files and install scripts with each packages since they are highly system dependent. Additionally many configurations need certain patches in order to work.

While it would be cool to support a wide range of OS this repo is purely an axe sharpening exercise, so I will only really be maintaining the things that I am using. My hope is that by organizing it in this way I will minimize the duplicate configuration I need to do for each system.

## Dependencies

### Git
Well you have to get the repo somehow.

### Stow
GNU Stow is a symlink manager and it is the reason for the directory structure of this repository. It takes a package from the root of this repository and symlinks it to the proper location. This is not mandatory but it takes away all the work of symlinks. See below for an example. 

### Bash
Many packages include an install.sh script for things that require more than just a file in the right place.

### Package manager
This depends on the system, on MacOS you have to install Homebrew and on Fedora it comes with dnf.

## Stow Packages Example
The .stowrc in the repo root configures the behavior of stow, which sets the dotfiles option, targets the home directory, and ignores install.sh and Brewfile (Which I use on MacOS for dependencies). The dotfiles option tells stow that `dot-config` is really `.config`. It is so that files are more visible when looking at the repo in a terminal or file explorer that hides dotfiles by default.

### Directory Structure
Stow will mirror the structure of the package in the repo. Tmux reads it's configuration from `~/.config/tmux/tmux.conf`, this is what that looks like from the home directory.
```
 ~
└──  .config
    └──  tmux
        └── tmux.conf
```

Therefore the tmux package has the following structure (without ignored files):
```
 tmux
└──  dot-config
    └──  tmux
        └── tmux.conf
```

Here is what this looks like after running stow:
```
 ~
└──  .config
    └──  tmux
        └── tmux.conf -> ~/dotfiles/tmux/dot-config/tmux/tmux.conf
```


### Adopt Option
In the .stowrc also sets the adopt flag. This means that if there is already a `~/.config/tmux/tmux.conf` on your system, stowing tmux will create the symlink but move the existing file into this repo. You can use git diff, or other git commands to manage files already on your system. Thus you can be sure that if anything is overwritten, you will know.

### install.sh
For a more complex install process I use an `install.sh` bash script. This is useful as a catchall for things that can't be done with the stow or the package manager. For example tmux uses the Tmux Plugin Manager, which is not available on most package managers. `install.sh` clones the repo into the correct location and that's it. For more complex setups like docker, I use the official docker install script.

### Commands
- `stow tmux`: symlinks tmux.conf
- `stow -D tmux`: undoes `stow tmux`
- `stow -R tmux`: recreates all symlinks, useful if new files are added to the repo
- `--simulate`: add this flag to any stow command to see what it will do

See the man page for more information

## Packages
Each directory in the room of the repo is considered a package. The goal is for each package to be as independent as possible. However, sometimes packages may assume the existence of environment variables that are set in a shell package.

One goal to aspire towards is to have each package declare it's dependencies and include an install.sh. MacOS uses homebrew, which reads from Brewfiles.

### Shells
- fish
- zsh
- bash

### Editors
- neovim
- helix
- vscode

### CLI
- bat
- fzf
- git
- mise

### Terminals
- ghostty
- wezterm
- tmux
- zellij

### Todo
Just a list of a few things I would like to include
- Window manager per system using a set of unified keybindings
- nushell
- helix
- Include other terminals like kitty or alacritty
- better VSCode package, which does not currently follow the stow package structure
- break up scripts, put tmux-sessionizer into tmux package for example
- Find a shell independent way to declare environment variables per package, so that they don't need to be in each shell. I tried .profile but it's not quite what I need. One idea is to put them in ~/.config/env/<package-name>.env, which gets sourced by all shells.

