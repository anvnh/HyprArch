source ./scripts/message.sh

print_message "33" "Installing rofi configuration"

# Copy the configuration file
print_message "34" "Copying rofi configuration file..."
cp -r ./config/rofi ~/.config/

print_message "35" "Rofi configuration installed"
# ------------------------------------------------------ #
