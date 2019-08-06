function tree {
  command tree -C -I "node_modules" $argv
}

function touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}
