CHECK := '✓'
CROSS := '✗'
RED := '\033[0;31m'
GREEN := '\033[0;32m'
YELLOW := '\033[1;33m'
BLUE := '\033[0;34m'
NC := '\033[0m'

# Check dependencies for a specific package
check-dependencies package:
  @{{ if package == "shell" { \
    "just check-shell-dependencies" \
  } else { \
    error("Unknown package '" + package + "'") \
  } }}

# Check all shell package dependencies
[default]
@check-shell-dependencies:
    printf "{{BLUE}}Checking dependencies for shell package...{{NC}}\n"
    just _check atuin
    just _check bash
    just _check bat
    just _check delta
    just _check direnv
    just _check eza
    just _check fd
    just _check fish
    just _check fzf
    just _check git
    just _check just # lol?
    just _check nvim
    just _check rg
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
    just _check_optional gh
    just _check_optional glab
    just _check_optional gpg
    just _check_optional jj
    just _check_optional jq
    just _check_optional op
    just _check_optional prek
    just _check_optional sd
    just _check_optional systemfd
    just _check_optional watchexec
    just _check_optional wt
    printf "\n"
    just _section "Data Tools"
    just _check_optional clickhouse
    just _check_optional duckdb
    just _check_optional gzip
    just _check_optional lazysql
    just _check_optional parquet-tools
    just _check_optional psql
    just _check_optional rsync
    just _check_optional sqlit
    just _check_optional sqlite
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
    just _section "Containers"
    just _check_optional docker
    just _check_optional podman
    printf "\n"
    just _section "Cloud"
    just _check_optional aws
    just _check_optional az
    just _check_optional gcloud
    printf "\n"

# Check required dependencies only
@check-required:
    printf "{{BLUE}}Checking required dependencies...{{NC}}\n"
    just _check atuin
    just _check bash
    just _check bat
    just _check delta
    just _check direnv
    just _check eza
    just _check fd
    just _check fish
    just _check fzf
    just _check git
    just _check just
    just _check nvim
    just _check rg
    just _check sesh
    just _check sl
    just _check starship
    just _check tmux
    just _check yazi
    just _check zoxide
    printf "\n"

# Check optional shell utilities
@check-optional-utils:
    printf "{{BLUE}}Checking optional utilities...{{NC}}\n"
    just _check_optional btop
    just _check_optional checkexec
    just _check_optional cloc
    just _check_optional dust
    just _check_optional fastfetch
    just _check_optional gh
    just _check_optional glab
    just _check_optional gpg
    just _check_optional jj
    just _check_optional jq
    just _check_optional op
    just _check_optional prek
    just _check_optional sd
    just _check_optional worktrunk
    just _check_optional systemfd
    just _check_optional watchexec
    printf "\n"

# Check data tools
@check-data-tools:
    printf "{{BLUE}}Checking data tools...{{NC}}\n"
    just _check_optional clickhouse
    just _check_optional duckdb
    just _check_optional lazysql
    just _check_optional parquet-tools
    just _check_optional psql
    just _check_optional rsync
    just _check_optional sqlit
    just _check_optional sqlite
    just _check_optional gzip
    just _check_optional unzip
    just _check_optional zip
    printf "\n"

# Check language toolchains
@check-toolchains:
    printf "{{BLUE}}Checking toolchains...{{NC}}\n"
    just _check_optional bun
    just _check_optional cargo
    just _check_optional gcc
    just _check_optional go
    just _check_optional npm
    just _check_optional uv
    just _check_optional zig
    printf "\n"

# Check language servers
@check-language-servers:
    printf "{{BLUE}}Checking language servers...{{NC}}\n"
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

# Check code formatters
@check-formatters:
    printf "{{BLUE}}Checking formatters...{{NC}}\n"
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

# Check container tools
@check-containers:
    printf "{{BLUE}}Checking container tools...{{NC}}\n"
    just _check_optional docker
    just _check_optional podman
    printf "\n"

# Check cloud CLIs
@check-cloud:
    printf "{{BLUE}}Checking cloud CLIs...{{NC}}\n"
    just _check_optional aws
    just _check_optional az
    just _check_optional gcloud
    printf "\n"

# Print a section header
[private]
_section name:
    @printf "{{BLUE}}{{name}}:{{NC}}\n"

# Check if a required command exists
[private]
_check cmd:
    @if command -v {{cmd}} > /dev/null 2>&1; then \
        printf "  {{GREEN}}{{CHECK}}{{NC}} {{cmd}}\n"; \
    else \
        printf "  {{RED}}{{CROSS}}{{NC}} {{cmd}} {{RED}}(REQUIRED){{NC}}\n"; \
        exit 1; \
    fi

# Check if an optional command exists
[private]
_check_optional cmd:
    @if command -v {{cmd}} > /dev/null 2>&1; then \
        printf "  {{GREEN}}{{CHECK}}{{NC}} {{cmd}} {{YELLOW}}(optional){{NC}}\n"; \
    else \
        printf "  {{RED}}{{CROSS}}{{NC}} {{cmd}} {{YELLOW}}(optional){{NC}}\n"; \
    fi
