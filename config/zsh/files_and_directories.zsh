# This function is like the built-in tree function, but it ignores files in a local .gitignore file.
# Unlike the built-in tree function, this function only takes one optional argument, which is a
# specific file or directory to print out.
function tree {

  # Ensure the number of arguments is correct.
  if [ $# -gt 1 ]; then
    echo "Usage: tree [directory]"
    return 1
  fi

  # If a directory was provided, navigate to that directory. This is done so the top-level
  if [ $# -eq 1 ]; then
    cd "$1"
  fi

  # Display the files with tree. Replace the first line with the current directory name so we can
  # always tell what the directory is.
  rg --files | /usr/local/bin/tree --fromfile | sed "1s/.*/$(basename $(pwd))/"
}

# This function is just like the built-in though function, but it also automatically makes the
# directories the file is contained in.
function touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}
