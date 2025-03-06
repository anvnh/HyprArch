source ./scripts/message.sh

# Copy content of hydewall to .cache/hyde/
mkdir -p ~/.cache/hyde/
cp -r ./configs/hydewall/wall.blur ~/.cache/hyde/
cp -r ./configs/hydewall/wall.thmb ~/.cache/hyde/

