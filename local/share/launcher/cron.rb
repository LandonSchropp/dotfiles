# frozen_string_literal: true

require "fugit"

# Expands a 5-field cron expression into launchd's StartCalendarInterval dictionaries: one per
# fully-specified point in time, since launchd has no wildcard, range, step, or list syntax.
module Cron
  class << self
    def expand(expression)
      cron = Fugit::Cron.parse(expression)

      raise ArgumentError, "Invalid cron expression: #{expression}" unless cron

      fields = {
        minute: cron.minutes,
        hour: cron.hours,
        monthday: cron.monthdays,
        month: cron.months,
        weekday: cron.weekdays&.map(&:first)
      }.compact

      if fields.empty?
        raise ArgumentError, "Invalid cron expression (matches every minute): #{expression}"
      end

      keys = fields.keys
      values = fields.values

      values.first.product(*values.drop(1)).map { keys.zip(_1).to_h }
    end
  end
end
