# frozen_string_literal: true

module Lite
  module Measurements
    module Helpers
      module ConversionHelper

        private

        def all_keys
          [imperical_keys, metric_keys].flatten
        end

        # rubocop:disable Layout/LineLength
        def convert_to_imperical_units(units, convert_to:, convert_from:, from: nil, to: nil)
          units = shift_units(units, type: klass::METRIC_UNITS, from: from, to: convert_to)
          shift_units(units / klass::CONVERTER, type: klass::IMPERICAL_UNITS, from: convert_from, to: to)
        end

        def convert_to_metric_units(units, convert_to:, convert_from:, from: nil, to: nil)
          units = shift_units(units, type: klass::IMPERICAL_UNITS, from: from, to: convert_to)
          shift_units(units * klass::CONVERTER, type: klass::METRIC_UNITS, from: convert_from, to: to)
        end
        # rubocop:enable Layout/LineLength

        def convert_to_imperical_units?(from, to)
          metric_keys.include?(from) && imperical_keys.include?(to)
        end

        def convert_to_metric_units?(from, to)
          imperical_keys.include?(from) && metric_keys.include?(to)
        end

        def klass
          self.class
        end

        def imperical_keys
          @imperical_keys ||= klass::IMPERICAL_UNITS.keys
        end

        def metric_keys
          @metric_keys ||= klass::METRIC_UNITS.keys
        end

        def shift_between_imperical_units?(from, to)
          imperical_keys.include?(from) && imperical_keys.include?(to)
        end

        def shift_between_metric_units?(from, to)
          metric_keys.include?(from) && metric_keys.include?(to)
        end

      end
    end
  end
end
