if ! $(which foot); then
    notify-send "foot is not installed"
    exit 1
fi

if ! foot --server; then 
    notify-send "foot server process died"
fi

