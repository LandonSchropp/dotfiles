#!/usr/bin/env ruby

# Installs Homebrew.

`ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"`
`brew doctor`

# correctly set up the path for the current session
`export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'`