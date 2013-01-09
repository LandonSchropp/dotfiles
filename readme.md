# Setup

This is a guide to setting up my personal development environment. Its purpose is to allow me to get up and running as quick as possible.

This guide assumes you're using a Mac with the latest version of OS X.

## Prerequisits

Before you do anything else, run the damn Software Update.

Once that's done, install all of this awesome shit:

* [Sublime Text 2](http://www.sublimetext.com/2)
* [Dropbox](https://www.dropbox.com/)
* [MacRuby](http://macruby.org/)

From the AppStore, install these:

* Xcode
* BetterSnapTool
* iA Writer
* The Unarchiver
* Alfred
* Clear

Install the XCode Command Line Tools. To do this, open XCode, navigate to Preferences > Downloads > Components and click on the Install button.

## Homebrew

[Homebrew](http://mxcl.github.com/homebrew/) is a badass little package manager for OS X.

To install homebrew, run:

```
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew doctor
brew update
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin'
```

The last line sets the `$PATH` environment variable for the current session. This only needs to be done for the current shell session. Once you set up Oh-My-Zsh later in this guide, this variable will be set whenever the shell starts.

Using Homebrew, install some handy little command line utilities:

```
brew install wget
brew install tree
brew install ack
```

To list all available packages, run `brew search`. However, this isn't really useful. For a betterway to browser available Homebrew packages, check out [Braumeister](http://braumeister.org/).

## Git

The XCode Command Line Tools installs Git, but it's not the latest and greatest version. To install the current version, run:

```
brew install git
```

Don't forget to configure the hell out of it:

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

Clone the [dotfiles](https://github.com/LandonSchropp/dotfiles) and [toolbox](https://github.com/LandonSchropp/toolbox) repositories:

```
git clone git@github.com:LandonSchropp/dotfiles.git ~/dotfiles
git clone git@github.com:LandonSchropp/toolbox.git ~/toolbox
```

## Oh My ZSH

The [Z shell (zsh)](http://en.wikipedia.org/wiki/Z_shell) is an awesome replacement for the default bash shell that ships with OS X. It includes some awesome features, include auto-completion, spelling correction, glob file matching, custom prompts and more.

[Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) is a framework that manages ZSH, and includes several plugins for zsh as well as an automatic update tool. Must of this installation guide guide for Oh My ZSH was taken from the [Oh My ZSH Railscast](http://railscasts.com/episodes/308-oh-my-zsh).

Install Oh My ZSH by using the following command:

```
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

Close the current Terminal window and open a new one for Oh My ZSH to take effect. Next, you'll need to link the custom oh-my-zsh.zsh configuration from the dotfiles repository:

```
mkdir -p ~/.oh-my-zsh/custom
rm -r ~/.oh-my-zsh/custom/*
ln -s ~/dotfiles/oh_my_zsh/zsh.zsh ~/.oh-my-zsh/custom/
```

## GCC

Xcode ships with LLVM-GCC, which can cause problems when compiling Ruby. To fix this, we need to install GCC:

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

OS X ships with an old version of Ruby. You'll want the latest stable one. Before doing anything else, check the official [Ruby language website](http://www.ruby-lang.org/en/) to see what it might be. At this time, the newest stable Ruby release is `Ruby 1.9.3-p362`.  To install Ruby, run:

```
CC="/usr/local/bin/gcc-4.2"
CFLAGS="-I/opt/X11/include"
rbenv install 1.9.3-p362
rbenv global 1.9.3-p362
eval "$(rbenv init -)"
```

## Ruby on Rails

There's not much to installing [Ruby on Rails](http://rubyonrails.org/). This will install the latest stable version:

```
gem install rdoc
gem install sqlite3
gem install rails
gem install bundler
```

## Sublime Text 2

You should have already installed Sublime Text 2 earlier in this guide. Now you need to configure it and add some of the awesome packages.

To start, you'll need [Sublime Package Control](http://wbond.net/sublime_packages/package_control). To install it, open up Sublime Text 2, hit Control + &#96; and paste in:

```
import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print 'Please restart Sublime Text to finish installation'
```

When that's done running, restart Sublime Text 2. Next, you'll want to install some awesome plugins. I'd recommend:

* CoffeeScript
* Dayle Rees Color Schemes
* Emmet
* SCSS

## NodeJS

[NodeJS](http://nodejs.org/) is the new kid on the block. It's a full-featured web application framework written in JavaScript. [NPM](https://npmjs.org/) is NodeJS's go-to package manager. To install both, run:

```
brew install nodejs
curl https://npmjs.org/install.sh | sh
```

## PostgreSQL

[PostgreSQL](http://www.postgresql.org/) is an open-source SQL database that beats the hell out of SQLite for development. It's currently used by Heroku in production. The instructions for installing it were taken from the [Migrating to PostgreSQL Railscast](http://railscasts.com/episodes/342-migrating-to-postgresql?view=asciicast).

OS X ships with PostgreSQL preinstalled, but it's old. To install the newest version, use:

```
brew install postgresql
initdb /usr/local/var/postgres
```

In order to make sure PostgreSQL starts up when OS X starts up, we'll need to add a launch agent. Check to see what version of PostgreSQL you have installed by running `psql --version`. Then replace the version below with that version instead.

```
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/9.1.3/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```