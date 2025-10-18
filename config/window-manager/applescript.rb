require 'shellwords'

module AppleScript
  class << self
    def run(script)
      run_command('osascript', '-e', script)
    end

    private

    def run_command(*args)
      output = `#{args.shelljoin}`
      raise "Command failed: #{args.join(' ')}" unless $?.success?
      output
    end
  end
end
