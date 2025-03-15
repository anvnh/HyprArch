#!/bin/bash

source ./scripts/message.sh
# NOTE: Install hyprland
print_message "33" "Installing hyprland"
print_message "34" "Do you want to install Hyprland? (y/n)"
read -r response
# If no then exit, otherwise continue
if [[ ! $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    print_message "35" "Exiting..."
    exit 1
fi

# print_message "34" "Do you want install Hyprland from AUR(yay)? (y/n)"
# read -r response
# if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
#     # Check if yay is installed, if not, install it
#     if ! command -v yay &> /dev/null; then
#         print_message "35" "Installing yay..."
#         sudo pacman -S --noconfirm yay
#     fi
#     print_message "36" "Installing Hyprland from AUR..."
#     yay -S --noconfirm hyprland
# else
#     print_message "36" "Installing Hyprland from official repository..."
#     sudo pacman -S --noconfirm hyprland
# fi

# NOTE: Install pacman and AUR packages
print_message "37" "Installing packages..."
sudo ./scripts/pacman_packages.sh
. ./scripts/aur_packages.sh

# NOTE: Notification
print_message "38" "Setting up notification..."
. ./scripts/configs/notification.sh

# NOTE: Hyde
print_message "38" "Setting up hyde..."
. ./scripts/configs/hyde.sh

# NOTE: Rofi
print_message "38" "Setting up rofi..."
. ./scripts/configs/rofi.sh

# NOTE: Waybar
print_message "38" "Setting up waybar..."
. ./scripts/configs/waybar.sh

cat <<EOF

===========================================
        🎉 Installation Complete! 🎉
===========================================

🔄 Please reboot to apply all changes.

===========================================
EOF
