# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Description |
|---|---|
| `shell` | My full CLI environment |
| `server` | Use over ssh - Minimal dependencies and compatiblity focused |
| `wayland-desktop` | Linux desktop |
| `darwin-desktop` | macOS desktop |

## Usage

Clone the repo and stow whichever packages you need:
```sh
git clone https://github.com/MVanderloo/dotfiles ~/.local/dotfiles
cd ~/.local/dotfiles
stow "$PACKAGE"
```
