function ls_after_cd --on-variable PWD
    if status --is-interactive
        ls --all
    end
end
