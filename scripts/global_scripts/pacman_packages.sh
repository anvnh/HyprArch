source ./scripts/message.sh
#  ____                                  
# |  _ \ __ _  ___ _ __ ___   __ _ _ __  
# | |_) / _` |/ __| '_ ` _ \ / _` | '_ \ 
# |  __/ (_| | (__| | | | | | (_| | | | |
# |_|   \__,_|\___|_| |_| |_|\__,_|_| |_|
pacman_packages=(
    zathura-pdf-mupdf
    gping
    scc
    exa
    duf
    bat
    gping
    dua-cli
    lazygit
    httpie
    ngrok
    wttr
    speedtest-cli
    scrcpy
    telegram-desktop
    tlpui
    base-devel
    git
    neovim
    firefox
    zsh
    tmux
    htop
    btop
    neofetch
    nodejs
    npm
    unrar
    zathura
    kitty
    fzf
    github-cli
    bat
    eza
    tldr
    thefuck
    zoxide
    kdeconnect
    partitionmanager
    obsidian
    sxiv
    ranger
    figlet
    fcitx5
    fcitx5-qt
    fcitx5-gtk
    fcitx5-configtool
    fcitx5-unikey
    fcitx5-mozc
    spectacle
    zip
    unzip
    noto-fonts-cjk
    pacman-contrib
    ufw
    bluez
    bluez-utils
    tk
    speech-dispatcher
    syncthing
    webapp-manager
    w3m # For ranger preview image
    mpv # For ranger preview video
    imagemagick # For ranger preview image
    dunst # For notitication on hyprland
    # ------------------------------------------------------ #
    # For hyprland
    parallel
    pamixer
    # ------------------------------------------------------ #
)

# Update the system and install the packages
echo "Updating package database..."
pacman -Sy --noconfirm

echo "Installing pacman packages..."
for package in "${pacman_packages[@]}"; do
    echo "Installing $package..."
    pacman -S --noconfirm --needed "$package"
done

echo "Installing camera..."
sudo pacman -S --noconfirm --needed gstreamer gst-plugins-base gst-plugins-bad-libs
sudo pacman -S --noconfirm --needed snapshot

print_message "32" "Pacman packages installed."
