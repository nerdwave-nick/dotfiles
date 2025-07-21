#!/bin/bash
echo_c "Setting up pacman config" $PURPLE
# Search for the line containing "ParallelDownloads = 5"
line=$(grep "ParallelDownloads" /etc/pacman.conf)

# Check if the line starts with a '#' character
if [[ $line == \#* ]]; then
        echo_n "Modifying pacman.conf to enable parallel downloads."
        new_line=$(echo "$line" | sed 's/^#//')

        # Replace the original line with the new line in the configuration file
        sudo sed -i "s/$line/$new_line/g" /etc/pacman.conf

        # Display a message indicating that the line was modified
        echo_s "Modified line: $new_line"
else
    # Check if the line is already uncommented
    if [[ $line == ParallelDownloads\ =\ 5 ]]; then
        # Display a message indicating that the line does not need to be modified
        echo_n "pacman.conf already optimized for parallel downloads."
    else
        # Display a message indicating that the line is missing or commented out
        echo_e "Parallel downloads could not be activated. Required configuration in /etc/pacman.conf could not found."
    fi
fi

# Activate Color in pacman.conf
if grep -Fxq "#Color" /etc/pacman.conf
then
    sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
    echo_s "Color activated in pacman.conf"
else
    echo_n "Color is already activated in pacman.conf"
fi
if grep -Fxq "# Color" /etc/pacman.conf
then
    sudo sed -i 's/^# Color/Color/' /etc/pacman.conf
    echo_s "Color activated in pacman.conf"
fi
echo

