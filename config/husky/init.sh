#!/usr/bin/env sh

# This script runs my personal commit-message hook in any repository that Husky manages. It is
# sourced by Husky's commit-msg hook, so it will run automatically whenever a commit message is
# being validated.

# If this script is being run by a hook other than commit-msg, exit early.
[ "$(basename "$0")" = "commit-msg" ] || return 0

# Run the personal commit-message hook, passing along all arguments.
"$HOME"/.config/git/hooks/commit-msg "$@" || exit $?
