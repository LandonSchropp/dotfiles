alias k='kubectl'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcn='docker-compose-current-service-name'

function dcr() {
  docker-compose run --rm "$(docker-compose-current-service-name)" $@
}

function dcl() {
  docker-compose logs -f "$(docker-compose-current-service-name)"
}

function dcb() {
  docker-compose build "$(docker-compose-current-service-name)"
}

# TODO: Genericize this.
alias dco="$EDITOR ~/Development/tesla/docker-compose.override.yml"

alias docker-kill='pgrep -i -f docker | xargs kill'

function docker-nuke {
  docker-compose down -v --rmi all --remove-orphans
  docker system prune --all --force --volumes
}
