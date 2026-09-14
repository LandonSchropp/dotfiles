# frozen_string_literal: true

require "fileutils"
require "json"
require "tempfile"

require_relative "launch_agent"
require_relative "task"

module Sync
  LAUNCH_AGENTS_DIRECTORY = File.expand_path("~/Library/LaunchAgents")
  MANIFEST_PATH = File.expand_path("~/Library/Application Support/launcher/managed.json")

  class << self
    def call
      tasks = Task.all
      current_labels = tasks.map { LaunchAgent.label(_1.name) }
      removed_labels = read_manifest - current_labels

      removed_labels.each { remove(_1) }
      tasks.each { install(_1) }

      write_manifest(current_labels)
    end

    private

    def domain
      "gui/#{Process.uid}"
    end

    def bootout(label)
      system("launchctl", "bootout", "#{domain}/#{label}", exception: false)
    end

    def remove(label)
      bootout(label)
      FileUtils.rm_f(plist_path(label))
    end

    def install(task)
      plist = LaunchAgent.build(task)
      label = plist.fetch("Label")
      path = plist_path(label)

      FileUtils.mkdir_p(File.dirname(plist.fetch("StandardOutPath")))
      write_plist(plist, path)

      bootout(label)
      system("launchctl", "bootstrap", domain, path, exception: true)
    end

    def plist_path(label)
      File.join(LAUNCH_AGENTS_DIRECTORY, "#{label}.plist")
    end

    def write_plist(plist, path)
      Tempfile.create do |file|
        file.write(JSON.generate(plist))
        file.flush

        system("plutil", "-convert", "xml1", file.path, "-o", path, exception: true)
      end

      system("plutil", "-lint", path, exception: true)
    end

    def read_manifest
      return [] unless File.exist?(MANIFEST_PATH)

      JSON.parse(File.read(MANIFEST_PATH))
    end

    def write_manifest(labels)
      FileUtils.mkdir_p(File.dirname(MANIFEST_PATH))
      File.write(MANIFEST_PATH, JSON.generate(labels))
    end
  end
end
