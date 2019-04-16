# Dotfiles

This is a guide to setting up my personal development environment. It's meant to get me up and
running as fast as possible on a clean install of macOS. After running through all of the
installation scripts and instructions, you'll have an environment configured with the following
tools.

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
* **[Fish](https://fishshell.com/)**: An awesome shell with a ton of useful features baked in out of
  the box.
* **[PostgreSQL](http://www.postgresql.org/)**: An open-source SQL database.

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
git clone https://github.com/LandonSchropp/dotfiles $HOME/.dotfiles
```

[RCM](https://github.com/thoughtbot/rcm) is a handy utility to manage the linking of dotfiles. Most
of the applications and utilities in these dotfiles (including Homebrew) can be installed by running
the following command.

``` shell
~/.dotfiles/bin/set-up
```

This executes the [pre-up](hooks/pre-up-hooks) and [post-up](hooks/post-up-hooks) scripts, which
install applications and configure the system. These scripts are idempotent, so feel free to run the
`rcup` command as many times as you'd like.

### Kinesis Advantage2

I use a Kinesis Advantage2 for my typing. This keyboard allows you to completely customize the
layout to your taste.

To load my [Kinesis Advantage2](https://www.kinesis-ergo.com/shop/advantage2/) custom layout:

1. Reset the keyboard's current configuration by holding `Program` + `F9` until the lights flash.
2. Put the keyboard in power user mode by pressing `Program` + `Shift` + `Esc`.
3. Put the keyboard into Mac mode with `Program` + `F5`.
4. Mount the keyboard's internal storage as a drive by pressing `Program` + `Shift` + `F1`.
5. Run the `bin/advantage2` script.
6. Load the custom keyboard layout with `Program` + `1` and check that it works.
7. Unmount the internal storage by again pressing `Program` + `Shift` + `F1`.

### Git

In order to connect with GitHub, you'll need to generate an SSH key. Follow the
[instructions](https://help.github.com/articles/generating-an-ssh-key/) on GitHub.

### macOS

Mathias Bynens maintains [a script](https://mths.be/osx) that configures several macOS system and
application settings in one go. Because macOS is constantly updating, it's probably a good idea to
pull it down an modify every once in a while. My latest local iteration is kept in the
[macos.sh](macos.sh) script.

### Fish

To get up and running, add Fish to the list of shells and set it as the default.

``` shell
sudo bash -c 'echo "/usr/local/bin/fish" >> /etc/shells'
chsh -s /usr/local/bin/fish
```

### Terminal Colors and Italics

To enable italic text in the terminal, you need to register italics with the TERM database.

``` shell
tic $HOME/.dotfiles/xterm-256color-italic.terminfo
tic $HOME/.dotfiles/tmux-256color-italic.terminfo
```

Next, follow [these instructions](https://sunaku.github.io/tmux-24bit-color.html#usage) to get
colors working in Tmux.

### PostgreSQL

[PostgreSQL](http://www.postgresql.org/) is an open-source SQL database and is installed via
Homebrew. It can be started and stopped with the following commands:

``` shell
brew services start postgresql
brew services stop postgresql
```
