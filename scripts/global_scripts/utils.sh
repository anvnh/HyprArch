source ./scripts/message.sh
#  _   _                 _           
# | \ | | ___  _____   _(_)_ __ ___  
# |  \| |/ _ \/ _ \ \ / / | '_ ` _ \ 
# | |\  |  __/ (_) \ V /| | | | | | |
# |_| \_|\___|\___/ \_/ |_|_| |_| |_|
print_message "33" "Installing neovim config..."
sudo rm -rf ~/.config/nvim && git clone https://github.com/anvnh/neovim-config.git -o origin ~/.config/nvim

# __     ___      _               _ ____            
# \ \   / (_)_ __| |_ _   _  __ _| | __ )  _____  __
#  \ \ / /| | '__| __| | | |/ _` | |  _ \ / _ \ \/ /
#   \ V / | | |  | |_| |_| | (_| | | |_) | (_) >  < 
#    \_/  |_|_|   \__|\__,_|\__,_|_|____/ \___/_/\_\
read -p "Do you want to install Virtual Box ? (y/n) " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    print_message "33" "Installing Virtual Box..."
    sudo pacman -S linux-zen-headers --noconfirm
    # unloading kvm modules because of conflict with virtualbox
    #remove kvm
    sudo rmmod kvm
    sudo rmmod kvm_amd
    sudo pacman -S virtualbox virtualbox-host-dkms --noconfirm
fi

# _____ _     ____  
# |_   _| |   |  _ \ 
#   | | | |   | |_) |
#   | | | |___|  __/ 
#   |_| |_____|_|   
read -p "Do you want to install TLP(Thermal Power Management)? (y/n) " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    print_message "33" "Installing TLP..."
    sudo pacman -S --needed --noconfirm tlp 
    yay -S --needed --noconfirm tlpui
    sudo systemctl enable tlp.service
    sudo systemctl start tlp.service
fi

# ____   ___  ____ _____ ___ _   _  ____ 
# |  _ \ / _ \/ ___|_   _|_ _| \ | |/ ___|
# | |_) | | | \___ \ | |  | ||  \| | |  _ 
# |  __/| |_| |___) || |  | || |\  | |_| |
# |_|    \___/|____/ |_| |___|_| \_|\____|
read -p "Do you want to install Posting? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    print_message "33" "Installing Posting..."
    curl -sSf https://rye.astral.sh/get | bash
    source "$HOME/.rye/env"
    rye install posting
fi

#  ____ _                 _  __ _                
#  / ___| | ___  _   _  __| |/ _| | __ _ _ __ ___ 
# | |   | |/ _ \| | | |/ _` | |_| |/ _` | '__/ _ \
# | |___| | (_) | |_| | (_| |  _| | (_| | | |  __/
#  \____|_|\___/ \__,_|\__,_|_| |_|\__,_|_|  \___|
read -p "Do you want to install warp? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    print_message "33" "Installing warp..."
    yay -S --noconfirm cloudflare-warp-bin
    sudo systemctl start warp-svc
    sudo systemctl enable warp-svc
    sleep 3
    warp-cli registration new
fi

#  _____        _ 
# |__  /___  __| |
#   / // _ \/ _` |
#  / /|  __/ (_| |
# /____\___|\__,_|
read -p "Do you want to install Zed editor? (y/n)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    print_message "33" "Installing Zed"
    # install zed editor with curl 
    print_message "33" "Installing zed editor..."
    curl -f https://zed.dev/install.sh | sh
    # Run zed from terminal
    echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zshrc
    source ~/.zshrc
fi


