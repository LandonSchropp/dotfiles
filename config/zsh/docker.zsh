alias k='kubectl'
alias dc='docker-compose'
alias dcud='docker-compose-current-service-up-dependent'
alias dcn='docker-compose-current-service-name'
alias dc-envrc='docker-compose-envrc > .envrc'

# TODO: Genericize this.
alias dco="$EDITOR ~/Development/tesla/docker-compose.override.yml"

function dcr() {
  docker-compose run --rm "$(docker-compose-current-service-name)" $@
}

function dcl() {
  docker-compose logs -f "$(docker-compose-current-service-name)"
}

function dcb() {
  docker-compose build "$(docker-compose-current-service-name)"
}

function dcu() {
  docker-compose up "$(docker-compose-current-service-name)"
}
