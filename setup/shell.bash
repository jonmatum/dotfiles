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

# Function to clone a repository
function clone_repository() {
  local repository_url=$1
  local destination=$2

  git clone --depth=1 "${repository_url}" "${destination}"
}

# Main function
function main() {
  local dotfiles_dir="${HOME}/.dotfiles"
  local backup_dir="${HOME}/.dotfiles_backup/${EPOCH}"
  local shell=$(basename "${SHELL}")

  # Backup existing dotfiles
  if [[ -d "${dotfiles_dir}" ]]; then
    echo_msg "Backing up existing dotfiles to: ${backup_dir}"
    mkdir -p "${backup_dir}"

    for file in .dotfiles .oh-my-zsh .vimrc .zshrc .zshenv .tmux.conf; do
      if [[ -h "${HOME}/${file}" ]]; then
        unlink "${HOME}/${file}"
      elif [[ -f "${HOME}/${file}" ]] || [[ -d "${HOME}/${file}" ]]; then
        mv "${HOME}/${file}" "${backup_dir}"
      fi
    done
  fi

  # Install Powerline fonts
  echo_msg "Installing Powerline fonts"
  clone_repository "https://github.com/powerline/fonts.git" "fonts"
  (cd fonts && ./install.sh)
  rm -rf fonts

  # Clone oh-my-zsh
  echo_msg "Cloning oh-my-zsh"
  clone_repository "https://github.com/robbyrussell/oh-my-zsh.git" "${HOME}/.oh-my-zsh"

  # Clone dotfiles repository
  echo_msg "Cloning dotfiles repository"
  clone_repository "https://github.com/jonmatum/dotfiles.git" "${dotfiles_dir}"

  # Install zsh theme
  echo_msg "Installing zsh theme"
  ln -s "${dotfiles_dir}/zsh/cobalt2.zsh-theme" "${HOME}/.oh-my-zsh/themes/"

  # Link dotfiles
  echo_msg "Linking dotfiles"
  for file in zshrc tmux vimrc; do
    if [[ -f "${dotfiles_dir}/${file}/${file}.conf" ]]; then
      ln -s "${dotfiles_dir}/${file}/${file}.conf" "${HOME}/.${file}"
    elif [[ -f "${dotfiles_dir}/${file}/${file}" ]]; then
      ln -s "${dotfiles_dir}/${file}/${file}" "${HOME}/.${file}"
    else
      local file_without_rc="${file%rc}"
      if [[ -f "${dotfiles_dir}/${file_without_rc}/${file}" ]]; then
        ln -s "${dotfiles_dir}/${file_without_rc}/${file}" "${HOME}/.${file}"
      fi
    fi
  done

  # Initialize local helpers
  local helpers_dir="${dotfiles_dir}/helpers"
  local local_helpers_dir="${dotfiles_dir}/.dotfiles_helpers"

  echo_msg "Initializing local helpers"
  if [[ ! -d "${local_helpers_dir}" ]]; then
    mkdir -p "${local_helpers_dir}"
    for dir in scripts aliases git miscellaneous; do
      cp -r "${helpers_dir}/${dir}" "${local_helpers_dir}"
    done
  fi

  # Change user shell to zsh if it's not already set
  if [[ "${shell}" != "zsh" ]]; then
    if command -v zsh >/dev/null 2>&1; then
      echo_msg "Changing user shell to zsh"
      chsh -s "$(command -v zsh)"
    else
      echo_err "Zsh is not installed. Please install zsh and re-run the script."
      exit 1
    fi
  fi

  echo_msg "Dotfiles installation completed successfully!"
}

# Execute the main function
main

exit $?
