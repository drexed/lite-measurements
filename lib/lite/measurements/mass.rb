# frozen_string_literal: true

module Lite
  module Measurements
    class Mass < Lite::Measurements::Base

      include Lite::Measurements::Helpers::ConversionHelper

      CONVERTER ||= 28.349523125

      IMPERICAL ||= {
        ounces: 1.0, pounds: 16.0, stones: 224.0, us_tons: 32_000.0, imperial_tons: 35_840.0
      }.freeze
      METRIC ||= {
        micrograms: 0.000001, milligrams: 0.001, centigrams: 0.01, decigrams: 0.1, grams: 1.0,
        dekagrams: 10.0, hectograms: 100.0, kilograms: 1_000.0, metric_tons: 1_000_000.0
      }.freeze

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
      # rubocop:disable Metrics/PerceivedComplexity
      def convert(from:, to:)
        ikeys = IMPERICAL.keys
        mkeys = METRIC.keys

        valid_keys = [ikeys, mkeys].flatten
        [from, to].each { |key| assert_valid_keys!(key, *valid_keys) }

        if from == to
          amount
        elsif ikeys.include?(from) && ikeys.include?(to)
          convert_same_types(amount, type: IMPERICAL, from: from, to: to)
        elsif mkeys.include?(from) && mkeys.include?(to)
          convert_same_types(amount, type: METRIC, from: from, to: to)
        elsif ikeys.include?(from) && mkeys.include?(to)
          ounces = convert_same_types(amount, type: IMPERICAL, from: from, to: :ounces)
          convert_same_types(ounces * CONVERTER, type: METRIC, from: :grams, to: to)
        else
          grams = convert_same_types(amount, type: METRIC, from: from, to: :grams)
          convert_same_types(grams / CONVERTER, type: IMPERICAL, from: :ounces, to: to)
        end
      end
      # rubocop:enable Metrics/PerceivedComplexity
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

    end
  end
end
