# frozen_string_literal: true

module Lite
  module Measurements
    class Mass < Lite::Measurements::Base

      include Lite::Measurements::Helpers::ConversionHelper
      include Lite::Measurements::Helpers::ShiftHelper

      CONVERTER ||= 28.349523125

      IMPERICAL_UNITS ||= {
        ounces: 1.0, pounds: 16.0, stones: 224.0, us_tons: 32_000.0, imperial_tons: 35_840.0
      }.freeze
      METRIC_UNITS ||= {
        micrograms: 0.000001, milligrams: 0.001, centigrams: 0.01, decigrams: 0.1, grams: 1.0,
        dekagrams: 10.0, hectograms: 100.0, kilograms: 1_000.0, metric_tons: 1_000_000.0
      }.freeze

      # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Metrics/LineLength
      def convert(from:, to:)
        assert_all_valid_keys!(from, to, all_keys)

        if equal_units?(from, to)
          amount
        elsif shift_between_imperical_units?(from, to)
          shift_units(amount, type: IMPERICAL_UNITS, from: from, to: to)
        elsif shift_between_metric_units?(from, to)
          shift_units(amount, type: METRIC_UNITS, from: from, to: to)
        elsif convert_to_metric_units?(from, to)
          convert_to_metric_units(amount, from: from, convert_to: :ounces, convert_from: :grams, to: to)
        else
          convert_to_imperical_units(amount, from: from, convert_to: :grams, convert_from: :ounces, to: to)
        end
      end
      # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Metrics/LineLength

    end
  end
end
