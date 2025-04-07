# Dotfiles (2025 Edition)

[![GitHub release](https://img.shields.io/github/v/release/jonmatum/dotfiles)](https://github.com/jonmatum/dotfiles/releases)
[![Build - Makefile](https://img.shields.io/badge/build-makefile-ff69b4)]()
[![Platform - macOS/Linux/WSL](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-informational)]()
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

This is a clean, modular, and machine-aware dotfiles setup designed for modern developer workflows in 2025. It integrates shell, Git, Neovim, terminal, and theme configurations with a focus on productivity, consistency, and portability.

## Highlights

- Git identity switching (personal & work) with prompt integration
- Fully Lua-configured Neovim with Lazy.nvim
- Modern terminal styling with iTerm2 and Nerd Font support
- Zsh with Powerlevel10k, autosuggestions, and syntax highlighting
- VS Code, Vim, and iTerm2 themes all aligned visually
- Portable across macOS, Linux, WSL
- Makefile-based automation for reproducibility and setup

## Structure

```
~/dotfiles/
...[TBD]
```

## Features

### Git

- Uses `includeIf` rules to apply work vs. personal identities
- `git_identity` function displays context in prompt
- Signed commits via GPG, portable key handling
- `gstatus` CLI tool gives commit and working tree summary

### Zsh + Shell

- Oh My Zsh with Powerlevel10k prompt
- Smart Git segment with colored identity tags
- Aliases for common Git commands (`gc`, `gp`, `fix`, etc.)
- Autosuggestions, syntax highlighting, completions

### Neovim (Lua)

- `lazy.nvim` plugin manager
- GitHub Dark Default theme with Lualine sync
- Telescope, Treesitter, LSP, nvim-cmp, LuaSnip
- Modular config split into `core/`, `lsp/`, `completion/`, `git/`, `extras/`
- Auto-detection of OS clipboard and settings

### Terminal

- iTerm2 with `TBD.itermcolors`
- Nerd Fonts (JetBrainsMono, MesloLGS)
- Matching prompt colors, font sizes, and cursor styling

### VS Code

- Theme: TBD
- Terminal font and colors synced with iTerm2
- `settings.json` snippets to apply full UI alignment

## Requirements

- macOS, Linux, or WSL
- Homebrew or equivalent package manager
- iTerm2 (for full terminal styling)
- Neovim 0.9+
- Zsh + Oh My Zsh
- Git, GPG

## Getting Started

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
make setup           # Run bootstrap scripts and install tools
make nvim            # Install Neovim plugins and Lua config
```

## Customization

- Adjust `~/.gitconfig`, `~/.gitconfig-work`, `~/.gitconfig-personal` for identities
- Use `~/.p10k.zsh` to tweak prompt look
- Update `nvim/lua/core/plugins.lua` to add/remove plugins
- Use `setup-nvim-structure.sh` to scaffold clean Lua layout
- Edit `Makefile` to extend automated tasks

## License

MIT © 2025 Jonatan Mata
