# Dotfiles

This is a guide to setting up my personal development environment. It's meant get me up and running as fast as possible on a clean install of OS X.

## Prerequisites

Before anything else, run Software Update. Then, install all of your App Store purchases.

## Xcode Comment Line Tools

In the terminal, run `xcode-select --install` to install the Xcode Command Line Tools.

## Homebrew

[Homebrew](http://mxcl.github.com/homebrew/) is a bad ass little package manager for OS X. To install it, run the install script on the Homebrew site and then do:

```
brew doctor
brew update
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'
```

The last line sets the `$PATH` environment variable. This only needs to be done for the current shell session. Once you set up Oh My Zsh later on in this guide, this variable will be set whenever the shell starts.

Install some handy little command line utilities using Homebrew:

```
brew install android-sdk
brew install diff-so-fancy
brew install gnu-sed
brew install imagemagick
brew install jq
brew install rename
brew install source-highlight
brew install the_silver_searcher
brew install tree
brew install wget
brew install z
```

Install [Homebrew Cask](http://caskroom.io/):

```
brew install caskroom/cask/brew-cask
```

Install [Homebrew Cask versions](https://github.com/caskroom/homebrew-versions) and [Homebrew Cask fonts](https://github.com/caskroom/homebrew-fonts).

```
brew tap caskroom/versions
brew tap caskroom/fonts
```

Then, install the OS X apps and fonts:

```
brew cask install atom
brew cask install bartender
brew cask install calibre
brew cask install cheatsheet
brew cask install cyberduck
brew cask install dropbox
brew cask install firefox
brew cask install font-source-code-pro
brew cask install google-chrome
brew cask install imageoptim
brew cask install istat-menus
brew cask install iterm2
brew cask install mailbox
brew cask install sketch-tool
brew cask install sketch-toolbox
brew cask install spotify
brew cask install vlc
```

## Git

The XCode Command Line Tools includes Git, but it's not the latest version. To install the current version, run:

```
brew install git
```

In order to connect with GitHub, you'll need to generate an SSH key. Follow the [instructions](https://help.github.com/articles/generating-ssh-keys) on Github.

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
env RCRC=$HOME/.dotfiles/rcrc rcup
```

## Neovim

Install Neovim with Homebrew.

``` shell
brew install neovim
```

Symbolically link the OS X user dictionary so it's shared with Neovim.

```
ln -s $HOME/Library/Spelling/LocalDictionary $HOME/.vim-spell-en.utf-8.add
```

Next, download [vim-plug](https://github.com/junegunn/vim-plug) by following the directions in the
repo. Then, open up Neovim and run `:PlugInstall` to install the plugins.

Finally, some of the plugins require Python 3.

``` shell
brew install python3
pip3 install neovim
```

## Oh My ZSH

[Z shell (zsh)](http://en.wikipedia.org/wiki/Z_shell) is an awesome replacement for the default bash shell that ships with OS X. It includes some greate features such as auto-completion, spelling correction, glob file matching, custom prompts and more.

[Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) is a framework that manages Zsh, and includes several plugins for zsh as well as an automatic update tool. The installation information for Oh My ZSH was taken from this [Oh My ZSH Railscast](http://railscasts.com/episodes/308-oh-my-zsh).

Install Oh My ZSH by using the following command:

```
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
```

In order to property change the shell, restart the system.

## Italics

To enable italic text in the terminal, you need to register italics with the TERM database.

```
tic $HOME/.dotfiles/xterm-256color-italic.terminfo
tic $HOME/.dotfiles/tmux-256color-italic.terminfo
```

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

You may also want to disable `ri` and `rdoc` documentation from being installed by default.

``` shell
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
```

Finally, install the [Bundler](http://bundler.io/) gem in order to gain access to the `bundle` command.

``` shell
gem install bundler
```

## tmux

tmux is a program that splits multiple terminals in the same window. The instructions for installing tmux were taken from [this gist](https://gist.github.com/simme/1297707).

Install tmux with Homebrew and tmuxinator with `gem`.

``` shell
brew install reattach-to-user-namespace tmux
gem install tmuxinator
```

[tmuxinator](https://github.com/aziz/tmuxinator) allows you to rapidly create tmux workspaces by storing their configurations in files. Install the tmuxinator gem using the shell.

## NodeJS

[NodeJS](http://nodejs.org/) is a web application framework written in JavaScript. [NPM](https://npmjs.org/) is the best NodeJS package manager. You can use Homebrew to install both:

```
brew install nodejs npm
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
mkdir -p $HOME/Library/LaunchAgents
cp "/usr/local/Cellar/postgresql/$(ls /usr/local/Cellar/postgresql)/homebrew.mxcl.postgresql.plist" $HOME/Library/LaunchAgents
launchctl load -w $HOME/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

Depending on your application, you may also have to create the traditional `postgres` role:

```
/usr/local/Cellar/postgresql/$(ls /usr/local/Cellar/postgresql)/bin/createuser -s postgres
```
