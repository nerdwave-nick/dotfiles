function l --wraps=kitten --description 'ssh to laptop with terminal specific functionality'
    if count $argv > /dev/null
        kitten ssh laptop -t "fish -i -C '$argv'"
    else
        kitten ssh laptop -t fish
    end
end
