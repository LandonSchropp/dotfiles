# A set of aliases to assist with Ruby on Rails development.

# Run a command through bundle execute.
alias be='bundle exec'

# Run a Rake command through bundle execute.
alias ber='bundle exec rake'

# Run Guard on the current directory.
alias guard='bundle exec guard --notify false'

# Migrates a Rails database.
alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:prepare'

# Run the Rake populate task.
alias populate='bundle exec rake db:populate'