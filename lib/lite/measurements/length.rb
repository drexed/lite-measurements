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

    end
  end
end
