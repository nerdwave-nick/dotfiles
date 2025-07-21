function lt --wraps=eza --description 'alias eza tree'
    eza --tree --level=2 --long --icons --git $argv
end
