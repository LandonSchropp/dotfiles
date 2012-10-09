#!/usr/bin/env ruby

# Installs and sets up Ruby.
#
# Prerequisits:
# * GCC 4.2

# install rbenv
`brew install rbenv`
`brew install ruby-build`

# install ruby
`CC="/usr/local/bin/gcc-4.2"`
`CFLAGS="-I/opt/X11/include"`
`rbenv install 1.9.3-p194`
`rbenv global 1.9.3-p194`
`eval "$(rbenv init -)"`