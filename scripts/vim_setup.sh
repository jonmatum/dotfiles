#!/usr/bin/env sh
# Copyright (c) 2019 Jonatan Mata

main()
{
  vimrc="https://raw.githubusercontent.com/jonmatum/dotfiles/master/vim/vimrc"
  curl -fsSL "${vimrc}" > "${HOME}/.vimrc"
  vi -c 'PlugInstall' +qall
}

main

exit ${?}
