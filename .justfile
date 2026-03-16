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
    just _check direnv
    just _check eza
    just _check fish
    just _check fzf
    just _check just # lol?
    just _check nvim
    just _check sesh
    just _check sl
    just _check starship
    just _check tmux
    just _check yazi
    just _check zoxide
    just _check_optional btop
    just _check_optional checkexec
    just _check_optional cloc
    just _check_optional dust
    just _check_optional fastfetch
    just _check_optional fd
    just _check_optional gpg
    just _check_optional jq
    just _check_optional op
    just _check_optional prek
    just _check_optional rg
    just _check_optional sd
    just _check_optional systemfd
    just _check_optional watchexec
    printf "\n"
    just _section "Version Control"
    just _check delta
    just _check git
    just _check_optional diffnav
    just _check_optional gh
    just _check_optional git-filter-repo
    just _check_optional gitu
    just _check_optional glab
    just _check_optional jj
    just _check_optional lazygit
    just _check_optional lazyjj
    just _check_optional worktrunk
    printf "\n"
    just _section "Data Tools"
    just _check_optional clickhouse
    just _check_optional duckdb
    just _check_optional lazysql
    just _check_optional parquet-tools
    just _check_optional psql
    just _check_optional sqlit
    just _check_optional sqlite
    just _check_optional gzip
    just _check_optional unzip
    just _check_optional zip
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
    just _check_optional yamllint
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
    just _section "AI"
    just _check_optional goose
    just _check_optional ollama
    just _check_optional opencode
    printf "\n"
    just _section "Containers"
    just _check_optional devcontainer
    just _check_optional docker
    just _check_optional lazydocker
    just _check_optional podman
    printf "\n"
    just _section "Cloud"
    just _check_optional aws
    just _check_optional az
    just _check_optional gcloud
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
