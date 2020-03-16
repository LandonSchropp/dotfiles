function raw-tree {
   /usr/local/bin/tree $argv
}

function tree {
  git check-ignore * | paste -s -d '|' - | xargs -I _ tree -I _ $argv
}

function touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}
