# frozen_string_literal: true

require_relative "cron"

# Builds a launchd plist hash for a task.
module LaunchAgent
  LOGS_DIRECTORY = File.expand_path("~/Library/Logs")

  PLIST_KEYS = {
    minute: "Minute",
    hour: "Hour",
    monthday: "Day",
    month: "Month",
    weekday: "Weekday"
  }.freeze

  class << self
    def build(task)
      {
        "Label" => task.label,
        "ProgramArguments" => ["/bin/zsh", "-lc", task.command],
        "StandardOutPath" => "#{log_directory(task.label)}/stdout.log",
        "StandardErrorPath" => "#{log_directory(task.label)}/stderr.log",
        "StartCalendarInterval" => intervals(task.cron)
      }
    end

    def domain
      "gui/#{Process.uid}"
    end

    private

    def log_directory(label)
      "#{LOGS_DIRECTORY}/#{label}"
    end

    def intervals(expression)
      Cron.expand(expression).map do |combination|
        combination.transform_keys { PLIST_KEYS.fetch(_1) }
      end
    end
  end
end
