#!/usr/bin/env bash

set -euo pipefail

# If the version of Ruby that's installed isn't the system Ruby, then we can skip this step
# completely.
if [[ $(command -v ruby) =~ "rbenv" ]]; then
  return 0
fi

# Install the latest version of Ruby
RUBY_VERSION=$(rbenv install -l | grep -v - | tail -1)
rbenv install "$RUBY_VERSION"
rbenv global "$RUBY_VERSION"
eval "$(rbenv init -)"

# Install Bundler
gem install bundler
