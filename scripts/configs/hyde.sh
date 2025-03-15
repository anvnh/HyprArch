source ./scripts/message.sh

print_message "33" "Copying hyde folder to .config/hyde"

# Copy content of hyde to .config/hyde/
cp -r ./configs/hyde ~/.config

# Create cache hyde folder to store wall.blur and wall.thmb
mkdir -p ~/.cache/hyde

print_message "34" "Finished copying hyde folder to .config/hyde"
