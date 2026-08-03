if status is-interactive
    if type -q zoxide
        zoxide init fish | source
    else
        echo >&2 "zoxide: not found, skipping zoxide integration"
    end
end
