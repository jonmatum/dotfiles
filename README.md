# `@jonmatum/dotfiles`

### Just Another Dotfiles Repository

![version](https://img.shields.io/badge/version-2023-blue)
![license](https://img.shields.io/badge/license-MIT-green)

## Overview

Embark upon my dotfiles repository, a testament to my journey in customizing and optimizing development environments across macOS, GNU/Linux, and Windows ecosystems. Within these digital realms, discover an assembly of meticulously crafted settings and configurations designed to streamline the recreation of my ideal workspace.

![image](https://github.com/jonmatum/dotfiles/assets/4975788/e06138aa-ceef-4250-b718-a8bca1485a88)

## Repository Contents

1. **Dotfiles Installation Script:** This repository houses a script to automate the setup process of various tools and applications using configuration files, commonly known as dotfiles.

2. **Additional Configuration Scripts:** A series of scripts included to further enhance your development environment - such as Zsh shell configuration, Tmux terminal multiplexer, and AWS CLI setup.

## Getting Started

Follow these steps to clone and install this repository:

1. Clone the dotfiles repository to your local machine:

   ```
   git clone https://github.com/jonmatum/dotfiles.git
   ```

2. Navigate to the cloned repository directory:

   ```
   cd dotfiles
   ```

3. Customize the dotfiles:
   Take some time to explore and modify the dotfiles and configurations to match your preferences. Ensure to read any accompanying documentation or README files for specific instructions.

4. Run the Installation Script:
   The repository includes an installation script that automates the setup process. Run the script to apply the configurations and settings to your system:

   ```
   bash install.sh
   ```

5. Sit back and observe the progress:
   The installation script will display progress and informational messages in the terminal. It may also prompt for input or confirmation during the setup process.

6. Post-installation:
   A log file will be generated at `/tmp/dotfiles-installation-<timestamp>.log` upon completion, containing the details of the installation process. Review it to ensure successful installation.

7. Enjoy your personalized workspace:
   Explore your development environment set up according to the customized dotfiles.

> **Quick Install:** You can also install the dotfiles using a single command that fetches the install script directly from the repository. However, be aware that this will bypass user confirmations and install all scripts listed in the `execute_script` function by default. If you're comfortable with this, run:

```
curl https://raw.githubusercontent.com/jonmatum/dotfiles/main/install.sh | bash
```

> Note: The installation script downloads and executes additional scripts from the internet. Ensure to trust the sources before proceeding.

## Additional Configurations

The installation script includes the following additional scripts by default:

- [setup-zsh.bash](https://raw.githubusercontent.com/jonmatum/dotfiles/main/zsh/setup-zsh.bash): Sets up Zsh shell configuration.
- [setup-tmux.bash](https://raw.githubusercontent.com/jonmatum/dotfiles/main/tmux/setup-tmux.bash): Sets up Tmux terminal multiplexer.
- [setup-aws-cli.sh](https://raw.githubusercontent.com/jonmatum/dotfiles/main/aws/setup-aws-cli.sh): Sets up AWS CLI.

These can be customized via the `execute_script` function in the main installation script.

## License

MIT License.

---

Open to contributions and suggestions! Report issues or propose enhancements.

**Crafted with ❤️ by Jonatan Mata**.
