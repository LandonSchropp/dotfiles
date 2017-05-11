alias -g dc='docker-compose'
alias -g dcr='docker-compose run --rm'
alias -g dcu='docker-compose up -d'
alias -g dcl='docker-compose logs -f'
alias -g dcb='docker-compose build'

alias -g docker-kill='pgrep -i -f docker | xargs kill'

function docker-stop-containers {
  RUNNING_CONTAINERS=$(docker ps -q)

  if [[ ! -z $RUNNING_CONTAINERS ]]; then
    printf "\nStopping running containers\n\n"
    docker stop $(echo $RUNNING_CONTAINERS)
  fi
}

function docker-clean-containers {
  CONTAINERS=$(docker ps -a -q)

  if [[ ! -z $CONTAINERS ]]; then
    printf "\nRemoving containers\n\n"
    docker rm $(echo $CONTAINERS)
  fi
}

function docker-clean-images {
  IMAGES_=$(docker images -q -a)

  if [[ ! -z $IMAGES_ ]]; then
    printf "\nRemoving images\n\n"
    docker rmi $(echo $IMAGES_)
  fi
}

function docker-clean-dangling-images {
  DANGLING_IMAGES=$(docker images -q -f dangling=true)

  if [[ ! -z $DANGLING_IMAGES ]]; then
    printf "\nRemoving dangling images\n\n"
    docker rmi $(echo $DANGLING_IMAGES)
  fi
}

function docker-clean-volumes {
  VOLUMES=$(docker volume ls)

  if [[ ! -z $VOLUMES ]]; then
    printf "\nRemoving volumes\n\n"
    docker volume remove $(echo $VOLUMES)
  fi
}

function docker-clean {
  docker-stop-containers
  docker-clean-containers
  docker-clean-images
  docker-clean-volumes
}
