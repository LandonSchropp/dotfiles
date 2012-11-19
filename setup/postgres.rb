#!/usr/bin/env ruby

# Installs and sets up the latest version of PostgreSQL.

# These instructions were taken from: http://goo.gl/7xbEc
# `brew install postgresql`
# `initdb /usr/local/var/postgres`
current_version = `psql --version`.scan(/\d+\.\d+\.\d+/).first
# `mkdir -p ~/Library/LaunchAgents`
`cp /usr/local/Cellar/postgresql/#{current_version}/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents`
`launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`