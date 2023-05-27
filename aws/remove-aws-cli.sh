#!/bin/bash

# Function to check if AWS CLI is installed
is_aws_cli_installed() {
    if command -v aws >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Function to uninstall AWS CLI
uninstall_aws_cli() {
    echo "Uninstalling AWS CLI..."
    sudo rm -rf /usr/local/aws-cli
    sudo rm /usr/local/bin/aws
    echo "AWS CLI uninstalled successfully!"
}

# Main script
if is_aws_cli_installed; then
    uninstall_aws_cli
else
    echo "AWS CLI is not installed."
fi
