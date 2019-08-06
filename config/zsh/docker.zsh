# Ignore project names that aren't prepended with `tesla` or `edison`.
# TODO: Genericize this.
# TODO: Fix this function.
function project_name {
  basename "$(pwd)" | sed -E 's/^(tesla|edison)-(.*)$/\2/' | sed 's/-/_/g'
}

alias k='kubectl'
alias dc='docker-compose'
alias dcr='docker-compose run --rm $(project_name)'
alias dcu='docker-compose up -d'
alias dcl='docker-compose logs -f $(project_name)'
alias dcb='docker-compose build $(project_name)'

# TODO: Genericize this.
alias dco="$EDITOR ~/Development/tesla/docker-compose.override.yml"

alias docker-kill='pgrep -i -f docker | xargs kill'

function docker-nuke {
  docker-compose down -v --rmi all --remove-orphans
  docker system prune --all --force --volumes
}
