# Welcome to my dotfiles

## Supported Systems
See branches for all supported systems. As of writing this it is
- MacOS
- Fedora

The main branch can be considered a system independent set of configuration files. All branches are rebased off main, and configurations that are system specific are created as changes on top of main. To update all systems I commit to main, then rebase all branches. 

While it would be cool to support a wide range of OS this repo is purely an axe sharpening exercise, so I will only really be maintaining the things that I am using. My hope is that by organizing it in this way I will minimize the duplicate configuration I need to do for each system.

## Structure

## Dependencies

While each package has it's own dependencies, I have minimized install dependencies to the following
1. Git - To clone the repo
2. Stow - GNU Stow uses the directory structure to manage symlinks to this repo. Not strictly necessary but a lot easier than doing it yourself. Symlinks also allow `git pull` to update configurations directly
3. Bash - Many packages include an install.sh for anything that is more complex than stow can handle
4. Package Manager - Ideally where tools are installed from. In some cases install.sh will handle dependencies (see tmux/install.sh)

## Stow Usage
The .stowrc in the repo root configures the behavior of stow, which sets the dotfiles option, and targets the home directory. It also ignore certain files that are not meant to be symlinked, like `install.sh` and `Brewfile` in the case of MacOS. The dotfiles option tells stow that `dot-config` is really `.config`. This is for viewing this repository in an explorer that doesn't display dot prefixed files and director.

### Directory Structure
Stow will mirror the structure of the package in the repo. Take the tmux package as an example

Tmux reads it's configuration from `~/.config/tmux/tmux.conf`, this is what that looks like from the home directory.
```
~
└── .config
    └── tmux
        └── tmux.conf
```

Therefore the tmux package has the following structure (without ignored files):
```
tmux
└── dot-config
    └── tmux
        └── tmux.conf
```

Here is what this looks like after running stow:
```
~
└── .config
    └── tmux
        └── tmux.conf -> ~/dotfiles/tmux/dot-config/tmux/tmux.conf
```


### Adopt Option
In the .stowrc also sets the adopt flag. This means that if there is already a `~/.config/tmux/tmux.conf` on your system, stowing tmux will create the symlink but move the existing file into this repo. You can then use git diff or other git commands to manage the files that already existed on your system without deleting them. If you are confident you don't want them, use git restore to delete them. If you get scared and want to undo, stow -D will put everything back how it was. Thus you can be sure that if anything is overwritten, you will know.

### Commands
- `stow tmux`: symlinks tmux.conf
- `stow -D tmux`: undoes `stow tmux`
- `stow -R tmux`: recreates all symlinks, useful if new files are added to the repo
- `--simulate`: add this flag to any stow command to see what it will do

See the man page for more information

## Packages
Each directory in the root of the repo is considered a package. My goal is for each package to be functional on their own. Ideally they should each declare their dependencies (however is idiomatic for the package manager), declare their own environment variables, and include an idempotent install script if there is something to install.

Here are some of the tools I have configured
### Shells
- fish
- zsh

### Editors
- helix
- neovim
- vscode

### CLI
- bat
- delta
- fastfetch
- fzf
- git
- just
- lazygit
- mise
- python
- starship

### Terminals
- ghostty
- tmux
- wezterm
- zellij
