#!/usr/bin/env bash
# dotfiles installation script
# Author: Jonatan Mata
# Date: 2023-05-27

# Setting bash strict mode - exit script if any command fails (returns non-true exit status), any variable is not set and prevent piped commands to hide an error.
set -euo pipefail

# Function to print informational messages in cyan color
function echo_msg() {
    local cyan='\033[0;36m'
    local reset='\033[0m'
    echo -e "${cyan}- ${1:-}${reset}"
}

# Function to print error messages in red color
function echo_err() {
    local red='\033[0;31m'
    local reset='\033[0m'
    echo -e "${red}ERROR: ${1:-Unable to configure dotfiles}${reset}"
}

# Function to install necessary packages
function install_prerequisites() {
    OS=$(uname)

    install_package() {
        local package=$1
        if ! command -v "$package" &>/dev/null; then
            echo_msg "Installing $package..."

            # Check if the user has sudo privileges
            if sudo -v >/dev/null 2>&1; then
                # The user has sudo privileges, proceed with installation
                if [ "$OS" == "Darwin" ]; then
                    brew install "$package" || {
                        echo_err "Failed to install $package. Please check your network connection and package manager setup."
                        exit 1
                    }
                elif [ "$OS" == "Linux" ]; then
                    if [ -f /etc/debian_version ]; then
                        sudo apt-get install -y "$package" || {
                            echo_err "Failed to install $package. Please check your network connection and package manager setup."
                            exit 1
                        }
                    elif [ -f /etc/redhat-release ]; then
                        sudo yum install -y "$package" || {
                            echo_err "Failed to install $package. Please check your network connection and package manager setup."
                            exit 1
                        }
                    fi
                else
                    echo_err "$OS is not supported"
                    exit 1
                fi
            else
                # The user doesn't have sudo privileges, print a warning message
                echo_msg "User does not have sudo privileges. Skipping installation of $package. Only configuration files will be deployed."
            fi
        else
            echo_msg "$package is already installed"
        fi
    }

    # Check if curl is installed, install if not
    install_package curl

    # Add more prerequisite installations as needed
    # For example:
    # install_package git

    install_package tmux
}

# Function to create backup location if it does not exist
function create_backup_location() {
    if [ ! -d "${BACKUP_LOCATION}" ]; then
        mkdir -p "${BACKUP_LOCATION}" || {
            echo_err "Error creating directory ${BACKUP_LOCATION}"
            exit 1
        }
    else
        echo_msg "Backup location ${BACKUP_LOCATION} already exists"
    fi
}

# Function to backup the existing file if it exists in the destination directory
function backup_existing_file() {
    if [ -f "${FILE_LOCATION}/${FILENAME}" ]; then
        echo_msg "File ${FILE_LOCATION}/${FILENAME} already exists, creating a backup..."
        mv "${FILE_LOCATION}/${FILENAME}" "${BACKUP_LOCATION}/$(date +%s)_${FILENAME}" || {
            echo_err "Error moving file to backup"
            exit 1
        }
    else
        echo_msg "File ${FILE_LOCATION}/${FILENAME} does not exist yet"
    fi
}

# Function to download the file from the given URL to the destination directory
function download_file() {
    echo_msg "Downloading ${FILE_URL}..."
    if ! curl -L "${FILE_URL}" -o "${FILE_LOCATION}/${FILENAME}"; then
        echo_err "Error downloading file"
        exit 1
    else
        echo_msg "Successfully downloaded file to ${FILE_LOCATION}/${FILENAME}"
    fi
}

# Start by installing any prerequisites
install_prerequisites

# Define the URL of the file you want to download
FILE_URL="https://raw.githubusercontent.com/jonmatum/dotfiles/main/zsh/.zshrc"

# Define the location where the downloaded file should be stored
FILE_LOCATION="${HOME}"

# Define the location for the backup files
BACKUP_LOCATION="${HOME}/.dotfiles_backups"

# Define the filename from the URL
FILENAME=$(basename "${FILE_URL}")

# Create the backup location if it doesn't exist
create_backup_location

# If the file to be downloaded already exists at the destination, backup the existing file
backup_existing_file

# Download the file
download_file
