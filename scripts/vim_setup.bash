#!/usr/bin/env bash
# Copyright (c) 2019 Jonatan Mata

function main()
{
  local vimrc="https://raw.githubusercontent.com/jonmatum/dotfiles/master/vim/vimrc"
  curl ${vimrc} > "${HOME}/.vimrc"
  vi -c 'PlugInstall' +qall
}

main

exit ${?}
