#!/usr/bin/env sh
# Copyright (c) 2019 Jonatan Mata

main()
{
  git clone https://github.com/robbyrussell/oh-my-zsh.git "${HOME}/.oh-my-zsh"

  chsh -s $(which zsh)
}

main

exit ${?}
