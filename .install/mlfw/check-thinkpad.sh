#!/bin/bash

if [[ -n "$(sudo lshw | grep 'version: ThinkPad E16 Gen 2')" ]] 
then
isThinkpad="yes"
fi

echo $isThinkpad
