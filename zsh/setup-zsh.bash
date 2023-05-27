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

    install_package git
    install_package zsh
    install_package python3
    install_package pip3
    install_package virtualenv
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

# Function clone_repository clones a Git repository from a specified URL to a specified location.
# If the destination already exists, it creates a backup before cloning.
function clone_repository() {
    REPO_URL=$1
    DESTINATION=$2
    BACKUP_DESTINATION="${DESTINATION}_backup_$(date +%Y%m%d%H%M%S)"

    if [ -d "$DESTINATION" ]; then
        echo_msg "Destination $DESTINATION already exists, moving to backup location $BACKUP_DESTINATION"
        mv "$DESTINATION" "$BACKUP_DESTINATION"
    fi

    if git clone "$REPO_URL" "$DESTINATION"; then
        echo_msg "Successfully cloned repository from $REPO_URL to $DESTINATION"
    else
        echo_err "Failed to clone repository from $REPO_URL"
        exit 1
    fi
}

# This function downloads a file from a specified URL and backs it up.
# Args:
#   $1: The URL of the file to download.
#   $2: The location where the file should be saved.
#   $3: The location where the backup should be stored.
function configure_file() {
    FILE_URL=$1
    FILE_LOCATION=$2
    BACKUP_LOCATION=$3
    FILENAME=$(basename "${FILE_URL}")

    install_prerequisites
    create_backup_location
    backup_existing_file
    download_file
}

# This function installs Powerline fonts by cloning the repository
# and running the installation script.
function install_fonts() {
    echo_msg "Installing Powerline fonts"
    clone_repository "https://github.com/powerline/fonts.git" "fonts"
    (cd fonts && ./install.sh)
    rm -rf fonts
}

# This function configures zsh by cloning oh-my-zsh and installing
# zsh-autosuggestions and zsh-syntax-highlighting plugins.
function configure_zsh() {
    echo_msg "Cloning oh-my-zsh"
    clone_repository "https://github.com/robbyrussell/oh-my-zsh.git" "${HOME}/.oh-my-zsh"

    echo_msg "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
    echo_msg "zsh-autosuggestions installation complete."

    echo_msg "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
    echo_msg "zsh-syntax-highlighting installation complete."
}

# This function sets up a Python virtual environment and activates it.
# It then tries to download a requirements.txt file from a specified URL,
# and if successful, installs the Python packages listed in the file.
function configure_python() {
    echo_msg "Setting up Python virtual environment..."
    python3 -m virtualenv "${HOME}/venv"
    echo_msg "Python virtual environment set up at: ${HOME}/venv"

    echo_msg "Activating Python virtual environment..."
    source "${HOME}/venv/bin/activate"
    echo_msg "Python virtual environment activated"

    # URL of the requirements.txt file on GitHub
    requirements_url="https://raw.githubusercontent.com/jonmatum/dotfiles/main/python/requirements.txt"

    # Temporary file to hold the downloaded requirements.txt
    requirements_file="$(mktemp)"

    # Try to download the requirements.txt file
    if curl -fsSL "$requirements_url" -o "$requirements_file"; then
        # If download succeeds, install Python packages from requirements.txt
        echo_msg "Installing Python packages from requirements.txt..."
        pip install -r "$requirements_file"
        echo_msg "Python packages installed successfully!"
        # Cleanup: remove the temporary requirements.txt file
        rm "$requirements_file"
    else
        # If download fails, print error and exit
        echo_err "No requirements.txt file found at ${requirements_url}. Please check the URL and re-run the script."
        exit 1
    fi
}

# This function checks if the user's shell is zsh, and if not, tries to change it to zsh.
function configure_shell() {
    # Change user shell to zsh if it's not already set
    if [[ "${SHELL}" != *"zsh"* ]]; then
        if command -v zsh >/dev/null 2>&1; then
            echo_msg "Changing user shell to zsh"
            chsh -s "$(command -v zsh)" || true
            echo_msg "User shell changed to zsh"
        else
            echo_err "Zsh is not installed. Please install zsh and re-run the script."
            exit 1
        fi
    fi
}

# Function to download and install a zsh theme from a GitHub repository
function install_zsh_theme() {
    local THEME_URL=$1
    local THEME_NAME=$(basename "${THEME_URL}")
    local THEMES_DIR="${HOME}/.oh-my-zsh/themes/"
    local TARGET="${THEMES_DIR}/${THEME_NAME}"

    # Check if oh-my-zsh themes directory exists
    if [ ! -d "${THEMES_DIR}" ]; then
        echo_err "oh-my-zsh themes directory does not exist. Please check your oh-my-zsh installation."
        exit 1
    fi

    # Download theme file
    echo_msg "Downloading zsh theme from ${THEME_URL}..."
    if ! curl -L "${THEME_URL}" -o "${TARGET}"; then
        echo_err "Error downloading zsh theme from ${THEME_URL}"
        exit 1
    else
        echo_msg "Successfully downloaded zsh theme to ${TARGET}"
    fi

    # Install theme
    echo_msg "Installing zsh theme..."
    ln -sf "${TARGET}" "${THEMES_DIR}"
    echo_msg "Zsh theme installed"
}

configure_file "https://raw.githubusercontent.com/jonmatum/dotfiles/main/zsh/.zshrc" "${HOME}" "${HOME}/.dotfiles_backups"
install_fonts
configure_zsh
install_zsh_theme "https://raw.githubusercontent.com/jonmatum/dotfiles/main/zsh/me.zsh-theme"
configure_python
configure_shell
