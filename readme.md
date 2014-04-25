# Dotfiles

This is a guide to setting up my personal development environment. It's purpose is to get me up and running as fast as possible on a clean install of OS X.

## Prerequisits

Before anything else, run Software Update.

Once that's done, install:

* [Google Chrome](https://www.google.com/intl/en/chrome/browser/)
* [Sublime Text 2](http://www.sublimetext.com/3)
* [Dropbox](http://dropbox.com)
* [iStat Menus](http://bjango.com/mac/istatmenus/)
* [Spotify](http://www.spotify.com)

Then install these from the AppStore:

* Xcode
* BetterSnapTool
* iA Writer
* The Unarchiver
* Alfred
* Clear
* Caffine
* ColorSnapper
* Screenshot PSD

Install the XCode Command Line Tools by opening XCode, navigating to Preferences > Downloads > Components and clicking on the Install button.

## Homebrew

[Homebrew](http://mxcl.github.com/homebrew/) is a bad ass little package manager for OS X. To install it, run:

```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor
brew update
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'
```

The last line sets the `$PATH` environment variable. This only needs to be done for the current shell session. Once you set up Oh My ZSH later on in this guide, this variable will be set whenever the shell starts.

Install some handy little command line utilities using Homebrew:

```
brew install wget tree ack rename imagemagick android-sdk
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
git config --global core.editor "subl -w"
git config --global push.default simple
git config --global color.ui true
git config --global core.mergeoptions --no-edit
```

In order to connect with GitHub, you'll need to generate an SSH key. Follow the [instructions](https://help.github.com/articles/generating-ssh-keys) on Github.

## Dotfiles

To get all of the settings and script files, clone the [dotfiles](https://github.com/LandonSchropp/dotfiles) repository.

```
git clone git@github.com:LandonSchropp/dotfiles.git $HOME/dotfiles
```

## Oh My ZSH

[Z shell (zsh)](http://en.wikipedia.org/wiki/Z_shell) is an awesome replacement for the default bash shell that ships with OS X. It includes some greate features such as auto-completion, spelling correction, glob file matching, custom prompts and more.

[Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) is a framework that manages Zsh, and includes several plugins for zsh as well as an automatic update tool. The installation information for Oh My ZSH was taken from this [Oh My ZSH Railscast](http://railscasts.com/episodes/308-oh-my-zsh).

Install Oh My ZSH by using the following command:

```
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

Next, link the custom Oh My ZSH configuration from the dotfiles repository.

```
mkdir -p $HOME/.oh-my-zsh/custom
rm -r $HOME/.oh-my-zsh/custom/*
ln -s $HOME/dotfiles/oh_my_zsh/* $HOME/.oh-my-zsh/custom/
```

Finally, in order to property change the shell, restart the system.

## iTerm2

[iTerm2](http://www.iterm2.com/#/section/downloads) is a nifty little terminal replacement. To set up iTerm2, download and install it. You may have to perform an update to get the latest version. Open up the preferences and navigate to the General tab. Click the checkbox labeled "Load preferences from a custom folder or URL" and select the `iterm2` folder in the dotfiles repository.

## OS X

Run the OS X script to set some useful OS X preferences. Restart for all of the changes to take effect.

```
source $HOME/dotfiles/osx/osx.zsh
```

## GCC

The XCode Command Line Tools includes LLVM-GCC, which can cause problems when compiling Ruby. To fix this, we need to install GCC:

``` shell
brew tap homebrew/dupes
brew install apple-gcc42
```

## Ruby

[rbenv](https://github.com/sstephenson/rbenv) is an awesome little Ruby environment manager. It does one thing really well. To install rbenv, run:

``` shell
brew install rbenv ruby-build
```

OS X ships with an old version of Ruby. You'll want the latest stable one. Check the official [Ruby language website](http://www.ruby-lang.org/en/) to see what it might be. At the time this document was written, the newest stable Ruby release is `Ruby 1.9.3-p362`.  To install Ruby, run:

```
export CC="/usr/local/bin/gcc-4.2"
export CFLAGS="-I/opt/X11/include"
rbenv install 1.9.3-p327
rbenv global 1.9.3-p327
eval "$(rbenv init -)"
```

You may also want to disable `ri` and `rdoc` documentation from being installed by default.

``` shell
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
```
```

## tmux

tmux is a program that splits multiple terminals in the same window. The instructions for installing tmux were taken from [this gist](https://gist.github.com/simme/1297707).

To get started, install tmux with Homebrew.

``` shell
brew install reattach-to-user-namespace tmux
```

Next, link the tmux configuration file.

``` shell
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
```

[tmuxinator](https://github.com/aziz/tmuxinator) allows you to rapidly create tmux workspaces by storing their configurations in files. Install the tmuxinator gem using the shell.

``` shell
gem install tmuxinator
```
To link to the tmuxinator project files, run:

``` shell
ln -s $HOME/dotfiles/tmuxinator $HOME/.tmuxinator
```

## Ruby on Rails

[Ruby on Rails](http://rubyonrails.org/) is easy to install:

```
gem install sqlite3
gem install rails
gem install bundler
```

## Sublime Text

Install [Sublime Package Control](http://wbond.net/sublime_packages/package_control).

When that's done, restart Sublime Text 2. Next, add the following packages by hitting Command + Shift + P and typing in Package Control: Install Package:

* Better CoffeeScript
* Emmet
* SCSS
* Dayle Rees Color Schemes
* EasyMotion
* ruby-slim
* Jade
* Stylus
* SublimeCodeIntel
* SideBarEnchancements
* ApplySyntax

By default, the multi-line selection keyboard shortcut (Control + Shift + Up/Down) is overridden by OS X. To get it back, disable this shortcut by going to System Preferences, then Keyboard, then Shortcuts. Uncheck the Mission Control and Application Windows shortcuts.

To hook up the preferences and keybindings, symbolically link the Sublime dotfiles.

```
PREFERENCES_DIRECTORY="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
rm -rf "$PREFERENCES_DIRECTORY/Preferences.sublime-settings"
rm -rf "$PREFERENCES_DIRECTORY/Default (OSX).sublime-keymap"

mkdir -p $PREFERENCES_DIRECTORY

ln -s "$HOME/dotfiles/sublime_text/Preferences.sublime-settings" "$PREFERENCES_DIRECTORY/"
ln -s "$HOME/dotfiles/sublime_text/Default (OSX).sublime-keymap" "$PREFERENCES_DIRECTORY/"

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
cp "/usr/local/Cellar/postgresql/$(psql --version | perl -wnE 'say for /\d+\.\d+\.\d+/g')/homebrew.mxcl.postgresql.plist" $HOME/Library/LaunchAgents
launchctl load -w $HOME/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

## Private Keys

Some APIs require secret access keys and tokens for authentication. For security reasons, these values should not be stored in a git repository.

Create a new Oh My ZSH configuration file.

``` shell
touch ~/.oh-my-zsh/custom/private.zsh
```

Store the keys as environment variables like this:

``` shell
export SERVICE_USERNAME="<Username>"
export SERVICE_SECRET_KEY="<Secret Key>"
```
