# frozen_string_literal: true

module Cron
  MAX_INTERVALS = 100

  WEEKDAYS = %i(sunday monday tuesday wednesday thursday friday saturday).freeze

  CRON_REGEX = /\A(\*|(?:\d+)) (\*|(?:\d+)) \* \* (\*|\d+(?:,\d+)*)\z/

  Result = Data.define(:minute, :hour, :weekdays)

  class << self
    def parse(expression)
      match = expression.match(CRON_REGEX)

      raise_cron_argument_error(expression) unless match

      Result.new(
        minute: parse_minute(expression, match[1]),
        hour: parse_hour(expression, match[2]),
        weekdays: parse_weekdays(expression, match[3])
      )
    end

    def parse_integer(expression, value, range)
      return nil if value == "*"
      value = Integer(value)
      raise_cron_argument_error(expression) unless range.include?(value)
      value
    rescue ArgumentError
      raise_cron_argument_error(expression)
    end

    def parse_minute(expression, value)
      parse_integer(expression, value, 0..59)
    end

    def parse_hour(expression, value)
      parse_integer(expression, value, 0..23)
    end

    def parse_weekdays(expression, value)
      return nil if value == "*"

      value
        .split(",")
        .map { parse_integer(expression, _1, 0..6) }
        .map { WEEKDAYS[_1] }
    end

    def raise_cron_argument_error(expression)
      raise ArgumentError, "Invalid cron expression: #{expression}"
    end
  end
end
