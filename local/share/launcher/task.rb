# frozen_string_literal: true

require "yaml"

Task = Data.define(:name, :description, :command, :cron) do
  CONFIG_PATH = File.expand_path("~/.config/launcher/tasks.yml")

  class << self
    def all(path: CONFIG_PATH)
      return [] unless File.exist?(path)

      entries = YAML.load_file(path) || []
      validate_unique_names!(entries)

      entries.map { new(**_1.transform_keys(&:to_sym)) }
    end

    private

    def validate_unique_names!(entries)
      names = entries.map { _1.fetch("name") }
      duplicates = names.tally.filter_map { |name, count| name if count > 1 }

      raise ArgumentError, "Duplicate task names: #{duplicates.join(", ")}" unless duplicates.empty?
    end
  end
end
