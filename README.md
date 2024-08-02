# My Dotfiles (WIP)

Welcome to my dotfiles repository. There are configurations for various OS's, split at the top level. Each OS should have an install.sh that should handle all the dependencies and configurations that only need to be done once. I might have the install.sh handle symlinks for those things that I'm sure I want

There are various directories that are designed to be used by stow. I don't have a good way of notating which those are. Good luck!

```code
stow zsh -t ~ 
```

# Dependencies
The dependencies vary per OS but typically need the following
- bash (TODO: make this plain POSIX sh)
- stow
