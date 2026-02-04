function laptop --wraps=waypipe,kitten --description 'ssh to work laptop'
    if count $argv > /dev/null
        waypipe --no-gpu ssh laptop $argv
    else
        kitten ssh laptop -t fish
    end
end
