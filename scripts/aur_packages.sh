source ./scripts/message.sh
# __   __          
# \ \ / /_ _ _   _ 
#  \ V / _` | | | |
#   | | (_| | |_| |
#   |_|\__,_|\__, |
#            |___/ 

# Disable root before installing AUR packages
yay_packages=(
    grimshot # For taking screenshots
    swaylock-effects # For hyprland lockscreen
)
echo "Installing aur packages..."
for package in "${yay_packages[@]}"; do
    echo "Installing $package..."
    yay -S --noconfirm --needed "$package"
done

print_message "32" "Aur packages installed."
