function raw-tree {
   /usr/local/bin/tree $argv
}


function touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}
