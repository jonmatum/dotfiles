#!/usr/bin/env sh
# Copyright (c) 2019 Jonatan Mata

main()
{
  cd "${HOME}" || exit ${?}

  if [ -f '.dotfiles/vim/vimrc' ]; then
    rm '.vimrc' && ln -s '.dotfiles/vim/vimrc' '.vimrc'
  else
    vimrc='https://raw.githubusercontent.com/jonmatum/dotfiles/master/vim/vimrc'
    curl -fsSL "${vimrc}" > '.vimrc'
  fi

  vi -c 'PlugInstall' +qall
}

main

exit ${?}
