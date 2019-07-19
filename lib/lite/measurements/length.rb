# frozen_string_literal: true

module Lite
  module Measurements
    class Length < Lite::Measurements::Base

      include Lite::Measurements::Helpers::ConversionHelper

      CONVERTER ||= 0.0254

      IMPERICAL ||= {
        inches: 1.0, feet: 12.0, yards: 36.0, miles: 63_360.0, nautical_miles: 72_913.386
      }.freeze
      METRIC ||= {
        micrometers: 0.000001, millimeters: 0.001, centimeters: 0.01, decimeters: 0.1, meters: 1.0,
        dekameters: 10.0, hectometers: 100.0, kilometers: 1_000.0
      }.freeze

      # rubocop:disable Metrics/MethodLength, Metrics/LineLength
      def convert(from:, to:)
        assert_all_valid_keys!(from, to)

        if equal_units?(from, to)
          amount
        elsif shift_between_imperical_units?(from, to)
          shift_units(amount, type: IMPERICAL, from: from, to: to)
        elsif shift_between_metric_units?(from, to)
          shift_units(amount, type: METRIC, from: from, to: to)
        elsif convert_to_metric_units?(from, to)
          convert_to_metric_units(amount, from: from, convert_to: :inches, convert_from: :meters, to: to)
        else
          convert_to_imperical_units(amount, from: from, convert_to: :meters, convert_from: :inches, to: to)
        end
      end
      # rubocop:enable Metrics/MethodLength, Metrics/LineLength

    end
  end
end