# README - Dotfiles Installation Script

## Description

This script automates the process of setting up a development environment by installing and configuring various dotfiles. It takes care of installing Powerline fonts, Oh-My-Zsh, Python, pip, virtualenv, and some handy Zsh plugins. It also creates symbolic links for your dotfiles and sets your default shell to Zsh, if it isn't already.

## Requirements

* Bash Shell
* Git
* Python3 and pip3 (Script will attempt to install these if not already installed)

## How to Use

### Steps

1. First, make sure the script is executable. If not, run the following command:

```bash
chmod +x dotfiles_installation_script.sh
```

2. To run the script, use the command:

```bash
./dotfiles_installation_script.sh
```

The script will automatically:

* Backup any existing dotfiles in your home directory.
* Clone necessary repositories (including oh-my-zsh and dotfiles).
* Install Powerline fonts.
* Setup and configure Zsh with oh-my-zsh.
* Install and configure Python and its environment (pip3, virtualenv, and any requirements specified in a `requirements.txt` file).
* Create symbolic links for your configuration files (dotfiles).
* Initialize local helper scripts and directories.
* Change the default shell to Zsh if it isn't already.

### Output

The script logs all its output to `dotfiles_installation.log` in the same directory. You can use this log file to debug any issues that might occur during the script execution.

## Caution

Please read and understand the script before running it. It will replace certain configuration files in your home directory. While it does backup existing files, it is recommended to manually backup any important configuration files before proceeding.

## Contribution

Feel free to fork the script and make any changes or additions you deem necessary. Contributions are always welcome!

## Author

[Jonatan Mata](https://github.com/jonmatum)

## License

This script is licensed under the [MIT License](https://opensource.org/licenses/MIT).

