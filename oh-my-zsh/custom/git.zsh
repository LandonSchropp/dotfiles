alias git_delete_merged_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git_rebase_master='git rebase -i master'

git_autosquash() {
  git rebase --autosquash -i $(git merge-base head $1);
}
