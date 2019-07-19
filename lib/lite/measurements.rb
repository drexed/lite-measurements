# frozen_string_literal: true

require 'lite/measurements/version'
require 'lite/measurements/configuration'
require 'lite/measurements/helpers/conversion_helper'

%w[conversion shift].each do |filename|
  require "lite/measurements/helpers/#{filename}_helper"
end

%w[base length mass temperature time].each do |filename|
  require "lite/measurements/#{filename}"
end

require 'lite/measurements/monkey_patches' if Lite::Measurements.configuration.monkey_patches

require 'generators/lite/measurements/install_generator'
