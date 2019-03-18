# A set of aliases and functions for web development.

# Starts a simple HTTP server in the current directory.
alias server="python -m SimpleHTTPServer"

# Get the external IP address. Taken from: http://alias.sh/get-external-ip.
alias externalip='curl ifconfig.me'

# Reload DNS on OS X. Taken from: http://alias.sh/reload-dns-osx.
alias flushdns="dscacheutil -flushcache"

# Open up a local server for testing on other devices.
function serveo
  ssh -R "80:localhost:$argv[1]" serveo.net
end
