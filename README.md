# Just Another Dotfiles Repository (2023 Update)

Welcome to just another dotfiles repository, though it's anything but ordinary. This repository is a testament to my journey in customizing and optimizing development environments. After several years working solely on MacOS and GNU/Linux, I have recently made my return to the Windows ecosystem. Thanks to the Windows Subsystem for Linux (WSL), I've found an unparalleled sense of satisfaction, as it allows me to tailor everything exactly to my needs and aesthetic preferences.

Housed in this repository are my carefully crafted dotfiles that contain an array of settings and configurations, streamlining the task of recreating my ideal workspace across MacOS, GNU/Linux, and WSL.

![image](https://github.com/jonmatum/dotfiles/assets/4975788/e06138aa-ceef-4250-b718-a8bca1485a88)

## Table of Contents

- [VSCode Terminal - GitHub Dark Like Theme](#github-dark-like-theme-for-vscode-terminal)
- [VSCode Terminal - GitHub Dark Dimmed Like Theme](#github-dark-dimmed-like-theme-for-vscode-terminal)
- [iTerm2 Configuration](#iterm2-configuration)
- [Handy Resources](#useful-links)

## VSCode Terminal - GitHub Dark Like Theme

Modify your terminal's colors in a way that suits your style! You can achieve this through the `workbench.colorCustomizations` setting in Visual Studio Code. Here are the steps to follow:

1. Navigate to user settings by pressing `Ctrl+,` or heading to `Preferences > Settings`.
2. Look for "workbench" and opt for "Edit in settings.json" under Color Customizations.
3. Adapt the following JSON configuration to match your preferred color palette:

```json
{
  "workbench.colorCustomizations": {
    "terminal.background": "#010409",
    "terminal.foreground": "#f4f4f4",
    "terminalCursor.background": "#f2cb1e",
    "terminalCursor.foreground": "#f2cb1e",
    "terminal.ansiBlack": "#000000",
    "terminal.ansiBlue": "#2384f4",
    "terminal.ansiBrightBlack": "#383838",
    "terminal.ansiBrightBlue": "#58a6ff",
    "terminal.ansiBrightCyan": "#99d1ee",
    "terminal.ansiBrightGreen": "#39d252",
    "terminal.ansiBrightMagenta": "#8957e5",
    "terminal.ansiBrightRed": "#f9291b",
    "terminal.ansiBrightWhite": "#ffffff",
    "terminal.ansiBrightYellow": "#f1e05a",
    "terminal.ansiCyan": "#99d1ee",
    "terminal.ansiGreen": "#39d252",
    "terminal.ansiMagenta": "#8957e5",
    "terminal.ansiRed": "#cd3131",
    "terminal.ansiWhite": "#f0f6fc",
    "terminal.ansiYellow": "#f1e05a"
  }
}
```

## VSCode Terminal - GitHub Dark Dimmed Like Theme

If the GitHub Dark Dimmed theme appeals to you for your VS Code terminal, consider implementing the following configuration:

```json
{
  "workbench.colorCustomizations": {
    "terminal.background": "#1c2128",
    "terminal.foreground": "#adbac7",
    "terminalCursor.background": "#f2cb1e",
    "terminalCursor.foreground": "#f2cb1e",
    "terminal.ansiBlack": "#000000",
    "terminal.ansiBlue": "#3572a5",
    "terminal.ansiBrightBlack": "#383838",
    "terminal.ansiBrightBlue": "#58a6ff",
    "terminal.ansiBrightCyan": "#99d1ee",
    "terminal.ansiBrightGreen": "#39d252",
    "terminal.ansiBrightMagenta": "#8957e5",
    "terminal.ansiBrightRed": "#f9291b",
    "terminal.ansiBrightWhite": "#ffffff",
    "terminal.ansiBrightYellow": "#f1e05a",
    "terminal.ansiCyan": "#85d7da",
    "terminal.ansiGreen": "#47824d",
    "terminal.ansiMagenta": "#563d7c",
    "terminal.ansiRed": "#9d3d3e",
    "terminal.ansiWhite": "#f0f6fc",
    "terminal.ansiYellow": "#f1e05a"
  }
}
```

## iTerm2 Configuration

To command iTerm2 to dispatch text at startup, incorporate the following command into your iTerm2 profile:

```
tmux new-session -d -s HappyHacking -n myWindow;tmux attach -t HappyHacking:myWindow
```

## Handy Resources

- [GitHub's Variety of .gitignore Templates](https://github.com/github/gitignore)
- [vim-github-dark](https://github.com/vv9k/vim-github-dark)

Feel free to dive into these dotfiles and tailor them to elevate your personal development environment. The possibilities are endless!

--
Happy Hacking and Pura Vida!
