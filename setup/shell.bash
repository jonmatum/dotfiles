#!/usr/bin/env bash
# Copyright (c) 2019 Jonatan Mata

EPOCH=$(date +%s)

function echo_msg()
{
  echo "- ${@:-}"
}

function echo_err()
{
  echo "ERROR: ${@:-Unable to configure dotfiles}"
}

function install_homebrew()
{
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

# TODO::Add OS support to install software using, brew or any linux package manager like apt or yum.
function main()
{
  cd ${HOME} || exit ${?}

  local b p s c f

  p='.dotfiles'

  if [[ -d "${p}" ]]; then
    b="${HOME}/.dotfiles_backup/${EPOCH}"
    mkdir -p "${b}"

    echo_msg "Backup of old .dotfiles at: ${b}."
    for i in .dotfiles .oh-my-zsh .vimrc .zshrc .tmux.conf;do
      if [[ -h "${i}" ]];then
        unlink "${i}"
      elif [[ -f "${i}" ]] || [[ -d "${i}" ]]; then
        mv "${i}" "${b}"
      fi
    done
  fi

  echo_msg "Install Powerline fonts."
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts || exit ${?}
  ./install.sh
  cd .. || exit ${?}
  rm -rf fonts

  echo_msg "Clone oh-my-zsh"
  git clone https://github.com/robbyrussell/oh-my-zsh.git "${HOME}/.oh-my-zsh"

  echo_msg "Clone jonmatum's dotfiles"
  git clone https://github.com/jonmatum/dotfiles.git "${HOME}/.dotfiles"

  echo_msg "Install zsh theme"
  cd "${HOME}/.oh-my-zsh/themes" || exit ${?}
  ln -s "${HOME}/.dotfiles/zsh/cobalt2.zsh-theme" .

  echo_msg "Link .dotfiles"
  cd "${HOME}" || exit ${?}
  
  for i in zshrc tmux vimrc;do
    if [[ -f "${p}/${i}/${i}.conf" ]]; then
      ln -s "${p}/${i}/${i}.conf" ".${i}.conf"
    elif [[ -f "${p}/${i}/${i}" ]]; then
      ln -s "${p}/${i}/${i}" ".${i}"
    else
      c=$(echo ${i}|tr -d rc)
      if [[ -f "${p}/${c}/${i}" ]];then
        ln -s "${p}/${c}/${i}" ".${i}"
      fi
    fi
  done

  f=iterm2_shell_integration
  echo_msg "link ${f}"

  for i in bash zsh;do
    x="${p}/iterm/${f}.${i}"
    if [[ -f "${x}" ]];then
      ln -fs "${x}" ".${f}.${i}" 
    fi
  done

  s="$(command -v zsh)"
  
  if [[ -f "${s}" ]];then
    echo_msg "Change user shell to zsh"
    chsh -s "${s}"
  fi
}

main

exit ${?}
