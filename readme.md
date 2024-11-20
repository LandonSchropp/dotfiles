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

```shell
softwareupdate -ia
```

Then, install the Xcode's CLI tools and accept the license.

```shell
xcode-select --install
sudo xcodebuild -license accept
```

## Dotfiles

First, clone this repo.

```shell
git clone git@github.com:LandonSchropp/dotfiles.git $HOME/.dotfiles
```

Next, you'll want to run each of the following scripts in-order. Over the years, I've found that
_something_ usually breaks every year or two, so it's best to run them individually and debug
anything that pops up.

```shell
~/.dotfiles/bin/set-up-homebrew
~/.dotfiles/bin/set-up-zshell
~/.dotfiles/bin/set-up-rcup
~/.dotfiles/bin/set-up-tic
~/.dotfiles/bin/set-up-tmux
~/.dotfiles/bin/set-up-ruby
~/.dotfiles/bin/set-up-node
~/.dotfiles/bin/set-up-fzf
~/.dotfiles/bin/set-up-neovim
~/.dotfiles/bin/set-up-bat
~/.dotfiles/bin/set-up-mas
```

### Git

In order to connect with GitHub, you'll need to generate an SSH key. Follow the
[instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) on GitHub.
