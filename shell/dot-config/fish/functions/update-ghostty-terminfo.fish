function update-server-terminfo --argument-names ssh_address
    echo $ssh_address
    infocmp -x xterm-ghostty | ssh $ssh_address -- tic -x -
end
