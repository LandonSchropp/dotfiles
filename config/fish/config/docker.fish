# Ignore project names that aren't prepended with `tesla` or `edison`.
# TODO: Genericize this.
function project_name
  string match -r '(tesla|edison)-(.+)' (basename (pwd)) | sed -n 3p | sed 's/-/_/g'
end

alias dc="docker-compose"
alias dcr="docker-compose run --rm (project_name)"
alias dcu="docker-compose up -d"
alias dcl="docker-compose logs -f (project_name)"
alias dcb="docker-compose build (project_name)"

alias docker-kill='pgrep -i -f docker | xargs kill'
