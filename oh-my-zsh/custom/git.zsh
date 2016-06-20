alias git_delete_merged_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git_rebase_master='git rebase -i master'

alias git_what_i_did_today='git log --branches --remotes --tags --graph --oneline --author="Landon" --since="6am"'

git_autosquash() {
  git rebase --autosquash -i $(git merge-base head $1);
}
