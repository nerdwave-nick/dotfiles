function fw  --wraps=ssh --description 'while active, forward local port to remote host'
    if test (count $argv) -lt 2 
        echo 'Usage: fw [local port] [remote port]'
    else
        ssh -N -L 127.0.0.1:$argv[1]:127.0.0.1:$argv[2] nerdwave@laptop
    end
end


