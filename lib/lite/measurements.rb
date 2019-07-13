# frozen_string_literal: true

%w[version configuration base mass temperature].each do |filename|
  require "lite/measurements/#{filename}"
end

require "lite/measurements/monkey_patches" if Lite::Measurements.configuration.monkey_patches

require 'generators/lite/measurements/install_generator'
