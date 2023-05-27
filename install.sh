#!/usr/bin/env bash
# dotfiles installation script
# Author: Jonatan Mata
# Date: 2023-05-26

# Just Another Dotfiles Repository - Installation Script

## set -euo pipefail

# Function to print informational messages in cyan color and redirect to log
function echo_msg() {
    local cyan='\033[0;36m'
    local reset='\033[0m'
    echo -e "${cyan}- ${1:-}${reset}"
}

# Function to confirm user's choice
function confirm() {
    if [[ -t 0 ]]; then
        local response
        read -r -p "$1 [y/N]: " response
        case "$response" in
        [yY][eE][sS] | [yY])
            return 0
            ;;
        *)
            return 1
            ;;
        esac
    else
        # Non-interactive mode, return true by default
        return 0
    fi
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

    # Prompt user for confirmation
    if confirm "Do you want to run $script_name?"; then
        # Execute the script
        echo_msg "Running $script_name..."
        "$script_path" >/tmp/${script_name}-$(date +%s).log 2>&1
    else
        echo_msg "Skipping $script_name..."
    fi

    # Remove the script
    rm "$script_path"
}

# Execute additional scripts
execute_script "https://raw.githubusercontent.com/jonmatum/dotfiles/main/setup/shell.bash"
execute_script "https://raw.githubusercontent.com/jonmatum/dotfiles/main/aws/install-aws-cli.sh"

# Print completion message
echo_msg "Installation completed successfully!"
