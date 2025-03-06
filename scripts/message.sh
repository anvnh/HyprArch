# Function to print colorful messages
print_message() {
    local color=$1
    local message=$2
    echo -e "\e[${color}m${message}\e[0m"
}

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}
