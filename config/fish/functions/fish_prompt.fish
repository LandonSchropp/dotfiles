function fish_prompt
  set -l command_status $status

  # Set the second color to red if the last command fails
  set -l first_color magenta
  set -l second_color cyan

  if test $command_status -ne 0
    set first_color brred
    set second_color red
  end

  # Print out the current directory.
  set_color -b $first_color black
  printf ' %s ' (prompt_pwd)

  # If the working directory is not contained in a Git repo, close the prompt
  if not __fish_is_git_repository
    set_color -b normal $first_color
    printf ' '
    return 0
  end

  # Print out the seperator.
  set_color -b $second_color $first_color
  printf ''

  # Customize the git prompt.
  # https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_git_prompt.fish
  set -g __fish_git_prompt_showdirtystate 1
  set -g __fish_git_prompt_showstashstate 1
  set -g __fish_git_prompt_showuntrackedfiles 1
  set -g __fish_git_prompt_showupstream 1
  set -g __fish_git_prompt_showcleanstate 1

  set -g __fish_git_prompt_char_upstream_prefix ""

  set -g __fish_git_prompt_char_untrackedfiles "?"
  set -g __fish_git_prompt_char_upstream_equal ""
  set -g __fish_git_prompt_char_upstream_behind " ↓"
  set -g __fish_git_prompt_char_upstream_ahead " ↑"
  set -g __fish_git_prompt_char_upstream_diverged " ↑↓"

  set_color -b $second_color black
  printf ' %s ' (__fish_git_prompt "%s")

  # Close the prompt.
  set_color -b normal $second_color
  printf ' '
end
