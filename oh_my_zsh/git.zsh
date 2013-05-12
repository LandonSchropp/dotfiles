# A set of aliases and functions for working with git.

# Add all of the files in the current directory and commit them with the provided message.
alias gc='git add . && git commit -a -m '

# Display a compact, colorized git log. Taken from: http://alias.sh/compact-colorized-git-log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"