# frozen_string_literal: true

module Lite
  module Measurements
    class Time < Lite::Measurements::Base

      include Lite::Measurements::Helpers::ShiftHelper

      TIME_UNITS ||= {
        milliseconds: 0.001, seconds: 1.0, minutes: 60.0, hours: 3600.0, days: 86_400.0,
        weeks: 604_800.0, years: 31_557_600.0, decades: 31_557_600.0 * 10.0,
        centuries: 31_557_600.0 * 100.0, millenniums: 31_557_600.0 * 1_000.0
      }.freeze

      def convert(from:, to:)
        assert_all_valid_keys!(from, to, TIME_UNITS.keys)
        return amount if equal_units?(from, to)

        shift_units(amount, type: TIME_UNITS, from: from, to: to)
      end

    end
  end
end
