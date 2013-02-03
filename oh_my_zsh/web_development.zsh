# A set of aliases and functions for web development.

# Run a command through bundle execute.
alias be='bundle exec'

# Run guard on the current directory.
alias grd='bundle exec guard --notify false'

# Migrate a Rails database for both the development and test environments.
alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:prepare'

# Run the rake populate task.
alias populate='bundle exec rake db:populate'

# Starts a simple HTTP server in the current directory.
alias server="python -m SimpleHTTPServer"

# Get the external IP address. Taken from: http://alias.sh/get-external-ip.
alias externalip='curl ifconfig.me'

# Reload DNS on OS X. Taken from: http://alias.sh/reload-dns-osx.
alias flushdns="dscacheutil -flushcache"