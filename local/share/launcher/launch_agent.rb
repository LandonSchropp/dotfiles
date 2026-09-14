# frozen_string_literal: true

require_relative "cron"

# Builds a launchd plist hash for a task.
module LaunchAgent
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
        "StandardOutPath" => "#{task.log_directory}/stdout.log",
        "StandardErrorPath" => "#{task.log_directory}/stderr.log",
        "StartCalendarInterval" => intervals(task.cron)
      }
    end

    def domain
      "gui/#{Process.uid}"
    end

    private

    def intervals(expression)
      Cron.expand(expression).map do |combination|
        combination.transform_keys { PLIST_KEYS.fetch(_1) }
      end
    end
  end
end
