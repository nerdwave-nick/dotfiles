function lta --wraps=eza --description 'alias eza tree'
    eza -a --tree --level=2 --long --icons --git $argv
end
