# Dotfiles

This is a guide to setting up my personal development environment. It's meant get me up and running as fast as possible on a clean install of OS X.

## Prerequisites

Before anything else, install the system updates.

```
softwareupdate -ia
```

Then, install Xcode and accept its license.

```
xcode-select --install
sudo xcodebuild -license accept
```

Finally, install [Google Chrome](https://www.google.com/chrome). This is necessary because 1Password checks the MD5 hash of the installed binary and rejects Chrome if it's installed via Homebrew Cask.

## Homebrew

[Homebrew](http://mxcl.github.com/homebrew/) is a bad ass little package manager for OS X. To install it, run the following script:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Next, install some handy little command line utilities with Homebrew:

``` shell
brew install \
  ansiweather \
  coreutils \
  diff-so-fancy \
  direnv \
  gnu-sed \
  heroku \
  imagemagick \
  jq \
  mas \
  m-cli \
  rename \
  source-highlight \
  the_silver_searcher \
  tldr \
  tree \
  wget \
  z
```

Then, install the OS X apps and fonts via [Homebrew Cask](https://caskroom.github.io/):

```
brew tap caskroom/fonts
brew cask install \
  atom \
  calibre \
  cheatsheet \
  dropbox \
  firefox \
  font-open-sans \
  font-source-code-pro \
  imageoptim \
  istat-menus \
  iterm2 \
  numi \
  sketch-toolbox \
  spotify \
  vlc
```

Finally, install the apps from the App Store.

``` shell
APPS=(
  504544917 # Clear
  892581529 # Tonality
  917790450 # ScreenFlow
  425424353 # The Unarchiver
  412980789 # Full Deck Solitaire
  409183694 # Keynote
  443987910 # 1Password
  411902645 # Braid
  775737590 # iA Writer
  852320343 # Sketch
  557168941 # Tweetbot
  803453959 # Slack
  969418666 # ColorSnapper2
  417375580 # BetterSnapTool
  961632517 # Be Focused Pro
  1074021862 # External Editors For Photos
  414154107 # World of Goo
)
mas install ${APPS[@]}
```

## Git

The XCode Command Line Tools includes Git, but it's not the latest version. To install the current version, run:

```
brew install git
```

In order to connect with GitHub, you'll need to generate an SSH key. Follow the [instructions](https://help.github.com/articles/generating-an-ssh-key/) on Github.

## Neovim

Install Neovim with Homebrew.

``` shell
brew install neovim/neovim/neovim
```

Some of the plugins I use require Python, so install that as well.

``` shell
brew install python3
pip3 install neovim
```

Neovim is configured in the dotfiles.

## Dotfiles

The dotfiles in this repo are integrated with the [Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles). To get all of the settings and script files, you'll need to clone both repositories.

``` shell
git clone git@github.com:LandonSchropp/dotfiles.git $HOME/.dotfiles
git clone git@github.com:thoughtbot/dotfiles.git $HOME/.thoughtbot_dotfiles
```

Next, install [rcm](https://github.com/thoughtbot/rcm) and link the dotfiles.

``` shell
brew tap thoughtbot/formulae
brew install rcm
RCRC=$HOME/.dotfiles/rcrc rcup
```

## Zsh and Prezto

[Z shell (zsh)](http://en.wikipedia.org/wiki/Z_shell) is an awesome replacement for the default bash shell that ships with OS X. It includes some greate features such as auto-completion, spelling correction, glob file matching, custom prompts and more.

[Prezto](https://github.com/sorin-ionescu/prezto) is a framework that manages Zsh, and includes several plugins to make development easier.

To set up and install Zsh and Prezto, start zsh, clone the Prezto repository and set zsh as the default shell.

```
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git $HOME/.zprezto
chsh -s /bin/zsh
```

## Terminal Colors and Italics

To enable italic text in the terminal, you need to register italics with the TERM database.

```
tic $HOME/.dotfiles/xterm-256color-italic.terminfo
tic $HOME/.dotfiles/tmux-256color-italic.terminfo
```

Next, follow [these instructions](https://sunaku.github.io/tmux-24bit-color.html#usage) to get colors working in Tmux.

## OS X

Run the OS X script to set some useful OS X preferences. Restart for all of the changes to take effect.

```
source $HOME/.dotfiles/osx.zsh
```

## Mackup

Mackup is used to back up all of the configuration files that aren't worth copying to this repository, such as tmuxinator's file or application configuration files. Once Dropbox has finished downloading all of your files, copy the application settings by running:

```
brew install mackup
mackup restore
```

## Ruby

[rbenv](https://github.com/sstephenson/rbenv) is an awesome little Ruby environment manager. It does one thing really well. To install rbenv, run:

``` shell
brew install rbenv ruby-build
```

OS X ships with an old version of Ruby. You'll want the latest stable one. Check the official [Ruby language website](https://www.ruby-lang.org/en/downloads/) to see what it is. To install Ruby, run:

```
rbenv install <version>
rbenv global <version>
eval "$(rbenv init -)"
```

Finally, install the [Bundler](http://bundler.io/) gem in order to gain access to the `bundle` command.

``` shell
gem install bundler
```

## tmux

[tmux](https://tmux.github.io/) is a utility that allows you to run multiple windows inside one terminal.

First, install tmux with Homebrew.

``` shell
brew install tmux
```

Next, install [tpm](https://github.com/tmux-plugins/tpm) and use it to install the tmux plugins.

``` shell
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins
```

[tmuxinator](https://github.com/aziz/tmuxinator) allows you to rapidly create tmux workspaces by storing their configurations in files. You can install tmuxinator by installing its gem.

``` shell
gem install tmuxinator
```

Once all of this is done, you may have to tell tmux to reload the configuration file.

``` shell
tmux source-file ~/.tmux.conf
```

## Node.js

These days, the best way to install node with with [NVM](https://github.com/creationix/nvm). To install it, follow the instructions in the [readme file](https://github.com/creationix/nvm#install-script).

Once NVM is installed, you'll want to install a global copy of Node.

```
npm install stable
nvm use stable
```

## PostgreSQL

[PostgreSQL](http://www.postgresql.org/) is an open-source SQL database.

OS X ships with an old version of PostgreSQL pre-installed. To install the newest version, use:

```
brew install postgresql
initdb /usr/local/var/postgres
```

Next, restart the terminal. In order to make sure PostgreSQL starts up when OS X starts up, we need to add a launch agent.

```
ln -s "/usr/local/Cellar/postgresql/$(ls /usr/local/Cellar/postgresql)/homebrew.mxcl.postgresql.plist" $HOME/Library/LaunchAgents
launchctl load -w $HOME/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

Depending on your application's set up, you may also have to create a traditional `postgres` role:

```
/usr/local/Cellar/postgresql/$(ls /usr/local/Cellar/postgresql)/bin/createuser -s postgres
```
