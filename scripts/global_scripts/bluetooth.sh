source ./scripts/message.sh
print_message "33" "Setting up Bluetooth..."
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
# check if bluetooth is enabled, if not, notify user and move to next step
if ! systemctl is-active --quiet bluetooth; then
    print_message "31" "Bluetooth is not enabled. Please try again later."
fi
# If bluetooth setup is ok, then print message
print_message "32" "Bluetooth setup is complete."
