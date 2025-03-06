source ./scripts/message.sh
# __   __          
# \ \ / /_ _ _   _ 
#  \ V / _` | | | |
#   | | (_| | |_| |
#   |_|\__,_|\__, |
#            |___/ 

# Disable root before installing AUR packages
yay_packages=(
    scc
    ngrok
    wttr
    tlpui
    webapp-manager
    ente-auth
    ttf-ms-fonts
    ttf-liberation
    wps-office
    appimaged # Daemon that monitors and integrates AppImage applications with the system
)
echo "Installing aur packages..."
for package in "${yay_packages[@]}"; do
    echo "Installing $package..."
    yay -S --noconfirm --needed "$package"
done

print_message "32" "Aur packages installed."
