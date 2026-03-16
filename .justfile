CHECK := '✓'
CROSS := '✗'
RED := '\033[0;31m'
GREEN := '\033[0;32m'
YELLOW := '\033[1;33m'
BLUE := '\033[0;34m'
NC := '\033[0m'

check-dependencies package:
  @{{ if package == "shell" { \
    "just check-shell-dependencies" \
  } else { \
    error("Unknown package '" + package + "'") \
  } }}

[default]
@check-shell-dependencies:
    printf "{{BLUE}}Checking dependencies for shell package...{{NC}}\n"
    just _check atuin
    just _check bash
    just _check bat
    just _check eza
    just _check fish
    just _check fzf
    just _check nvim
    just _check rg
    just _check sesh
    just _check starship
    just _check tmux
    just _check zoxide
    just _check_optional fastfetch
    just _check_optional fd
    just _check_optional just
    printf "\n"
    just _section "Version Control"
    just _check delta
    just _check git
    just _check_optional gh
    just _check_optional glab
    just _check_optional jj
    just _check_optional lazygit
    printf "\n"
    just _section "TUI"
    just _check yazi
    just _check_optional btop
    just _check_optional lazydocker
    just _check_optional lazysql
    printf "\n"
    just _section "Toolchains"
    just _check_optional bun
    just _check_optional cargo
    just _check_optional gcc
    just _check_optional go
    just _check_optional npm
    just _check_optional uv
    just _check_optional zig
    printf "\n"
    just _section "Language Servers"
    just _check_optional basedpyright
    just _check_optional bashls
    just _check_optional emmylua_check
    just _check_optional emmylua_ls
    just _check_optional gopls
    just _check_optional lua-language-server
    just _check_optional pyright
    just _check_optional ruff
    just _check_optional rust-analyzer
    just _check_optional ty
    just _check_optional zls
    printf "\n"
    just _section "Formatters"
    just _check_optional fish_indent
    just _check_optional gofmt
    just _check_optional goimports
    just _check_optional mdformat
    just _check_optional prettier
    just _check_optional ruff
    just _check_optional rustfmt
    just _check_optional shfmt
    just _check_optional stylua
    just _check_optional taplo
    just _check_optional yamlfix
    just _check_optional zigfmt
    printf "\n"

[private]
_section name:
    @printf "{{BLUE}}{{name}}:{{NC}}\n"

[private]
_check cmd:
    @if command -v {{cmd}} > /dev/null 2>&1; then \
        printf "  {{GREEN}}{{CHECK}}{{NC}} {{cmd}}\n"; \
    else \
        printf "  {{RED}}{{CROSS}}{{NC}} {{cmd}} {{RED}}(REQUIRED){{NC}}\n"; \
        exit 1; \
    fi

[private]
_check_optional cmd:
    @if command -v {{cmd}} > /dev/null 2>&1; then \
        printf "  {{GREEN}}{{CHECK}}{{NC}} {{cmd}} {{YELLOW}}(optional){{NC}}\n"; \
    else \
        printf "  {{RED}}{{CROSS}}{{NC}} {{cmd}} {{YELLOW}}(optional){{NC}}\n"; \
    fi
