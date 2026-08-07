# Increase the maximum number of open files.
ulimit -n 10485760

# Unfortunately, macOS's /etc/zprofile _reorders the paths set in ~/.zshenv_. This causes system
# utilities to take a higher precedence in the path than they should. Move ~/.zshenv's directories
# back ahead of the ones path_helper reshuffles to the front.
typeset -U path
path=($zshenv_path $path)
