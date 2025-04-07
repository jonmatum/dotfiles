#!/usr/bin/env bash
# dotfiles installation script
# Author: Jonatan Mata
# Date: 2023-05-26

set -euo pipefail

# Function to print informational messages
function echo_msg() {
  echo "- ${1:-}"
}

# Function to print error messages
function echo_err() {
  echo "ERROR: ${1:-Unable to configure dotfiles}"
}

# Main function
function main() {
  cd "${HOME}" || exit $?

  # Install vim-plug
  echo_msg "Installing vim-plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Remove existing .vimrc if present
  if [[ -f ".vimrc" ]]; then
    echo_msg "Removing existing .vimrc"
    rm -f ".vimrc"
  fi

  # Link or download .vimrc
  if [[ -f ".dotfiles/vim/vimrc" ]]; then
    echo_msg "Updating dotfiles repository"
    git -C ".dotfiles" pull
    echo_msg "Linking .vimrc"
    ln -s ".dotfiles/vim/vimrc" ".vimrc"
  else
    vimrc_url="https://raw.githubusercontent.com/jonmatum/dotfiles/master/vim/vimrc"
    echo_msg "Downloading .vimrc"
    curl -fsSL "${vimrc_url}" >".vimrc"
  fi

  # Install plugins using vim-plug
  echo_msg "Installing vim plugins"
  vi -c 'PlugInstall' +qall
}

# Execute the main function
main

exit $?
