#!/usr/bin/env bash
# dotfiles installation script
# Author: Jonatan Mata
# Date: 2023-05-26

# Just Another Dotfiles Repository - Installation Script

set -euo pipefail

# Function to print informational messages in cyan color and redirect to log
function echo_msg() {
    local cyan='\033[0;36m'
    local reset='\033[0m'
    echo -e "${cyan}- ${1:-}${reset}" | tee -a "$log_file"
}

# Function to download and execute scripts
function execute_script() {
    local script_url=$1
    local script_name=${script_url##*/}
    local script_path="/tmp/$script_name"

    # Download the script
    echo_msg "Downloading $script_name..."
    curl -sSL -o "$script_path" "$script_url"

    # Make the script executable
    chmod +x "$script_path"

    # Execute the script
    echo_msg "Running $script_name..."
    "$script_path"

    # Remove the script
    rm "$script_path"
}

# Execute additional scripts
execute_script "https://raw.githubusercontent.com/jonmatum/dotfiles/main/setup/shell.bash"

# Print completion message
echo_msg "Installation completed successfully!"
