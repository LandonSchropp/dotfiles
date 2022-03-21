# This wraps tree, but ignores common directories we don't want to search.
function tree {
  command tree -I 'node_modules|.git|build|dist' "$@"
}

# This function is just like the built-in though function, but it also automatically makes the
# directories the file is contained in.
function touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}
