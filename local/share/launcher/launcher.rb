#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative "sync"

def print_help
  puts <<~HELP
    Usage: launcher <command>

    Generates and manages launchd LaunchAgents from ~/.config/launcher/tasks.yml.

    Commands:

      sync    Reconcile installed agents with tasks.yml.

    Options:

      --help  Show this help message and exit.
  HELP
end

command = ARGV.shift

case command
when "sync"
  Sync.call
when "--help"
  print_help
else
  warn command.nil? ? "Error: A command is required." : "Error: Unknown command: #{command}"
  warn ""
  print_help
  exit 1
end
