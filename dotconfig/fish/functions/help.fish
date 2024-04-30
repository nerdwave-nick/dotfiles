function bathelp --wraps=bat --description 'get help with bat'
  bat --plain --language=help
        
end

function help --wraps=bathelp --description 'print help via bat'
    $argv --help 2>&1 | bathelp
end
