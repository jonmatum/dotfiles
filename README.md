# Dotfiles Repository

This repository contains my custom dotfiles for configuring my development environment on macOS, Linux, and Windows Subsystem for Linux (WSL). These dotfiles include various configurations and settings that help me reproduce my preferred setup quickly and easily.

![Terminal Screenshot](https://github.com/jonmatum/dotfiles/blob/0931840be160caf763ffc6cb3a406d4f67d81521/screenshot.jpg?raw=true)

## Table of Contents
- [Terminal Theme Color](#terminal-theme-color)
- [GitHub Dark Dimmed Theme for VSCode Terminal](#github-dark-dimmed-theme-for-vscode-terminal)
- [iTerm2 Configuration](#iterm2-configuration)
- [Useful Links](#useful-links)

## Terminal Theme Color

To customize the colors of your terminal, you can modify the `workbench.colorCustomizations` setting in Visual Studio Code. Follow these steps:

1. Open user settings by pressing `Ctrl+,` (or go to `Preferences > Settings`).
2. Search for "workbench" and select "Edit in settings.json" under Color Customizations.
3. Add or modify the following JSON configuration with your preferred color values:

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

## GitHub Dark Dimmed Theme for VSCode Terminal

If you prefer the GitHub Dark Dimmed theme for your VS Code terminal, you can use the following configuration:

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

To configure iTerm2 to send text at startup, add the following command to your iTerm2 profile:

```
tmux new-session -d -s HappyHacking -n myWindow;tmux attach -t HappyHacking:myWindow
```

## Useful Links

- [GitHub's Collection of .gitignore Templates](https://github.com/github/gitignore)

Feel free to explore and use these dotfiles to enhance your own development environment. 

--
Happy hacking and Pura Vida!






















# Dotfiles Repository

Welcome to my dotfiles repository! This repository contains my custom dotfiles that I use to configure my development environment on macOS, Linux, and Windows Subsystem for Linux (WSL). Feel free to explore and use them to reproduce my configuration or as a reference for your own setup.

![alt text](https://github.com/jonmatum/dotfiles/blob/0931840be160caf763ffc6cb3a406d4f67d81521/screenshot.jpg?raw=true)

## Table of Contents

- [Terminal Theme Color](#terminal-theme-color)
- [Visual Studio Code Color Theme](#visual-studio-code-color-theme)
- [GitHub Dark Dimmed Theme for VS Code Terminal](#github-dark-dimmed-theme-for-vs-code-terminal)
- [iTerm2 Setup](#iterm2-setup)
- [Useful Links](#useful-links)

## Terminal Theme Color

To customize the colors of your terminal, you can modify the `workbench.colorCustomizations` setting in Visual Studio Code. Follow these steps:

1. Open user settings by pressing `Ctrl+,` (or go to `Preferences > Settings`).
2. Search for "workbench" and select "Edit in settings.json" under Color Customizations.
3. Add or modify the following JSON configuration with your preferred color values:

```json
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
```

## Visual Studio Code Color Theme

If you're using Visual Studio Code, you can also customize the color theme for the editor itself. You can find numerous color themes on the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/VSCode).

## GitHub Dark Dimmed Theme for VS Code Terminal

If you prefer the GitHub Dark Dimmed theme for your VS Code terminal, you can use the following configuration:

```json
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
    "terminal.ansi



--
Happy Hacking and Pura Vida!



# Just Another Dotfiles Repository (WIP....)

This is a new version of my dotfiles for 2022.



--
Happy Hacking and Pura Vida!


# Terminal Theme Color

You can customize your active Visual Studio Code color theme with the workbench.colorCustomizations user setting.

1. Open user settings (Ctrl+,)
2. Search for workbench and select Edit in settings.json under Color Customizations

```json
{
    "workbench.colorCustomizations": {
        "terminal.background":"#010409",
        "terminal.foreground":"#f4f4f4",
        "terminalCursor.background":"#f2cb1e",
        "terminalCursor.foreground":"#f2cb1e",
        "terminal.ansiBlack":"#000000",
        "terminal.ansiBlue":"#2384f4",
        "terminal.ansiBrightBlack":"#383838",
        "terminal.ansiBrightBlue":"#58a6ff",
        "terminal.ansiBrightCyan":"#99d1ee",
        "terminal.ansiBrightGreen":"#39d252",
        "terminal.ansiBrightMagenta":"#8957e5",
        "terminal.ansiBrightRed":"#f9291b",
        "terminal.ansiBrightWhite":"#ffffff",
        "terminal.ansiBrightYellow":"#f1e05a",
        "terminal.ansiCyan":"#99d1ee",
        "terminal.ansiGreen":"#39d252",
        "terminal.ansiMagenta":"#8957e5",
        "terminal.ansiRed":"#cd3131",
        "terminal.ansiWhite":"#f0f6fc",
        "terminal.ansiYellow":"#f1e05a"
    }
}
```

