# Setup

This is a guide to setting up my personal development environment. Its purpose is to allow me to get up and running as quick as possible.

This guide assumes you're using a Mac with the latest version of OS X.

## Prerequisits

Before you do anything else, run Software Update.

Once that's done, install:

* [Sublime Text 2](http://www.sublimetext.com/2)
* [Dropbox](https://www.dropbox.com/)
* [MacRuby](http://macruby.org/)

Then install these from the AppStore:

* Xcode
* BetterSnapTool
* iA Writer
* The Unarchiver
* Alfred
* Clear

Install the XCode Command Line Tools by opening XCode, navigating to Preferences > Downloads > Components and clicking on the Install button.

## Homebrew

[Homebrew](http://mxcl.github.com/homebrew/) is a bad ass little package manager for OS X. To install it, run:

```
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew doctor
brew update
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'
```

The last line sets the `$PATH` environment variable. This only needs to be done for the current shell session. Once you set up Oh My ZSH later on in this guide, this variable will be set whenever the shell starts.

Install some handy little command line utilities using Homebrew:

```
brew install wget
brew install tree
brew install ack
```

To browser all of the available Homebrew packages, check out [Braumeister](http://braumeister.org/).

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
git config --global alias.c commit
git config --global alias.b branch
git config --global alias.m merge
git config --global alias.s status
git config --global core.editor "subl -n -w"
git config --global push.default simple
```

## Dotfiles and Toolbox

To get all of the settings and script files, clone the [dotfiles](https://github.com/LandonSchropp/dotfiles) and [toolbox](https://github.com/LandonSchropp/toolbox) repositories:

```
git clone git@github.com:LandonSchropp/dotfiles.git $HOME/dotfiles
git clone git@github.com:LandonSchropp/toolbox.git $HOME/toolbox
```

## Oh My ZSH

The [Z shell (zsh)](http://en.wikipedia.org/wiki/Z_shell) is an awesome replacement for the default bash shell. It includes some awesome features such as auto-completion, spelling correction, glob file matching, custom prompts and more.

[Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) is a framework that manages ZSH, and includes several plugins for zsh as well as an automatic update tool. The installation information for Oh My ZSH was taken from this [Oh My ZSH Railscast](http://railscasts.com/episodes/308-oh-my-zsh).

Install Oh My ZSH by using the following command:

```
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

Close the current Terminal window and open a new one to start zsh. Next, you'll need to link the custom Oh My ZSH configuration from the dotfiles repository:

```
mkdir -p $HOME/.oh-my-zsh/custom
rm -r $HOME/.oh-my-zsh/custom/*
ln -s $HOME/dotfiles/oh_my_zsh/* $HOME/.oh-my-zsh/custom/
```

## GCC

The XCode Command Line Tools includes LLVM-GCC, which can cause problems when compiling Ruby. To fix this, we need to install GCC:

```
brew tap homebrew/dupes
brew install apple-gcc42
```

## Ruby

[rbenv](https://github.com/sstephenson/rbenv) is an awesome little Ruby environment manager. It does one thing really well. To install rbenv, run:

```
brew install rbenv
brew install ruby-build
```

OS X ships with an old version of Ruby. You'll want the latest stable one. Check the official [Ruby language website](http://www.ruby-lang.org/en/) to see what it might be. At the time this document was written, the newest stable Ruby release is `Ruby 1.9.3-p362`.  To install Ruby, run:

```
export CC="/usr/local/bin/gcc-4.2"
export CFLAGS="-I/opt/X11/include"
rbenv install 1.9.3-p327
rbenv global 1.9.3-p327
eval "$(rbenv init -)"
```

## Ruby on Rails

[Ruby on Rails](http://rubyonrails.org/) is easy to install:

```
gem install rdoc
gem install sqlite3
gem install rails
gem install bundler
```

## Sublime Text 2

You should have already installed Sublime Text 2 earlier in this guide. Now you need to configure it and add some great packages.

Install [Sublime Package Control](http://wbond.net/sublime_packages/package_control) by opening Sublime Text 2, hitting Control + &#96; and pasting:

```
import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print 'Please restart Sublime Text to finish installation'
```

When that's done, restart Sublime Text 2. Next, add the following packages by hitting Command + Shift + P and typing in Package Control: Install Package:

* CoffeeScript
* Dayle Rees Color Schemes
* Emmet
* SCSS

Finally, symbolically link the Sublime Text 2 preferences files from the dotfiles repository:

```
rm -rf "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings"
mkdir -p "$HOME/Library/Application Support/Sublime Text 2/Packages/User"
ln -s $HOME/dotfiles/sublime_text_2/Preferences.sublime-settings "$HOME/Library/Application Support/Sublime Text 2/Packages/User"
```

## NodeJS

[NodeJS](http://nodejs.org/) is a web application framework written in JavaScript. [NPM](https://npmjs.org/) is the best NodeJS package manager. To install both, run:

```
brew install nodejs
curl https://npmjs.org/install.sh | sh
```

## PostgreSQL

[PostgreSQL](http://www.postgresql.org/) is an open-source SQL database. OS X ships with and old version of PostgreSQL preinstalled. Most of the instructions for installing PostgreSQL were borrowed from [this great Railscast](http://railscasts.com/episodes/342-migrating-to-postgresql?view=asciicast).

To install the newest version, use:

```
brew install postgresql
initdb /usr/local/var/postgres
```

In order to make sure PostgreSQL starts up when OS X starts up, we need to add a launch agent. Check to see what version of PostgreSQL you have installed by running `psql --version`. Then replace the version below with that version.

```
mkdir -p $HOME/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/9.1.3/homebrew.mxcl.postgresql.plist $HOME/Library/LaunchAgents
launchctl load -w $HOME/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

## Private Keys

Some APIs require secret access keys and tokens for authentication. For security reasons, these values should not be stored in a git repository.

Create a new Oh My ZSH configuration file.

```
touch ~/.oh-my-zsh/custom/private.zsh
```

Add the Amazon Web Services access key id and secret access key to this file. These keys can be found on the [Security Credentials](https://portal.aws.amazon.com/gp/aws/securityCredentials) page under Access Keys.

```
export AMAZON_ACCESS_KEY_ID="<Access Key ID>"
export AMAZON_SECRET_ACCESS_KEY="<Secret Access Key>"
```