function yayf --wraps=yay --description='search yay with fzf'
    yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S
end
