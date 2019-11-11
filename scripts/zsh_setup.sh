#!/usr/bin/env sh
# Copyright (c) 2019 Jonatan Mata

main()
{
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

main

exit ${?}
