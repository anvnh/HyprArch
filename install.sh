#!/bin/bash

source ./scripts/message.sh

# # NOTE: Update system
# print_message "33" "Updating system..."
# sudo pacman -Syu --noconfirm
# sudo pacman -Sy --noconfirm git
#
# # NOTE: Install yay for AUR
# print_message "33" "Installing Yay..."
# if ! command_exists yay; then
#     git clone https://aur.archlinux.org/yay.git
#     cd yay
#     makepkg -si --noconfirm
#     cd ..
#     rm -rf yay
# fi
#
# # NOTE: Pacmamn packages
# sudo ./scripts/pacman_packages.sh
#
# # NOTE: AUR packages
# . ./scripts/yay_packages.sh
#
# # NOTE: Notitication
# print_message "33" "Setting up notification..."
# . ./scripts/notification.sh
#
# # NOTE: Change shell to zsh
# print_message "33" "Changing shell to zsh..."
# chsh -s $(which zsh)
# exec $SHELL
#
# # NOTE: Bluetooth install
# print_message "33" "Setting up Bluetooth..."
# sudo ./scripts/bluetooth.sh
#
# # NOTE: Neofetch theme
# print_message "33" "Setting up Neofetch theme..."
# cd ~/.config/neofetch/ && rename config.conf configbackup.conf config.conf
# cd && mkdir Git && cd Git && git clone https://github.com/Chick2D/neofetch-themes/
#
# # NOTE: Kitty ( temrinal ) install 
# sudo ./scripts/kitty.sh
#
# # NOTE: Firewall install
# # print_message "33" "Setting up firewall..."
# # sudo ufw enable
# # sudo systemctl enable ufw.service # enable with system
#
# # NOTE: CLI install
# print_message "33" "Installing CLI..."
# . ./scripts/cli.sh
#
# # NOTE: Nerd Fonts install
# print_message "33" "Installing Nerd Fonts..."
# sudo pacman -S $(pacman -Sgq nerd-fonts)
#
# # NOTE: Utilities install
# print_message "33" "Installing Utilities..."
# . ./scripts/utils.sh
#
# # NOTE: Setup alias
# print_message "33" "Setting up alias..."
# . ./scripts/alias.sh
#
# # ---------------------------------------------------------------------------------------------------- #
# #  ____   ___   ___ _____
# # | __ ) / _ \ / _ \_   _|
# # |  _ \| | | | | | || |
# # | |_) | |_| | |_| || |
# # |____/ \___/ \___/ |_|
#
# sudo ./scripts/boot.sh
#
# # ---------------------------------------------------------------------------------------------------- #
# # Hyperland
# # ---------------------------------------------------------------------------------------------------- #
#
print_message "33" "Do you want to install Hyperland?(y/n)"
read -r hyperland
if [ "$hyperland" = "y" ]; then
    print_message "33" "Installing Hyperland..."
    . ./scripts/hyprland_scripts/install.sh
else
    print_message "33" "Skipping Hyperland..."
fi

cat <<EOF

===========================================
        🎉 Installation Complete! 🎉
===========================================

🔄 Please reboot to apply all changes.

📝 Some important notes:
-------------------------------------------
✅ Your default shell is now: 🐚 zsh  
✅ Default editor: ✍️ Neovim  
✅ Default browser: 🌍 Firefox  
✅ Default terminal: 🖥️ Kitty  

⚡ Warp is available with the following commands:
   - 🔌 Connect: 1111  
   - 🔌 Disconnect: 2222  

🛠️ Neovim Configuration:
   - If you want to install or configure Neovim manually, run:  
     ⚠️ 'sudo rm -rf ~/.config/nvim'  

🚀 Additional Services:
   - If you installed **TLP, Postfix, Cloudflare**, they are now enabled.  
   - Try searching for them in your installed applications.  

🎯 Final Step:
   - Open **tmux** and press **'Ctrl + Shift + I'** to install plugins.

✨ Enjoy your optimized system! 🚀
===========================================
EOF
