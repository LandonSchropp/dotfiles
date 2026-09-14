# frozen_string_literal: true

require_relative "launch_agent"
require_relative "task"

module List
  class << self
    def call
      rows = Task.all.map { [_1.name, status(LaunchAgent.label(_1.name)), _1.description] }
      name_width = rows.map { _1[0].length }.max
      status_width = rows.map { _1[1].length }.max

      rows.each do |name, task_status, description|
        puts "#{name.ljust(name_width)}  #{task_status.ljust(status_width)}  #{description}"
      end
    end

    private

    def status(label)
      system("launchctl", "list", label, out: File::NULL, err: File::NULL) ? "loaded" : "not loaded"
    end
  end
end
