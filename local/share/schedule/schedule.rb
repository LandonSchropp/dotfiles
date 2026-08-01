#!/usr/bin/env ruby

# frozen_string_literal: true

# Regenerates and reloads launchd jobs from the tagged tasks.json config, replacing
# hand-authored launchd plist files with a simple cron-style JSON config.

require 'fileutils'
require 'json'
require 'tempfile'
require_relative 'launch_agent'

CONFIG_PATH = File.expand_path('~/.config/schedule/tasks.json')
LAUNCH_AGENTS_DIRECTORY = File.expand_path('~/Library/LaunchAgents')

def domain
  "gui/#{Process.uid}"
end

def tasks
  return [] unless File.exist?(CONFIG_PATH)

  JSON.parse(File.read(CONFIG_PATH))['tasks']
end

def existing_plists
  Dir.glob("#{LAUNCH_AGENTS_DIRECTORY}/#{LaunchAgent::LABEL_PREFIX}*.plist")
end

def unload(path)
  label = File.basename(path, '.plist')
  puts "⏪ Unloading service: #{label}"
  system('launchctl', 'bootout', "#{domain}/#{label}", exception: false)
  File.delete(path)
end

def install(plist)
  label = plist['Label']
  path = "#{LAUNCH_AGENTS_DIRECTORY}/#{label}.plist"

  FileUtils.mkdir_p(File.dirname(plist['StandardOutPath']))

  Tempfile.create do |file|
    file.write(JSON.generate(plist))
    file.flush

    system('plutil', '-convert', 'xml1', file.path, '-o', path, exception: true)
  end

  system('plutil', '-lint', path, exception: true)

  puts "⏩ Loading service: #{label}"
  system('launchctl', 'bootstrap', domain, path, exception: true)
end

task_list = tasks

names = task_list.map { _1['name'] }
duplicates = names.tally.filter_map { |name, count| name if count > 1 }
raise "Duplicate task names: #{duplicates.join(', ')}" unless duplicates.empty?

existing_plists.each { unload(_1) }
task_list.each { install(LaunchAgent.build(_1)) }
