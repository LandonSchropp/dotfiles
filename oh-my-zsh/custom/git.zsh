alias git_delete_merged_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

git_autosquash() {
  git rebase --autosquash -i $(git merge-base head $1);
}
