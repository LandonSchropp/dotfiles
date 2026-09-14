# frozen_string_literal: true

require_relative "cron"

# Builds a launchd plist hash for a task.
module LaunchAgent
  LABEL_PREFIX = "com.landonschropp."
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
      task_label = label(task.name)
      task_log_directory = log_directory(task.name)

      {
        "Label" => task_label,
        "ProgramArguments" => ["/bin/zsh", "-lc", task.command],
        "StandardOutPath" => "#{task_log_directory}/stdout.log",
        "StandardErrorPath" => "#{task_log_directory}/stderr.log",
        "StartCalendarInterval" => intervals(task.cron)
      }
    end

    def label(name)
      "#{LABEL_PREFIX}#{name}"
    end

    private

    def log_directory(name)
      "#{LOGS_DIRECTORY}/#{label(name)}"
    end

    def intervals(expression)
      Cron.expand(expression).map do |combination|
        combination.transform_keys { PLIST_KEYS.fetch(_1) }
      end
    end
  end
end
