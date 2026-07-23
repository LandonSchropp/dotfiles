# Dotfiles

This is a collection of scripts for setting up my personal development environment. It's meant to
get a new environment completely configured as fast as possible on a clean install of macOS.

After running through the installation scripts and instructions, you'll have an environment
configured with the following tools.

- **[Homebrew](http://mxcl.github.com/homebrew/)**: The de facto package manager for macOS.
- **[Git](https://git-scm.com/)**: Everyone's favorite distributed version control system.
- **[Neovim](https://neovim.io/)**: The world's best text editor. My Neovim configuration includes
  [AstroNvim](https://astronvim.com/), a "distribution", as well as a ton of customization.
- **[tmux](https://tmux.github.io/)**: A utility that allows you to run multiple windows inside one
  terminal.

In addition, these dotfiles install a ton of small, useful utilities command-line utilities and
system applications, which can be viewed in the [Brewfile](Brewfile).

## Prerequisites

Before anything else, install any pending system updates.

```sh
softwareupdate -ia
```

Then, install the Xcode's CLI tools and accept the license.

```sh
xcode-select --install
sudo xcodebuild -license accept
```

## Dotfiles

First, clone this repo.

```sh
git clone https://github.com/LandonSchropp/dotfiles.git $HOME/.dotfiles
```

Next, you'll want to run each of the following scripts in-order. Over the years, I've found that
_something_ usually breaks every year or two, so it's best to run them individually and debug
anything that pops up.

```sh
~/.dotfiles/bin/set-up-homebrew
~/.dotfiles/bin/set-up-zshell
~/.dotfiles/bin/set-up-rcup
~/.dotfiles/bin/set-up-bat
~/.dotfiles/bin/set-up-fzf
~/.dotfiles/bin/set-up-launchd
~/.dotfiles/bin/set-up-mise-en-place
~/.dotfiles/bin/set-up-neovim
~/.dotfiles/bin/set-up-tmux
```

### Git

In order to connect with GitHub, you'll need to generate an SSH key. Follow the
[instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) on GitHub.

## Utilities

Beyond the setup scripts, this repository includes a handful of small, purpose-built utilities.
These are too involved for a single script, but not substantial enough to warrant their own
repository. These live in `local/share/<name>` and are exposed as commands on `PATH` via
`local/bin`.

### Window Manager

The window manager arranges windows into configurable per-workspace layouts, switches
[FlashSpace](https://flashspace.dev/) profiles based on the connected display, and toggles the
focused window between fullscreen and its arranged layout. It's wired into Yabai, FlashSpace, and
Karabiner and does not need to be run by hand.

### sync

The sync utilities keep my machines updated an in-sync. They include the following:

- `sync-repositories`: Syncs the default branch of my active development repositories via
  [git-town](https://www.git-town.com/).
- `sync-dictionaries`: Merges the local, Neovim, and iCloud spelling dictionaries.
- `back-up-preferences` / `restore-preferences`: Backs up and restores a subset of app preferences
  to and from iCloud Drive. The list of apps is configured in `config/preferences/apps.json`. Run
  `restore-preferences` when setting up a new machine.
- `update-tools`: Upgrades a handful of installed command-line tools.
