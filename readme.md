# Dotfiles

This is a guide to setting up my personal development environment. It's purpose is to get me up and running as fast as possible on a clean install of OS X.

## Prerequisits

Before anything else, run Software Update.

Then install these from the AppStore:

* Xcode
* BetterSnapTool
* iA Writer
* The Unarchiver
* Clear
* Caffine
* ColorSnapper
* Screenshot PSD

Open up Xcode, and when it prompts you, install the Xcode Command Line Tools.

## Homebrew

[Homebrew](http://mxcl.github.com/homebrew/) is a bad ass little package manager for OS X. To install it, run the install script on the homebrew site and then do:

```
brew doctor
brew update
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'
```

The last line sets the `$PATH` environment variable. This only needs to be done for the current shell session. Once you set up Oh My ZSH later on in this guide, this variable will be set whenever the shell starts.

Install some handy little command line utilities using Homebrew:

```
brew install wget tree rename imagemagick android-sdk gnu-sed the_silver_searcher
```

Install [Homebrew Cask](http://caskroom.io/):

```
brew install caskroom/cask/brew-cask
```

Then, install the OS X apps:

```
brew cask install google-chrome
brew cask install atom
brew cask install dropbox
brew cask install spotify
brew cask install mailbox
brew cask install iterm2
brew cask install istat-menus
```

## Git

The XCode Command Line Tools includes Git, but it's not the latest version. To install the current version, run:

```
brew install git
```

Next, configure it:

```
git config --global credential.helper osxkeychain
git config --global user.name "Landon Schropp"
git config --global user.email schroppl@gmail.com
git config --global alias.co checkout
git config --global alias.a add
git config --global alias.c commit
git config --global alias.b branch
git config --global alias.m merge
git config --global alias.s status
git config --global core.editor "atom --wait"
git config --global color.ui true
git config --global core.mergeoptions --no-edit
```

In order to connect with GitHub, you'll need to generate an SSH key. Follow the [instructions](https://help.github.com/articles/generating-ssh-keys) on Github.

## Dotfiles

To get all of the settings and script files, clone the [dotfiles](https://github.com/LandonSchropp/dotfiles) repository.

```
git clone git@github.com:LandonSchropp/dotfiles.git $HOME/.dotfiles
```

## Oh My ZSH

[Z shell (zsh)](http://en.wikipedia.org/wiki/Z_shell) is an awesome replacement for the default bash shell that ships with OS X. It includes some greate features such as auto-completion, spelling correction, glob file matching, custom prompts and more.

[Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) is a framework that manages Zsh, and includes several plugins for zsh as well as an automatic update tool. The installation information for Oh My ZSH was taken from this [Oh My ZSH Railscast](http://railscasts.com/episodes/308-oh-my-zsh).

Install Oh My ZSH by using the following command:

```
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
```

Next, link the custom Oh My ZSH configuration from the dotfiles repository.

```
mkdir -p $HOME/.oh-my-zsh/custom
rm -r $HOME/.oh-my-zsh/custom/*
ln -s $HOME/.dotfiles/oh_my_zsh/* $HOME/.oh-my-zsh/custom/
```

Comment out the following line in the `.zshrc` file:

``` shell
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
```

Finally, in order to property change the shell, restart the system.

# Vim

First, install the latest version of Vim by running:

``` shell
brew install vim
```

Next,  link the `.vimrc` file from the dotfiles repository.

``` shell
ln -s $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
```

Then, install Vundle with:

``` shell
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Finally, fire up Vim and run `:PluginInstall` to install all of the plugins in the `.vimrc` file.

## iTerm2

[iTerm2](http://www.iterm2.com/#/section/downloads) is a nifty little terminal replacement. To configure, iTerm2, first install the latest update from inside the application. Next, open up the preferences and navigate to the General tab. Click the checkbox labeled "Load preferences from a custom folder or URL" and manually enter the `/Users/<USERNAME>/.dotfiles/iterm2` directory.

## OS X

Run the OS X script to set some useful OS X preferences. Restart for all of the changes to take effect.

```
source $HOME/.dotfiles/osx/osx.zsh
```

## Ruby

[rbenv](https://github.com/sstephenson/rbenv) is an awesome little Ruby environment manager. It does one thing really well. To install rbenv, run:

``` shell
brew install rbenv ruby-build
```

OS X ships with an old version of Ruby. You'll want the latest stable one. Check the official [Ruby language website](http://www.ruby-lang.org/en/) to see what it might be. To install Ruby, run:

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

To get started, install tmux with Homebrew.

``` shell
brew install reattach-to-user-namespace tmux
```

Next, link the tmux configuration file.

``` shell
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
```

[tmuxinator](https://github.com/aziz/tmuxinator) allows you to rapidly create tmux workspaces by storing their configurations in files. Install the tmuxinator gem using the shell.

``` shell
gem install tmuxinator
```
To link to the tmuxinator project files, run:

``` shell
ln -s $HOME/.dotfiles/tmuxinator $HOME/.tmuxinator
```

## Atom

To hook up the preferences and keybindings, symbolically link the Atom dotfiles.

```
rm -rf "$HOME/.atom"
ln -s "$HOME/.dotfiles/atom" "$HOME/.atom"
```

Then, open up the preferences and install the following packages:

* ColorPicker
* Command Logger
* Editor Stats
* Language Emblem
* Language Handlebars
* Language Haml
* Language Slim
* Sort Lines
* Zen

## NodeJS

[NodeJS](http://nodejs.org/) is a web application framework written in JavaScript. [NPM](https://npmjs.org/) is the best NodeJS package manager. You can use Homebrew to install both:

```
brew install nodejs npm
```

## PostgreSQL

[PostgreSQL](http://www.postgresql.org/) is an open-source SQL database. OS X ships with and old version of PostgreSQL preinstalled. Most of the instructions for installing PostgreSQL were borrowed from [this great Railscast](http://railscasts.com/episodes/342-migrating-to-postgresql?view=asciicast).

To install the newest version, use:

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
