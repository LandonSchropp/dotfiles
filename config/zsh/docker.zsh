# Aliases
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcs="docker compose stop"
alias dcr="docker compose stop && docker compose up -d"
alias dcl="docker compose logs"
alias dcps="docker-compose-ps"

# Pretty print the output of `docker compose ps` in a table format.
function docker-compose-ps() {
  echo
  local headers="\033[34mService\tState\tHealth\tStatus\tUptime\033[0m"
  local output=$(docker compose ps --format "{{.Service}}\t{{.State}}\t{{.Health}}\t{{.Status}}\t{{.RunningFor}}")

  (echo -e "$headers" && echo "$output") | column -t -s $'\t' -o '    '
  echo
}

# Remove all docker containers, images, volumes, and networks.
function docker-nuke() {
  local running_containers="$(docker ps -q)"

  if [ -n "$running_containers" ]; then
    docker kill "$running_containers"
  fi

  docker compose down --volumes --rmi all --remove-orphans || true
  docker system prune --all --force --volumes
}
