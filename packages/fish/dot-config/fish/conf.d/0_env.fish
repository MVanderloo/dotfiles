fish_add_path "$HOME/.local/bin"

set start_time (date +%s%N)
function expand_vars
    set -l result $argv[1]

    # tilde expansion
    if string match -q '~*' -- $result
        set result (string replace '^~' $HOME -- $result)
    end

    # skip if no variables
    string match -q '*$*' -- $result; or begin
        echo $result
        return
    end

    # single regex to find all variables at once
    set -l vars (string match -ra '\$\{?([A-Za-z_][A-Za-z0-9_]*)\}?' -- $result)

    for var_match in $vars
        set -l var_name (string replace -ra '\$\{?([A-Za-z_][A-Za-z0-9_]*)\}?' '$1' -- $var_match)
        if set -q $var_name
            set result (string replace -a $var_match $$var_name -- $result)
        end
    end

    echo $result
end

for conf in $HOME/.local/env/*.conf
    test -f $conf; or continue

    for line in (string match -r '^[A-Za-z_][A-Za-z0-9_]*=.*' < $conf)
        set -l parts (string split -m 1 '=' -- $line)
        set -l key $parts[1]
        set -l value $parts[2]

        if string match -q '"*"' -- $value; or string match -q "'*'" -- $value
            set value (string sub -s 2 -e -1 $value)
        end

        set -l expanded_value (expand_vars $value)
        set -gx $key $expanded_value
    end
end
