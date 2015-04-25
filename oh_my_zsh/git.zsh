alias git-delete-merged-branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
