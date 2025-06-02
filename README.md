# Dotfiles

This repo contains configurations and scripts that setup my devlopment environment.

## Getting Started

### Local Branch

The local branch I create on every machine I clone these to. This is a place for source controlling changes local to the computer.

Source controlling dotfiles also comes with the risk of committing secrets. If committed, you are 1 git push away from putting them on the internet. Not committing can also be annoying while pulling from upstream.

By setting the pushRemote to an invalid ref `no-push`, it makes it much harder to accidentally push this branch.

### Setup Variables

Each branch off main targets an operating system. The setup commands below reference a branch and a path. Setting these two variables will allow you to paste the commands.

```shell
branch="darwin"
dotfiles="$HOME/.local/dotfiles"
```

### Simple Setup

Clone the desired branch to the desired path and setup submodules.

```shell
git clone https://github.com/mvanderloo/dotfiles "$dotfiles" \
	-b "$branch" --recurse-submodules
cd "$dotfiles"
```

### Setup with local worktree

This is the same as the above but it uses a bare repo to clone two worktrees, $branch and local.

```shell
git clone --bare https://github.com/mvanderloo/dotfiles "$dotfiles/.git" --recurse-submodules
cd "$dotfiles"
git worktree add "$branch"
git worktree add local -b local --track "$branch"
git config branch.local.pushRemote no-push
cd local
git submodule update --init --recursive
```

## Install

Every directory in packages/ is a stow package. You can either select the packages you want, or install all of them.

```shell
cd packages
stow git neovim fzf
# or
stow */
```

## Supported Systems

See branches for all supported systems. As of writing this it is

- darwin (MacOS)
- fedora

The primary differences between system configs are the package manager and system utility scripts.

## Structure

## Dependencies

While each package has it's own dependencies, I have minimized install dependencies to the following

1. Git - To clone the repo
1. Stow - GNU Stow uses the directory structure to manage symlinks to this repo. Not strictly necessary but a lot easier than doing it yourself. Symlinks also allow `git pull` to update configurations directly
1. Bash - Many packages include an install.sh for anything that is more complex than stow can handle
1. Package Manager - Ideally where tools are installed from. In some cases install.sh will handle dependencies (see tmux/install.sh)

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
