function raw-tree {
   /usr/local/bin/tree $argv
}

# Since ripgrep ignores files in .gitignore by default, we can pipe its output into tree to exclude
# gitignored files. This should also work fine in directories that aren't part of Git repositories.
function tree {
  rg --files | /usr/local/bin/tree --fromfile
}


function touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}
