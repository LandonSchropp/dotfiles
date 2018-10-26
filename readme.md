# Dotfiles

This is a guide to setting up my personal development environment. It's meant get me up and running
as fast as possible on a clean install of macOS. After running through all of the installation
scripts and instructions, you'll have an environment configured with the following tools.

* **[Homebrew](http://mxcl.github.com/homebrew/)**: A bad ass little package manager for macOS.
* **[Git](https://git-scm.com/)**: Everyone's favorite distributed version control system.
* **[Node.js](https://nodejs.org/en/)**: The JavaScript runtime.
* **[Ruby](https://www.ruby-lang.org/en/)**: A programming language with a focus on simplicity and
  productivity.
* **[PostgreSQL](http://www.postgresql.org/)**: An open-source SQL database.
* Microsoft VS Code A text editor with plugins.

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

Then, install Xcode and accept its license.

``` shell
xcode-select --install
sudo xcodebuild -license accept
```

## Installation

Start by cloning the dotfiles repo.

``` shell
git clone https://github.com/jorge0136/dotfiles $HOME/.dotfiles
```

[RCM](https://github.com/thoughtbot/rcm) is a handy utility to manage the linking of dotfiles. Most
of the applications and utilities in these dotfiles (including Homebrew) can be installed by running
the following command.

``` shell
RCRC=$HOME/.dotfiles/rcrc rcup
```

This executes the [pre-up](hooks/pre-up-hooks) and [post-up](hooks/post-up-hooks) scripts, which
install applications and configure the system. These scripts are idempotent, so feel free to run the
`rcup` command as many times as you'd like.

### VScode

Using the following tool to sync settings to and from my github gist. Secure your github token to [download settings again.](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)


### Git

In order to connect with GitHub, you'll need to generate an SSH key. Follow the
[instructions](https://help.github.com/articles/generating-an-ssh-key/) on Github.

### macOS

Mathias Bynens maintains [a script](https://mths.be/osx) that configures several macOS system and
application settings in one go. Because macOS is constantly updating, it's probably a good idea to
pull it down an modify every once in a while. My latest local iteration is kept in the
[macos.sh](macos.sh) script.

### ZSH

Interesting dotfiles
These are dotfiles I got many ideas from and liked.

## Interesting dotfiles

These are dotfiles I got many ideas from and liked.

- [LandonSchropp](https://github.com/LandonSchropp/dotfiles) - Interesting install setup, original inspiration for my dot files.
