#!/usr/bin/env sh
# Copyright (c) 2019 Jonatan Mata

main()
{
  git clone https://github.com/robbyrussell/oh-my-zsh.git "${HOME}/.oh-my-zsh"
  git clone https://github.com/jonmatum/dotfiles.git "${HOME}/.dotfiles"
  
  cd "${HOME}/.oh-my-zsh/themes" || exit ${?}
  ln -s "${HOME}/.dotfiles/zsh/cobalt2.zsh-theme" .
  
  cd "${HOME}" || exit ${?}
  ln -s .dotfiles/zsh/zshrc .zshrc
  ln -s .dotfiles/tmux/tmux.conf .

  chsh -s "$(command -v zsh)"
}

main

exit ${?}
