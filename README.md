# Just Another Dotfiles Repository (WIP...)

This is a new version of my dotfiles for 2022.

![alt text](https://github.com/jonmatum/dotfiles/blob/0931840be160caf763ffc6cb3a406d4f67d81521/screenshot.jpg?raw=true)

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

# iTerm2: Send text at start

```
tmux new-session -d -s HappyHacking -n myWindow;tmux attach -t HappyHacking:myWindow

https://github.com/github/gitignore
```
