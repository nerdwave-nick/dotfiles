#!/usr/bin/env bash

function run {
    if ! pgrep -f $1 ;
    then 
        $@&
    fi
}

run vmware-user-suid-wrapper --no--startup-id
# run picom --config $HOME/.config/picom/picom.conf
run picom 
