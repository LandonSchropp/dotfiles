function tree
  command tree -C -I 'node_modules' $argv
end

function touch
  mkdir -p (dirname $argv[1])
  command touch $argv[1]
end
