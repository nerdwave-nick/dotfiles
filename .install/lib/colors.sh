#!/bin/bash

RESET='\033[0m'

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

BBLACK='\033[1;30m'
BRED='\033[1;31m'
BGREEN='\033[1;32m'
BYELLOW='\033[1;33m'
BBLUE='\033[1;34m'
BPURPLE='\033[1;35m'
BCYAN='\033[1;36m'
BWHITE='\033[1;37m'

echo_s() {
    echo -en "${RESET}${GREEN}"
    echo "$@"
    echo -en "${RESET}"
}

echo_e() {
    echo -en "${RESET}${RED}"
    echo "$@"
    echo -en "${RESET}"
}

echo_t() {
    echo -en "${RESET}${WHITE}"
    echo "$@"
    echo -en "${RESET}"
}

echo_i() {
    echo -en "${RESET}${BWHITE}"
    echo "$@"
    echo -en "${RESET}"
}
