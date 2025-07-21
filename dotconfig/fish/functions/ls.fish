function ls --wraps=eza --description 'alias ls eza'
  exa -lh --group-directories-first --icons=auto $argv
end
