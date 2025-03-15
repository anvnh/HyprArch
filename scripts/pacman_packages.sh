source ./scripts/message.sh
#  ____                                  
# |  _ \ __ _  ___ _ __ ___   __ _ _ __  
# | |_) / _` |/ __| '_ ` _ \ / _` | '_ \ 
# |  __/ (_| | (__| | | | | | (_| | | | |
# |_|   \__,_|\___|_| |_| |_|\__,_|_| |_|
pacman_packages=(
    dunst # For notitication on hyprland
    grim slurp # For screenshot on hyprland
    rofi 
    imv # Image viewer for rofi
    w3m # For ranger preview image
    mpv # For ranger preview video
    pango
    ueberzugpp
    imagemagick # For ranger preview image
    appimaged # Daemon that monitors and integrates AppImage applications with the system
    # ------------------------------------------------------ #
    # For hyprland
    parallel
    pamixer
    # ------------------------------------------------------ #
    jq
)

# Update the system and install the packages
echo "Updating package database..."
pacman -Sy --noconfirm

echo "Installing pacman packages..."
for package in "${pacman_packages[@]}"; do
    echo "Installing $package..."
    pacman -S --noconfirm --needed "$package"
done

