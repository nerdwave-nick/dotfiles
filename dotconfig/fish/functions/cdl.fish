function cdl --wraps=kitten --description 'ssh to laptop to specific directory'
    if count $argv > /dev/null
        kitten ssh laptop -t "fish -i -C 'cd $argv'"
    else
        echo 'Usage: cdl [directory]'
    end
end
