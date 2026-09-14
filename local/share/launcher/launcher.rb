#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative "list"
require_relative "run"
require_relative "sync"

def print_help
  puts <<~HELP
    Usage: launcher <command>

    Generates and manages launchd LaunchAgents from ~/.config/launcher/tasks.yml.

    Commands:

      sync         Reconcile installed agents with tasks.yml.
      list         Show each task's name, description, and live launchctl status.
      run <name>   Run a task immediately, without waiting for its schedule.

    Options:

      --help  Show this help message and exit.
  HELP
end

def fail_with(message)
  warn "Error: #{message}"
  warn ""
  print_help
  exit 1
end

command = ARGV.shift

case command
when "sync"
  Sync.call
when "list"
  List.call
when "run"
  name = ARGV.shift
  fail_with("A task name is required.") if name.nil?

  begin
    Run.call(name)
  rescue ArgumentError => e
    fail_with(e.message)
  end
when "--help"
  print_help
else
  fail_with(command.nil? ? "A command is required." : "Unknown command: #{command}")
end
