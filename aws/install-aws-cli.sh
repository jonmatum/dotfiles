#!/bin/bash

# Function to print informational messages in cyan color
echo_msg() {
  local cyan='\033[0;36m'
  local reset='\033[0m'
  echo -e "${cyan}- ${1:-}${reset}"
}

# Function to print error messages in red color
echo_err() {
  local red='\033[0;31m'
  local reset='\033[0m'
  echo -e "${red}ERROR: ${1:-}${reset}"
}

# Function to check if AWS CLI is installed
is_aws_cli_installed() {
    if command -v aws >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Function to update SSL certificates
update_ssl_certificates() {
    echo_msg "Updating SSL certificates..."
    sudo update-ca-certificates --fresh
    echo_msg "SSL certificates updated successfully!"
}

# Function to install AWS CLI
install_aws_cli() {
    echo_msg "Installing AWS CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli
    rm -rf awscliv2.zip aws
    echo_msg "AWS CLI installed successfully!"
}

# Function to update AWS CLI
update_aws_cli() {
    echo_msg "Updating AWS CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
    rm -rf awscliv2.zip aws
    latest_version=$(aws --version | awk '{print $1}' | cut -d '/' -f2)
    echo_msg "AWS CLI updated successfully to version $latest_version!"
}

# Main script
if is_aws_cli_installed; then
    current_version=$(aws --version | awk '{print $1}' | cut -d '/' -f2)
    echo_msg "AWS CLI is already installed (current version: $current_version)."
    read -p "Do you want to update AWS CLI? (y/n): " update_choice

    if [ "$update_choice" == "y" ]; then
        update_ssl_certificates
        update_aws_cli
    else
        echo_msg "Skipping AWS CLI update."
    fi
else
    update_ssl_certificates
    install_aws_cli
fi

