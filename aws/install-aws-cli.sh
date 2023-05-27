#!/bin/bash

# Function to check if AWS CLI is installed
is_aws_cli_installed() {
    if command -v aws >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Function to get the latest version of AWS CLI
get_latest_aws_cli_version() {
    awscli_latest_version=$(curl -sL "https://github.com/aws/aws-cli/releases/latest" | grep -oE "v[0-9]+\.[0-9]+\.[0-9]+" | head -1 | cut -c 2-)
    echo "$awscli_latest_version"
}

# Function to update SSL certificates
update_ssl_certificates() {
    echo "Updating SSL certificates..."
    sudo update-ca-certificates --fresh
    echo "SSL certificates updated successfully!"
}

# Function to install AWS CLI
install_aws_cli() {
    echo "Installing AWS CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf awscliv2.zip aws
    echo "AWS CLI installed successfully!"
}

# Main script
if is_aws_cli_installed; then
    current_version=$(aws --version | awk '{print $1}' | cut -d '/' -f2)
    latest_version=$(get_latest_aws_cli_version)
    echo "AWS CLI is already installed (current version: $current_version)."

    if [ -n "$latest_version" ] && [ "$current_version" != "$latest_version" ]; then
        echo "A newer version of AWS CLI is available ($latest_version)."
        read -p "Do you want to update AWS CLI? (y/n): " update_choice

        if [ "$update_choice" == "y" ]; then
            update_ssl_certificates
            install_aws_cli
            echo "AWS CLI updated successfully to version $latest_version."
        else
            echo "Skipping AWS CLI update."
        fi
    else
        echo "AWS CLI is already up to date."
    fi
else
    if [ -d "/usr/local/aws-cli/v2/current" ]; then
        echo "Found preexisting AWS CLI installation: /usr/local/aws-cli/v2/current."
        echo "Please rerun the install script with the --update flag to update the installation."
    else
        update_ssl_certificates
        install_aws_cli
    fi
fi


