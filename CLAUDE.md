# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for setting up a macOS development environment. It contains configuration files and setup scripts for various development tools including Neovim, tmux, Zsh, and other command-line utilities.

## Key Setup Commands

### Initial Environment Setup

Run these setup scripts in order after cloning the repository:

```bash
~/.dotfiles/bin/set-up-homebrew     # Install Homebrew and packages from Brewfile
~/.dotfiles/bin/set-up-zshell        # Configure Zsh shell
~/.dotfiles/bin/set-up-rcup          # Link dotfiles using rcm
~/.dotfiles/bin/set-up-bat           # Configure bat (cat replacement)
~/.dotfiles/bin/set-up-fzf           # Configure fzf (fuzzy finder)
~/.dotfiles/bin/set-up-launchd       # Set up launchd services
~/.dotfiles/bin/set-up-mas           # Configure Mac App Store CLI
~/.dotfiles/bin/set-up-mise-en-place # Configure mise (runtime version manager)
~/.dotfiles/bin/set-up-neovim        # Install and configure Neovim with AstroNvim
~/.dotfiles/bin/set-up-tmux          # Configure tmux
```

### Development Tools Configuration

- **Runtime versions**: Managed by `mise` (configured in `config/mise/config.toml`)
- **Package installation**: Homebrew packages defined in `Brewfile`
- **Dotfile linking**: Uses `rcup` to symlink configuration files

### Neovim Setup

The Neovim configuration is based on AstroNvim v5 with extensive customization:

- **Base**: AstroNvim template with custom plugin configurations
- **Plugins**: Located in `config/nvim/lua/plugins/` - each plugin has its own config file
- **Mappings**: Modular system in `config/nvim/lua/mappings/` with 14+ specialized mapping modules (ai, buffers, comments, files, find, git, language-tools, search-replace, test, text, ui, yank, etc.)
- **Utilities**: Common functions in `config/nvim/lua/utilities/` for LSP, snippets, strings, tables
- **Snippets**: Language-specific snippets organized in `config/nvim/lua/snippets/`
- **Initialization**: `config/nvim/init.lua` bootstraps Lazy.nvim
- **Setup**: `config/nvim/lua/lazy_setup.lua` configures AstroNvim

## Repository Structure

```
bin/                    # Setup scripts for various tools
config/
  ├── nvim/             # Neovim configuration (AstroNvim-based)
  │   ├── lua/
  │   │   ├── plugins/  # Custom plugin configurations
  │   │   └── snippets/ # Code snippets by language
  │   └── init.lua      # Neovim entry point
  ├── mise/             # Runtime version manager config
  └── zsh/              # Zsh configuration files
zshrc                   # Main Zsh configuration
tmux.conf               # tmux configuration
Brewfile                # Homebrew package definitions
```

## Key Configuration Files

- `Brewfile`: Defines all Homebrew packages and applications to install
- `config/mise/config.toml`: Runtime versions for languages (Node, Ruby, Python, etc.)
- `config/nvim/lua/plugins/astrocore.lua`: Core Neovim options and mappings
- `zshrc`: Main Zsh shell configuration with Oh My Zsh setup

## Development Workflow

1. **Making changes**: Edit configuration files directly in their respective directories
2. **Applying changes**: Run the appropriate setup script or use `rcup` to relink dotfiles
3. **Testing Neovim changes**: Restart Neovim or use `:Lazy reload` for plugin changes
4. **Package updates**: Edit `Brewfile` and run `brew bundle` to install new packages

## Architecture Details

### Git Integration

- Custom Git commands in `config/git/bin/` (branches, checkout, default-branch, delete-branches, force-pull, force-push, local-repos, my-branches, page, review, what-did-i-do)
- Git configuration and global ignore patterns in `config/git/`

### System Automation

- LaunchAgent services in `Library/LaunchAgents/` for system automation (screen tint control, dictionary sync)
- Karabiner keyboard remapping configuration in `config/karabiner/karabiner.json`

### Development Tools

- **mise**: Runtime version management for multiple languages (Node, Ruby, Python, etc.) configured in `config/mise/config.toml`
- **rcm**: Dotfile symlinking with exclusions for specific directories (excludes `config/launchd`, includes `Library`, `claude`, `config`, etc.)
- **Brewfile**: Comprehensive package definitions including development tools, CLI utilities, and applications

## Important Notes

- The repository uses `rcm` (rcup) for dotfile management, not manual symlinks
- Neovim configuration is heavily customized on top of AstroNvim
- All setup scripts are idempotent and can be run multiple times safely
- The `mise` tool manages runtime versions for multiple programming languages
