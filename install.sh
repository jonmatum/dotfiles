#!/usr/bin/env bash
# dotfiles installation script
# Author: Jonatan Mata
# Date: 2023-05-26

# Just Another Dotfiles Repository - Installation Script

set -euo pipefail

# Define log file path
log_file="/tmp/dotfiles-installation-$(date +%s).log"

# Function to print informational messages in cyan color and redirect to log
function echo_msg() {
    local cyan='\033[0;36m'
    local reset='\033[0m'
    echo -e "${cyan}- ${1:-}${reset}" | tee -a "$log_file"
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

    # Prompt user for confirmation
    if confirm "Do you want to run $script_name?"; then
        # Download the script
        echo_msg "Downloading $script_name..."

        curl -sSL -o "$script_path" "$script_url"

        # Make the script executable
        chmod +x "$script_path"

        # Execute the script
        echo_msg "Running $script_name..."
        "$script_path" >>"$log_file" 2>&1

        # Remove the script
        rm "$script_path"
    else
        echo_msg "Skipping $script_name..."
    fi
}

# Execute additional scripts
execute_script "https://raw.githubusercontent.com/jonmatum/dotfiles/main/zsh/setup-zsh.bash"
execute_script "https://raw.githubusercontent.com/jonmatum/dotfiles/main/tmux/setup-tmux.bash"
execute_script "https://raw.githubusercontent.com/jonmatum/dotfiles/main/aws/install-aws-cli.sh"

## TODO: Add vi(*) setup and git

# Print message to user with log file location
echo_msg "Script execution log is available at: $log_file"

# Print completion message
echo_msg "Installation completed successfully!"
