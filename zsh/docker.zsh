# Ignore project names that aren't prepended with `tesla` or `edison`.
# TODO: Genericize this.
project_name() {
  [[ $(basename `pwd`) =~ '(tesla|edison)-(.*)' ]] && echo $match[2] | sed 's/-/_/g'
}

alias -g dc='docker-compose'
alias -g dcr='docker-compose run --rm $(project_name)'
alias -g dcu='docker-compose up -d'
alias -g dcl='docker-compose logs -f $(project_name)'
alias -g dcb='docker-compose build $(project_name)'
alias -g docker-kill='pgrep -i -f docker | xargs kill'
