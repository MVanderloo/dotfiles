# My Dotfiles (WIP)

Welcome to my dotfiles repository. Don't assume anything here works.

Aside from configuration files there are a couple shell scripts used to install/configure things that can't be done from a file.

Most things are contained in an OS specific directory. Some things are cross-platform enough to be outside of that. 

There are various directories that are designed to be used by stow. I don't have a good way of notating which those are, but this command should handle symlinking
```code
stow DIRECTORY -t ~/.config
```
