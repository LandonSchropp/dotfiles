# sublime text aliases
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'

#rails aliases
alias grd='bundle exec guard --notify false'
alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:prepare'
alias populate='bundle exec rake db:populate'

# git aliases
alias gitc='git add . && git commit -a -m '

# shortcuts
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
alias -g ........='../../../../../../..'
alias -g .........='../../../../../../../..'
alias -g ..........='../../../../../../../../..'

alias -g cur='~/Development/current'

# This was taken from: http://www.askdavetaylor.com/how_do_i_figure_out_my_ip_address_on_a_mac.html
alias -g ip='ifconfig en1 | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'

# alias the terminal commands
alias -g ter2='ruby ~/toolbox/open_terminal_windows.rb 2'
alias -g ter3='ruby ~/toolbox/open_terminal_windows.rb 3'
alias -g ter4='ruby ~/toolbox/open_terminal_windows.rb 4'

# start up rbenv
eval "$(rbenv init -)"

# set up NodeJS environment
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"