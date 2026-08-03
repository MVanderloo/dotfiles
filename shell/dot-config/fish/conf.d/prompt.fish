if status is-interactive
    if type -q starship
        starship init fish | source
    else
        echo >&2 "starship: not found, skipping prompt"
    end
end
