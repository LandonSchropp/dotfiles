# frozen_string_literal: true

require_relative "task"

module Log
  DEFAULT_LINES = 50

  class << self
    def call(name, lines: DEFAULT_LINES)
      task = Task.find(name)
      paths = ["stdout.log", "stderr.log"].map { File.join(task.log_directory, _1) }

      system("tail", "-n", lines.to_s, *paths, exception: false)
    end
  end
end
