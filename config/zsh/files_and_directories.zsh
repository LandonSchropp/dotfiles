# This function is just like the built-in though function, but it also automatically makes the
# directories the file is contained in.
function touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}
