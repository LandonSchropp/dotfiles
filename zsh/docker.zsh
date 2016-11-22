alias -g dc='docker-compose'
alias -g dcr='docker-compose run'
alias -g dcu='docker-compose up'

# Taken from: https://www.calazan.com/docker-cleanup-commands/
function docker-clean {
  RUNNING_CONTAINERS=$(docker ps -q)

  if [[ ! -z $RUNNING_CONTAINERS ]]; then
    printf "\nStopping running containers\n\n"
    docker stop $RUNNING_CONTAINERS
  fi

  STOPPED_CONTAINERS=$(docker ps -a -q)

  if [[ ! -z $STOPPED_CONTAINERS ]]; then
    printf "\nDeleting stopped containers\n\n"
    docker rm $STOPPED_CONTAINERS
  fi

  UNTAGGED_IMAGES=$(docker images -q -f dangling=true)

  if [[ ! -z $UNTAGGED_IMAGES ]]; then
    printf "\nDeleting untagged images\n\n"
    docker rmi $UNTAGGED_IMAGES
  fi
}
