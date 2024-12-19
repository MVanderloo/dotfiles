Use `brew bundle` to install dependencies in the Brewfile.

The .stowrc file and directory structures are setup to link each set of configs into the proper location with the command `stow {NAME}`. The --adopt option is used so if there is an existing file in the location, it will be moved to this repository and git can be used to diff or restore the original or the new.
