# frozen_string_literal: true

require_relative 'cron'

module LaunchAgent
  LABEL_PREFIX = 'com.landonschropp.schedule.'
  LOGS_DIRECTORY = File.expand_path('~/Library/Logs')

  class << self
    def build(task)
      label = label_for(task['name'])

      {
        'Label' => label,
        # launchd hands a job a bare PATH, so the command runs through a login shell to pick up
        # mise's shims. Without it `ruby` and friends resolve to the system versions instead.
        'ProgramArguments' => ['/bin/zsh', '-lc', task['command']],
        'StandardOutPath' => "#{LOGS_DIRECTORY}/#{label}/stdout.log",
        'StandardErrorPath' => "#{LOGS_DIRECTORY}/#{label}/stderr.log",
        'StartCalendarInterval' => intervals_for(task['cron'])
      }
    end

    def label_for(name)
      "#{LABEL_PREFIX}#{name}"
    end

    private

    def intervals_for(cron_expression)
      result = Cron.parse(cron_expression)

      interval = {}
      interval['Minute'] = result.minute if result.minute
      interval['Hour'] = result.hour if result.hour

      return [interval] unless result.weekdays

      result.weekdays.map { interval.merge('Weekday' => Cron::WEEKDAYS.index(_1)) }
    end
  end
end
