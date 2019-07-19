# frozen_string_literal: true

module Lite
  module Measurements
    module Helpers
      module ShiftHelper

        private

        def change_units(units, type:, from: nil, to: nil)
          if from
            units * type[from]
          else
            units / type[to]
          end
        end

        def equal_units?(from, to)
          from == to
        end

        def shift_units(units, type:, from: nil, to: nil)
          units = change_units(units, type: type, from: from)
          change_units(units, type: type, to: to)
        end

      end
    end
  end
end
