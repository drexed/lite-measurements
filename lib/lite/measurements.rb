# frozen_string_literal: true

%w[version configuration base mass temperature].each do |filename|
  require "lite/measurements/#{filename}"
end

if Lite::Measurements.configuration.monkey_patches
  require "lite/measurements/monkey_patches"
end

require 'generators/lite/measurements/install_generator'
