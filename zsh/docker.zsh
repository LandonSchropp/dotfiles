alias -g dc='docker-compose'
alias -g dcr='docker-compose run'
alias -g dcu='docker-compose up'

alias -g docker-kill='pgrep -i -f docker | xargs kill'

# Taken from: https://www.calazan.com/docker-cleanup-commands/
function docker-clean-dangling {
  RUNNING_CONTAINERS=$(docker ps -q)

  if [[ ! -z $RUNNING_CONTAINERS ]]; then
    printf "\nStopping running containers\n\n"
    docker stop $(echo $RUNNING_CONTAINERS)
  fi

  STOPPED_CONTAINERS=$(docker ps -a -q)

  if [[ ! -z $STOPPED_CONTAINERS ]]; then
    printf "\nDeleting stopped containers\n\n"
    docker rm $(echo $STOPPED_CONTAINERS)
  fi

  DANGLING_IMAGES=$(docker images -q -f dangling=true)

  if [[ ! -z $DANGLING_IMAGES ]]; then
    printf "\nDeleting dangling images\n\n"
    docker rmi $(echo $DANGLING_IMAGES)
  fi
}

function docker-clean {
  docker-clean-dangling

  ALL_IMAGES=$(docker images -q -a)

  if [[ ! -z $ALL_IMAGES ]]; then
    printf "\nDeleting all images\n\n"
    docker rmi $(echo $ALL_IMAGES)
  fi

}
