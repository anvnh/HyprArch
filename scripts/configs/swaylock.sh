source ./scripts/message.sh

print_message "33" "Installing swaylock configuration"

# Copy the configuration file
print_message "34" "Copying swaylock configuration file..."
cp -r ./configs/swaylock ~/.config/

print_message "35" "Swaylock configuration installed"

