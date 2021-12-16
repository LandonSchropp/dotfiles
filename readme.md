# Dotfiles

This is a guide to setting up my personal development environment. It's meant to get me up and
running as fast as possible on a clean install of macOS. After running through the installation
scripts and instructions, you'll have an environment configured with the following tools.

* **[Homebrew](http://mxcl.github.com/homebrew/)**: A badass little package manager for macOS.
* **[Git](https://git-scm.com/)**: Everyone's favorite distributed version control system.
* **[Node.js](https://nodejs.org/en/)**: The JavaScript runtime.
* **[Neovim](https://neovim.io/)**: The world's best text editor.
* **[Mackup](https://github.com/lra/mackup)**: A utility for syncing application settings when
  they're not worth copying into the dotfiles.
* **[Ruby](https://www.ruby-lang.org/en/)**: A programming language with a focus on simplicity and
  productivity.
* **[tmux](https://tmux.github.io/)**: A utility that allows you to run multiple windows inside one
  terminal.
* **[Postgres](http://www.postgresql.org/)**: An open-source SQL database.

In addition, these dotfiles install a ton of small, useful utilities command-line utilities and
system applications, which can be viewed in the [Brewfile](Brewfile). They also add several custom
commands.

These dotfiles are heavily based on the
[Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles) and
[Paul Irish's dotfiles](https://github.com/paulirish/dotfiles).

## Prerequisites

Before anything else, install the system updates.

``` shell
softwareupdate -ia
```

Then, install the Xcode's CLI tools and accept the license.

``` shell
xcode-select --install
sudo xcodebuild -license accept
```

## 1Password

Before you can do anything useful, you’ll need to install 1Password manually to get access to all of
your passwords. You can download it [here](https://1password.com/downloads/mac/). Configure it by
scanning the QR codes from another instance of the app.

### Git

In order to connect with GitHub, you'll need to generate an SSH key. Follow the
[instructions](https://help.github.com/articles/generating-an-ssh-key/) on GitHub.

## Google Drive

Next, you’ll need to sync your application configurations. These are required by the dotfiles
scripts.

To do this, Download [Google Backup and Sync](https://www.google.com/drive/download/) and install
it. Follow the prompts to set it up, and then let the files sync.

## Dotfiles Respository

Clone this dotfiles repo.

``` shell
git clone git@github.com:LandonSchropp/dotfiles.git $HOME/.dotfiles
```

Most of the applications and utilities in these dotfiles (including Homebrew) can be installed by
running the following command.

``` shell
~/.dotfiles/bin/set-up
```

This executes the [set-up-hook](bin/set-up-hooks) scripts, which install applications and configure
the system. These scripts are idempotent, so feel free to run the `set-up` command as many times as
you'd like.

### Terminal Colors and Italics

To enable italic text in the terminal, you need to register italics with the TERM database.

``` shell
tic $HOME/.dotfiles/xterm-256color-italic.terminfo
tic $HOME/.dotfiles/tmux-256color-italic.terminfo
```

For more information, check out
[these instructions](https://sunaku.github.io/tmux-24bit-color.html#usage).

### macOS

Mathias Bynens maintains [a script](https://mths.be/osx) that configures several macOS system and
application settings in one go. Because macOS is constantly updating, it's probably a good idea to
pull it down an modify every once in a while. My latest local iteration is kept in the
[macos.sh](macos.sh) script.

### PostgreSQL

[PostgreSQL](http://www.postgresql.org/) is an open-source SQL database and is installed via
Homebrew. It can be started and stopped with the following commands:

``` shell
brew services start postgresql
brew services stop postgresql
```
