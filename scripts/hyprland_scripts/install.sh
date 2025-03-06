#!/bin/bash

source ./scripts/message.sh
# NOTE: Install hyprland
print_message "33" "Installing hyprland"
print_message "34" "Do you want install Hyprland from AUR(yay)? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    # Check if yay is installed, if not, install it
    if ! command -v yay &> /dev/null; then
        print_message "35" "Installing yay..."
        sudo pacman -S --noconfirm yay
    fi
    print_message "36" "Installing Hyprland from AUR..."
    yay -S --noconfirm hyprland
else
    print_message "36" "Installing Hyprland from official repository..."
    sudo pacman -S --noconfirm hyprland
fi

# NOTE: Install pacman and AUR packages
print_message "37" "Installing packages..."
sudo ./scripts/hyprland_scripts/pacman_packages.sh
. ./scripts/hyprland_scripts/aur_packages.sh

# NOTE: Notification
print_message "38" "Setting up notification..."
. ./scripts/hyprland_scripts/configs/notification.sh

# NOTE: Rofi
print_message "38" "Setting up rofi..."
. ./scripts/hyprland_scripts/configs/rofi.sh
