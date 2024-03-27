# this should run after fzf so that Ctrl-r doesn't get overwritten
# I'll fix this eventually
if status is-interactive
    atuin init fish --disable-up-arrow --disable-ctrl-r | source

	# TODO: integrate with fzf
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end
