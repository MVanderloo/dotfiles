Use `brew bundle` to install dependencies in each Brewfile.

The .stowrc file and directory structures are setup to link each set of configs into the proper location with the command `stow {NAME}`. The --adopt option is used to prevent data loss. If the location of a symlink already exists, the file will be adopted into this repository.
- To see if something existed/was adopted, use git diff
- To throw away the existing file and use this repository, use git reset <file-name>
- To restore the existing file, use stow -D <package-name>
- To keep something system specific, just keep it as an uncommitted change
