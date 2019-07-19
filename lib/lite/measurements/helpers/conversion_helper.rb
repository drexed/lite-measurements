# frozen_string_literal: true

module Lite
  module Measurements
    module Helpers
      module ConversionHelper

        private

        def all_keys
          [imperical_keys, metric_keys].flatten
        end

        def convert_to_imperical_units(units, from: nil, convert_to:, convert_from:, to: nil)
          units = shift_units(units, type: klass::METRIC, from: from, to: convert_to)
          shift_units(units / klass::CONVERTER, type: klass::IMPERICAL, from: convert_from, to: to)
        end

        def convert_to_metric_units(units, from: nil, convert_to:, convert_from:, to: nil)
          units = shift_units(units, type: klass::IMPERICAL, from: from, to: convert_to)
          shift_units(units * klass::CONVERTER, type: klass::METRIC, from: convert_from, to: to)
        end

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
          @imperical_keys ||= klass::IMPERICAL.keys
        end

        def metric_keys
          @metric_keys ||= klass::METRIC.keys
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
