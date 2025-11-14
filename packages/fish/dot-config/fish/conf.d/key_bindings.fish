if status is-interactive
    fish_vi_key_bindings

	bind -M insert ctrl-p up-or-search
	bind -M insert ctrl-n down-or-search
end
