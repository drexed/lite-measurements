# frozen_string_literal: true

require 'lite/measurements/version'
require 'lite/measurements/configuration'
require 'lite/measurements/base'

%w[temperature].each do |filename|
  require "lite/measurements/#{filename}"
  next unless Lite::Measurements.configuration.monkey_patch.include?(filename)

  require "lite/measurements/monkey_patches/#{filename}"
end

require 'generators/lite/measurements/install_generator'
