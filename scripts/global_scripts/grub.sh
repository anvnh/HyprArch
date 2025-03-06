#!/bin/bash

source ./scripts/message.sh

read -p "Do you want to install the Grub theme? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/anvnh/grub2
    cd grub2

    # Select background theme variant
    echo "Select a background theme variant:"
    options=("forest" "mojave" "mountain" "wave")
    select opt in "${options[@]}"; do
        if [[ -n $opt ]]; then
            theme=$opt
            echo "You selected: $theme"
            break
        else
            echo "Invalid option, please select a valid number."
        fi
    done

    # Select theme style variant
    echo "Select a theme style variant:"
    options=("window" "float" "sharp" "blur")
    select opt in "${options[@]}"; do
        if [[ -n $opt ]]; then
            type=$opt
            echo "You selected: $type"
            break
        else
            echo "Invalid option, please select a valid number."
        fi
    done

    # Select picture display side
    echo "Select a picture display side:"
    options=("left" "right")
    select opt in "${options[@]}"; do
        if [[ -n $opt ]]; then
            side=$opt
            echo "You selected: $side"
            break
        else
            echo "Invalid option, please select a valid number."
        fi
    done

    # Select background color variant
    echo "Select a background color variant:"
    options=("dark" "light")
    select opt in "${options[@]}"; do
        if [[ -n $opt ]]; then
            color=$opt
            echo "You selected: $color"
            break
        else
            echo "Invalid option, please select a valid number."
        fi
    done

    # Select screen display variant
    echo "Select a screen display variant:"
    options=("1080p" "2k" "4k")
    select opt in "${options[@]}"; do
        if [[ -n $opt ]]; then
            screen=$opt
            echo "You selected: $screen"
            break
        else
            echo "Invalid option, please select a valid number."
        fi
    done

    # Select logo option
    echo "Do you want to show a logo on the picture?"
    options=("default" "system")
    select opt in "${options[@]}"; do
        if [[ -n $opt ]]; then
            logo=$opt
            echo "You selected: $logo"
            break
        else
            echo "Invalid option, please select a valid number."
        fi
    done

    echo "Installing with the following options:"
    echo "Theme: $theme"
    echo "Type: $type"
    echo "Side: $side"
    echo "Color: $color"
    echo "Screen: $screen"
    echo "Logo: $logo"

    # Command to install theme with selected options
    ./install.sh -t "$theme" -p "$type" -i "$side" -c "$color" -s "$screen" -l "$logo" -b
fi

