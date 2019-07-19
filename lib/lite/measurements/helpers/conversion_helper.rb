# frozen_string_literal: true

module Lite
  module Measurements
    module Helpers
      module ConversionHelper

        private

        def convert_same_types(amt, type:, from: nil, to: nil)
          amt = normalize_same_types(amt, type: type, from: from)
          normalize_same_types(amt, type: type, to: to)
        end

        def normalize_same_types(amt, type:, from: nil, to: nil)
          if from
            amt * type[from]
          else
            amt / type[to]
          end
        end

      end
    end
  end
end
