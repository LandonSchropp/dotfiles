# Increase the maximum number of open files.
ulimit -n 10485760

# Move mise's shims back ahead of the system directories path_helper reshuffles to the front.
typeset -U path
path=("$XDG_DATA_HOME/mise/shims" $path)
