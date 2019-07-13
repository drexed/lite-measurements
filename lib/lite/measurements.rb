# frozen_string_literal: true

%w[version configuration base].each do |filename|
  require "lite/measurements/#{filename}"
end

%w[mass temperature].each do |filename|
  require "lite/measurements/#{filename}"
  next unless Lite::Measurements.configuration.monkey_patch.include?(filename)

  require "lite/measurements/monkey_patches/#{filename}"
end

require 'generators/lite/measurements/install_generator'
