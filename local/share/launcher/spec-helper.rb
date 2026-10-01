# frozen_string_literal: true

require "bundler/inline"

# A second gemfile block would drop this one's gems, so this one also declares launcher.rb's gems.
gemfile do
  source "https://rubygems.org"
  gem "fugit", "~> 1.14"
  gem "rspec", "~> 3.13"
end

require "rspec/autorun"
