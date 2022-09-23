#!/usr/bin/env bash
# Copyright (c) 2019 Jonatan Mata

main()
{
  cd "${HOME}" || exit ${?}

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  if [ -f .vimrc ]; then
    rm -rf .vimrc
  fi

  if [ -f '.dotfiles/vim/vimrc' ]; then
    git pull
    ln -s '.dotfiles/vim/vimrc' '.vimrc'
  else
    vimrc='https://raw.githubusercontent.com/jonmatum/dotfiles/master/vim/vimrc'
    curl -fsSL "${vimrc}" > '.vimrc'
  fi

  vi -c 'PlugInstall' +qall
}

main

exit ${?}
