# this should run after fzf so that Ctrl-r doesn't get overwritten
# I'll fix this eventually
if status is-interactive
    if type -q atuin
        atuin init fish --disable-up-arrow --disable-ctrl-r | source

        bind \cr _atuin_search
        bind -M insert \cr _atuin_search
    else
        echo >&2 "atuin: not found, skipping atuin integration"
    end
end
