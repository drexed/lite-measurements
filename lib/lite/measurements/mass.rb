# frozen_string_literal: true

module Lite
  module Measurements
    class Mass < Lite::Measurements::Base

      CONVERTER ||= 28.35

      VALID_KEYS ||= %i[
        celsius fahrenheit kelvin
      ].freeze

      def convert(from:, to:)
        [from, to].each { |key| assert_valid_keys!(key, *VALID_KEYS) }

        case to
        when from then @amount
        when :celsius then send("celsius_from_#{from}")
        when :fahrenheit then send("fahrenheit_from_#{from}")
        when :kelvin then send("kelvin_from_#{from}")
        end
      end

      private

      # def to_mass(from, to)
      #   assert_inclusion_of_valid_keys!(MASS_KEYS.values.flatten, from, to)
      #
      #   return self if from == to
      #
      #   metric_keys = MASS_KEYS.fetch(:metric)
      #   metrics_included_from = metric_keys.include?(from)
      #
      #   case to
      #   when :gram, :grams, :milligram, :milligrams, :centigram, :centigrams, :decigram, :decigrams,
      #        :decagram, :decagrams, :hectogram, :hectograms, :kilogram, :kilograms, :metric_ton,
      #        :metric_tons
      #     if metrics_included_from
      #       to_f * 1.send("#{from}_in_grams").to_f / 1.send("#{to}_in_grams").to_f
      #     else
      #       to_f * ((1.send("#{from}_in_ounces") * 28.3495).to_f / 1.send("#{to}_in_grams").to_f)
      #     end
      #   when :ounce, :ounces, :pound, :pounds, :stone, :stones, :ton, :tons
      #     if metrics_included_from
      #       to_f * ((1.send("#{from}_in_grams") * 0.035274).to_f / 1.send("#{to}_in_ounces").to_f)
      #     else
      #       to_f * 1.send("#{from}_in_ounces").to_f / 1.send("#{to}_in_ounces").to_f
      #     end
      #   end
      # end

    end
  end
end
