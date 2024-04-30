function rfv --wraps=fzf --description='does rg and then fzf on the results with bat as preview'
  rg --color=always --line-number --no-heading --smart-case "$argv" |
    fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
      --bind 'enter:become(nvim {1} +{2})'
end
