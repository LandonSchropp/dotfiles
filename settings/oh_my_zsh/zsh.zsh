# start up rbenv
eval "$(rbenv init -)"

# set up NodeJS environment
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"

# directory aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
alias -g ........='../../../../../../..'
alias -g .........='../../../../../../../..'
alias -g ..........='../../../../../../../../..'

alias cur='cd ~/Development/current'

# git aliases
alias gitc='git add . && git commit -a -m '

# sublime text aliases
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'

#rails aliases
alias grd='bundle exec guard --notify false'
alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:prepare'
alias populate='bundle exec rake db:populate'

# alias the terminal commands
alias -g ter2='macruby ~/toolbox/utilities/open_terminal_windows.rb 2'
alias -g ter3='macruby ~/toolbox/utilities/open_terminal_windows.rb 3'
alias -g ter4='macruby ~/toolbox/utilities/open_terminal_windows.rb 4'

# Prints the current IP address.
# Taken from: http://www.askdavetaylor.com/how_do_i_figure_out_my_ip_address_on_a_mac.html
alias -g ip='ifconfig en1 | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'

# Starts a simple HTTP server in the current directory.
alias server="python -m SimpleHTTPServer"