if status is-interactive
    atuin init fish | ATUIN_NOBIND="true" source

    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end
