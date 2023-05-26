#!/bin/bash

# Script to install prerequisites for the configuration file

# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh-My-Zsh installation complete."

# Install zsh-autosuggestions plugin
echo "Installing zsh-autosuggestions plugin..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
echo "zsh-autosuggestions installation complete."

# Install zsh-syntax-highlighting plugin
echo "Installing zsh-syntax-highlighting plugin..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
echo "zsh-syntax-highlighting installation complete."

# Install Neovim (optional)
read -p "Do you want to install Neovim? (y/n): " install_neovim
if [[ $install_neovim == "y" || $install_neovim == "Y" ]]; then
    echo "Installing Neovim..."
    # Add installation steps for your specific operating system/package manager
    echo "Neovim installation complete."
fi

# Install Python virtual environment (optional)
read -p "Do you want to set up a Python virtual environment? (y/n): " setup_virtualenv
if [[ $setup_virtualenv == "y" || $setup_virtualenv == "Y" ]]; then
    echo "Setting up Python virtual environment..."
    # Add steps to set up your Python virtual environment
    echo "Python virtual environment setup complete."
fi

# Install Node Version Manager (NVM) (optional)
read -p "Do you want to install Node Version Manager (NVM)? (y/n): " install_nvm
if [[ $install_nvm == "y" || $install_nvm == "Y" ]]; then
    echo "Installing Node Version Manager (NVM)..."
    # Add installation steps for NVM
    echo "Node Version Manager (NVM) installation complete."
fi

echo "Prerequisite installation complete."
