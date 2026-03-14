function fish_user_key_bindings
    fish_default_key_bindings -M insert
    bind -M insert ctrl-p up-or-search
    bind -M insert ctrl-n down-or-search
end
