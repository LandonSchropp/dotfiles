git_delete_merged_branches() {
  git branch --no-color --merged | grep -v "\*" | xargs -n 1 git branch -d
}

git_rebase_master() {
  git rebase -i master
}

git_what_i_did_today() {
  git log --branches --remotes --tags --graph --oneline --author="Landon" --since="6am"
}

git_autosquash() {
  git rebase --autosquash -i $(git merge-base head $1);
}
