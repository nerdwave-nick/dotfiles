function cd --wraps=z --description 'try cd if possible, else try z'
  if test (count $argv) -eq 0
    builtin cd ~
    return
  else if test -d "$argv[1]"
    builtin cd "$argv[1]"
  else
    if z $argv
      printf " \U000F17A9 "
      pwd
    else
      echo "Error: Directory not found"
    end
  end
end
