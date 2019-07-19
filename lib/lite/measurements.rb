# frozen_string_literal: true

require "lite/measurements/version"
require "lite/measurements/configuration"
require "lite/measurements/helpers/conversion_helper"

%w[base mass temperature].each do |filename|
  require "lite/measurements/#{filename}"
end

require 'lite/measurements/monkey_patches' if Lite::Measurements.configuration.monkey_patches

require 'generators/lite/measurements/install_generator'
