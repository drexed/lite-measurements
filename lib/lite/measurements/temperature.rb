# frozen_string_literal: true

module Lite
  module Measurements
    class Temperature < Lite::Measurements::Base

      C_FREEZING_POINT ||= 5.0 / 9.0
      C_INVERSED_POINT ||= 9.0 / 5.0
      F_FREEZING_POINT ||= 32.0
      K_FREEZING_POINT ||= 273.15

      VALID_KEYS ||= %i[
        celsius fahrenheit kelvin
      ].freeze

      def convert(from:, to:)
        [from, to].each { |key| assert_valid_keys!(key, *VALID_KEYS) }

        case to
        when from then amount
        when :celsius then send("celsius_from_#{from}")
        when :fahrenheit then send("fahrenheit_from_#{from}")
        when :kelvin then send("kelvin_from_#{from}")
        end
      end

      private

      def celsius_from_fahrenheit
        (amount - F_FREEZING_POINT) * C_FREEZING_POINT
      end

      def celsius_from_kelvin
        amount - K_FREEZING_POINT
      end

      def fahrenheit_from_celsius
        (amount * C_INVERSED_POINT) + F_FREEZING_POINT
      end

      def fahrenheit_from_kelvin
        celsius_from_kelvin * C_INVERSED_POINT + F_FREEZING_POINT
      end

      def kelvin_from_celsius
        amount + K_FREEZING_POINT
      end

      def kelvin_from_fahrenheit
        celsius_from_fahrenheit + K_FREEZING_POINT
      end

    end
  end
end
