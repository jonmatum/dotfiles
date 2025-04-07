# ZSH Configuration file

# This configuration file enhances your shell experience using Oh-My-Zsh and various plugins.
# Customize the file as needed to match your preferences and system setup.

# Prerequisites:
# - Oh-My-Zsh: Install it from the official Oh-My-Zsh GitHub repository.
# - zsh-autosuggestions: Install it from the zsh-autosuggestions GitHub repository.
# - zsh-syntax-highlighting: Install it from the zsh-syntax-highlighting GitHub repository.
# - Neovim (optional): Install it on your system if you want to use the provided aliases for 'vi' and 'vim'.
# - Python virtual environment (optional): Set up a virtual environment if you want to activate it automatically.
# - Node Version Manager (NVM) (optional): Install NVM if you use it to manage Node.js versions.

# Environment variable configurations
# If you come from bash, you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:/opt/local/bin:/opt/local/sbin:$HOME/.local/bin:$HOME/bin

# Path to your oh-my-zsh installation.
 export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="me"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux)

# Load oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# Configure LESS colors for man pages
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode – bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow
export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan

# Enable colored output in ls command
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Load zsh-autosuggestions plugin
source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting plugin
source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable bash completion in zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# Activate Python virtual environment
test -d "$HOME/venv" && source "$HOME/venv/bin/activate"

# Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# TMP fix here.... Sorry :P
export PIP_CERT=${HOME}/ZscalerRootCertificate-2048-SHA256.crt
export AWS_CA_BUNDLE=${HOME}/ZscalerRootCertificate-2048-SHA256.crt
export NODE_EXTRA_CA_CERTS=${HOME}/ZscalerRootCertificate-2048-SHA256.crt
