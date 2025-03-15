source ./scripts/message.sh

print_message "33" "Installing dunst configuration"

# Copy content of dunst to .config/dunst/
mkdir -p ~/.config/dunst/
cp -r ./configs/dunst/* ~/.config/dunst/

print_message "34" "Dunst configuration installed"

# ------------------------------------------------------ #
