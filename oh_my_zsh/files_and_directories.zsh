# A set of aliases and functions for manipulating generic files and directories directories.

# Navigate backwards multiple directories.
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
alias -g ........='../../../../../../..'
alias -g .........='../../../../../../../..'
alias -g ..........='../../../../../../../../..'

# Make and change into a directory. Taken from: http://alias.sh/make-and-cd-directory.
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# Make the directory containing the file and touch the file.
function mt() {
  mkdir -p $(dirname "$1") && touch "$1"
}

# Extract most known archives with one command. Taken from:
# http://alias.sh/extract-most-know-archives-one-command.
extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Show hidden files only. Taken from: http://alias.sh/show-hidden-files-only.
alias l.='ls -d .* --color=auto'

# Alias the clear command.
alias c='clear'