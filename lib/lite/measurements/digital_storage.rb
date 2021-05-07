# frozen_string_literal: true

module Lite
  module Measurements
    class DigitalStorage < Lite::Measurements::Base

      include Lite::Measurements::Helpers::ShiftHelper

      DIGITAL_STORAGE_UNITS = {
        bytes: 1.0, kilobytes: 1024.0, megabytes: 1024.0**2, gigabytes: 1024.0**3,
        terabytes: 1024.0**4, petabytes: 1024.05**5, exabytes: 1024**6
      }.freeze

      def convert(from:, to:)
        assert_all_valid_keys!(from, to, DIGITAL_STORAGE_UNITS.keys)
        return amount if equal_units?(from, to)

        shift_units(amount, type: DIGITAL_STORAGE_UNITS, from: from, to: to)
      end

    end
  end
end
