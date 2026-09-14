# frozen_string_literal: true

require_relative "launch_agent"
require_relative "task"

module Run
  class << self
    def call(name)
      task = Task.find(name)
      system("launchctl", "kickstart", "-k", "#{LaunchAgent.domain}/#{task.label}", exception: true)
    end
  end
end
